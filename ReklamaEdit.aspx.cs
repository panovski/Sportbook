using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Data;

public partial class Account_Login : System.Web.UI.Page
{
    #region Promenlivi
    public byte[] data;
    public string pathTekovnaReklama = "";
    public String goleminaWidth = "545";
    public String goleminaHeight = "80";
    public int gWidth = 545;
    public int gHeight = 80;

    #endregion

    #region Load
    protected void Page_Load(object sender, EventArgs e)
    {
        lblWidth.Text  = Request.QueryString["w"];
        lblHeight.Text  = Request.QueryString["h"];
        goleminaWidth = Request.QueryString["w"];
        goleminaHeight = Request.QueryString["h"];
        gWidth = Convert.ToInt16(Request.QueryString["w"]);
        gHeight = Convert.ToInt16(Request.QueryString["h"]);

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

                pathTekovnaReklama = "Handlers/ReklamaSWF.ashx?Id=" + Request.QueryString["id"];

                if (!Page.IsPostBack)
                { 
                SqlConnection konekcija = new SqlConnection();
                konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
                string sqlString = @"SELECT Url, Vidlivo FROM Reklama WHERE Reklama_Id = " + Request.QueryString["id"];
                SqlCommand komanda = new SqlCommand(sqlString, konekcija);

                try
                {
                    konekcija.Open();
                    SqlDataReader citac = komanda.ExecuteReader();
                    while (citac.Read())
                    {
                        if (citac["Vidlivo"].ToString() == "1")
                            cbVidliva.Checked = true;
                        else
                            cbVidliva.Checked = false;

                        tbUrlReklama.Text = citac["Url"].ToString();
                    }
                    citac.Close();

                }
                catch (Exception err) { }
                finally
                {
                    konekcija.Close();
                }
                }


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
    protected void btnImportSWF_Click(object sender, EventArgs e)
    {
        UpdateReklama("2");
    }
    protected void rblFormat_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlUpload.Visible = true;

        if (rblFormat.SelectedItem.Value == "1")
        {
            btnImportJPG.Visible = true;
            btnImportSWF.Visible = false;
        }
        else if (rblFormat.SelectedItem.Value == "2")
        {
            btnImportJPG.Visible = false;
            btnImportSWF.Visible = true;
        }
    }
    protected void btnImportJPG_Click(object sender, EventArgs e)
    {
        UpdateReklama("1");

        pnlCrop.Visible = true;
        imgImageToCrop.ImageUrl = "Handlers/ReklamaSWF.ashx?Id=" + Request.QueryString["id"];
    }
    protected void btnCrop_Click(object sender, EventArgs e)
    {
        //Get the Cordinates          
        Int32 x = Convert.ToInt32(Convert.ToDouble(hfImageXcoordinate1.Value.ToString().Replace(".", ",")));
        Int32 y = Convert.ToInt32(Convert.ToDouble(hfImageYcoordinate1.Value.ToString().Replace(".", ",")));
        Int32 w = Convert.ToInt32(Convert.ToDouble(hfImageWidth.Value.ToString().Replace(".", ",")));
        Int32 h = Convert.ToInt32(Convert.ToDouble(hfImageHeight.Value.ToString().Replace(".", ",")));

        //Load the Image from the location
        MemoryStream memoryStream = new MemoryStream();
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = connection;
        komanda.CommandText = @"SELECT Reklama FROM Reklama WHERE Reklama_Id = " + Request.QueryString["id"];
        try
        {
            connection.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                byte[] btImage = (byte[])citac["Reklama"];
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
            komanda.CommandText = @"UPDATE Reklama SET Reklama = @Reklama WHERE Reklama_Id = " + Request.QueryString["id"];
            komanda.Parameters.Add("@Reklama", data);
            try
            {
                connection.Open();
                komanda.ExecuteNonQuery();
                imgImageToCrop.ImageUrl = "Handlers/ReklamaSWF.ashx?Id=" + Request.QueryString["id"];
                imgImageToCrop.Width = gWidth;
                imgImageToCrop.Height = gHeight;
            }
            finally
            { connection.Close(); }
        }
    }
    protected void btnZacuvaj_Click(object sender, EventArgs e)
    {
        //Load the Image from the location
        MemoryStream memoryStream = new MemoryStream();
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = connection;
        komanda.CommandText = @"SELECT Reklama FROM Reklama WHERE Reklama_Id = " + Request.QueryString["id"];
        try
        {
            connection.Open();
            SqlDataReader citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                byte[] btImage = (byte[])citac["Reklama"];
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
            int newWidth = gWidth ;
            //if (sngRatio < 1) sngRatio = 1;
            int newHeight = gHeight; // newWidth / sngRatio;

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
            komanda.CommandText = @"UPDATE Reklama SET Reklama = @Reklama WHERE Reklama_Id = " + Request.QueryString["id"];
            komanda.Parameters.Add("@Reklama", data);
            komanda.ExecuteNonQuery();
            imgImageToCrop.ImageUrl = "Handlers/ReklamaSWF.ashx?Id=" + Request.QueryString["id"];
        }
        finally
        { connection.Close(); }

    }
    protected void btnPromeniVidlivo_Click(object sender, EventArgs e)
    {
        int iVidlivo = 0;
        if (cbVidliva.Checked == true) iVidlivo = 1;
        else iVidlivo = 0;

        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = connection;
        komanda.CommandText = @"UPDATE Reklama SET Vidlivo =" + iVidlivo.ToString() + ", Url = '" + tbUrlReklama.Text.Replace("'","''") + 
                              "' WHERE Reklama_Id = " + Request.QueryString["id"];

        try
        {
            connection.Open();
            komanda.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Успешна промена!');", true);
        }
        finally
        { connection.Close(); }
    }
    #endregion

    #region Funkcii
    protected void UpdateReklama(string Tip)
    {
        if (Upload.HasFile)
        {
            string FileName = System.IO.Path.GetFileName(Upload.PostedFile.FileName);
            int len = Upload.PostedFile.ContentLength;
            byte[] pic = new byte[len];
            Upload.PostedFile.InputStream.Read(pic, 0, len);

            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
            SqlCommand komanda = new SqlCommand();
            komanda.Connection = connection;
            komanda.CommandText = @"UPDATE Reklama SET Reklama = @Reklama, Tip=" + Tip + " WHERE Reklama_Id = " + Request.QueryString["id"];

            komanda.Parameters.Add("@Reklama", pic);
            string SlikaID = "";
            try
            {
                connection.Open();
                komanda.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AlertPopup", "alert('Рекламата е успешно променета!');", true);
            }
            finally
            { connection.Close(); }
        }

    }
    #endregion
}