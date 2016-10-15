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
        string sqlStringFudbal = @"SELECT TOP 30 * FROM Vest WHERE Tip = " + t_FudbalTip + " AND f_Odobrena = 1 AND Datum_Objava_Prikaz < GETDATE() ORDER BY Datum_Objava DESC, Procitana DESC ";
        string sqlStringKosarka = @"SELECT TOP 30 * FROM Vest WHERE Tip = " + t_KosarkaTip + " AND f_Odobrena = 1 AND Datum_Objava_Prikaz < GETDATE() ORDER BY Datum_Objava DESC, Procitana DESC ";
        string sqlStringRakomet = @"SELECT TOP 30 * FROM Vest WHERE Tip = " + t_RakometTip + " AND f_Odobrena = 1 AND Datum_Objava_Prikaz < GETDATE() ORDER BY Datum_Objava DESC, Procitana DESC ";
        string sqlStringOstanato = @"SELECT TOP 30 * FROM Vest WHERE Tip = " + t_OstanatoTip + " AND f_Odobrena = 1 AND Datum_Objava_Prikaz < GETDATE() ORDER BY Datum_Objava DESC, Procitana DESC ";
        string sqlStringAnalizi = @"SELECT TOP 30 v.* FROM Vest v LEFT OUTER JOIN dbo.VestPodkategorija vp ON v.Vest_Id = vp.Vest_Id WHERE vp.Podkategorija = " + t_AnaliziTip + " AND v.f_Odobrena = 1 AND v.Datum_Objava_Prikaz < GETDATE() ORDER BY v.Datum_Objava DESC, v.Procitana DESC ";
        string sqlStringZeskiTopki = @"SELECT TOP 30 v.* FROM Vest v LEFT OUTER JOIN dbo.VestPodkategorija vp ON v.Vest_Id = vp.Vest_Id WHERE vp.Podkategorija = " + t_ZeskiTopkiTip + " AND v.f_Odobrena = 1 AND v.Datum_Objava_Prikaz < GETDATE() ORDER BY v.Datum_Objava DESC, v.Procitana DESC ";

        if (Request.QueryString["Tip"] == t_FudbalTip) 
        {
            DS_Vesti.SelectCommand = sqlStringFudbal;
            lblTip.Text = "Фудбал";
        }

        if (Request.QueryString["Tip"] == t_KosarkaTip)
        {
            DS_Vesti.SelectCommand = sqlStringKosarka;
            lblTip.Text = "Кошарка";
        }

        if (Request.QueryString["Tip"] == t_RakometTip)
        {
            DS_Vesti.SelectCommand = sqlStringRakomet;
            lblTip.Text = "Ракомет";
        }
        if (Request.QueryString["Tip"] == t_OstanatoTip)
        {
            DS_Vesti.SelectCommand = sqlStringOstanato;
            lblTip.Text = "Останати спортови";
        }
        if (Request.QueryString["Tip"] == t_AnaliziTip)
        {
            DS_Vesti.SelectCommand = sqlStringAnalizi;
            lblTip.Text = "Анализи";
        }
        if (Request.QueryString["Tip"] == t_ZeskiTopkiTip)
        {
            DS_Vesti.SelectCommand = sqlStringZeskiTopki;
            lblTip.Text = "Жешки топки";
        }

        DS_Vesti.ConnectionString = konekcija.ConnectionString;
        DS_Vesti.DataBind();
 
    }
    protected void NaslovLabel_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton1Clicked = (LinkButton)sender;
        DataListItem SelectedItem = (DataListItem)LinkButton1Clicked.NamingContainer;
        Label Vest_Id = (Label)SelectedItem.FindControl("Vest_IdLabel");
        Response.Redirect("VestMobile.aspx?id=" + Vest_Id.Text);
    }
}