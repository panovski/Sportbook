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

    protected void gvDnevni_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + gvDnevni.SelectedRow.Cells[2].Text);
    }
    protected void gvNedelni_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + gvNedelni.SelectedRow.Cells[2].Text);
    }
    protected void gvMesecni_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + gvMesecni.SelectedRow.Cells[2].Text);
    }
    protected void gvGodishni_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + gvGodishni.SelectedRow.Cells[2].Text);
    }
}