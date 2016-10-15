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

public partial class Account_Login : System.Web.UI.Page
{
    #region Promenlivi
    public byte[] data;
    public string pathTekovnaReklama = "";
    public String goleminaWidth = "545";
    public String goleminaHeight = "80";
    public int gWidth = 545;
    public int gHeight = 80;

    #endregion

    #region Load
    protected void Page_Load(object sender, EventArgs e)
    {
        lblWidth.Text  = "2000";
        lblHeight.Text = "1000";

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

                DS_SiteSliki.SelectCommand = "SELECT * FROM Pozadina";
                DS_SiteSliki.DataBind();

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
    protected void btnImportJPG_Click(object sender, EventArgs e)
    {
        InsertPozadina();
    }
    #endregion

    #region Funkcii
    protected void InsertPozadina()
    {
        if (Upload.HasFile)
        {
            string FileName = System.IO.Path.GetFileName(Upload.PostedFile.FileName);
            int len = Upload.PostedFile.ContentLength;
            byte[] pic = new byte[len];
            Upload.PostedFile.InputStream.Read(pic, 0, len);

            String Url = tbPozadinaUrl.Text.Replace("'", "''");
            if (Url.StartsWith("www"))
                Url = "http://" + Url;

            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
            SqlCommand komanda = new SqlCommand();
            komanda.Connection = connection;
            komanda.CommandText = @"INSERT INTO Pozadina (Pozadina, Aktivna, Url) Values (@Reklama, 0, '" + Url + "')";

            komanda.Parameters.Add("@Reklama", pic);
            try
            {
                connection.Open();
                komanda.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Позадината е прикачена!');", true);
            }
            finally
            { connection.Close(); }
            DS_SiteSliki.SelectCommand = "SELECT * FROM Pozadina";
            DS_SiteSliki.DataBind();

            DataList6.DataBind();
        }

    }
    #endregion
    protected void imgBtn_Odberi_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgBtnIzbrisiClicked = (ImageButton)sender;
        DataListItem SelectedItem = (DataListItem)imgBtnIzbrisiClicked.NamingContainer;
        Label Slika_Id = (Label)SelectedItem.FindControl("lbl_Slika_Id");

        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = connection;
        komanda.CommandText = @"UPDATE Pozadina SET Aktivna = 0 ; UPDATE Pozadina SET Aktivna = 1 WHERE Pozadina_Id = " + Slika_Id.Text;

        try
        {
            connection.Open();
            komanda.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Успешна промена!');", true);
        }
        finally
        { connection.Close(); }

        DS_SiteSliki.SelectCommand = "SELECT * FROM Pozadina";
        DS_SiteSliki.DataBind();
        DataList6.DataBind();
    }
    protected void imgBtn_Izbrisi_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton imgBtnIzbrisiClicked = (ImageButton)sender;
            DataListItem SelectedItem = (DataListItem)imgBtnIzbrisiClicked.NamingContainer;
            Label Slika_Id = (Label)SelectedItem.FindControl("lbl_Slika_Id");
            Label Aktivna = (Label)SelectedItem.FindControl("lbl_Aktivna");
            if (Aktivna.Text != "Активна")
            {
                try
                {
                    String Sql = "DELETE FROM Pozadina WHERE Pozadina_Id=" + Slika_Id.Text;
                    DS_SiteSliki.DeleteCommand = Sql;


                    DS_SiteSliki.Delete();

                    DS_SiteSliki.SelectCommand = "SELECT * FROM Pozadina";
                    DS_SiteSliki.DataBind();
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Сликата е избришана!');", true);
                }
                catch (Exception err)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Настана грешка! Бришењето не е извршено!');", true);
                }
            }
            else
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Позадината се користи! Неможе да се избрише!');", true);
                
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Настана грешка! Бришењето не е извршено!');", true);
        }
    }
}