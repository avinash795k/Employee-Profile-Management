using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class loginpage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] != null)
        {
            Response.Redirect("loginhome.aspx");
        }
    }
    protected void Login(object sender, EventArgs e)
    {
        Response.Redirect("~/loginpage.aspx");
    }
    protected void Signup(object sender, EventArgs e)
    {
        Response.Redirect("~/registration.aspx");
    }
    protected void userlogin(object sender, EventArgs e)
    {
        string connetionString = "Server=AVINASH\\MSSQLSERVER2012;Database=users; User ID=sa; Password=avinash; Trusted_Connection=true";
        SqlConnection con = new SqlConnection(connetionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "checklogin";
        cmd.Parameters.AddWithValue("@username", Textusername.Text);
        cmd.Parameters.AddWithValue("@password", Textpassword.Text);
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        con.Close();
        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            DataRow dr = dt.Rows[0];
            string userid = Convert.ToString(dr[0]).Trim();
            Session["uid"] = userid;
            Session["workinguid"] = userid;

            Response.Redirect("loginhome.aspx");
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Username or Password')</script>");
        }
    }
}