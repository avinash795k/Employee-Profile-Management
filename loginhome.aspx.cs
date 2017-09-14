using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class loginhome : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Server=AVINASH\\MSSQLSERVER2012;Database=users; User ID=sa; Password=avinash; Trusted_Connection=true");
    DataTable dt;
    DataRow dr;
    string userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            Response.Redirect("loginpage.aspx");
        }
        else
        {
            userid = Session["uid"].ToString();
        }
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "selectuser";
        cmd.Parameters.AddWithValue("@userid", userid);
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        con.Close();
        dt = new DataTable();
        da.Fill(dt);
        dr = dt.Rows[0];
        welcomenote.Text = "WELCOME " + Convert.ToString(dr["name"]).ToUpper();
        labeldate.Text = DateTime.Today.ToLongDateString();
        labelday.Text = "It's " + DateTime.Today.DayOfWeek.ToString();
        if (!dr.IsNull(1))
        {
            imgprofile.ImageUrl = "~/userimage/" + Convert.ToString(dr["image"]);
        }
    }
    protected void btnimgprofile(object sender, EventArgs e)
    {
        Response.Redirect("profile.aspx");
    }
}