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
        if (context.Request.QueryString["tip"] == "mala")
            cmd.CommandText = "SELECT malaSlika FROM Vest WHERE Vest_Id = @Id";
        else if (context.Request.QueryString["tip"] == "golema")
            cmd.CommandText = "SELECT golemaSlika FROM Vest WHERE Vest_Id = @Id";
        
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
            if (context.Request.QueryString["tip"] == "mala")
                context.Response.BinaryWrite((byte[])dReader["malaSlika"]);
            else if (context.Request.QueryString["tip"] == "golema")
                context.Response.BinaryWrite((byte[])dReader["golemaSlika"]);
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