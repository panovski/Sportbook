using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Data;
using System.Globalization;

public partial class Account_Login : System.Web.UI.Page
{
    public byte[] data;

    #region Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["najaven"] != null))
        {
            if (Session["najaven"] == "ne")
            {
                pnlNajava.Visible = true;
                pnlAdmin.Visible = false;
            }
            else if (Session["najaven"] == "da")
            {
                pnlNajava.Visible = false;
                pnlAdmin.Visible = true;

                PrikazNaPaneli();
            }
        }
        else
        {
            pnlNajava.Visible = true;
            pnlAdmin.Visible = false;
        }

    }
    
    #endregion

    #region Button Clicks
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT * FROM Korisnik WHERE KorisnickoIme='" + tbUserName.Text + "' AND Lozinka='" + tbLozinka.Text + "'";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();

            Session["najaven"] = "ne";
            lblInfoNajava.Text = "Погрешно корисничко име или лозинка!";
            pnlError.Visible = true;
            while (citac.Read())
            {
                Session["najaven"] = "da";
                Session["lozinka"] = citac["Lozinka"].ToString();
                Session["korime"] = citac["KorisnickoIme"].ToString();
            }
            citac.Close();

            if (Session["najaven"] == "da")
                Response.Redirect("Login.aspx");
        }
        catch (Exception err) { }
        finally
        {
            konekcija.Close();
        }
    
    }
    
    #endregion

    #region Functions 

    protected void IspolniDatumVreme(String datum, String vreme)
    {
        tbDatum.Text = (Convert.ToDateTime(datum)).ToString("dd.MM.yyyy", CultureInfo.InvariantCulture);
        tbVreme.Text = (Convert.ToDateTime(vreme)).ToString("hh:mm", CultureInfo.InvariantCulture);
    }

    protected void PrikazNaPaneli()
    {
        if (GridView1.Rows.Count > 0)
        {
            lblInfo.Visible = false;
            btnPromeni.Visible = true;

            pnlVremeNaObjava.Visible = true;
        }
        else
        {
            lblInfo.Visible = true;
            btnPromeni.Visible = false;

            pnlVremeNaObjava.Visible = false;
        }
    }

    #endregion
    
    protected void btnPromeni_Click(object sender, EventArgs e)
    {
        String UpdateIDs = "";
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox CheckBoxGrid = (CheckBox)row.Cells[1].FindControl("CheckBox1");
            if (CheckBoxGrid.Checked)
            {
                if (UpdateIDs != "") UpdateIDs += ", ";
                UpdateIDs += row.Cells[0].Text;
            }
        }

        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = connection;
        if (UpdateIDs != "")
        {
            String DatumVreme = DateTime.Now.ToString("dd.MM.yyyy hh:mm", CultureInfo.InvariantCulture);

            if(cbVednash.Checked == false)
            {
                tbVreme.Text = tbVreme.Text.Trim();
                if (tbVreme.Text.Length == 0) tbVreme.Text = DateTime.Now.ToShortTimeString();
                DatumVreme = tbDatum.Text + " " + tbVreme.Text;
            }
             
            komanda.CommandText += @" UPDATE Vest SET f_Odobrena = 1, Datum_Dozvola = GETDATE(),
                                Datum_Objava_Prikaz = convert(datetime,'" + DatumVreme + @"',104), 
                                Odobrena_Od = " + Session["Korisnik"].ToString() + " WHERE Vest_Id IN (" + UpdateIDs + ") ; ";
            try
            {
                connection.Open();
                komanda.ExecuteNonQuery();
                //ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Вестите се активирани!');", true);
            }

            finally
            { connection.Close(); }

            DS_NeaktivniVesti.DataBind();
            GridView1.DataBind();

            PrikazNaPaneli();
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + GridView1.SelectedRow.Cells[0].Text);
    }
    protected void cbVednash_CheckedChanged(object sender, EventArgs e)
    {
        if (cbVednash.Checked) pnlPrikazDatum.Visible = false;
        else 
        { 
            pnlPrikazDatum.Visible = true;
            IspolniDatumVreme(DateTime.Now.ToShortDateString(), DateTime.Now.ToShortTimeString()); 
        }
    }
    protected void calDatum_SelectionChanged(object sender, EventArgs e)
    {
        IspolniDatumVreme(calDatum.SelectedDate.ToShortDateString(), DateTime.Now.ToShortTimeString()); 
    }
    protected void btnIzbrishi_Click(object sender, EventArgs e)
    {

        String SelectedIDs = "";
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox CheckBoxGrid = (CheckBox)row.Cells[1].FindControl("CheckBox1");
            if (CheckBoxGrid.Checked)
            {
                if (SelectedIDs != "") SelectedIDs += ", ";
                SelectedIDs += row.Cells[0].Text;
            }
        }

        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = connection;
        if (SelectedIDs != "")
        {
            komanda.CommandText += @" DELETE FROM Vest WHERE Vest_Id IN (" + SelectedIDs + ") ; ";
            try
            {
                connection.Open();
                komanda.ExecuteNonQuery();
            }

            finally
            { connection.Close(); }

            DS_NeaktivniVesti.DataBind();
            GridView1.DataBind();

            PrikazNaPaneli();
        }
    }
}