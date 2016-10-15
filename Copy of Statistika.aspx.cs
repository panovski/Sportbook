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
            }
        }
        else
        {
            pnlNajava.Visible = true;
            pnlAdmin.Visible = false;
        }

        if (!Page.IsPostBack)
        {
            Ispolni();
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
    #endregion

    protected void btnIzbrisi_Click(object sender, EventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        String sqlString = "DELETE FROM [Message] WHERE Message_Id=" + lstPoraki.SelectedValue.ToString();
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            komanda.ExecuteNonQuery();
        }
        catch (Exception err) { }
        finally
        {
            konekcija.Close();
        }
        lstPoraki.Items.Clear();
        Ispolni();
        pnlPoraka.Visible = false;
    }
    protected void Ispolni()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        String sqlString = "SELECT * FROM [Message] ORDER BY Ostavena_Na DESC";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                String Procitana = "";
                if (citac["Procitana"].ToString() != "True") Procitana = "|New| ";
                ListItem li = new ListItem();
                li.Text = Procitana + citac["ImePrezime"].ToString() + " , " + citac["Ostavena_Na"].ToString();
                li.Value = citac["Message_Id"].ToString();
                lstPoraki.Items.Add(li);
            }
            citac.Close();

        }
        catch (Exception err) { }
        finally
        {
            konekcija.Close();
        }
    }

    protected void lstPoraki_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlPoraka.Visible = true;
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        String sqlString = "SELECT * FROM [Message] WHERE Message_Id=" + lstPoraki.SelectedValue.ToString();
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            if (citac.Read())
            {
                lblIme.Text = citac["ImePrezime"].ToString();
                lblMail.Text = citac["Email"].ToString();
                lblTekst.Text = citac["Poraka"].ToString();
                lblData.Text = citac["Ostavena_Na"].ToString();
            }
            citac.Close();

            komanda.CommandText = "UPDATE [Message] SET Procitana = 1 WHERE Message_Id=" + lstPoraki.SelectedValue.ToString();
            komanda.ExecuteNonQuery();
        }
        catch (Exception err) { }
        finally
        {
            konekcija.Close();
        }

    }
    protected void btnMarkiraj_Click(object sender, EventArgs e)
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        String sqlString = "UPDATE [Message] SET Procitana = 0 WHERE Message_Id=" + lstPoraki.SelectedValue.ToString();
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            komanda.ExecuteNonQuery();
        }
        catch (Exception err) { }
        finally
        {
            konekcija.Close();
            pnlPoraka.Visible = false;
            lstPoraki.Items.Clear();
            Ispolni();
        }
    }
}