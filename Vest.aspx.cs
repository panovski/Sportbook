using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;

public partial class Vest : System.Web.UI.Page
{
    public string pathReklama1, pathReklama2, pathReklama3, pathReklama4, pathReklama5, pathReklama6, pathReklama7, pathReklama8, pathReklama9, pathReklama10;
    public string OpenReklama1, OpenReklama2, OpenReklama3, OpenReklama4, OpenReklama5, OpenReklama6, OpenReklama7, OpenReklama8, OpenReklama9, OpenReklama10;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if ((Session["najaven"] != null))
            {
                if (Session["najaven"] != "da") { btnPromeni.Visible = false; btnDeaktiviraj.Visible = false; pnlAdminPromeni.Visible = false; }
                else { btnPromeni.Visible = true; btnDeaktiviraj.Visible = true; pnlAdminPromeni.Visible = true; }
            }
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
            string sqlString = @"SELECT v.*, k1.KorisnickoIme as Objavil, k2.KorisnickoIme as Odobril  
                                FROM Vest v left outer join Korisnik k1 on k1.Korisnik_Id = v.Objavena_Od 
                                            left outer join Korisnik k2 on k2.Korisnik_Id = v.Odobrena_Od 
                                WHERE Vest_Id=" + Request.QueryString["id"];
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            try
            {
                konekcija.Open();
                SqlDataReader citac = komanda.ExecuteReader();
                while (citac.Read())
                {
                    lblNaslov.Text = citac["Naslov"].ToString();
                    lblSodzina.Text = citac["Sodrzina"].ToString();
                    lblTip.Text = citac["Tip"].ToString();
                    lblProcitana.Text = citac["Procitana"].ToString();
                    lblObjavena.Text = citac["Datum_Objava_Prikaz"].ToString();
                    lblObjavenaOd.Text = citac["Objavil"].ToString();
                    lblOdobrenoOd.Text = citac["Odobril"].ToString();
                    lblOdobrenaNa.Text = citac["Datum_Dozvola"].ToString();
                }
                citac.Close();

                bool DaliPostoi = false;
                sqlString = @"SELECT * FROM Vest_MAC_Poseta WHERE Vest_Id="+Request.QueryString["id"]+
                    " AND MAC_Add='"+Session["MAC"]+"'";
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

            IspolniReklami();
        }
    }
    protected void btnPromeni_Click(object sender, EventArgs e)
    {
        Response.Redirect("KreirajVest.aspx?id=" + Request.QueryString["id"]);
    }
    /// <summary>
    /// IspolniReklami() - Se ispolnuvaat reklamite
    /// </summary>
    private void IspolniReklami()
    {

        pathReklama1 = pathReklama2 = pathReklama3 = pathReklama4 = pathReklama5 = pathReklama6 = pathReklama7 = pathReklama8 =
        pathReklama9 = pathReklama10 = "Reklama1.swf";

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
                if (citac["Reklama_Id"].ToString() == "1" && citac["Vidlivo"].ToString() == "1") { pathReklama1 = "Handlers/ReklamaSWF.ashx?Id=1"; OpenReklama1 = citac["Url"].ToString(); }
                if (citac["Reklama_Id"].ToString() == "2" && citac["Vidlivo"].ToString() == "1") { pathReklama2 = "Handlers/ReklamaSWF.ashx?Id=2"; OpenReklama2 = citac["Url"].ToString(); }
                if (citac["Reklama_Id"].ToString() == "3" && citac["Vidlivo"].ToString() == "1") { pathReklama3 = "Handlers/ReklamaSWF.ashx?Id=3"; OpenReklama3 = citac["Url"].ToString(); }
                if (citac["Reklama_Id"].ToString() == "4" && citac["Vidlivo"].ToString() == "1") { pathReklama4 = "Handlers/ReklamaSWF.ashx?Id=4"; OpenReklama4 = citac["Url"].ToString(); }
                if (citac["Reklama_Id"].ToString() == "11" && citac["Vidlivo"].ToString() == "1") { pathReklama5 = "Handlers/ReklamaSWF.ashx?Id=11"; OpenReklama5 = citac["Url"].ToString(); }
                if (citac["Reklama_Id"].ToString() == "12" && citac["Vidlivo"].ToString() == "1") { pathReklama6 = "Handlers/ReklamaSWF.ashx?Id=12"; OpenReklama6 = citac["Url"].ToString(); }
                if (citac["Reklama_Id"].ToString() == "13" && citac["Vidlivo"].ToString() == "1") { pathReklama7 = "Handlers/ReklamaSWF.ashx?Id=13"; OpenReklama7 = citac["Url"].ToString(); }
                if (citac["Reklama_Id"].ToString() == "14" && citac["Vidlivo"].ToString() == "1") { pathReklama8 = "Handlers/ReklamaSWF.ashx?Id=14"; OpenReklama8 = citac["Url"].ToString(); }
                if (citac["Reklama_Id"].ToString() == "15" && citac["Vidlivo"].ToString() == "1") { pathReklama9 = "Handlers/ReklamaSWF.ashx?Id=15"; OpenReklama9 = citac["Url"].ToString(); }
                if (citac["Reklama_Id"].ToString() == "16" && citac["Vidlivo"].ToString() == "1") { pathReklama10 = "Handlers/ReklamaSWF.ashx?Id=16"; OpenReklama10 = citac["Url"].ToString(); }
            }
            citac.Close();

            if (pathReklama1 == "Reklama1.swf" && pathReklama2 == "Reklama1.swf") { pnlReklama1.Visible = false; }
            else { pnlReklama1.Visible = true; }

            if (pathReklama3 == "Reklama1.swf") { pnlReklamiStran1.Visible = false; }
            else { pnlReklamiStran1.Visible = true; }

            if (pathReklama4 == "Reklama1.swf") { pnlReklamiStran2.Visible = false; }
            else { pnlReklamiStran2.Visible = true; }

            if (pathReklama5 == "Reklama1.swf") { pnlReklamiStran3.Visible = false; }
            else { pnlReklamiStran3.Visible = true; }

            if (pathReklama6 == "Reklama1.swf") { pnlReklama6.Visible = false; }
            else { pnlReklama6.Visible = true; }

            if (pathReklama7 == "Reklama1.swf") { pnlReklama7.Visible = false; }
            else { pnlReklama7.Visible = true; }

            if (pathReklama8 == "Reklama1.swf") { pnlReklama8.Visible = false; }
            else { pnlReklama8.Visible = true; }

            if (pathReklama9 == "Reklama1.swf") { pnlReklama9.Visible = false; }
            else { pnlReklama9.Visible = true; }

            if (pathReklama10 == "Reklama1.swf") { pnlReklama10.Visible = false; }
            else { pnlReklama10.Visible = true; }
        }
        catch (Exception err) { }
        finally
        {
            konekcija.Close();
        }
    }

    /// <summary>
    /// SetirajReklamiEdit() - Se setiraat reklamite dali da bidat editabilni
    /// </summary>
    private void SetirajReklamiEdit(Boolean Edit)
    {
        btnReklama1.Visible = Edit;
        btnReklama2.Visible = Edit;
        btnReklama3.Visible = Edit;
        btnReklama4.Visible = Edit;
        btnReklama5.Visible = Edit;
        btnReklama6.Visible = Edit;
        btnReklama7.Visible = Edit;
        btnReklama8.Visible = Edit;
        btnReklama9.Visible = Edit;
        btnReklama10.Visible = Edit;
    }

    #region Button_Clicks
    protected void lnkNaslov_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton1Clicked = (LinkButton)sender;
        DataListItem SelectedItem = (DataListItem)LinkButton1Clicked.NamingContainer;
        Label Vest_Id = (Label)SelectedItem.FindControl("lblVest_Id");
        Response.Redirect("Vest.aspx?id=" + Vest_Id.Text);
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Response.Write(e.CommandArgument.ToString());
    }
    protected void btnReklama1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=1&w=545&h=80");
    }
    protected void btnReklama2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=2&w=545&h=80");
    }
    protected void btnReklama3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=3&w=250&h=210");
    }
    protected void btnReklama4_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=4&w=250&h=210");
    }
    protected void btnReklama5_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=11&w=250&h=210");
    }
    protected void btnReklama6_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=12&w=545&h=80");
    }
    protected void btnReklama7_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=13&w=250&h=80");
    }
    protected void btnReklama8_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=14&w=250&h=80");
    }
    protected void btnReklama9_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=15&w=250&h=80");
    }
    protected void btnReklama10_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ReklamaEdit.aspx?id=16&w=1090&h=80");
    }
    #endregion

    protected void btnDeaktiviraj_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = connection;

        komanda.CommandText += @" UPDATE Vest SET f_Odobrena = 0 WHERE Vest_Id = " + Request.QueryString["id"] ;
        
        try
        {
            connection.Open();
            komanda.ExecuteNonQuery();
        }
        
        finally
        { connection.Close(); }

        Response.Redirect("Login.aspx");
    }
}