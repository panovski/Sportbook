using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Drawing.Drawing2D;

public partial class Account_Login : System.Web.UI.Page
{
    #region Load
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["najaven"] != null))
        {
            if (Session["najaven"] == "ne") pnlPromeniMeni.Visible = false;
            else if (Session["najaven"] == "da") pnlPromeniMeni.Visible = true;
        }
        else pnlPromeniMeni.Visible = false;

        if (!Page.IsPostBack)
        {
            DSCeloMeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
            DSGlavnoMeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
            DSPodmeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
            DSSitePodmenija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

            DSCeloMeni.SelectCommand = "SELECT Meni_Id, Tekst FROM Meni UNION SELECT '',''";
            DSGlavnoMeni.SelectCommand = "SELECT * FROM Meni Where ParentMeni_Id IS NULL ORDER BY f_Sort";
            DSPodmeni.SelectCommand = "SELECT * FROM Meni WHERE 1=2";
            DSSitePodmenija.SelectCommand = "SELECT * FROM Meni WHERE 1=2";

            Session["GlavnoMeni"] = "";
            Session["VtoroMeni"]="";
            Session["TretoMeni"]="";
        }
    }

    #endregion

    #region Button_Clicks
    
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
    protected void lbGlavnoMeni_SelectedIndexChanged(object sender, EventArgs e)
    {
        GlavnoUp.Enabled = true;
        GlavnoDown.Enabled = true;
        DSPodmeni.SelectCommand = "SELECT * FROM Meni Where NOT ParentMeni_Id IS NULL AND ParentMeni_Id = " + lbGlavnoMeni.SelectedValue + "  ORDER BY f_Sort";
        DSPodmeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        DSPodmeni.DataBind();

        DSSitePodmenija.SelectCommand = "SELECT * FROM Meni WHERE 1=2";
        DSSitePodmenija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        DSSitePodmenija.DataBind();

        //UpdatePanel2.DataBind();
        Session["GlavnoMeni"] = lbGlavnoMeni.SelectedIndex;
        Session["VtoroMeni"] = "";
        Session["TretoMeni"]="";
        NapolniPromena(Convert.ToInt32(lbGlavnoMeni.SelectedValue));
    }
    protected void lbPodmeni_SelectedIndexChanged(object sender, EventArgs e)
    {
        VtoroUp.Enabled = true;
        VtoroDown.Enabled = true;
        DSSitePodmenija.SelectCommand = @"select Meni_Id, Tekst, f_Sort from Meni where ParentMeni_Id=" + lbPodmeni.SelectedValue + @"
                                            union select Meni_Id, Tekst, f_Sort from Meni where ParentMeni_Id IN
                                            (select Meni_Id from Meni where ParentMeni_Id=" + lbPodmeni.SelectedValue + ") ORDER BY f_Sort";
        DSSitePodmenija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        DSSitePodmenija.DataBind();
        Session["VtoroMeni"] = lbPodmeni.SelectedIndex;
        Session["TretoMeni"] = "";
        //UpdatePanel2.DataBind();
        NapolniPromena(Convert.ToInt32(lbPodmeni.SelectedValue));
    }
    protected void lbSitePodmenija_SelectedIndexChanged(object sender, EventArgs e)
    {
        TretoUp.Enabled = true;
        TretoDown.Enabled = true;
        NapolniPromena(Convert.ToInt32(lbSitePodmenija.SelectedValue));
        Session["TretoMeni"] = lbSitePodmenija.SelectedIndex;
    }
    protected void btnPromeni_Click(object sender, EventArgs e)
    {
        if (tbSelected_Id.Text != "")
        {
            String f_Stranica = "0";
            if (cbStranica.Checked) f_Stranica = "1";
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
            SqlCommand komanda = new SqlCommand();
            komanda.Connection = connection;

            String Podmeni = ddlPromeniPodmeni.SelectedValue;
            if (Convert.ToInt32(Podmeni) < 1) Podmeni = "NULL";

            if (fuPromeniSlika.PostedFile.ContentLength != 0)
            {
                Bitmap originalBMP = new Bitmap(fuPromeniSlika.FileContent);

                // Calculate the new image dimensions
                int origWidth = originalBMP.Width;
                int origHeight = originalBMP.Height;
                int sngRatio = origWidth / origHeight;
                int newWidth = 20;
                if (sngRatio < 1) sngRatio=1;
                int newHeight = newWidth / sngRatio;

                int newWidth2 = 70;
                if (sngRatio < 1) sngRatio = 1;
                int newHeight2 = newWidth2 / sngRatio;

                // Create a new bitmap which will hold the previous resized bitmap
                Bitmap newBMP = new Bitmap(originalBMP, newWidth, newHeight);
                Graphics oGraphics = Graphics.FromImage(newBMP);
                oGraphics.SmoothingMode = SmoothingMode.AntiAlias; oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                oGraphics.DrawImage(originalBMP, 0, 0, newWidth, newHeight);
                byte[] data;

                Bitmap newBMP2 = new Bitmap(originalBMP, newWidth2, newHeight2);
                Graphics oGraphics2 = Graphics.FromImage(newBMP2);
                oGraphics2.SmoothingMode = SmoothingMode.AntiAlias; oGraphics2.InterpolationMode = InterpolationMode.HighQualityBicubic;
                oGraphics2.DrawImage(originalBMP, 0, 0, newWidth2, newHeight2);
                byte[] data2;

                using (System.IO.MemoryStream stream = new System.IO.MemoryStream())
                {
                    newBMP.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                    stream.Position = 0;
                    data = new byte[stream.Length];
                    data = stream.ToArray();

                    newBMP2.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                    stream.Position = 0;
                    data2 = new byte[stream.Length];
                    data2 = stream.ToArray();
                }

                komanda.CommandText = "UPDATE Meni SET Tekst = ' " + tbPromeniTekst.Text + "', Opis = '" + tbPromeniOpis.Text + @"', 
            ParentMeni_Id = " + Podmeni + " , f_Stranica = "+ f_Stranica +", Slika = @Slika, SlikaGolema = @SlikaGolema WHERE Meni_Id = " + tbSelected_Id.Text;
                komanda.Parameters.Add("@Slika", data);
                komanda.Parameters.Add("@SlikaGolema", data2);
            }
            else
            {
                komanda.CommandText = "UPDATE Meni SET Tekst = ' " + tbPromeniTekst.Text + "', Opis = '" + tbPromeniOpis.Text + @"', 
            ParentMeni_Id = " + Podmeni + ", f_Stranica = " + f_Stranica + " WHERE Meni_Id = " + tbSelected_Id.Text;
            }

            try
            {
                connection.Open();
                komanda.ExecuteNonQuery();
            }
            finally
            {
                connection.Close();

                DSCeloMeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                DSGlavnoMeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                DSPodmeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                DSSitePodmenija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

                DSCeloMeni.SelectCommand = "SELECT Meni_Id, Tekst FROM Meni UNION SELECT '',''";
                DSGlavnoMeni.SelectCommand = "SELECT * FROM Meni Where ParentMeni_Id IS NULL";
                DSPodmeni.SelectCommand = "SELECT * FROM Meni WHERE 1=2";
                DSSitePodmenija.SelectCommand = "SELECT * FROM Meni WHERE 1=2";

                DSCeloMeni.DataBind();
                DSGlavnoMeni.DataBind();
                DSPodmeni.DataBind();
                DSSitePodmenija.DataBind();

                lbGlavnoMeni.SelectedIndex = Convert.ToInt32(Session["GlavnoMeni"]);

                if (Session["VtoroMeni"] != "")
                {
                    DSPodmeni.SelectCommand = "SELECT * FROM Meni Where NOT ParentMeni_Id IS NULL AND ParentMeni_Id = " + lbGlavnoMeni.SelectedValue;
                    DSPodmeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                    DSPodmeni.DataBind();
                    lbPodmeni.SelectedIndex = Convert.ToInt32(Session["VtoroMeni"]);
                }
                if (Session["TretoMeni"] != "")
                {
                    DSSitePodmenija.SelectCommand = @"select Meni_Id, Tekst, f_Sort from Meni where ParentMeni_Id=" + lbPodmeni.SelectedValue + @"
                                            union select Meni_Id, Tekst, f_Sort from Meni where ParentMeni_Id IN
                                            (select Meni_Id from Meni where ParentMeni_Id=" + lbPodmeni.SelectedValue + ") ORDER BY f_Sort";
                    DSSitePodmenija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                    DSSitePodmenija.DataBind();
                    lbSitePodmenija.SelectedIndex = Convert.ToInt32(Session["TretoMeni"]);
                }

                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Промените се сочувани!');", true);
            }
        }
    }
    protected void btnIzbrisi_Click(object sender, EventArgs e)
    {
        if (tbSelected_Id.Text != "")
        {
            SlikaMeni.ImageUrl = "";
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
            SqlCommand komanda = new SqlCommand();
            komanda.Connection = connection;
            komanda.CommandText = "DELETE FROM Meni WHERE Meni_Id = " + tbSelected_Id.Text;
            try
            {
                connection.Open();
                komanda.ExecuteNonQuery();
            }
            finally
            {
                connection.Close();
                tbSelected_Id.Text = "";
                tbPromeniTekst.Text = "";
                tbPromeniOpis.Text = "";
                ddlPromeniPodmeni.SelectedIndex = -1;

                DSCeloMeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                DSGlavnoMeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                DSPodmeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                DSSitePodmenija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

                DSCeloMeni.SelectCommand = "SELECT Meni_Id, Tekst FROM Meni UNION SELECT '',''";
                DSGlavnoMeni.SelectCommand = "SELECT * FROM Meni Where ParentMeni_Id IS NULL ORDER BY f_Sort";
                DSPodmeni.SelectCommand = "SELECT * FROM Meni WHERE 1=2";
                DSSitePodmenija.SelectCommand = "SELECT * FROM Meni WHERE 1=2";

                DSCeloMeni.DataBind();
                DSGlavnoMeni.DataBind();
                DSPodmeni.DataBind();
                DSSitePodmenija.DataBind();

                if (Session["VtoroMeni"] != "")
                {
                    lbGlavnoMeni.SelectedIndex = Convert.ToInt32(Session["GlavnoMeni"]);

                    DSPodmeni.SelectCommand = "SELECT * FROM Meni Where NOT ParentMeni_Id IS NULL AND ParentMeni_Id = " + lbGlavnoMeni.SelectedValue + " ORDER BY f_Sort";
                    DSPodmeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                    DSPodmeni.DataBind();
                    
                }
                if (Session["TretoMeni"] != "")
                {
                    lbPodmeni.SelectedIndex = Convert.ToInt32(Session["VtoroMeni"]);
                    DSSitePodmenija.SelectCommand = @"select Meni_Id, Tekst, f_Sort from Meni where ParentMeni_Id=" + lbPodmeni.SelectedValue + @"
                                            union select Meni_Id, Tekst, f_Sort from Meni where ParentMeni_Id IN
                                            (select Meni_Id from Meni where ParentMeni_Id=" + lbPodmeni.SelectedValue + ") ORDER BY f_Sort";
                    DSSitePodmenija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                    DSSitePodmenija.DataBind();
                }

                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Ставката е избришана!');", true);
            }
        }
    }
    protected void btnDodadi_Click(object sender, EventArgs e)
    {
        if (tbPromeniTekst.Text != "")
        {
            String f_Stranica = "0";
            if (cbStranica.Checked) f_Stranica = "1";
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
            SqlCommand komanda = new SqlCommand();
            komanda.Connection = connection;

            String Podmeni = ddlPromeniPodmeni.SelectedValue;
            if (Convert.ToInt32(Podmeni) < 1) Podmeni = "NULL";

            if (fuPromeniSlika.PostedFile.ContentLength != 0)
            {
                Bitmap originalBMP = new Bitmap(fuPromeniSlika.FileContent);

                // Calculate the new image dimensions
                int origWidth = originalBMP.Width;
                int origHeight = originalBMP.Height;
                int sngRatio = origWidth / origHeight;
                int newWidth = 20;
                if (sngRatio < 1) sngRatio = 1;
                int newHeight = newWidth / sngRatio;

                int newWidth2 = 70;
                if (sngRatio < 1) sngRatio = 1;
                int newHeight2 = newWidth2 / sngRatio;

                // Create a new bitmap which will hold the previous resized bitmap
                Bitmap newBMP = new Bitmap(originalBMP, newWidth, newHeight);
                Graphics oGraphics = Graphics.FromImage(newBMP);
                oGraphics.SmoothingMode = SmoothingMode.AntiAlias; oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                oGraphics.DrawImage(originalBMP, 0, 0, newWidth, newHeight);
                byte[] data;

                Bitmap newBMP2 = new Bitmap(originalBMP, newWidth2, newHeight2);
                Graphics oGraphics2 = Graphics.FromImage(newBMP2);
                oGraphics2.SmoothingMode = SmoothingMode.AntiAlias; oGraphics2.InterpolationMode = InterpolationMode.HighQualityBicubic;
                oGraphics2.DrawImage(originalBMP, 0, 0, newWidth2, newHeight2);
                byte[] data2;
                                
                using (System.IO.MemoryStream stream = new System.IO.MemoryStream())
                {
                    newBMP.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                    stream.Position = 0;
                    data = new byte[stream.Length];
                    data = stream.ToArray();

                    newBMP2.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                    stream.Position = 0;
                    data2 = new byte[stream.Length];
                    data2 = stream.ToArray();                
                }

                komanda.CommandText = @"INSERT INTO Meni (Tekst, Opis, ParentMeni_Id, Slika, SlikaGolema, f_Stranica, f_Sort)
                VALUES ( ' " + tbPromeniTekst.Text + "', '" + tbPromeniOpis.Text + @"', " + Podmeni + ", @Slika, @SlikaGolema , "  + f_Stranica + @", 
                (SELECT isnull(MAX(f_Sort),0)+1 FROM Meni WHERE ParentMeni_Id = " + Podmeni + ") )";
                komanda.Parameters.Add("@Slika", data);
                komanda.Parameters.Add("@SlikaGolema", data2);
            }
            else
            {
                komanda.CommandText = @"INSERT INTO Meni (Tekst, Opis, ParentMeni_Id, f_Stranica, f_Sort)
                VALUES ( ' " + tbPromeniTekst.Text + "', '" + tbPromeniOpis.Text + @"', " + Podmeni + ", " + f_Stranica + @", 
                (SELECT isnull(MAX(f_Sort),0)+1 FROM Meni WHERE ParentMeni_Id = " + Podmeni + ") )";
            }

            try
            {
                connection.Open();
                komanda.ExecuteNonQuery();
            }
            finally
            {
                connection.Close();

                DSCeloMeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                DSGlavnoMeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                DSPodmeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                DSSitePodmenija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;

                DSCeloMeni.SelectCommand = "SELECT Meni_Id, Tekst FROM Meni UNION SELECT '',''";
                DSGlavnoMeni.SelectCommand = "SELECT * FROM Meni Where ParentMeni_Id IS NULL ORDER BY f_Sort";
                DSPodmeni.SelectCommand = "SELECT * FROM Meni WHERE 1=2";
                DSSitePodmenija.SelectCommand = "SELECT * FROM Meni WHERE 1=2";

                DSCeloMeni.DataBind();
                DSGlavnoMeni.DataBind();
                //DSPodmeni.DataBind();
                //DSSitePodmenija.DataBind();

                if (Session["GlavnoMeni"] != "")
                lbGlavnoMeni.SelectedIndex = Convert.ToInt32(Session["GlavnoMeni"]);

                if (Session["VtoroMeni"] != "")
                {
                    DSPodmeni.SelectCommand = "SELECT * FROM Meni Where NOT ParentMeni_Id IS NULL AND ParentMeni_Id = " + lbGlavnoMeni.SelectedValue + " ORDER BY f_Sort";
                    DSPodmeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                    DSPodmeni.DataBind();
                    lbPodmeni.SelectedIndex = Convert.ToInt32(Session["VtoroMeni"]);
                }
                if (Session["TretoMeni"] != "")
                {
                    DSSitePodmenija.SelectCommand = @"select Meni_Id, Tekst, f_Sort from Meni where ParentMeni_Id=" + lbPodmeni.SelectedValue + @"
                                            union select Meni_Id, Tekst, f_Sort from Meni where ParentMeni_Id IN
                                            (select Meni_Id from Meni where ParentMeni_Id=" + lbPodmeni.SelectedValue + ") ORDER BY f_Sort";
                    DSSitePodmenija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                    DSSitePodmenija.DataBind();
                    lbSitePodmenija.SelectedIndex = Convert.ToInt32(Session["TretoMeni"]);
                }

                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Ставката е додадена!');", true);
            }
        }
    }
    protected void imgIzbrisiSlika_Click(object sender, ImageClickEventArgs e)
    {
        if (tbSelected_Id.Text != "")
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
            SqlCommand komanda = new SqlCommand();
            komanda.Connection = connection;
            komanda.CommandText = "UPDATE Meni SET  Slika = NULL, SlikaGolema = NULL WHERE Meni_Id = " + tbSelected_Id.Text;

            try
            {
                connection.Open();
                komanda.ExecuteNonQuery();
            }
            finally
            {
                connection.Close();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Сликата е избришана!');", true);
            }
        }
    }
    protected void GlavnoUp_Click(object sender, ImageClickEventArgs e)
    {
        int TekovenSort = 0;
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "";

        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            komanda.CommandText = "SELECT isnull(f_Sort,0) as f_Sort FROM Meni WHERE Meni_Id = " + lbGlavnoMeni.SelectedValue;
            SqlDataReader citac = komanda.ExecuteReader();
            if (citac.Read()) TekovenSort = Convert.ToInt32(citac["f_Sort"]);
            citac.Close();

            if (TekovenSort > 1)
            {
                komanda.CommandText = "UPDATE Meni SET f_Sort = (isnull(f_Sort,0) + 1) WHERE ParentMeni_Id IS NULL AND f_Sort = " + (TekovenSort - 1).ToString() + @" ; 
                                       UPDATE Meni SET f_Sort = (isnull(f_Sort,0) - 1) WHERE Meni_Id = " + lbGlavnoMeni.SelectedValue;
                komanda.ExecuteNonQuery();

                DSGlavnoMeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                DSGlavnoMeni.SelectCommand = "SELECT * FROM Meni Where ParentMeni_Id IS NULL ORDER BY f_Sort";
                DSGlavnoMeni.DataBind();
            }
        }
        catch { konekcija.Close(); }

    }
    protected void GlavnoDown_Click(object sender, ImageClickEventArgs e)
    {
        int MaximumSort = 0;
        int TekovenSort = 0;
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = @"SELECT isnull(MAX(f_Sort),0) as Maximum FROM Meni WHERE ParentMeni_Id IS NULL ";

        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            if (citac.Read()) MaximumSort = Convert.ToInt32(citac["Maximum"]);
            citac.Close();

            komanda.CommandText = "SELECT isnull(f_Sort,0) as f_Sort FROM Meni WHERE Meni_Id = " + lbGlavnoMeni.SelectedValue;
            citac = komanda.ExecuteReader();
            if (citac.Read()) TekovenSort = Convert.ToInt32(citac["f_Sort"]);
            citac.Close();

            if (TekovenSort < MaximumSort)
            {
                komanda.CommandText = "UPDATE Meni SET f_Sort = (isnull(f_Sort,0) - 1) WHERE ParentMeni_Id IS NULL AND f_Sort = " + (TekovenSort + 1).ToString() + @" ; 
                                       UPDATE Meni SET f_Sort = (isnull(f_Sort,0) + 1) WHERE Meni_Id = " + lbGlavnoMeni.SelectedValue;
                komanda.ExecuteNonQuery();

                DSGlavnoMeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                DSGlavnoMeni.SelectCommand = "SELECT * FROM Meni Where ParentMeni_Id IS NULL ORDER BY f_Sort";
                DSGlavnoMeni.DataBind();
            }
        }
        catch { konekcija.Close(); }
    }
    protected void VtoroUp_Click(object sender, ImageClickEventArgs e)
    {
        int TekovenSort = 0;
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "";

        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            komanda.CommandText = "SELECT isnull(f_Sort,0) as f_Sort FROM Meni WHERE Meni_Id = " + lbPodmeni.SelectedValue;
            SqlDataReader citac = komanda.ExecuteReader();
            if (citac.Read()) TekovenSort = Convert.ToInt32(citac["f_Sort"]);
            citac.Close();

            if (TekovenSort > 1)
            {
                komanda.CommandText = "UPDATE Meni SET f_Sort = (isnull(f_Sort,0) + 1) WHERE ParentMeni_Id = " + lbGlavnoMeni.SelectedValue + " AND f_Sort = " + (TekovenSort - 1).ToString() + @" ; 
                                       UPDATE Meni SET f_Sort = (isnull(f_Sort,0) - 1) WHERE Meni_Id = " + lbPodmeni.SelectedValue;
                komanda.ExecuteNonQuery();

                DSPodmeni.SelectCommand = "SELECT * FROM Meni Where NOT ParentMeni_Id IS NULL AND ParentMeni_Id = " + lbGlavnoMeni.SelectedValue + " ORDER BY f_Sort";
                DSPodmeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                DSPodmeni.DataBind();
            }
        }
        catch { konekcija.Close(); }
    }
    protected void VtoroDown_Click(object sender, ImageClickEventArgs e)
    {
        int MaximumSort = 0;
        int TekovenSort = 0;
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = @"SELECT isnull(MAX(f_Sort),0) as Maximum FROM Meni WHERE ParentMeni_Id = " + lbGlavnoMeni.SelectedValue;

        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            if (citac.Read()) MaximumSort = Convert.ToInt32(citac["Maximum"]);
            citac.Close();

            komanda.CommandText = "SELECT isnull(f_Sort,0) as f_Sort FROM Meni WHERE Meni_Id = " + lbPodmeni.SelectedValue;
            citac = komanda.ExecuteReader();
            if (citac.Read()) TekovenSort = Convert.ToInt32(citac["f_Sort"]);
            citac.Close();

            if (TekovenSort < MaximumSort)
            {
                komanda.CommandText = "UPDATE Meni SET f_Sort = (isnull(f_Sort,0) - 1) WHERE ParentMeni_Id = " + lbGlavnoMeni.SelectedValue + " AND f_Sort = " + (TekovenSort + 1).ToString() + @" ; 
                                       UPDATE Meni SET f_Sort = (isnull(f_Sort,0) + 1) WHERE Meni_Id = " + lbPodmeni.SelectedValue;
                komanda.ExecuteNonQuery();

                DSPodmeni.SelectCommand = "SELECT * FROM Meni Where NOT ParentMeni_Id IS NULL AND ParentMeni_Id = " + lbGlavnoMeni.SelectedValue + " ORDER BY f_Sort";
                DSPodmeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                DSPodmeni.DataBind();
            }
        }
        catch { konekcija.Close(); }
    }
    protected void TretoUp_Click(object sender, ImageClickEventArgs e)
    {
        int TekovenSort = 0;
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = "";

        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            komanda.CommandText = "SELECT isnull(f_Sort,0) as f_Sort FROM Meni WHERE Meni_Id = " + lbSitePodmenija.SelectedValue;
            SqlDataReader citac = komanda.ExecuteReader();
            if (citac.Read()) TekovenSort = Convert.ToInt32(citac["f_Sort"]);
            citac.Close();

            if (TekovenSort > 1)
            {
                komanda.CommandText = "UPDATE Meni SET f_Sort = (isnull(f_Sort,0) + 1) WHERE ParentMeni_Id = " + lbPodmeni.SelectedValue + " AND f_Sort = " + (TekovenSort - 1).ToString() + @" ; 
                                       UPDATE Meni SET f_Sort = (isnull(f_Sort,0) - 1) WHERE Meni_Id = " + lbSitePodmenija.SelectedValue;
                komanda.ExecuteNonQuery();

                DSSitePodmenija.SelectCommand = @"select Meni_Id, Tekst, f_Sort from Meni where ParentMeni_Id=" + lbPodmeni.SelectedValue + @"
                                            union select Meni_Id, Tekst, f_Sort from Meni where ParentMeni_Id IN
                                            (select Meni_Id from Meni where ParentMeni_Id=" + lbPodmeni.SelectedValue + ") ORDER BY f_Sort";
                DSSitePodmenija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                DSSitePodmenija.DataBind();
            }
        }
        catch { konekcija.Close(); }
    }
    protected void TretoDown_Click(object sender, ImageClickEventArgs e)
    {
        int MaximumSort = 0;
        int TekovenSort = 0;
        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = @"SELECT isnull(MAX(f_Sort),0) as Maximum FROM Meni WHERE ParentMeni_Id = " + Session["VtoroMeni"];

        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            if (citac.Read()) MaximumSort = Convert.ToInt32(citac["Maximum"]);
            citac.Close();

            komanda.CommandText = "SELECT isnull(f_Sort,0) as f_Sort FROM Meni WHERE Meni_Id = " + lbSitePodmenija.SelectedValue;
            citac = komanda.ExecuteReader();
            if (citac.Read()) TekovenSort = Convert.ToInt32(citac["f_Sort"]);
            citac.Close();

            if (TekovenSort < MaximumSort)
            {
                komanda.CommandText = "UPDATE Meni SET f_Sort = (isnull(f_Sort,0) - 1) WHERE ParentMeni_Id = " + lbPodmeni.SelectedValue + " AND f_Sort = " + (TekovenSort + 1).ToString() + @" ; 
                                       UPDATE Meni SET f_Sort = (isnull(f_Sort,0) + 1) WHERE Meni_Id = " + lbSitePodmenija.SelectedValue;
                komanda.ExecuteNonQuery();

                DSSitePodmenija.SelectCommand = @"select Meni_Id, Tekst, f_Sort from Meni where ParentMeni_Id=" + lbPodmeni.SelectedValue + @"
                                            union select Meni_Id, Tekst, f_Sort from Meni where ParentMeni_Id IN
                                            (select Meni_Id from Meni where ParentMeni_Id=" + lbPodmeni.SelectedValue + ") ORDER BY f_Sort";
                DSSitePodmenija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                DSSitePodmenija.DataBind();
            }
        }
        catch { konekcija.Close(); }
    }
    #endregion

    #region Funkcii
    
    private void NapolniPromena(int id)
    { 

        SqlConnection konekcija = new SqlConnection();
        konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        string sqlString = @"SELECT * FROM Meni WHERE Meni_Id = " + id.ToString(); 
           
        SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        try
        {
            konekcija.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                String tNaslov = citac["Tekst"].ToString();
                tbPromeniTekst.Text = tNaslov.Trim();
                tbPromeniOpis.Text = citac["Opis"].ToString();
                tbSelected_Id.Text=citac["Meni_Id"].ToString();
                Boolean f_Stranica = Convert.ToBoolean(citac["f_Stranica"]);
                if (f_Stranica)
                    cbStranica.Checked = true;
                else
                    cbStranica.Checked = false;
                System.Byte[] pom = (System.Byte[])(citac["Slika"]);
                if (pom.Length!=0)
                {
                    SlikaMeni.ImageUrl = "~/Handlers/ImgMeniGolema.ashx?Id=" + id;
                    pnlPostoeckaSlika.Visible = true;
                }
                else pnlPostoeckaSlika.Visible = false;
                if (citac["ParentMeni_Id"].ToString() != "")
                    ddlPromeniPodmeni.SelectedValue = citac["ParentMeni_Id"].ToString();
            }
            citac.Close();
        }
        catch { konekcija.Close(); }
    }

    #endregion
}