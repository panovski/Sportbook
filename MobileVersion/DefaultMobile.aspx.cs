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

public partial class MobileVersion_DefaultMobile : System.Web.UI.Page
{

    public string t_FudbalTip = ConfigurationManager.AppSettings["Fudbal_Id"];
    public string t_KosarkaTip = ConfigurationManager.AppSettings["Kosarka_Id"];
    public string t_RakometTip = ConfigurationManager.AppSettings["Rakomet_Id"];
    public string t_OstanatoTip = ConfigurationManager.AppSettings["Ostanato_Id"];
    public string t_AnaliziTip = ConfigurationManager.AppSettings["Analizi_Id"];
    public string t_ZeskiTopkiTip = ConfigurationManager.AppSettings["ZeskiTopki_Id"];

    protected void Page_Load(object sender, EventArgs e)
    {
        IspolniAktuelniVesti();
    }
    
    /// <summary>
    /// IspolniAktuelniVesti() - Se ispolnuvaat vestite sto se na levata strana (Fudba, Kosarka, Rakomet, Ostanato)
    /// </summary>
    private void IspolniAktuelniVesti()
    {
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlStringFudbal = @"SELECT TOP 5 * FROM Vest WHERE Tip = " + t_FudbalTip + " AND f_Naslovna = 1  AND f_Odobrena = 1 AND Datum_Objava_Prikaz < GETDATE() ORDER BY Datum_Objava DESC, Procitana DESC ";
        string sqlStringKosarka = @"SELECT TOP 5 * FROM Vest WHERE Tip = " + t_KosarkaTip + " AND f_Naslovna = 1 AND f_Odobrena = 1 AND Datum_Objava_Prikaz < GETDATE() ORDER BY Datum_Objava DESC, Procitana DESC ";
        string sqlStringRakomet = @"SELECT TOP 5 * FROM Vest WHERE Tip = " + t_RakometTip + " AND f_Naslovna = 1 AND f_Odobrena = 1 AND Datum_Objava_Prikaz < GETDATE() ORDER BY Datum_Objava DESC, Procitana DESC ";
        string sqlStringOstanato = @"SELECT TOP 5 * FROM Vest WHERE Tip = " + t_OstanatoTip + " AND f_Naslovna = 1 AND f_Odobrena = 1 AND Datum_Objava_Prikaz < GETDATE() ORDER BY Datum_Objava DESC, Procitana DESC ";
        string sqlStringAnalizi = @"SELECT TOP 1 v.* FROM Vest v LEFT OUTER JOIN dbo.VestPodkategorija vp ON v.Vest_Id = vp.Vest_Id WHERE vp.Podkategorija = " + t_AnaliziTip + " AND v.f_Naslovna = 1 AND v.f_Odobrena = 1 AND v.Datum_Objava_Prikaz < GETDATE() ORDER BY v.Datum_Objava DESC, v.Procitana DESC ";
        string sqlStringZeskiTopki = @"SELECT TOP 1 v.* FROM Vest v LEFT OUTER JOIN dbo.VestPodkategorija vp ON v.Vest_Id = vp.Vest_Id WHERE vp.Podkategorija = " + t_ZeskiTopkiTip + " AND v.f_Naslovna = 1 AND v.f_Odobrena = 1 AND v.Datum_Objava_Prikaz < GETDATE() ORDER BY v.Datum_Objava DESC, v.Procitana DESC ";

        DS_Vesti_Fudbal.ConnectionString = konekcija.ConnectionString;
        DS_Vesti_Fudbal.SelectCommand = sqlStringFudbal;
        DS_Vesti_Fudbal.DataBind();

        DS_Vesti_Kosarka.ConnectionString = konekcija.ConnectionString;
        DS_Vesti_Kosarka.SelectCommand = sqlStringKosarka;
        DS_Vesti_Kosarka.DataBind();

        DS_Vesti_Rakomet.ConnectionString = konekcija.ConnectionString;
        DS_Vesti_Rakomet.SelectCommand = sqlStringRakomet;
        DS_Vesti_Rakomet.DataBind();

        DS_Vesti_Ostanato.ConnectionString = konekcija.ConnectionString;
        DS_Vesti_Ostanato.SelectCommand = sqlStringOstanato;
        DS_Vesti_Ostanato.DataBind();

        DS_Vesti_Analizi.ConnectionString = konekcija.ConnectionString;
        DS_Vesti_Analizi.SelectCommand = sqlStringAnalizi;
        DS_Vesti_Analizi.DataBind();

        DS_Vesti_ZeskiTopki.ConnectionString = konekcija.ConnectionString;
        DS_Vesti_ZeskiTopki.SelectCommand = sqlStringZeskiTopki;
        DS_Vesti_ZeskiTopki.DataBind();
    }
    protected void lbFudbal_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/MobileVersion/CategorijaMobile.aspx?Tip="+t_FudbalTip);
    }
    protected void lbKosarka_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/MobileVersion/CategorijaMobile.aspx?Tip=" + t_KosarkaTip);
    }
    protected void lbRakomet_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/MobileVersion/CategorijaMobile.aspx?Tip=" + t_RakometTip);
    }
    protected void lbOstanatiSportovi_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/MobileVersion/CategorijaMobile.aspx?Tip=" + t_OstanatoTip);
    }
    protected void lbAnalizi_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/MobileVersion/CategorijaMobile.aspx?Tip=" + t_AnaliziTip);
    }
    protected void lbZeshkiTopki_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/MobileVersion/CategorijaMobile.aspx?Tip=" + t_ZeskiTopkiTip);
    }
    protected void NaslovLabel_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton1Clicked = (LinkButton)sender;
        DataListItem SelectedItem = (DataListItem)LinkButton1Clicked.NamingContainer;
        Label Vest_Id = (Label)SelectedItem.FindControl("Vest_IdLabel");
        Response.Redirect("VestMobile.aspx?id=" + Vest_Id.Text);
    }
}