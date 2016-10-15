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

                if (!Page.IsPostBack)
                    IspolniCheckBoxovi();
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
    protected void btnPromeniVidlivo_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = connection;

        // ------------------------------- Prikaz na Panela 1 (dve reklami dolgi) -------------------------------------
        if (cbPanela1.Checked == true)
            komanda.CommandText += @" UPDATE Reklama SET Vidlivo = 1 WHERE Reklama_Id IN (1,2) ; ";
        else
            komanda.CommandText += @" UPDATE Reklama SET Vidlivo = 0 WHERE Reklama_Id IN (1,2) ; ";
        // ------------------------------------------------------------------------------------------------------------

        // ------------------------------- Prikaz na Panela 2 (prva reklama desno) ------------------------------------
        if (cbPanela2.Checked == true)
            komanda.CommandText += @" UPDATE Reklama SET Vidlivo = 1 WHERE Reklama_Id = 3 ; ";
        else
            komanda.CommandText += @" UPDATE Reklama SET Vidlivo = 0 WHERE Reklama_Id = 3 ; ";
        // ------------------------------------------------------------------------------------------------------------

        // ------------------------------- Prikaz na Panela 3 (vtora reklama desno) -----------------------------------
        if (cbPanela3.Checked == true)
            komanda.CommandText += @" UPDATE Reklama SET Vidlivo = 1 WHERE Reklama_Id = 4 ; ";
        else
            komanda.CommandText += @" UPDATE Reklama SET Vidlivo = 0 WHERE Reklama_Id = 4 ; ";
        // ------------------------------------------------------------------------------------------------------------

        // ------------------------------- Prikaz na Panela 4 (treta reklama desno) -----------------------------------
        if (cbPanela4.Checked == true)
            komanda.CommandText += @" UPDATE Reklama SET Vidlivo = 1 WHERE Reklama_Id = 11 ; ";
        else
            komanda.CommandText += @" UPDATE Reklama SET Vidlivo = 0 WHERE Reklama_Id = 11 ; ";
        // ------------------------------------------------------------------------------------------------------------

        // ------------------------------- Prikaz na Panela 5 (Najdolu reklama levo) ----------------------------------
        if (cbPanela5.Checked == true)
            komanda.CommandText += @" UPDATE Reklama SET Vidlivo = 1 WHERE Reklama_Id = 12 ; ";
        else
            komanda.CommandText += @" UPDATE Reklama SET Vidlivo = 0 WHERE Reklama_Id = 12 ; ";
        // ------------------------------------------------------------------------------------------------------------

        // ------------------------------- Prikaz na Panela 6 (Prva reklama vo sredina mala) --------------------------
        if (cbPanela6.Checked == true)
            komanda.CommandText += @" UPDATE Reklama SET Vidlivo = 1 WHERE Reklama_Id = 13 ; ";
        else
            komanda.CommandText += @" UPDATE Reklama SET Vidlivo = 0 WHERE Reklama_Id = 13 ; ";
        // ------------------------------------------------------------------------------------------------------------

        // ------------------------------- Prikaz na Panela 7 (Vtora reklama vo sredina mala) -------------------------
        if (cbPanela7.Checked == true)
            komanda.CommandText += @" UPDATE Reklama SET Vidlivo = 1 WHERE Reklama_Id = 14 ; ";
        else
            komanda.CommandText += @" UPDATE Reklama SET Vidlivo = 0 WHERE Reklama_Id = 14 ; ";
        // ------------------------------------------------------------------------------------------------------------

        // ------------------------------- Prikaz na Panela 8 (Treta reklama vo sredina mala) -------------------------
        if (cbPanela8.Checked == true)
            komanda.CommandText += @" UPDATE Reklama SET Vidlivo = 1 WHERE Reklama_Id = 15 ; ";
        else
            komanda.CommandText += @" UPDATE Reklama SET Vidlivo = 0 WHERE Reklama_Id = 15 ; ";
        // ------------------------------------------------------------------------------------------------------------

        // ------------------------------- Prikaz na Panela 9 (Najgolemata najgore - glavnata) ------------------------
        if (cbPanela9.Checked == true)
            komanda.CommandText += @" UPDATE Reklama SET Vidlivo = 1 WHERE Reklama_Id = 16 ; ";
        else
            komanda.CommandText += @" UPDATE Reklama SET Vidlivo = 0 WHERE Reklama_Id = 16 ; ";
        // ------------------------------------------------------------------------------------------------------------

        try
        {
            connection.Open();
            komanda.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Успешна промена!');", true);
        }
        finally
        { connection.Close(); }
    }
    #endregion

    #region Functions 
    private void IspolniCheckBoxovi()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = @"SELECT * FROM Reklama ";
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);

        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                if ((citac["Reklama_Id"].ToString() == "1" || citac["Reklama_Id"].ToString() == "2") &&
                     citac["Vidlivo"].ToString() == "1")
                    cbPanela1.Checked = true;


                else if (citac["Reklama_Id"].ToString() == "3" && citac["Vidlivo"].ToString() == "1")
                    cbPanela2.Checked = true;

                else if (citac["Reklama_Id"].ToString() == "4" && citac["Vidlivo"].ToString() == "1")
                    cbPanela3.Checked = true;

                else if (citac["Reklama_Id"].ToString() == "11" && citac["Vidlivo"].ToString() == "1")
                    cbPanela4.Checked = true;

                else if (citac["Reklama_Id"].ToString() == "12" && citac["Vidlivo"].ToString() == "1")
                    cbPanela5.Checked = true;

                else if (citac["Reklama_Id"].ToString() == "13" && citac["Vidlivo"].ToString() == "1")
                    cbPanela6.Checked = true;

                else if (citac["Reklama_Id"].ToString() == "14" && citac["Vidlivo"].ToString() == "1")
                    cbPanela7.Checked = true;

                else if (citac["Reklama_Id"].ToString() == "15" && citac["Vidlivo"].ToString() == "1")
                    cbPanela8.Checked = true;

                else if (citac["Reklama_Id"].ToString() == "16" && citac["Vidlivo"].ToString() == "1")
                    cbPanela9.Checked = true;

            }
            citac.Close();

        }
        catch (Exception err) { }
        finally
        {
            konekcija.Close();
        }
    
    }
    #endregion
    protected void lbReklama1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=1&w=545&h=80");
    }
    protected void lbReklama2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=2&w=545&h=80");
    }
    protected void lbReklama3_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=3&w=250&h=210");
    }
    protected void lbReklama4_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=4&w=250&h=210");
    }
    protected void lbReklama5_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=11&w=250&h=210");
    }
    protected void lbReklama6_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=12&w=545&h=80");
    }
    protected void lbReklama7_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=13&w=250&h=80");
    }
    protected void lbReklama8_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=14&w=250&h=80");
    }
    protected void lbReklama9_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=15&w=250&h=80");
    }
    protected void lbReklama10_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=16&w=1090&h=80");
    }
}