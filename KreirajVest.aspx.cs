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
using System.IO;

public partial class Account_Login : System.Web.UI.Page
{
    #region Promenlivi

    public byte[] data;

    #endregion

    #region Load
    protected void Page_Load(object sender, EventArgs e)
    {
        btnVnesiPostoeckaSlika.Attributes.Add("onClick", "javascript:InvokePop('" + tbPostoeckaSlika_Id.ClientID + "');");

        if ((Session["najaven"] != null))
        {
            if (Session["najaven"] == "ne") pnlPromeniMeni.Visible = false;
            else if (Session["najaven"] == "da") pnlPromeniMeni.Visible = true;
        }
        else pnlPromeniMeni.Visible = false;

        if (!Page.IsPostBack)
        {
            Session["zaNaslovna"] = "ne";
            Session["zaSlideShow"] = "ne";
            DSCeloMeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
            DSCeloMeni.SelectCommand = "SELECT Meni_Id, Tekst FROM Meni WHERE ParentMeni_Id IS NULL OR ParentMeni_Id=0 UNION SELECT '',''";

            DSSiteStavkiMeni.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
            DSSiteStavkiMeni.SelectCommand = "SELECT Meni_Id, Tekst FROM Meni ORDER BY Meni_Id";
            cblPodkategorii.DataBind();

            if (Request.QueryString["id"] != null)
            {
                Session["NewID"] = Request.QueryString["id"];
                btnVnesi.Text = "Промени";
                btnVnesi0.Text = "Промени";
                IspolniZaPromena();
            }
            else
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                SqlCommand komanda = new SqlCommand();
                komanda.Connection = connection;
                if (Session["Promeni"] != null)
                {
                    if (Session["Promeni"] == "ne") komanda.CommandText =
                  @"DELETE FROM Vest WHERE f_Snimeno <> 1 or f_Snimeno IS NULL; 
                  INSERT INTO Vest (Naslov) VALUES ('') ; SELECT scope_identity();";
                }
                else komanda.CommandText =
                  @"DELETE FROM Vest WHERE f_Snimeno <> 1 or f_Snimeno IS NULL; 
                  INSERT INTO Vest (Naslov) VALUES ('') ; SELECT scope_identity();";
                if (komanda.CommandText != "")
                {
                    try
                    {
                        connection.Open();
                        Session["NewID"] = komanda.ExecuteScalar().ToString();
                    }
                    finally
                    {
                        connection.Close();
                    }
                }
            }
        }
    }
    #endregion

    #region Button_Clicks
    protected void btnVnesi_Click(object sender, EventArgs e)
    {
        String Kategorija = ddlKategorija.SelectedValue;
        if (Convert.ToInt32(Kategorija) < 1) Kategorija = "NULL";

        if (ProveriZadolzitelni()) 
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
            SqlCommand komanda = new SqlCommand();
            komanda.Connection = connection;

            String zaNazlovna = "";
            if (cbZaNaslovna.Checked) zaNazlovna = " , f_Naslovna = 1";
            else zaNazlovna = " , f_Naslovna = 0 ";

            String zaSlideShow = "";
            if (cbZaSlideShow.Checked) zaSlideShow = " , f_SlideShow = 1";
            else zaSlideShow = " , f_SlideShow = 0 ";

            komanda.CommandText = "UPDATE Vest SET Naslov = '" + tbNaslov.Text.Replace("'", "''") + "', Sodrzina = '" + tbSodrzina.Text.Replace("'", "''") + @"',
                                Tip = " + Kategorija + ", KratkaSodrzina = '" + tbKratkaSodrzina.Text.Replace("'", "''") +
                                "', f_Snimeno=1 " + zaNazlovna + zaSlideShow + ", Objavena_Od = " + Session["Korisnik"].ToString() + ", Datum_Objava = GETDATE() WHERE Vest_Id = " + Session["NewID"];
            try
            {
                connection.Open();
                komanda.ExecuteNonQuery();

                komanda.CommandText = "DELETE FROM VestPodkategorija WHERE Vest_Id = " + Session["NewID"];
                komanda.ExecuteNonQuery();

                komanda.CommandText ="";
                for (int i = 0; i < cblPodkategorii.Items.Count; i++)
                {
                    if (cblPodkategorii.Items[i].Selected)
                    komanda.CommandText += " INSERT INTO VestPodkategorija (Vest_Id, Podkategorija) VALUES(" +
                                            Session["NewID"] + "," + cblPodkategorii.Items[i].Value + ") ; " ;
                }
                if (komanda.CommandText != "")
                komanda.ExecuteNonQuery();
            }
            finally
            {
                connection.Close();
                String tPoraka = "";
                if (btnVnesi.Text == "Промени") tPoraka = "променета";
                else tPoraka = "додадена";

                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Веста е успешно " + tPoraka + "!');", true);
            }
        }
    }
    protected void btnImportImage_Click(object sender, EventArgs e)
    {
        string filename = "";
        if (fuImage.PostedFile != null)
        {
            if (fuImage.PostedFile.ContentLength != 0)
            {
                filename = Path.GetFileName(fuImage.PostedFile.FileName);
                string targetPath = Server.MapPath("Images1/" + filename);
                Stream strm = fuImage.PostedFile.InputStream;
                var targetFile = targetPath;
                //Based on scalefactor image size will vary
                GenerateThumbnails(1, strm, targetFile);


                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                SqlCommand komanda = new SqlCommand();
                komanda.Connection = connection;
                komanda.CommandText = @"INSERT INTO Slika (Naziv, Slika, Ekstenzija, Vest_Id)
                VALUES ( ' " + filename + "', @Slika, ''," + Session["NewID"] + "); SELECT scope_identity();"; //+ tbPromeniOpis.Text + @"', " + Podmeni + ", @Slika)";
                komanda.Parameters.Add("@Slika", data);
                string SlikaID = "";
                try
                {
                    connection.Open();
                    //komanda.ExecuteNonQuery();
                    SlikaID = komanda.ExecuteScalar().ToString();
                }
                finally
                { connection.Close(); }

                string FilePath = "Handlers/Slika.ashx?Id=" + SlikaID;
                Session["SlikaID"] = SlikaID;
                Session["SlikaHandler"] = FilePath;
                Session["SlikaTitle"] = filename;

                pnlCrop.Visible = true;
                imgImageToCrop.ImageUrl = "Handlers/Slika.ashx?Id=" + SlikaID;

            }
        }

    }
    protected void btnVmetniVoTekst_Click(object sender, EventArgs e)
    {
        tbSodrzina.Text += string.Format("<img src = '{0}' alt = '{1}' />", Session["SlikaHandler"], Session["SlikaTitle"]);
        pnlCrop.Visible = false;
    }
    protected void btnCrop_Click(object sender, EventArgs e)
    {
        //Get the Cordinates          
        //Int32 x = Convert.ToInt32(Convert.ToDouble(hfImageXcoordinate1.Value.ToString().Replace(".", ",")));
        //Int32 y = Convert.ToInt32(Convert.ToDouble(hfImageYcoordinate1.Value.ToString().Replace(".", ",")));
        //Int32 w = Convert.ToInt32(Convert.ToDouble(hfImageWidth.Value.ToString().Replace(".", ",")));
        //Int32 h = Convert.ToInt32(Convert.ToDouble(hfImageHeight.Value.ToString().Replace(".", ",")));

        int index = 0;
        string x_pom = hfImageXcoordinate1.Value, y_pom = hfImageYcoordinate1.Value, w_pom = hfImageWidth.Value, h_pom = hfImageHeight.Value;

        index = hfImageXcoordinate1.Value.IndexOf(".");
        if (index > 0) x_pom = hfImageXcoordinate1.Value.Substring(0,index);

        index = hfImageYcoordinate1.Value.IndexOf(".");
        if (index > 0) y_pom = hfImageYcoordinate1.Value.Substring(0, index);

        index = hfImageWidth.Value.IndexOf(".");
        if (index > 0) w_pom = hfImageWidth.Value.Substring(0, index);

        index = hfImageHeight.Value.IndexOf(".");
        if (index > 0) h_pom = hfImageHeight.Value.Substring(0, index);

        Int32 x = Convert.ToInt32(x_pom);
        Int32 y = Convert.ToInt32(y_pom);
        Int32 w = Convert.ToInt32(w_pom);
        Int32 h = Convert.ToInt32(h_pom);

        //Load the Image from the location
        MemoryStream memoryStream = new MemoryStream();
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = connection;
        komanda.CommandText = @"SELECT Slika FROM Slika WHERE Slika_Id = " + Session["SlikaID"];
        try
        {
            connection.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                byte[] btImage = (byte[])citac["Slika"];
                memoryStream = new MemoryStream(btImage, false);
            }
        }
        finally
        { connection.Close(); }


        System.Drawing.Image image = System.Drawing.Image.FromStream(memoryStream);

        //Create a new image from the specified location to                
        //specified height and width                
        //x = 10;
        //y = 10;
        //w = 300;
        //h = 300;
        Bitmap bmp = new Bitmap(w, h, image.PixelFormat);
        Graphics g = Graphics.FromImage(bmp);
        g.DrawImage(image, new Rectangle(0, 0, w, h), new Rectangle(x, y, w, h), GraphicsUnit.Pixel);

        using (System.IO.MemoryStream stream = new System.IO.MemoryStream())
        {
            bmp.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
            stream.Position = 0;
            data = new byte[stream.Length];
            data = stream.ToArray();

            komanda.Connection = connection;
            komanda.CommandText = @"UPDATE Slika SET Slika = @Slika WHERE Slika_Id = " + Session["SlikaID"];
            komanda.Parameters.Add("@Slika", data);
            try
            {
                connection.Open();
                komanda.ExecuteNonQuery();
            }
            catch
            { connection.Close(); }
            finally
            { connection.Close(); }

        }
    }
    protected void cbZaNaslovna_CheckedChanged(object sender, EventArgs e)
    {
        if (cbZaNaslovna.Checked)
            pnlZaNaslovna.Visible = true;
        else
            pnlZaNaslovna.Visible = false;
    }
    protected void cbZaSlideShow_CheckedChanged(object sender, EventArgs e)
    {
        if (cbZaSlideShow.Checked)
            pnlZaSlideShow.Visible = true;
        else
            pnlZaSlideShow.Visible = false;
    }
    protected void btnImportImageMala_Click(object sender, EventArgs e)
    {
        string filename = "";
        if (fuImageMala.PostedFile != null)
        {
            filename = Path.GetFileName(fuImageMala.PostedFile.FileName);
            string targetPath = Server.MapPath("Images1/" + filename);
            Stream strm = fuImageMala.PostedFile.InputStream;
            var targetFile = targetPath;
            //Based on scalefactor image size will vary
            GenerateThumbnails(1, strm, targetFile);
        }

        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = connection;
        komanda.CommandText = "UPDATE Vest SET malaSlika = @Slika WHERE Vest_Id = " + Session["NewID"];
        komanda.Parameters.Add("@Slika", data);
        try
        {
            connection.Open();
            komanda.ExecuteNonQuery();
        }
        finally
        { connection.Close(); }
        
        pnlCropMala.Visible = true;
        imgImageToCropMala.ImageUrl = "Handlers/SlikaVest.ashx?Id=" + Session["NewID"] + "&tip=mala";
        ProveriZadolzitelni();
    }
    protected void btnCropMala_Click(object sender, EventArgs e)
    {
        //Get the Cordinates          
        //Int32 x = Convert.ToInt32(Convert.ToDouble(hfImageXcoordinate1.Value.ToString().Replace(".", ",")));
        //Int32 y = Convert.ToInt32(Convert.ToDouble(hfImageYcoordinate1.Value.ToString().Replace(".", ",")));
        //Int32 w = Convert.ToInt32(Convert.ToDouble(hfImageWidth.Value.ToString().Replace(".", ",")));
        //Int32 h = Convert.ToInt32(Convert.ToDouble(hfImageHeight.Value.ToString().Replace(".", ",")));

        int index = 0;
        string x_pom = hfImageXcoordinate1.Value, y_pom = hfImageYcoordinate1.Value, w_pom = hfImageWidth.Value, h_pom = hfImageHeight.Value;

        index = hfImageXcoordinate1.Value.IndexOf(".");
        if (index > 0) x_pom = hfImageXcoordinate1.Value.Substring(0, index);

        index = hfImageYcoordinate1.Value.IndexOf(".");
        if (index > 0) y_pom = hfImageYcoordinate1.Value.Substring(0, index);

        index = hfImageWidth.Value.IndexOf(".");
        if (index > 0) w_pom = hfImageWidth.Value.Substring(0, index);

        index = hfImageHeight.Value.IndexOf(".");
        if (index > 0) h_pom = hfImageHeight.Value.Substring(0, index);

        Int32 x = Convert.ToInt32(x_pom);
        Int32 y = Convert.ToInt32(y_pom);
        Int32 w = Convert.ToInt32(w_pom);
        Int32 h = Convert.ToInt32(h_pom);

        //Load the Image from the location
        MemoryStream memoryStream = new MemoryStream();
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = connection;
        komanda.CommandText = @"SELECT malaSlika FROM Vest WHERE Vest_Id = " + Session["NewID"];
        try
        {
            connection.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                byte[] btImage = (byte[])citac["malaSlika"];
                memoryStream = new MemoryStream(btImage, false);
            }
        }
        finally
        { connection.Close(); }


        System.Drawing.Image image = System.Drawing.Image.FromStream(memoryStream);

        //Create a new image from the specified location to                
        //specified height and width               
        Bitmap bmp = new Bitmap(w, h, image.PixelFormat);
        Graphics g = Graphics.FromImage(bmp);
        g.DrawImage(image, new Rectangle(0, 0, w, h), new Rectangle(x, y, w, h), GraphicsUnit.Pixel);

        using (System.IO.MemoryStream stream = new System.IO.MemoryStream())
        {
            bmp.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
            stream.Position = 0;
            data = new byte[stream.Length];
            data = stream.ToArray();

            komanda.Connection = connection;
            komanda.CommandText = @"UPDATE Vest SET malaSlika = @Slika WHERE Vest_Id = " + Session["NewID"];
            komanda.Parameters.Add("@Slika", data);
            try
            {
                connection.Open();
                komanda.ExecuteNonQuery();
            }
            finally
            { connection.Close(); }
        }
    }
    protected void btnZacuvajMala_Click(object sender, EventArgs e)
    {
        //Load the Image from the location
        MemoryStream memoryStream = new MemoryStream();
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = connection;
        komanda.CommandText = @"SELECT malaSlika FROM Vest WHERE Vest_Id = " + Session["NewID"];
        try
        {
            connection.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                byte[] btImage = (byte[])citac["malaSlika"];
                memoryStream = new MemoryStream(btImage, false);
            }
            citac.Close();

            System.Drawing.Image image = System.Drawing.Image.FromStream(memoryStream);

            //Create a new image from the specified location to                
            //specified height and width                
            Bitmap originalBMP = new Bitmap(image);

            // Calculate the new image dimensions
            int origWidth = originalBMP.Width;
            int origHeight = originalBMP.Height;
            int sngRatio = origWidth / origHeight;
            int newWidth = 120;
            //if (sngRatio < 1) sngRatio = 1;
            int newHeight = 100; // newWidth / sngRatio;

            // Create a new bitmap which will hold the previous resized bitmap
            Bitmap newBMP = new Bitmap(originalBMP, newWidth, newHeight);

            Graphics oGraphics = Graphics.FromImage(newBMP);
            // Set the properties for the new graphic file
            oGraphics.SmoothingMode = SmoothingMode.AntiAlias; oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;

            // Draw the new graphic based on the resized bitmap
            oGraphics.DrawImage(originalBMP, 0, 0, newWidth, newHeight);
            byte[] data;
            using (System.IO.MemoryStream stream = new System.IO.MemoryStream())
            {
                newBMP.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
                stream.Position = 0;
                data = new byte[stream.Length];
                data = stream.ToArray();
            }
            komanda.CommandText = @"UPDATE Vest SET malaSlika = @Slika WHERE Vest_Id = " + Session["NewID"];
            komanda.Parameters.Add("@Slika", data);
            komanda.ExecuteNonQuery();
            Session["zaNaslovna"] = "da";
        }
        finally
        { connection.Close(); }
        ProveriZadolzitelni();
    }
    protected void btnImportImageGolema_Click(object sender, EventArgs e)
    {
        string filename = "";
        if (fuImageGolema.PostedFile != null)
        {
            filename = Path.GetFileName(fuImageGolema.PostedFile.FileName);
            string targetPath = Server.MapPath("Images1/" + filename);
            Stream strm = fuImageGolema.PostedFile.InputStream;
            var targetFile = targetPath;
            //Based on scalefactor image size will vary
            GenerateThumbnailsSlideShow(1, strm, targetFile);
        }

        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = connection;
        komanda.CommandText = "UPDATE Vest SET golemaSlika = @Slika WHERE Vest_Id = " + Session["NewID"];
        komanda.Parameters.Add("@Slika", data);
        try
        {
            connection.Open();
            komanda.ExecuteNonQuery();
        }
        finally
        { connection.Close(); }

        pnlCropGolema.Visible = true;
        imgImageToCropGolema.ImageUrl = "Handlers/SlikaVest.ashx?Id=" + Session["NewID"] + "&tip=golema";
        ProveriZadolzitelni();
    }
    protected void btnCropGolema_Click(object sender, EventArgs e)
    {
        //Get the Cordinates          
        //Int32 x = Convert.ToInt32(Convert.ToDouble(hfImageXcoordinate1.Value.ToString().Replace(".", ",")));
        //Int32 y = Convert.ToInt32(Convert.ToDouble(hfImageYcoordinate1.Value.ToString().Replace(".", ",")));
        //Int32 w = Convert.ToInt32(Convert.ToDouble(hfImageWidth.Value.ToString().Replace(".", ",")));
        //Int32 h = Convert.ToInt32(Convert.ToDouble(hfImageHeight.Value.ToString().Replace(".", ",")));

        int index = 0;
        string x_pom = hfImageXcoordinate1.Value, y_pom = hfImageYcoordinate1.Value, w_pom = hfImageWidth.Value, h_pom = hfImageHeight.Value;

        index = hfImageXcoordinate1.Value.IndexOf(".");
        if (index > 0) x_pom = hfImageXcoordinate1.Value.Substring(0, index);

        index = hfImageYcoordinate1.Value.IndexOf(".");
        if (index > 0) y_pom = hfImageYcoordinate1.Value.Substring(0, index);

        index = hfImageWidth.Value.IndexOf(".");
        if (index > 0) w_pom = hfImageWidth.Value.Substring(0, index);

        index = hfImageHeight.Value.IndexOf(".");
        if (index > 0) h_pom = hfImageHeight.Value.Substring(0, index);

        Int32 x = Convert.ToInt32(x_pom);
        Int32 y = Convert.ToInt32(y_pom);
        Int32 w = Convert.ToInt32(w_pom);
        Int32 h = Convert.ToInt32(h_pom);

        //Load the Image from the location
        MemoryStream memoryStream = new MemoryStream();
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = connection;
        komanda.CommandText = @"SELECT golemaSlika FROM Vest WHERE Vest_Id = " + Session["NewID"];
        try
        {
            connection.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                byte[] btImage = (byte[])citac["golemaSlika"];
                memoryStream = new MemoryStream(btImage, false);
            }
        }
        finally
        { connection.Close(); }


        System.Drawing.Image image = System.Drawing.Image.FromStream(memoryStream);

        //Create a new image from the specified location to                
        //specified height and width                
        Bitmap bmp = new Bitmap(w, h, image.PixelFormat);
        Graphics g = Graphics.FromImage(bmp);
        g.DrawImage(image, new Rectangle(0, 0, w, h),
        new Rectangle(x, y, w, h),
        GraphicsUnit.Pixel);

        using (System.IO.MemoryStream stream = new System.IO.MemoryStream())
        {
            bmp.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
            stream.Position = 0;
            data = new byte[stream.Length];
            data = stream.ToArray();

            komanda.Connection = connection;
            komanda.CommandText = @"UPDATE Vest SET golemaSlika = @Slika WHERE Vest_Id = " + Session["NewID"];
            komanda.Parameters.Add("@Slika", data);
            try
            {
                connection.Open();
                komanda.ExecuteNonQuery();
            }
            finally
            { connection.Close(); }
        }
    }
    protected void btnZacuvajGolema_Click(object sender, EventArgs e)
    {
        //Load the Image from the location
        MemoryStream memoryStream = new MemoryStream();
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = connection;
        komanda.CommandText = @"SELECT golemaSlika FROM Vest WHERE Vest_Id = " + Session["NewID"];
        try
        {
            connection.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                byte[] btImage = (byte[])citac["golemaSlika"];
                memoryStream = new MemoryStream(btImage, false);
            }
            citac.Close();

            System.Drawing.Image image = System.Drawing.Image.FromStream(memoryStream);

            //Create a new image from the specified location to                
            //specified height and width                
            Bitmap originalBMP = new Bitmap(image);

            // Calculate the new image dimensions
            int origWidth = originalBMP.Width;
            int origHeight = originalBMP.Height;
            int sngRatio = origWidth / origHeight;
            int newWidth = 565;
            //if (sngRatio < 1) sngRatio = 1;
            int newHeight = 290; // newWidth / sngRatio;

            // Create a new bitmap which will hold the previous resized bitmap
            Bitmap newBMP = new Bitmap(originalBMP, newWidth, newHeight);

            Graphics oGraphics = Graphics.FromImage(newBMP);
            // Set the properties for the new graphic file
            oGraphics.SmoothingMode = SmoothingMode.AntiAlias; oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;

            // Draw the new graphic based on the resized bitmap
            oGraphics.DrawImage(originalBMP, 0, 0, newWidth, newHeight);
            byte[] data;
            using (System.IO.MemoryStream stream = new System.IO.MemoryStream())
            {
                newBMP.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
                stream.Position = 0;
                data = new byte[stream.Length];
                data = stream.ToArray();
            }
            komanda.CommandText = @"UPDATE Vest SET golemaSlika = @Slika WHERE Vest_Id = " + Session["NewID"];
            komanda.Parameters.Add("@Slika", data);
            komanda.ExecuteNonQuery();
            Session["zaSlideShow"] = "da";
        }
        finally
        { connection.Close(); }
        ProveriZadolzitelni();
    }
    protected void btnVmetniVoTekst_Postoecka_Click(object sender, EventArgs e)
    {
        tbSodrzina.Text += string.Format("<img src = '{0}' alt = '{1}' />", "Handlers/Slika.ashx?Id=" + tbPostoeckaSlika_Id.Text, tbPostoeckaSlika_Id.Text);
    }
    protected void btnVnesiPostoeckaSlika_Click(object sender, EventArgs e)
    {
        btnVmetniVoTekst_Postoecka.Visible = true;
    }
    #endregion

    #region Funkcii
    private void IspolniZaPromena()
    {
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = connection;
        komanda.CommandText = @"SELECT * FROM Vest WHERE Vest_Id = " + Session["NewID"].ToString();
        try
        {
            connection.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                tbNaslov.Text = citac["Naslov"].ToString();
                ddlKategorija.SelectedValue = citac["Tip"].ToString();
                tbSodrzina.Text = citac["Sodrzina"].ToString();
                tbKratkaSodrzina.Text = citac["KratkaSodrzina"].ToString();
                if (citac["malaSlika"].ToString() != "")
                {
                    cbZaNaslovna.Checked = true;
                    pnlZaNaslovna.Visible = true;
                    pnlCropMala.Visible = true;
                    imgImageToCropMala.ImageUrl = "Handlers/SlikaVest.ashx?Id=" + Session["NewID"] + "&tip=mala";
                    Session["zaNaslovna"] = "da";
                }
                if (citac["golemaSlika"].ToString() != "")
                {
                    cbZaSlideShow.Checked = true;
                    pnlZaSlideShow.Visible = true;
                    pnlCropGolema.Visible = true;
                    imgImageToCropGolema.ImageUrl = "Handlers/SlikaVest.ashx?Id=" + Session["NewID"] + "&tip=golema";
                    Session["zaSlideShow"] = "da";
                }

            }
            citac.Close();

            // ----------------------- Ispolni check box list so Podkategorii ----------------------------
            komanda.CommandText = "SELECT * FROM VestPodkategorija WHERE Vest_Id = " + Session["NewID"];
            SqlDataReader citacPodkategorii = komanda.ExecuteReader();
            while (citacPodkategorii.Read())
            {
                for(int i = 0 ; i < cblPodkategorii.Items.Count ; i++)
                {
                    if (cblPodkategorii.Items[i].Value == citacPodkategorii["Podkategorija"].ToString())
                        cblPodkategorii.Items[i].Selected = true;
                }
            }
            // --------------------------------------------------------------------------------------------
        }
        finally
        {
            connection.Close();
        }
    }
    private void GenerateThumbnails(double scaleFactor, Stream sourcePath, string targetPath)
    {
        using (var image = System.Drawing.Image.FromStream(sourcePath))
        {
            // can given width of image as we want
            Decimal Odnos = (Decimal)((Decimal)image.Width / (Decimal)image.Height);
            int newWidth = 0;
            int newHeight = 0;
            if (image.Width > 500)
            {
                newWidth = 500;
                newHeight = (int)(500 / Odnos);
            }
            else
            {
                newWidth = (int)(image.Width * scaleFactor);
                newHeight = (int)(image.Height * scaleFactor);
            }
            //var newWidth = (int)(image.Width * scaleFactor);
            // can given height of image as we want
            //var newHeight = (int)(image.Height * scaleFactor);
            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighSpeed; // CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighSpeed; // SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.Low; // InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(image, imageRectangle);

            using (System.IO.MemoryStream stream = new System.IO.MemoryStream())
            {
                thumbnailImg.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
                stream.Position = 0;
                data = new byte[stream.Length];
                data = stream.ToArray();
            }
        }
    }
    private void GenerateThumbnailsSlideShow(double scaleFactor, Stream sourcePath, string targetPath)
    {
        using (var image = System.Drawing.Image.FromStream(sourcePath))
        {
            // can given width of image as we want
            Decimal Odnos = (Decimal)((Decimal)image.Width / (Decimal)image.Height);
            int newWidth = 0;
            int newHeight = 0;
            if (image.Width > 700)
            {
                newWidth = 700;
                newHeight = (int)(700 / Odnos);
            }
            else
            {
                newWidth = (int)(image.Width * scaleFactor);
                newHeight = (int)(image.Height * scaleFactor);
            }
            //var newWidth = (int)(image.Width * scaleFactor);
            // can given height of image as we want
            //var newHeight = (int)(image.Height * scaleFactor);
            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighSpeed; // HighQuality;
            thumbGraph.SmoothingMode =  SmoothingMode.HighSpeed; // HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.Low; // HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(image, imageRectangle);

            using (System.IO.MemoryStream stream = new System.IO.MemoryStream())
            {
                thumbnailImg.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
                stream.Position = 0;
                data = new byte[stream.Length];
                data = stream.ToArray();
            }
        }
    }
    private bool ProveriZadolzitelni()
    {
        String Kategorija = ddlKategorija.SelectedValue;
        if (Convert.ToInt32(Kategorija) < 1) Kategorija = "NULL";
        
        bool Continue = true;
        if (tbNaslov.Text == "") { Continue = false; pnlZadolzitelnaNaslov.Visible = true; }
        else pnlZadolzitelnaNaslov.Visible = false;
        if (Kategorija == "") { Continue = false; pnlZadolzitelnaKategorija.Visible = true; }
        else pnlZadolzitelnaKategorija.Visible = false;
        if (Kategorija == "NULL") { Continue = false; pnlZadolzitelnaKategorija.Visible = true; }
        else pnlZadolzitelnaKategorija.Visible = false;
        
        if (cbZaNaslovna.Checked)
        {
            if (pnlCropMala.Visible)
            {
                pnlZaNaslovnaSlika.Visible = false;
                if ((Session["zaNaslovna"] != null))
                {
                    if (Session["zaNaslovna"] != "da") { Continue = false; pnlZaNaslovnaZacuvaj.Visible = true; }
                    else pnlZaNaslovnaZacuvaj.Visible = false;
                }
                else { Continue = false; pnlZaNaslovnaZacuvaj.Visible = true; }
            }
            else
            {
                pnlZaNaslovnaSlika.Visible = true;
            }
        }
        else { pnlZaNaslovnaSlika.Visible = false; pnlZaNaslovnaZacuvaj.Visible = false; }

        if (cbZaSlideShow.Checked)
        {
            if (pnlCropGolema.Visible)
            {
                pnlZaSlideShowSlika.Visible = false;
                if ((Session["zaSlideShow"] != null))
                {
                    if (Session["zaSlideShow"] != "da") { Continue = false; pnlZaSlideShowZacuvaj.Visible = true; }
                    else pnlZaSlideShowZacuvaj.Visible = false;
                }
                else { Continue = false; pnlZaSlideShowZacuvaj.Visible = true; }
            }
            else
            {
                pnlZaSlideShowSlika.Visible = true;
            }
        }
        else { pnlZaSlideShowSlika.Visible = false; pnlZaSlideShowZacuvaj.Visible = false; }

        if (tbKratkaSodrzina.Text.Length > 450) { Continue = false; pnlDolgTekst.Visible = true; }
        else pnlDolgTekst.Visible = false; 

        if (Continue)
            return true;
        else
            return false;
    }
    private void PrevediVoKirilica(TextBox izvor, TextBox destinacija)
    { 
        Char[] C = {'А','Б','В','Г','Д','Е','З','Ѕ','И','Ј','К','Л','Љ','М','Н','Њ','О','П','Р','С','Т','У','Ф','Х','Ц','Џ',
                    'а','б','в','г','д','е','з','ѕ','и','ј','к','л','љ','м','н','њ','о','п','р','с','т','у','ф','х','ц','џ',
                    'Ѓ','ѓ','Ж','ж','Ќ','ќ','Ч','ч','Ш','ш'};
        Char[] L = {'A','B','V','G','D','E','Z','Y','I','J','K','L','Q','M','N','W','O','P','R','S','T','U','F','H','C','X',
                    'a','b','v','g','d','e','z','y','i','j','k','l','q','m','n','w','o','p','r','s','t','u','f','h','c','x',
                    '}',']','|','\\','"','\'',':',';','{','['};

        String ZaKonvert = izvor.Text;

        destinacija.Text = ZaKonvert;
        destinacija.Text = destinacija.Text.Replace("<p>", "");
        destinacija.Text = destinacija.Text.Replace("</p>", "");
        destinacija.Text = destinacija.Text.Replace("'", "");
        //Char[] Cyr = new Char[59];
        
        for(int q=0; q<C.Count();q++)
        {
            destinacija.Text = destinacija.Text.Replace(L[q].ToString(), C[q].ToString());
        }
      
    }
    #endregion    
    protected void Button1_Click(object sender, EventArgs e)
    {
        PrevediVoKirilica(tbSodrzina, tbSodrzina);
    }
    protected void btnNaslovConvert_Click(object sender, EventArgs e)
    {
        PrevediVoKirilica(tbNaslov, tbNaslov);
    }
    protected void btnKratkaConvert_Click(object sender, EventArgs e)
    {
        PrevediVoKirilica(tbKratkaSodrzina, tbKratkaSodrzina);
    }
}