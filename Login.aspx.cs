using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Account_Login : System.Web.UI.Page
{
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

                NapolniLista();
                IzbrojNeaktivniVesti();
                IzbrojVestiVoIdinina();
                IzbrojNoviPoraki();
            }
        }
        else
        {
            pnlNajava.Visible = true;
            pnlAdmin.Visible = false;
        }
    }
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
                    Session["Korisnik"] = citac["Korisnik_Id"].ToString();
                    Session["korime"] = citac["KorisnickoIme"].ToString();
                    Session["KorNivo"] = citac["KorisnikNivo_Id"].ToString();
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

    protected void NapolniLista()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT * FROM KorisnikNivo WHERE KorisnikNivo_Id = " + Session["KorNivo"].ToString();
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();

            while (citac.Read())
            {
                if (citac["KreiranjeVest"].ToString() == "True") pnlKreirajVest.Visible = true;
                if (citac["AktiviranjeVest"].ToString() == "True") pnlAktivirajVest.Visible = true;
                if (citac["BrisenjeNaSliki"].ToString() == "True") Session["BrishiSliki"] = "1";
                if (citac["PromenaNaReklami"].ToString() == "True") pnlReklami.Visible = true;
                if (citac["PromenaNaPozadina"].ToString() == "True") pnlPozadini.Visible = true;
                if (citac["PromenaNaMeni"].ToString() == "True") pnlPromeniMeni.Visible = true;
                if (citac["DodeluvanjePrivilegii"].ToString() == "True") pnlKorisnici.Visible = true;
                if (citac["OdreduvanjeNivoa"].ToString() == "True") pnlKorisnickiNivoa.Visible = true;
                if (citac["PregledStatistika"].ToString() == "True") pnlStatistics.Visible = true;
                if (citac["PregledPoraki"].ToString() == "True") pnlPoraki.Visible = true;
            }
            citac.Close();

        }
        catch (Exception err) { }
        finally
        {
            konekcija.Close();
        }
    }

    protected void IzbrojNeaktivniVesti()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT COUNT(*) AS Broj FROM dbo.Vest WHERE (f_Odobrena IS NULL or f_Odobrena = 0) AND f_Snimeno = 1";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();

            if (citac.Read())
            {
                lblNeaktivniBroj.Text = citac["Broj"].ToString();
            }
            citac.Close();

        }
        catch (Exception err) { }
        finally
        {
            konekcija.Close();
        }

        if (Convert.ToInt32(lblNeaktivniBroj.Text) < 1)
            pnlNeaktivniBroj.Visible = false;
        else
            pnlNeaktivniBroj.Visible = true;
    }

    protected void IzbrojNoviPoraki()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT COUNT(*) AS Broj FROM [Message] WHERE Procitana = 0 ";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();

            if (citac.Read())
            {
                lblPorakiBroj.Text = citac["Broj"].ToString();
            }
            citac.Close();

        }
        catch (Exception err) { }
        finally
        {
            konekcija.Close();
        }

        if (Convert.ToInt32(lblPorakiBroj.Text) < 1)
            pnlPorakiBroj.Visible = false;
        else
            pnlPorakiBroj.Visible = true;
    }

    protected void IzbrojVestiVoIdinina()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT COUNT(*) AS Broj FROM dbo.Vest WHERE f_Odobrena = 1 AND f_Snimeno = 1 AND Datum_Objava_Prikaz > GETDATE()";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();

            if (citac.Read())
            {
                lblVestiVoIdinaBroj.Text = citac["Broj"].ToString();
            }
            citac.Close();

        }
        catch (Exception err) { }
        finally
        {
            konekcija.Close();
        }

        if (Convert.ToInt32(lblVestiVoIdinaBroj.Text) < 1)
            pnlVestiVoIdninaBroj.Visible = false;
        else
            pnlVestiVoIdninaBroj.Visible = true;
    }
}