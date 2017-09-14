using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class registration : System.Web.UI.Page
{
    string connetionString = "";
    string userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        Button blogout = (Button)Master.FindControl("logout");
        Button bupdateinfo = (Button)Master.FindControl("updateinfo");
        Button binsert = (Button)Master.FindControl("insert");
        Button bprofil = (Button)Master.FindControl("profil");
        Button bhome = (Button)Master.FindControl("home");
        //this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        if (Session["uid"] == null)
        {
            Button2.Visible = true;
            Button3.Visible = true;
            blogout.Visible = false;
            bupdateinfo.Visible = false;
            binsert.Visible = false;
            bprofil.Visible = false;
            bhome.Visible = false;
        }
        else
        {
            userid = Session["uid"].ToString();
            Button2.Visible = false;
            Button3.Visible = false;
            blogout.Visible = true;
            bupdateinfo.Visible = true;
            binsert.Visible = true;
            bprofil.Visible = true;
            bhome.Visible = true;
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        connetionString = "Server=AVINASH\\MSSQLSERVER2012;Database=users; User ID=sa; Password=avinash; Trusted_Connection=true";
        SqlConnection con = new SqlConnection(connetionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "checkusername";


        cmd.Parameters.AddWithValue("@username", Textusername.Text.Trim());

        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        con.Close();
        DataTable dt = new DataTable();
        da.Fill(dt);
        cmd.CommandText = "userregister";
        if (Session["uid"] != null)
        {
            cmd.Parameters.AddWithValue("@creater", userid);
        }
        cmd.Parameters.AddWithValue("@name", Textname.Text.Trim());
        cmd.Parameters.AddWithValue("@password", Textpassword.Text.Trim());
        cmd.Parameters.AddWithValue("@birthday", Textbirthday.Text.Trim());
        cmd.Parameters.AddWithValue("@gender", Dropgender.SelectedValue);
        cmd.Parameters.AddWithValue("@mobile", Textmobile.Text.Trim());
        if (dt.Rows.Count > 0)
        {
            Label1.Visible = true;
        }
        else
        {
            Label1.Visible = false;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


            if (Session["uid"] == null)
            {
                Response.Redirect("~/loginpage.aspx");
            }
            else
            {
                Response.Redirect("~/loginhome.aspx");
            }
            string message = "Successfully Registered";
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "')};";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        }
    }
}