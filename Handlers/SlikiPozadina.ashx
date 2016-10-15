<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

public class Handler : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {

        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["Konekcija"].ConnectionString;
        // Create SQL Command 

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT Pozadina FROM Pozadina" +
                          " WHERE Pozadina_Id = @Id";
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = con;

        SqlParameter ImageID = new SqlParameter("@Id", System.Data.SqlDbType.Int);
        ImageID.Value = context.Request.QueryString["Id"];
        cmd.Parameters.Add(ImageID);
        try
        {
            con.Open();
            SqlDataReader dReader = cmd.ExecuteReader();
            dReader.Read();
            context.Response.BinaryWrite((byte[])dReader["Pozadina"]);
            dReader.Close();
            con.Close();
        }
        catch
        {
            con.Close();
        }
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}