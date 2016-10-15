using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnIsprati_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = connection;
        komanda.CommandText = @"INSERT INTO [Message] (ImePrezime, Email, Poraka, Ostavena_Na, Procitana) 
                                VALUES ('"+tbImePrezime.Text.Replace("'","''")+"', '"+tbEmail.Text.Replace("'","''")+
                                          "', '"+ tbPoraka.Text.Replace("'","''") +"', GETDATE(), 0) ;";

        try
        {
            connection.Open();
            komanda.ExecuteNonQuery();
        }
        catch
        {
            connection.Close();
            lblInfo.Text = "Настана грешка! Пораката не е испратена. Ве молиме обидете се повторно!";
        }
        finally
        {
            connection.Close();
            lblInfo.Text = "Пораката е успешно испратена! Ви благодариме!";
            tbPoraka.Text = "";
            tbImePrezime.Text = "";
            tbEmail.Text = "";
        }

    }
}