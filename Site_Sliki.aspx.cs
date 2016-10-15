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

                DS_SiteSliki.SelectCommand = "SELECT * FROM [Slika] WHERE 1=2";
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
    protected void imgBtn_Odberi_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton img = (ImageButton)sender;
        DataListItem SelectedItem = (DataListItem)img.NamingContainer;
        Label Slika_Id = (Label)SelectedItem.FindControl("lbl_Slika_Id");
        lblOdbrana.Text = Slika_Id.Text;

        Page.ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "CloseDialog()", true);

    }
    protected void btnBaraj_Click(object sender, EventArgs e)
    {
        DS_SiteSliki.SelectCommand = "SELECT * FROM [Slika] WHERE Naziv LIKE '%" + tbBaraj.Text + "%'";
        DS_SiteSliki.DataBind();
    }
    protected void imgBtn_Izbrisi_Click(object sender, ImageClickEventArgs e)
    {

        if (Session["BrishiSliki"] == null)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Немате дозвола за бришење!');", true);
        }
        else
        {
            try
            {
                ImageButton imgBtnIzbrisiClicked = (ImageButton)sender;
                DataListItem SelectedItem = (DataListItem)imgBtnIzbrisiClicked.NamingContainer;
                Label Slika_Id = (Label)SelectedItem.FindControl("lbl_Slika_Id");

                SqlConnection konekcija = new SqlConnection();
                konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                string sqlString = @"SELECT COUNT(Vest_Id) AS Broj FROM dbo.Vest WHERE Sodrzina LIKE '%Handlers/Slika.ashx?Id=" + Slika_Id.Text + "%'";
                SqlCommand komanda = new SqlCommand(sqlString, konekcija);
                try
                {
                    konekcija.Open();
                    SqlDataReader citac = komanda.ExecuteReader();
                    int BrojNaVesti = 0;
                    while (citac.Read())
                    {
                        BrojNaVesti = Convert.ToInt32(citac["Broj"]);
                        if (BrojNaVesti == 0)
                        {
                            String Sql = "DELETE FROM [Slika] WHERE Slika_Id=" + Slika_Id.Text;
                            DS_SiteSliki.DeleteCommand = Sql;
                            DS_SiteSliki.Delete();

                            DS_SiteSliki.SelectCommand = "SELECT * FROM [Slika] WHERE 1=2";
                            DS_SiteSliki.DataBind();
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Сликата е избришана!');", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Сликата неможе да се избриши! Има вести што ја користат оваа слика!');", true);
                        }
                    }
                }
                catch (Exception err)
                {

                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Настана грешка! Бришењето не е извршено!');", true);
                }
                finally
                {
                    konekcija.Close();
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Настана грешка! Бришењето не е извршено!');", true);
            }
        }
    }
    #endregion
    
}