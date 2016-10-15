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

public partial class SportBookMaster : System.Web.UI.MasterPage
{
    #region Load
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblFudbalLattest.Text = "0";
            lblKosarkaLattest.Text = "0";
            lblRakometLattest.Text = "0";
            lblOstanatoLattest.Text = "0";

            Image1.ImageUrl = "Images/1.jpg";
            HyperLink1.NavigateUrl = "";

            Image2.ImageUrl = "Images/2.jpg";
            HyperLink2.NavigateUrl = "";

            Image3.ImageUrl = "Images/3.jpg";
            HyperLink3.NavigateUrl = "";

            Image4.ImageUrl = "Images/4.jpg";
            HyperLink4.NavigateUrl = "";

            Image5.ImageUrl = "Images/5.jpg";
            HyperLink5.NavigateUrl = "";

            VcitajMeni();
            ZapisiMacAdresa();
            ProveriLattestVesti();

        }            

    }
    #endregion

    #region Button Clicks

    protected void lnkNaslov_Click(object sender, EventArgs e)
    {
            LinkButton LinkButton1Clicked = (LinkButton)sender;
            DataListItem SelectedItem = (DataListItem)LinkButton1Clicked.NamingContainer;
            Label Vest_Id = (Label)SelectedItem.FindControl("lblVest_Id");
            Response.Redirect("Vest.aspx?id=" + Vest_Id.Text );
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
    protected void DataList2_SelectedIndexChanged(object sender, EventArgs e)
    {

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
                             WHERE V.Datum_Objava > '" + DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture) + @"' 
                             AND V.Tip=1 AND V.Vest_Id NOT IN
                             (SELECT Vest_Id FROM Vest_MAC_Poseta AS VMP
                              WHERE Tip = 1 AND MAC_Add='" + Session["MAC"]+@"' 
                              ) GROUP BY V.Tip 

                            UNION SELECT COUNT(Vest_Id) AS Broj, V.Tip
                             FROM Vest AS V
                             WHERE V.Datum_Objava > '" + DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture) + @"' 
                             AND V.Tip=2 AND V.Vest_Id NOT IN
                             (SELECT Vest_Id FROM Vest_MAC_Poseta AS VMP
                              WHERE Tip = 2 AND MAC_Add='" + Session["MAC"] + @"' 
                              ) GROUP BY V.Tip 

                            UNION SELECT COUNT(Vest_Id) AS Broj, V.Tip
                             FROM Vest AS V
                             WHERE V.Datum_Objava > '" + DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture) + @"' 
                             AND V.Tip=3 AND V.Vest_Id NOT IN
                             (SELECT Vest_Id FROM Vest_MAC_Poseta AS VMP
                              WHERE Tip = 3 AND MAC_Add='" + Session["MAC"] + @"' 
                              ) GROUP BY V.Tip 

                            UNION SELECT COUNT(Vest_Id) AS Broj, V.Tip
                             FROM Vest AS V
                             WHERE V.Datum_Objava > '" + DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture) + @"' 
                             AND V.Tip=4 AND V.Vest_Id NOT IN
                             (SELECT Vest_Id FROM Vest_MAC_Poseta AS VMP
                              WHERE Tip = 4 AND MAC_Add='" + Session["MAC"] + @"' 
                              ) GROUP BY V.Tip "; 
           
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                // Zapisuvanje na brojot na neprocitani vesti:
                if (citac["Tip"].ToString() == "1")
                    lblFudbalLattest.Text = citac["Broj"].ToString();
                if (citac["Tip"].ToString() == "2")
                    lblKosarkaLattest.Text = citac["Broj"].ToString();
                if (citac["Tip"].ToString() == "3")
                    lblRakometLattest.Text = citac["Broj"].ToString();
                if (citac["Tip"].ToString() == "4")
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
                WHERE V.Datum_Objava > '" + DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture) + @"' 
                AND V.Tip=1 AND V.Vest_Id NOT IN
                (SELECT Vest_Id FROM Vest_MAC_Poseta AS VMP
                WHERE Tip = 1 AND MAC_Add='" + Session["MAC"] + @"' 
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
                WHERE V.Datum_Objava > '" + DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture) + @"' 
                AND V.Tip=2 AND V.Vest_Id NOT IN
                (SELECT Vest_Id FROM Vest_MAC_Poseta AS VMP
                WHERE Tip = 2 AND MAC_Add='" + Session["MAC"] + @"' 
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
                WHERE V.Datum_Objava > '" + DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture) + @"' 
                AND V.Tip = 3 AND V.Vest_Id NOT IN
                (SELECT Vest_Id FROM Vest_MAC_Poseta AS VMP
                WHERE Tip = 3 AND MAC_Add='" + Session["MAC"] + @"' 
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
                WHERE V.Datum_Objava > '" + DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture) + @"' 
                AND V.Tip = 4 AND V.Vest_Id NOT IN
                (SELECT Vest_Id FROM Vest_MAC_Poseta AS VMP
                WHERE Tip = 4 AND MAC_Add='" + Session["MAC"] + @"' 
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
    private void VcitajMeni()
    {
        DataTable Tabela = new DataTable();
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "SELECT * FROM Meni";
        try
        {
            using (SqlCommand komanda = new SqlCommand(sqlString, konekcija))
            {
                using (SqlDataAdapter ad = new SqlDataAdapter(komanda))
                {
                    ad.Fill(Tabela);
                }
            }

            DataView view = new DataView(Tabela);
            view.RowFilter = "ParentMeni_Id is NULL";
            foreach (DataRowView row in view)
            {
                MenuItem menuItem = new MenuItem(row["Tekst"].ToString(),
                row["Meni_Id"].ToString());
                menuItem.NavigateUrl = row["Meni_Url"].ToString();
                Meni.Items.Add(menuItem);
                AddChildItems(Tabela, menuItem);
            }

        }
        catch (Exception err) { }
        finally
        {
            konekcija.Close();
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
    private static void AddChildItems(DataTable table, MenuItem menuItem)
    {
        DataView viewItem = new DataView(table);
        viewItem.RowFilter = "ParentMeni_Id = " + menuItem.Value;
        foreach (DataRowView childView in viewItem)
        {
            MenuItem childItem = new MenuItem(childView["Tekst"].ToString(), childView["Meni_Id"].ToString());
            childItem.NavigateUrl = childView["Meni_Url"].ToString();
            if (childView.Row.ItemArray[2].ToString() != "")
            {
                childItem.ImageUrl = "Handler.ashx?Id=" + childView["Meni_Id"].ToString();
            }
            menuItem.ChildItems.Add(childItem);
            AddChildItems(table, childItem);
        }
    }
    
    #endregion
}
