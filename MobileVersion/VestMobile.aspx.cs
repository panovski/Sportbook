using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.NetworkInformation;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Data;
using System.Text.RegularExpressions;

public partial class MobileVersion_DefaultMobile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = @"SELECT * FROM Vest WHERE Vest_Id=" + Request.QueryString["id"];
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                lblNaslov.Text = citac["Naslov"].ToString();
                lblSodrzina.Text = citac["Sodrzina"].ToString();
                lblObjavenaNa.Text = citac["Datum_Objava_Prikaz"].ToString();
                lblTip.Text = citac["Tip"].ToString();
            }
            citac.Close();

            bool DaliPostoi = false;
            sqlString = @"SELECT * FROM Vest_MAC_Poseta WHERE Vest_Id=" + Request.QueryString["id"] +
                " AND MAC_Add='" + Session["MAC"] + "'";
            komanda.CommandText = sqlString;
            citac = komanda.ExecuteReader();
            if (citac.Read())
                DaliPostoi = true;
            citac.Close();

            if (!DaliPostoi)
            {
                //Zapisuvanje deka vesta ja procital
                sqlString = @"INSERT INTO Vest_MAC_Poseta VALUES('"
                            + Session["MAC"] + "', "
                            + Request.QueryString["id"] + ", "
                            + lblTip.Text + ", '"
                            + DateTime.Now.ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture) + "')";
                komanda.CommandText = sqlString;
                komanda.ExecuteNonQuery();
            }

            sqlString = @"UPDATE Vest SET Procitana = (isnull(Procitana,0) + 1) WHERE Vest_Id=" + Request.QueryString["id"];
            komanda.CommandText = sqlString;
            komanda.ExecuteNonQuery();

        }
        catch (Exception err) { }
        finally
        {
            konekcija.Close();
        }
    }
    
}