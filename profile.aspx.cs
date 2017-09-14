using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class profile : System.Web.UI.Page
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
        name.Text = Convert.ToString(dr[1]).Trim();
        username.Text = Convert.ToString(dr[2]).Trim();
        birthday.Text = Convert.ToString(dr[4]).Substring(0, 10).Trim();
        gender.Text = Convert.ToString(dr[5]).Trim();
        mobile.Text = Convert.ToString(dr[6]).Trim();
        if (!dr.IsNull(7))
        {
            Textaddress.Visible = true;
            Textaddress.Text = Convert.ToString(dr[7]);
        }
        else
        {
            Textaddress.Visible = false;
        }
        if (!dr.IsNull(8))
        {
            Textemail.Visible = true;
            Textemail.Text = Convert.ToString(dr[8]);
        }
        else
        {
            Textemail.Visible = false;
        }
        if (!dr.IsNull(10))
        {
            aadharno.Visible = true;
            aadharno.Text = Convert.ToString(dr[10]);
        }
        else
        {
            aadharno.Visible = false;
        }
        if (!dr.IsNull(11))
        {
            panno.Visible = true;
            panno.Text = Convert.ToString(dr[11]);
        }
        else
        {
            panno.Visible = false;
        }
        if (!dr.IsNull(12))
        {
            passportno.Visible = true;
            passportexp.Visible = true;
            passportno.Text = Convert.ToString(dr[12]);
            DateTime expiarypassport = DateTime.Parse(dr[13].ToString());
            passportexp.Text = expiarypassport.ToString("dd/MM/yyyy");
        }
        else
        {
            passportno.Visible = false;
            passportexp.Visible = false;
        }
        if (!dr.IsNull(14))
        {
            dlno.Visible = true;
            dlexp.Visible = true;
            dlno.Text = Convert.ToString(dr[14]);
            DateTime expiarydl = DateTime.Parse(dr[15].ToString());
            dlexp.Text = expiarydl.ToString("dd/MM/yyyy");
        }
        else
        {
            dlno.Visible = false;
            dlexp.Visible = false;
        }
        if (dr.IsNull(9))
        {
            userimg.ImageUrl = "~/userimage/default.png";
        }
        else
        {
            userimg.ImageUrl = "~/userimage/" + Convert.ToString(dr[9]);
        }
    }
}