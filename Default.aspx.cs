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

public partial class _Default : System.Web.UI.Page
{
    #region Promenlivi

    public string t_FudbalTip = ConfigurationManager.AppSettings["Fudbal_Id"];
    public string t_KosarkaTip = ConfigurationManager.AppSettings["Kosarka_Id"];
    public string t_RakometTip = ConfigurationManager.AppSettings["Rakomet_Id"];
    public string t_OstanatoTip = ConfigurationManager.AppSettings["Ostanato_Id"];
    public string t_AnaliziTip = ConfigurationManager.AppSettings["Analizi_Id"];
    public string t_ZeskiTopkiTip = ConfigurationManager.AppSettings["ZeskiTopki_Id"];

    public string pathReklama1, pathReklama2, pathReklama3, pathReklama4, pathReklama5, pathReklama6, pathReklama7, pathReklama8, pathReklama9, pathReklama10;
    public string OpenReklama1, OpenReklama2, OpenReklama3, OpenReklama4, OpenReklama5, OpenReklama6, OpenReklama7, OpenReklama8, OpenReklama9, OpenReklama10;

    #endregion

    #region Load

    /// <summary>
    /// PreInit - pravi podesuvanje za da se gleda menito dobro i na Chrome
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.ServerVariables["http_user_agent"].IndexOf("Safari", StringComparison.CurrentCultureIgnoreCase) != -1)
             Page.ClientTarget = "uplevel";
    }

    protected void ProveriMobilen()
    {
        if (Session["PrinudnoMobilen"] != "desktop")
        {
            string u = Request.ServerVariables["HTTP_USER_AGENT"];
            Regex b = new Regex(@"(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino", RegexOptions.IgnoreCase | RegexOptions.Multiline);
            Regex v = new Regex(@"1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-", RegexOptions.IgnoreCase | RegexOptions.Multiline);
            if ((b.IsMatch(u) || v.IsMatch(u.Substring(0, 4))))
            {
                Response.Redirect("~/MobileVersion/DefaultMobile.aspx");
            }
            if (Session["PrinudnoMobilen"] == "yes") Response.Redirect("~/MobileVersion/DefaultMobile.aspx");
        }
    }

    /// <summary>
    /// Page load - Se vcituaat top 5 vestite so koi se polni SlideShow - animacijata ;  IspolniTop5(); 
    ///           - Se povikuva i f-ta IspolniAktuelniVesti()
    ///           - Se polnat reklamite (i se podesuvaat dali da bidat editabilni ili ne;
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["PrinudnoMobilen"]==null) Session["PrinudnoMobilen"] = "no";
        ProveriMobilen();
        Session["background"] = "";
        if (!IsPostBack)
        {
            ZapisiMacAdresa();
            IspolniTop5();
            IspolniAktuelniVesti();
            IspolniPreporacaniVesti();
        }
        IspolniReklami();
        if (Session["najaven"] == "da") SetirajReklamiEdit(true);
        else SetirajReklamiEdit(false);
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
    /// IspolniAktuelniVesti() - Se ispolnuvaat vestite sto se na levata strana (Fudba, Kosarka, Rakomet, Ostanato)
    /// </summary>
    private void IspolniAktuelniVesti()
    { 
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlStringFudbal = @"SELECT TOP 4 * FROM Vest WHERE Tip = " + t_FudbalTip + " AND f_Naslovna = 1  AND f_Odobrena = 1 AND Datum_Objava_Prikaz < GETDATE() ORDER BY Datum_Objava_Prikaz DESC, Procitana DESC ";
        string sqlStringKosarka = @"SELECT TOP 4 * FROM Vest WHERE Tip = " + t_KosarkaTip + " AND f_Naslovna = 1 AND f_Odobrena = 1 AND Datum_Objava_Prikaz < GETDATE() ORDER BY Datum_Objava_Prikaz DESC, Procitana DESC ";
        string sqlStringRakomet = @"SELECT TOP 4 * FROM Vest WHERE Tip = " + t_RakometTip + " AND f_Naslovna = 1 AND f_Odobrena = 1 AND Datum_Objava_Prikaz < GETDATE() ORDER BY Datum_Objava_Prikaz DESC, Procitana DESC ";
        string sqlStringOstanato = @"SELECT TOP 4 * FROM Vest WHERE Tip = " + t_OstanatoTip + " AND f_Naslovna = 1 AND f_Odobrena = 1 AND Datum_Objava_Prikaz < GETDATE() ORDER BY Datum_Objava_Prikaz DESC, Procitana DESC ";
        string sqlStringAnalizi = @"SELECT TOP 1 v.* FROM Vest v LEFT OUTER JOIN dbo.VestPodkategorija vp ON v.Vest_Id = vp.Vest_Id WHERE vp.Podkategorija = " + t_AnaliziTip + " AND v.f_Naslovna = 1 AND v.f_Odobrena = 1 AND v.Datum_Objava_Prikaz < GETDATE() ORDER BY v.Datum_Objava DESC, v.Procitana DESC ";
        string sqlStringZeskiTopki = @"SELECT TOP 1 v.* FROM Vest v LEFT OUTER JOIN dbo.VestPodkategorija vp ON v.Vest_Id = vp.Vest_Id WHERE vp.Podkategorija = " + t_ZeskiTopkiTip + " AND v.f_Naslovna = 1 AND v.f_Odobrena = 1 AND v.Datum_Objava_Prikaz < GETDATE() ORDER BY v.Datum_Objava DESC, v.Procitana DESC "; 
        SqlCommand komandaFudbal = new SqlCommand(sqlStringFudbal, konekcija);
        SqlCommand komandaKosarka = new SqlCommand(sqlStringKosarka, konekcija);
        SqlCommand komandaRakomet = new SqlCommand(sqlStringRakomet, konekcija);
        SqlCommand komandaOstanato = new SqlCommand(sqlStringOstanato, konekcija);
        SqlCommand komandaAnalizi = new SqlCommand(sqlStringAnalizi, konekcija);
        SqlCommand komandaZeskiTopki = new SqlCommand(sqlStringZeskiTopki, konekcija);
        Boolean PrvaVest = true;
        int BrojNaVest = 1;
        try
        {   konekcija.Open();
            //--------------------------------- Aktuelni vesti - FUDBAL -------------------------------------------
            SqlDataReader citacFudbal = komandaFudbal.ExecuteReader();
            while (citacFudbal.Read())
            {
                if (PrvaVest)
                {   imgVestiFudbal.ImageUrl = "Handlers/SlikaVest.ashx?Id=" + citacFudbal["Vest_Id"] + "&tip=mala";
                    lblFudbal1.Text = citacFudbal["Naslov"].ToString();
                    lblFudbal_Id1.Text = citacFudbal["Vest_Id"].ToString();
                    lblFudbal1_Opis.Text = citacFudbal["KratkaSodrzina"].ToString();
                    PrvaVest = false;
                    BrojNaVest++;
                }
                else
                {   LinkButton lblFudbal = (LinkButton)pnlAktuelniFudbal.FindControl("lblFudbal" + BrojNaVest.ToString());
                    Label lblFudbal_Id = (Label)pnlAktuelniFudbal.FindControl("lblFudbal_Id" + BrojNaVest.ToString());
                    lblFudbal.Text = citacFudbal["Naslov"].ToString();
                    lblFudbal_Id.Text = citacFudbal["Vest_Id"].ToString();
                    BrojNaVest++;
                }
            }
            citacFudbal.Close();
            //----------------------------------------------------------------------------------------------------
           
            //--------------------------------- Aktuelni vesti - Kosarka -------------------------------------------
            SqlDataReader citacKosarka = komandaKosarka.ExecuteReader();
            PrvaVest = true;
            BrojNaVest = 1;
            while (citacKosarka.Read())
            {
                if (PrvaVest)
                {
                    imgVestiKosarka.ImageUrl = "Handlers/SlikaVest.ashx?Id=" + citacKosarka["Vest_Id"] + "&tip=mala";
                    lblKosarka1.Text = citacKosarka["Naslov"].ToString();
                    lblKosarka_Id1.Text = citacKosarka["Vest_Id"].ToString();
                    lblKosarka1_Opis.Text = citacKosarka["KratkaSodrzina"].ToString();
                    PrvaVest = false;
                    BrojNaVest++;
                }
                else
                {
                    LinkButton lblKosarka = (LinkButton)pnlAktuelniKosarka.FindControl("lblKosarka" + BrojNaVest.ToString());
                    Label lblKosarka_Id = (Label)pnlAktuelniKosarka.FindControl("lblKosarka_Id" + BrojNaVest.ToString());
                    lblKosarka.Text = citacKosarka["Naslov"].ToString();
                    lblKosarka_Id.Text = citacKosarka["Vest_Id"].ToString();
                    BrojNaVest++;
                }
            }
            citacKosarka.Close();
            //----------------------------------------------------------------------------------------------------

            //--------------------------------- Aktuelni vesti - Rakomet -------------------------------------------
            SqlDataReader citacRakomet = komandaRakomet.ExecuteReader();
            PrvaVest = true;
            BrojNaVest = 1;
            while (citacRakomet.Read())
            {
                if (PrvaVest)
                {
                    imgVestiRakomet.ImageUrl = "Handlers/SlikaVest.ashx?Id=" + citacRakomet["Vest_Id"] + "&tip=mala";
                    lblRakomet1.Text = citacRakomet["Naslov"].ToString();
                    lblRakomet_Id1.Text = citacRakomet["Vest_Id"].ToString();
                    lblRakomet1_Opis.Text = citacRakomet["KratkaSodrzina"].ToString();
                    PrvaVest = false;
                    BrojNaVest++;
                }
                else
                {
                    LinkButton lblRakomet = (LinkButton)pnlAktuelniRakomet.FindControl("lblRakomet" + BrojNaVest.ToString());
                    Label lblRakomet_Id = (Label)pnlAktuelniRakomet.FindControl("lblRakomet_Id" + BrojNaVest.ToString());
                    lblRakomet.Text = citacRakomet["Naslov"].ToString();
                    lblRakomet_Id.Text = citacRakomet["Vest_Id"].ToString();
                    BrojNaVest++;
                }
            }
            citacRakomet.Close();
            //----------------------------------------------------------------------------------------------------

            //--------------------------------- Aktuelni vesti - Ostanati Sportovi -------------------------------------------
            SqlDataReader citacOstanato = komandaOstanato.ExecuteReader();
            PrvaVest = true;
            BrojNaVest = 1;
            while (citacOstanato.Read())
            {
                if (PrvaVest)
                {
                    imgVestiOstanato.ImageUrl = "Handlers/SlikaVest.ashx?Id=" + citacOstanato["Vest_Id"] + "&tip=mala";
                    lblOstanato1.Text = citacOstanato["Naslov"].ToString();
                    lblOstanato_Id1.Text = citacOstanato["Vest_Id"].ToString();
                    lblOstanato1_Opis.Text = citacOstanato["KratkaSodrzina"].ToString();
                    PrvaVest = false;
                    BrojNaVest++;
                }
                else
                {
                    LinkButton lblOstanato = (LinkButton)pnlAktuelniOstanato.FindControl("lblOstanato" + BrojNaVest.ToString());
                    Label lblOstanato_Id = (Label)pnlAktuelniOstanato.FindControl("lblOstanato_Id" + BrojNaVest.ToString());
                    lblOstanato.Text = citacOstanato["Naslov"].ToString();
                    lblOstanato_Id.Text = citacOstanato["Vest_Id"].ToString();
                    BrojNaVest++;
                }
            }
            citacOstanato.Close();
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
    /// IspolniPreporacaniVesti() - Se polnat preporacanite vesti
    /// </summary>
    private void IspolniPreporacaniVesti()
    {
        DS_PreporacaniVesti.SelectCommand = "VratiPreporacani";
        DS_PreporacaniVesti.SelectParameters["MAC"].DefaultValue = Session["MAC"].ToString();
        DS_PreporacaniVesti.DataBind();
    }
    
    public void ZapisiMacAdresa()
    {
        //Zapisi MAC adresa
        if (Session["MAC"] == null)
        {
            try
            {
                Session["MAC"] = GetMACAddress();
            }
            catch { Session["MAC"] = ""; }
        }
        else if (Session["MAC"].ToString() == "")
        {
            try
            {
                Session["MAC"] = GetMACAddress();
            }
            catch { Session["MAC"] = ""; }
        }
    }
    
    public string GetMACAddress()
    {
        NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
        String sMacAddress = string.Empty;
        foreach (NetworkInterface adapter in nics)
        {
            if (sMacAddress == String.Empty)// only return MAC Address from first card
            {
                IPInterfaceProperties properties = adapter.GetIPProperties();
                sMacAddress = adapter.GetPhysicalAddress().ToString();
            }
        }

        if (Request.Cookies["SportBook_Id"] == null)
        {
            HttpCookie cookie = new HttpCookie("SportBook_Id");

            String GuidNew = System.Guid.NewGuid().ToString();
            GuidNew = GuidNew.Replace("-", "");
            GuidNew = GuidNew.ToUpper();

            cookie.Value = GuidNew;
            cookie.Expires = DateTime.Now.AddYears(10);
            Response.SetCookie(cookie);
        }

        if (Request.Cookies["SportBook_Id"] != null)
        { sMacAddress = Request.Cookies["SportBook_Id"].Value; }

        return sMacAddress;
    }

    /// <summary>
    /// IspolniTop5() - Se polnat top 5te vesti vo SlideShow
    /// </summary>
    private void IspolniTop5()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = @"SET DATEFORMAT DMY ; SELECT TOP 5 Vest_Id, Naslov FROM Vest WHERE f_SlideShow = 1 AND f_Odobrena = 1 AND Datum_Objava_Prikaz < GETDATE() ORDER BY Datum_Objava_Prikaz DESC, Procitana DESC";
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
        }
        catch (Exception err) { }
        finally
        {
            konekcija.Close();
        }
    }

    #endregion

    #region LinkClicks
    
    /// <summary>
    /// Se fakaat klikovite na labelite od levata strana (labelite za vestite)
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
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
    protected void lblKosarka1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblKosarka_Id1.Text);
    }
    protected void lblKosarka1_Opis_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblKosarka_Id1.Text);
    }
    protected void lblKosarka2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblKosarka_Id2.Text);
    }
    protected void lblKosarka3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblKosarka_Id3.Text);
    }
    protected void lblKosarka4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblKosarka_Id4.Text);
    }
    protected void lblRakomet1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblRakomet_Id1.Text);
    }
    protected void lblRakomet1_Opis_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblRakomet_Id1.Text);
    }
    protected void lblRakomet2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblRakomet_Id2.Text);
    }
    protected void lblRakomet3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblRakomet_Id3.Text);
    }
    protected void lblRakomet4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblRakomet_Id4.Text);
    }
    protected void lblOstanato1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblOstanato_Id1.Text);
    }
    protected void lblOstanato1_Opis_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblOstanato_Id1.Text);
    }
    protected void lblOstanato2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblOstanato_Id2.Text);
    }
    protected void lblOstanato3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblOstanato_Id3.Text);
    }
    protected void lblOstanato4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblOstanato_Id4.Text);
    }
    protected void lblAnalizi1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblAnalizi_Id1.Text);
    }
    protected void lblZeskiTopki1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Vest.aspx?id=" + lblZeskiTopki_Id1.Text);
    }
    #endregion

}