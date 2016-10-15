using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    #region Promenlivi

    public string t_FudbalTip = ConfigurationManager.AppSettings["Fudbal_Id"];
    public string t_KosarkaTip = ConfigurationManager.AppSettings["Kosarka_Id"];
    public string t_RakometTip = ConfigurationManager.AppSettings["Rakomet_Id"];
    public string t_OstanatoTip = ConfigurationManager.AppSettings["Ostanato_Id"];
    public string t_AnaliziTip = ConfigurationManager.AppSettings["Analizi_Id"];
    public string t_ZeskiTopkiTip = ConfigurationManager.AppSettings["ZeskiTopki_Id"];
    public string t_Klubovi = ConfigurationManager.AppSettings["Klubovi_Id"]; 
    
    public string backgroundImage = "Handlers/Pozadina.ashx";

    public string pathReklama1, pathReklama2, pathReklama3, pathReklama4, pathReklama5, pathReklama6, pathReklama7, pathReklama8, pathReklama9, pathReklama10;
    public string OpenReklama1, OpenReklama2, OpenReklama3, OpenReklama4, OpenReklama5, OpenReklama6, OpenReklama7, OpenReklama8, OpenReklama9, OpenReklama10;

    #endregion

    #region Load

    /// <summary>
    /// PreInit - pravi podesuvanje za da se gleda menito dobri i na Chrome
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.ServerVariables["http_user_agent"].IndexOf("Safari", StringComparison.CurrentCultureIgnoreCase) != -1)
            Page.ClientTarget = "uplevel";
    }

    /// <summary>
    /// Page load - Se vcituaat top 5 vestite so koi se polni SlideShow - animacijata 
    ///           - Se podesuva i pozadinata spored toa koja kategorija e odbrana
    ///           - Se povikuva i f-ta IspolniAktuelniVesti()
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            imgVestImage.ImageUrl = "Handlers/ImgMeni.ashx?Id=" + Request.QueryString["id"] ;
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
            string sqlString = @"SET DATEFORMAT DMY ; SELECT TOP 5 Vest_Id, Naslov FROM Vest WHERE f_SlideShow = 1 AND f_Odobrena = 1 AND Datum_Objava_Prikaz < GETDATE() AND (Tip = " + 
                                 Request.QueryString["id"] + " OR Vest_Id IN(SELECT TOP 5 Vest_Id FROM VestPodkategorija WHERE Podkategorija = " +
                                 Request.QueryString["id"] + " ORDER BY Datum_Objava DESC, Procitana DESC) ) ORDER BY Datum_Objava DESC, Procitana DESC";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            try
            {
                konekcija.Open();

                SqlDataReader citac = komanda.ExecuteReader();
                int BrojNaVest = 1;
                while (citac.Read())
                {
                    Image imgSlideShow = (Image)pnlCoinSlider.FindControl("Image" + BrojNaVest.ToString());
                    HyperLink hlSlideShow = (HyperLink)pnlCoinSlider.FindControl("HyperLink" + BrojNaVest.ToString());
                    Label lblSlideShow = (Label)pnlCoinSlider.FindControl("Label" + BrojNaVest.ToString());
                    imgSlideShow.ImageUrl = "Handlers/SlikaVest.ashx?Id=" + citac["Vest_Id"].ToString() + "&tip=golema";
                    hlSlideShow.NavigateUrl = "Vest.aspx?id=" + citac["Vest_Id"].ToString();
                    lblSlideShow.Text = citac["Naslov"].ToString();
                    BrojNaVest++;
                }
                citac.Close(); 
                komanda.CommandText = "SELECT * FROM Meni WHERE Meni_Id = " + Request.QueryString["id"];
               
                SqlDataReader citacMeni = komanda.ExecuteReader();
                while (citacMeni.Read())
                {
                    imgFlagVnatre.ImageUrl = "~/Handlers/ImgMeniGolema.ashx?Id=" + Request.QueryString["id"];
                    if (citacMeni["ParentMeni_Id"].ToString() != "")
                    {
                        if (Convert.ToInt32(citacMeni["ParentMeni_Id"]) == Convert.ToInt32(t_Klubovi))
                        Session["background"] = "Handlers/ImgMeniGolema.ashx?Id=" + Request.QueryString["id"];
                    else Session["background"] = "";
                    }
                    else Session["background"] = "";
                   
                }
                citacMeni.Close();

                sqlString = @"SET DATEFORMAT DMY ; SELECT TOP 20 Vest_Id, Naslov FROM Vest WHERE f_Snimeno = 1  AND f_Odobrena = 1 AND Datum_Objava_Prikaz < GETDATE() AND (Tip = " +
                                 Request.QueryString["id"] + " OR Vest_Id IN(SELECT TOP 5 Vest_Id FROM VestPodkategorija WHERE Podkategorija = " +
                                 Request.QueryString["id"] + " ORDER BY Vest_Id DESC) ) ORDER BY Vest_Id DESC";

                SqlDataSource1.SelectCommand = sqlString;
                SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                SqlDataSource1.DataBind();
            }
            catch (Exception err) { }
            finally
            {
                konekcija.Close();
            }

            IspolniAktuelniVesti();

            IspolniReklami();
            if (Session["najaven"] == "da") SetirajReklamiEdit(true);
            else SetirajReklamiEdit(false);
        }
    }
    
    #endregion

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

    #region Funkcii

    /// <summary>
    /// IspolniAktuelniVesti() 
    /// </summary>
    private void IspolniAktuelniVesti()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlStringFudbal = @"SET DATEFORMAT DMY ; SELECT TOP 15 * FROM Vest WHERE f_Naslovna = 1  AND f_Odobrena = 1 AND Datum_Objava_Prikaz < GETDATE() AND (Tip = " +
                                 Request.QueryString["id"] + " OR Vest_Id IN(SELECT TOP 15 Vest_Id FROM VestPodkategorija WHERE Podkategorija = " +
                                 Request.QueryString["id"] + " ORDER BY Datum_Objava DESC, Procitana DESC) ) ORDER BY Datum_Objava DESC, Procitana DESC";
        string sqlStringAnalizi = @"SELECT TOP 1 v.* FROM Vest v LEFT OUTER JOIN dbo.VestPodkategorija vp ON v.Vest_Id = vp.Vest_Id WHERE vp.Podkategorija = " + t_AnaliziTip + " AND v.f_Naslovna = 1  AND v.f_Odobrena = 1 AND v.Datum_Objava_Prikaz < GETDATE() ORDER BY v.Datum_Objava DESC, v.Procitana DESC ";
        string sqlStringZeskiTopki = @"SELECT TOP 1 v.* FROM Vest v LEFT OUTER JOIN dbo.VestPodkategorija vp ON v.Vest_Id = vp.Vest_Id WHERE vp.Podkategorija = " + t_ZeskiTopkiTip + " AND v.f_Naslovna = 1  AND v.f_Odobrena = 1 AND v.Datum_Objava_Prikaz < GETDATE() ORDER BY v.Datum_Objava DESC, v.Procitana DESC ";
        SqlCommand komandaFudbal = new SqlCommand(sqlStringFudbal, konekcija);
        SqlCommand komandaAnalizi = new SqlCommand(sqlStringAnalizi, konekcija);
        SqlCommand komandaZeskiTopki = new SqlCommand(sqlStringZeskiTopki, konekcija);
        Boolean PrvaVest = true;
        int BrojNaVest = 1;
        try
        {
            konekcija.Open();
            //--------------------------------- Aktuelni vesti - FUDBAL -------------------------------------------
            SqlDataReader citacFudbal = komandaFudbal.ExecuteReader();
            while (citacFudbal.Read())
            {
                if (PrvaVest)
                {
                    imgVestiFudbal.ImageUrl = "Handlers/SlikaVest.ashx?Id=" + citacFudbal["Vest_Id"] + "&tip=mala";
                    lblFudbal1.Text = citacFudbal["Naslov"].ToString();
                    lblFudbal_Id1.Text = citacFudbal["Vest_Id"].ToString();
                    lblFudbal1_Opis.Text = citacFudbal["KratkaSodrzina"].ToString();
                    PrvaVest = false;
                    BrojNaVest++;
                }
                else
                {
                    if (BrojNaVest == 2) { imgVestiFudbal2.ImageUrl = "Handlers/SlikaVest.ashx?Id=" + citacFudbal["Vest_Id"] + "&tip=mala"; }
                    if (BrojNaVest == 3) { imgVestiFudbal3.ImageUrl = "Handlers/SlikaVest.ashx?Id=" + citacFudbal["Vest_Id"] + "&tip=mala"; }
                    
                    LinkButton lblFudbal = (LinkButton)pnlAktuelniFudbal.FindControl("lblFudbal" + BrojNaVest.ToString());
                    Label lblFudbal_Id = (Label)pnlAktuelniFudbal.FindControl("lblFudbal_Id" + BrojNaVest.ToString());
                    lblFudbal.Text = citacFudbal["Naslov"].ToString();
                    lblFudbal_Id.Text = citacFudbal["Vest_Id"].ToString();
                    if (BrojNaVest < 4)
                    {
                        LinkButton lblFudbalOpis = (LinkButton)pnlAktuelniFudbal.FindControl("lblFudbal" + BrojNaVest.ToString() + "_Opis");
                        lblFudbalOpis.Text = citacFudbal["KratkaSodrzina"].ToString();
                    }
                    BrojNaVest++;
                }
            }
            citacFudbal.Close();
            //----------------------------------------------------------------------------------------------------

            //--------------------------------- Aktuelni vesti - Analizi -----------------------------------------
            SqlDataReader citacAnalizi = komandaAnalizi.ExecuteReader();
            PrvaVest = true;
            BrojNaVest = 1;
            while (citacAnalizi.Read())
            {
                if (PrvaVest)
                {
                    imgVestiAnalizi.ImageUrl = "Handlers/SlikaVest.ashx?Id=" + citacAnalizi["Vest_Id"] + "&tip=mala";
                    lblAnalizi1.Text = citacAnalizi["Naslov"].ToString();
                    lblAnalizi_Id1.Text = citacAnalizi["Vest_Id"].ToString();
                    lblAnalizi1_Opis.Text = citacAnalizi["KratkaSodrzina"].ToString();
                    PrvaVest = false;
                    BrojNaVest++;
                }
                else
                {
                    LinkButton lbAnalizi = (LinkButton)pnlAnalizi.FindControl("lblAnalizi" + BrojNaVest.ToString());
                    Label lbAnalizi_Id = (Label)pnlAnalizi.FindControl("lblAnalizi_Id" + BrojNaVest.ToString());
                    lbAnalizi.Text = citacAnalizi["Naslov"].ToString();
                    lbAnalizi_Id.Text = citacAnalizi["Vest_Id"].ToString();
                    BrojNaVest++;
                }
            }
            citacAnalizi.Close();
            //----------------------------------------------------------------------------------------------------

            //--------------------------------- Aktuelni vesti - Zeski Topki -----------------------------------------
            SqlDataReader citacZeskiTopki = komandaZeskiTopki.ExecuteReader();
            PrvaVest = true;
            BrojNaVest = 1;
            while (citacZeskiTopki.Read())
            {
                if (PrvaVest)
                {
                    imgVestiZeskiTopki.ImageUrl = "Handlers/SlikaVest.ashx?Id=" + citacZeskiTopki["Vest_Id"] + "&tip=mala";
                    lblZeskiTopki1.Text = citacZeskiTopki["Naslov"].ToString();
                    lblZeskiTopki_Id1.Text = citacZeskiTopki["Vest_Id"].ToString();
                    lblZeskiTopki1_Opis.Text = citacZeskiTopki["KratkaSodrzina"].ToString();
                    PrvaVest = false;
                    BrojNaVest++;
                }
                else
                {
                    LinkButton lbZeskiTopki = (LinkButton)pnlZeskiTopki.FindControl("lblZeskiTopki" + BrojNaVest.ToString());
                    Label lbZeskiTopki_Id = (Label)pnlZeskiTopki.FindControl("lblZeskiTopki_Id" + BrojNaVest.ToString());
                    lbZeskiTopki.Text = citacZeskiTopki["Naslov"].ToString();
                    lbZeskiTopki_Id.Text = citacZeskiTopki["Vest_Id"].ToString();
                    BrojNaVest++;
                }
            }
            citacZeskiTopki.Close();
            //----------------------------------------------------------------------------------------------------

        }
        catch (Exception err) { }
        finally
        {
            konekcija.Close();
        }
    }

    /// <summary>
    /// TRJavaScript - JavaScript so koj se ovozmozuva da se fati klikot na nekoj od stavkite vo sliderot
    /// </summary>
    /// <param name="con"></param>
    /// <returns></returns>
    public string TRJavaScript(Control con)
    {
        bool bSwitch = false;
    
        string tmp = "";
        DataListItem dli = con as DataListItem;
        LinkButton btn = dli.FindControl("lnkNaslov") as LinkButton;
        string _js = " onclick='document.getElementById(\"{0}\").click();' ";
        tmp = bSwitch ? string.Format(_js, btn.ClientID) : string.Format(_js, btn.ClientID);
        bSwitch = !bSwitch;
        return tmp;
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
    #endregion

    #region LinkClicks

    protected void lblFudbal1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblFudbal_Id1.Text);
    }
    protected void lblFudbal1_Opis_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblFudbal_Id1.Text);
    }
    protected void lblFudbal2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblFudbal_Id2.Text);
    }
    protected void lblFudbal3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblFudbal_Id3.Text);
    }
    protected void lblFudbal4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblFudbal_Id4.Text);
    }
    protected void lblFudbal5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblFudbal_Id5.Text);
    }
    protected void lblFudbal6_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblFudbal_Id6.Text);
    }
    protected void lblFudbal7_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblFudbal_Id7.Text);
    }
    protected void lblFudbal8_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblFudbal_Id8.Text);
    }
    protected void lblFudbal9_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblFudbal_Id9.Text);
    }
    protected void lblFudbal10_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblFudbal_Id10.Text);
    }
    protected void lblFudbal11_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblFudbal_Id11.Text);
    }
    protected void lblFudbal12_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblFudbal_Id12.Text);
    }
    protected void lblFudbal13_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblFudbal_Id13.Text);
    }
    protected void lblFudbal14_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblFudbal_Id14.Text);
    }
    protected void lblFudbal15_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblFudbal_Id15.Text);
    }
    protected void lblAnalizi1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblAnalizi_Id1.Text);
    }
    protected void lblZeskiTopki1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblZeskiTopki_Id1.Text);
    }
    protected void lbArhiva_Click(object sender, EventArgs e)
    {
        Response.Redirect("Arhiva.aspx?id=" + Request.QueryString["id"] + "&ime=" + Request.QueryString["ime"]);
    }
    
    #endregion
}