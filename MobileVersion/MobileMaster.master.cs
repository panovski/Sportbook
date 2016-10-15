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

public partial class MobileVersion_MobileMaster : System.Web.UI.MasterPage
{
    #region Promenlivi

    public string t_FudbalTip = ConfigurationManager.AppSettings["Fudbal_Id"];
    public string t_KosarkaTip = ConfigurationManager.AppSettings["Kosarka_Id"];
    public string t_RakometTip = ConfigurationManager.AppSettings["Rakomet_Id"];
    public string t_OstanatoTip = ConfigurationManager.AppSettings["Ostanato_Id"];
    public string t_Klubovi = ConfigurationManager.AppSettings["Klubovi_Id"];
    public string backgroundImage = "Images/bg.jpg";// "Handlers/Pozadina.ashx";

    #endregion

    #region Load

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblFudbalLattest.Text = "0";
            lblKosarkaLattest.Text = "0";
            lblRakometLattest.Text = "0";
            lblOstanatoLattest.Text = "0";

            ZapisiMacAdresa();
            ProveriLattestVesti();
        }

    }

    #endregion

    #region Button_Clicks

    protected void lnkNaslov_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton1Clicked = (LinkButton)sender;
        DataListItem SelectedItem = (DataListItem)LinkButton1Clicked.NamingContainer;
        Label Vest_Id = (Label)SelectedItem.FindControl("lblVest_Id");
        Response.Redirect("VestMobile.aspx?id=" + Vest_Id.Text);
    }

    protected void imgFudbalLattest_Click(object sender, ImageClickEventArgs e)
    {
        pnlDDLKosarka.Visible = false;
        pnlDDLRakomet.Visible = false;
        pnlDDLOstanato.Visible = false;

        if (pnlDDLFudbal.Visible)
            pnlDDLFudbal.Visible = false;
        else
            pnlDDLFudbal.Visible = true;

    }

    protected void imgKosarkaLattest_Click(object sender, ImageClickEventArgs e)
    {
        pnlDDLFudbal.Visible = false;
        pnlDDLRakomet.Visible = false;
        pnlDDLOstanato.Visible = false;

        if (pnlDDLKosarka.Visible)
            pnlDDLKosarka.Visible = false;
        else
            pnlDDLKosarka.Visible = true;
    }

    protected void imgRakometLattest_Click(object sender, ImageClickEventArgs e)
    {
        pnlDDLFudbal.Visible = false;
        pnlDDLKosarka.Visible = false;
        pnlDDLOstanato.Visible = false;

        if (pnlDDLRakomet.Visible)
            pnlDDLRakomet.Visible = false;
        else
            pnlDDLRakomet.Visible = true;

    }

    protected void imgOstanatoLattest_Click(object sender, ImageClickEventArgs e)
    {
        pnlDDLFudbal.Visible = false;
        pnlDDLKosarka.Visible = false;
        pnlDDLRakomet.Visible = false;

        if (pnlDDLOstanato.Visible)
            pnlDDLOstanato.Visible = false;
        else
            pnlDDLOstanato.Visible = true;

    }

    protected void Meni_MenuItemClick(object sender, MenuEventArgs e)
    {
        HideAllDropDown();
        String tPom = e.Item.Value.ToString();
        string[] words = tPom.Split('_');
        if (words[1] == "True")
            Response.Redirect("DefaultCategories.aspx?id=" + words[0] + "&ime=" + e.Item.Text.ToString());
    }

    protected void btnPromeni_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["najaven"] = "ne";
        Session["BrishiSliki"] = null;
        Response.Redirect("Login.aspx");
    }
    #endregion

    #region Funkcii

    private void ProveriLattestVesti()
    {
        // Izminuvanje na novite neprocitani vesti i odreduvanje na nivniot broj:
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = @"SELECT COUNT(Vest_Id) AS Broj, V.Tip
                             FROM Vest AS V
                             WHERE V.Datum_Objava_Prikaz > '" + DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture) + @"' 
                             AND V.Tip=" + t_FudbalTip + @" AND V.f_Odobrena = 1 AND V.Datum_Objava_Prikaz < GETDATE() AND V.Vest_Id NOT IN
                             (SELECT Vest_Id FROM Vest_MAC_Poseta AS VMP
                              WHERE Tip = " + t_FudbalTip + @" AND MAC_Add='" + Session["MAC"] + @"' 
                              ) GROUP BY V.Tip 

                            UNION SELECT COUNT(Vest_Id) AS Broj, V.Tip
                             FROM Vest AS V
                             WHERE V.Datum_Objava_Prikaz > '" + DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture) + @"' 
                             AND V.Tip= " + t_KosarkaTip + @" AND V.f_Odobrena = 1 AND V.Datum_Objava_Prikaz < GETDATE() AND V.Vest_Id NOT IN
                             (SELECT Vest_Id FROM Vest_MAC_Poseta AS VMP
                              WHERE Tip = " + t_KosarkaTip + @" AND MAC_Add='" + Session["MAC"] + @"' 
                              ) GROUP BY V.Tip 

                            UNION SELECT COUNT(Vest_Id) AS Broj, V.Tip
                             FROM Vest AS V
                             WHERE V.Datum_Objava_Prikaz > '" + DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture) + @"' 
                             AND V.Tip= " + t_RakometTip + @" AND V.f_Odobrena = 1 AND V.Datum_Objava_Prikaz < GETDATE() AND V.Vest_Id NOT IN
                             (SELECT Vest_Id FROM Vest_MAC_Poseta AS VMP
                              WHERE Tip = " + t_RakometTip + @" AND MAC_Add='" + Session["MAC"] + @"' 
                              ) GROUP BY V.Tip 

                            UNION SELECT COUNT(Vest_Id) AS Broj, V.Tip
                             FROM Vest AS V
                             WHERE V.Datum_Objava_Prikaz > '" + DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture) + @"' 
                             AND V.Tip=" + t_OstanatoTip + @" AND V.f_Odobrena = 1 AND V.Datum_Objava_Prikaz < GETDATE() AND V.Vest_Id NOT IN
                             (SELECT Vest_Id FROM Vest_MAC_Poseta AS VMP
                              WHERE Tip = " + t_OstanatoTip + @" AND MAC_Add='" + Session["MAC"] + @"' 
                              ) GROUP BY V.Tip ";

        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                // Zapisuvanje na brojot na neprocitani vesti:
                if (citac["Tip"].ToString() == t_FudbalTip)
                    lblFudbalLattest.Text = citac["Broj"].ToString();
                if (citac["Tip"].ToString() == t_KosarkaTip)
                    lblKosarkaLattest.Text = citac["Broj"].ToString();
                if (citac["Tip"].ToString() == t_RakometTip)
                    lblRakometLattest.Text = citac["Broj"].ToString();
                if (citac["Tip"].ToString() == t_OstanatoTip)
                    lblOstanatoLattest.Text = citac["Broj"].ToString();
            }
            citac.Close();

            // Fudbal - Disabled ako nema novi
            if (lblFudbalLattest.Text == "0")
            {
                pnlFudbalLattest.Visible = false;
                lblFudbalDDLInfo.Visible = true;
                imgFudbalLattest.ImageUrl = "~/Images/fudbal_topka-disabled.png";
            }
            else
            {
                // Fudbal - Ispolnuvanje samo so novite vesti :
                sqlDSFudbalDDL.SelectCommand = @"SELECT *
                FROM Vest AS V
                WHERE V.Datum_Objava_Prikaz > '" + DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture) + @"' 
                AND V.Tip=" + t_FudbalTip + @" AND V.f_Odobrena = 1 AND V.Datum_Objava_Prikaz < GETDATE() AND V.Vest_Id NOT IN
                (SELECT Vest_Id FROM Vest_MAC_Poseta AS VMP
                WHERE Tip = " + t_FudbalTip + @" AND MAC_Add='" + Session["MAC"] + @"' 
                )";
                DataList2.DataSource = sqlDSFudbalDDL;
                DataList2.DataBind();
            }

            // Kosarka - Disabled ako nema novi
            if (lblKosarkaLattest.Text == "0")
            {
                pnlKosarkaLattest.Visible = false;
                lblKosarkaDDLInfo.Visible = true;
                imgKosarkaLattest.ImageUrl = "~/Images/basket_topka_disabled.png";
            }
            else
            {
                // Kosarka - Ispolnuvanje samo so novite vesti :
                sqlDSKosarkaDDL.SelectCommand = @"SELECT *
                FROM Vest AS V
                WHERE V.Datum_Objava_Prikaz > '" + DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture) + @"' 
                AND V.Tip=" + t_KosarkaTip + @" AND V.f_Odobrena = 1 AND V.Datum_Objava_Prikaz < GETDATE() AND V.Vest_Id NOT IN
                (SELECT Vest_Id FROM Vest_MAC_Poseta AS VMP
                WHERE Tip = " + t_KosarkaTip + @" AND MAC_Add='" + Session["MAC"] + @"' 
                )";
                DataList3.DataSource = sqlDSKosarkaDDL;
                DataList3.DataBind();
            }

            // Rakomet - Disabled ako nema novi
            if (lblRakometLattest.Text == "0")
            {
                pnlRakometLattest.Visible = false;
                lblRakometDDLInfo.Visible = true;
                imgRakometLattest.ImageUrl = "~/Images/rakomet_topka_disabled.png";
            }
            else
            {
                // Rakomet - Ispolnuvanje samo so novite vesti :
                sqlDSRakometDDL.SelectCommand = @"SELECT *
                FROM Vest AS V
                WHERE V.Datum_Objava_Prikaz > '" + DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture) + @"' 
                AND V.Tip = " + t_RakometTip + @" AND V.f_Odobrena = 1 AND V.Datum_Objava_Prikaz < GETDATE() AND V.Vest_Id NOT IN
                (SELECT Vest_Id FROM Vest_MAC_Poseta AS VMP
                WHERE Tip = " + t_RakometTip + @" AND MAC_Add='" + Session["MAC"] + @"' 
                )";
                DataList4.DataSource = sqlDSRakometDDL;
                DataList4.DataBind();
            }

            // Ostanato - Disabled ako nema novi
            if (lblOstanatoLattest.Text == "0")
            {
                pnlOstanatoLattest.Visible = false;
                lblOstanatoDDLInfo.Visible = true;
                imgOstanatoLattest.ImageUrl = "~/Images/ostanati_sportovi_disabled.png";
            }
            else
            {
                // Ostanato - Ispolnuvanje samo so novite vesti :
                sqlDSOstanatoDDL.SelectCommand = @"SELECT *
                FROM Vest AS V
                WHERE V.Datum_Objava_Prikaz > '" + DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture) + @"' 
                AND V.Tip = " + t_OstanatoTip + @" AND V.f_Odobrena = 1 AND V.Datum_Objava_Prikaz < GETDATE() AND V.Vest_Id NOT IN
                (SELECT Vest_Id FROM Vest_MAC_Poseta AS VMP
                WHERE Tip = " + t_OstanatoTip + @" AND MAC_Add='" + Session["MAC"] + @"' 
                )";
                DataList5.DataSource = sqlDSOstanatoDDL;
                DataList5.DataBind();
            }
        }
        catch (Exception err) { }
        finally
        {
            konekcija.Close();
        }
    }

    public void HideAllDropDown()
    {
        pnlDDLFudbal.Visible = false;
        pnlDDLKosarka.Visible = false;
        pnlDDLRakomet.Visible = false;
        pnlDDLOstanato.Visible = false;
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

    public string TRJavaScript(Control con)
    {
        bool bSwitch = false;
        //string color1 = "#ffffcc";
        //string color2 = "#ccff99";

        string tmp = "";
        DataListItem dli = con as DataListItem;
        LinkButton btn = dli.FindControl("lnkNaslov") as LinkButton;
        string _js = //"bgcolor={0} onMouseover='rowcolor=this" +
            //".style.backgroundColor;this.style.backgroundColor" +
            //"=\"yellow\"; this.style.cursor = \"hand\"' " +
            //"onMouseout='this.style.backgroundColor=rowcolor;' " +
                     " onclick='document.getElementById(\"{0}\").click();' ";
        tmp = bSwitch ? string.Format(_js, btn.ClientID) :
                       string.Format(_js, btn.ClientID);
        bSwitch = !bSwitch;
        return tmp;
    }

    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Response.Write(e.CommandArgument.ToString());
    }
    protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Response.Write(e.CommandArgument.ToString());
    }
    protected void DataList4_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Response.Write(e.CommandArgument.ToString());
    }
    protected void DataList5_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Response.Write(e.CommandArgument.ToString());
    }

    #endregion
    protected void lnkDesktopV_Click1(object sender, EventArgs e)
    {
        Session["PrinudnoMobilen"] = "desktop";
        Response.Redirect("~/Default.aspx");
    }
}
