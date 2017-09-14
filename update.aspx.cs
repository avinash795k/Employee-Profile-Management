using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;

public partial class update : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Server=AVINASH\\MSSQLSERVER2012;Database=users; User ID=sa; Password=avinash; Trusted_Connection=true");
    DataTable dt, userdt;
    DataRow dr;
    string userid, showuser;
    int ch;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            Response.Redirect("loginpage.aspx");
        }
        else
        {
            userid = Session["workinguid"].ToString();
        }
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "admindisplay";
        cmd.Parameters.AddWithValue("@admin", Session["uid"].ToString());
        con.Open();
        SqlDataAdapter userda = new SqlDataAdapter(cmd);
        userdt = new DataTable();
        userda.Fill(userdt);
        otherusers.DataSource = userdt;
        otherusers.DataBind();
        con.Close();
        if (!IsPostBack)
        {
            displayconnect();
            display();
        }
        if (imgfile.PostedFile != null && imgfile.PostedFile.ContentLength > 0)
        {
            UpLoadAndDisplay();
        }
    }
    
    private void displayconnect()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "selectuser";
        cmd.Parameters.AddWithValue("@userid", userid);
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        dt = new DataTable();
        da.Fill(dt);
        dr = dt.Rows[0];
        con.Close();


        name.Text = Convert.ToString(dr[1]).Trim();
        username.Text = Convert.ToString(dr[2]).Trim();
        birthday.Text = Convert.ToString(dr[4]).Substring(0, 10).Trim();
        gender.Text = Convert.ToString(dr[5]).Trim();
        mobile.Text = Convert.ToString(dr[6]).Trim();
    }
    private void display()
    {
        if (!dr.IsNull(7))
        {
            Textaddress.Text = Convert.ToString(dr[7]);
        }
        else
        {
            Textaddress.Text = "";
        }
        if (!dr.IsNull(8))
        {
            Textemail.Text = Convert.ToString(dr[8]);
        }
        else
        {
            Textemail.Text = "";
        }
        if (!dr.IsNull(10))
        {
            aadharno.Text = Convert.ToString(dr[10]);
        }
        else
        {
            aadharno.Text = "";
        }
        if (!dr.IsNull(11))
        {
            panno.Text = Convert.ToString(dr[11]);
        }
        else
        {
            panno.Text = "";
        }
        if (!dr.IsNull(12))
        {
            passportno.Text = Convert.ToString(dr[12]);
            DateTime expiarypassport = DateTime.Parse(dr[13].ToString());
            passportexp.Text = expiarypassport.ToString("yyyy/MM/dd");
        }
        else
        {
            passportno.Text = "";
            passportexp.Text = "";
        }
        if (!dr.IsNull(14))
        {
            dlno.Text = Convert.ToString(dr[14]);
            DateTime expiarydl = DateTime.Parse(dr[15].ToString());
            dlexp.Text = expiarydl.ToString("yyyy/MM/dd");
        }
        else
        {
            dlno.Text = "";
            dlexp.Text = "";
        }
        if (dr.IsNull(9))
        {
            userimg.ImageUrl = "~/userimage/default.png";
            imgremove.Visible = false;
        }
        else
        {
            userimg.ImageUrl = "~/userimage/" + Convert.ToString(dr[9]);
            imgremove.Visible = true;
        }


    }
    private void UpLoadAndDisplay()
    {
        displayconnect();
        if (!dr.IsNull(9))
        {
            FileInfo file = new FileInfo(Server.MapPath("~/userimage/" + Convert.ToString(dr[9])));
            file.Delete();
        }
        string imgName = userid + System.IO.Path.GetExtension(imgfile.FileName);
        string imgPath = "userimage/" + imgName;
        int imgSize = imgfile.PostedFile.ContentLength;
        if (imgfile.PostedFile != null && imgfile.PostedFile.FileName != "")
        {

            imgfile.SaveAs(Server.MapPath(imgPath));
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "imageupdate";
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@imagepath", imgName);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            userimg.ImageUrl = "~/" + imgPath;
            imgremove.Visible = true;

        }
        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "popup_Click()", true);
    }

    protected void remove(object sender, EventArgs e)
    {
        displayconnect();
        if (!dr.IsNull(9))
        {
            FileInfo file = new FileInfo(Server.MapPath("~/userimage/" + Convert.ToString(dr[9])));
            file.Delete();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "imageupdate";
            cmd.Parameters.AddWithValue("@userid", userid);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            userimg.ImageUrl = "~/userimage/default.png";
            imgremove.Visible = false;
        }
        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "popup_Click()", true);
    }
    protected void btnupdate(object sender, EventArgs e)
    {
        string valid = "y";
        if ((dlno.Text.Trim() == String.Empty || dlexp.Text.Trim() == String.Empty) && !(dlno.Text.Trim() == String.Empty && dlexp.Text.Trim() == String.Empty))
        {
            Label2.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "popup_Click()", true);
            valid = "n";
        }
        if ((passportno.Text.Trim() == String.Empty || passportexp.Text.Trim() == String.Empty) && !(passportno.Text.Trim() == String.Empty && passportexp.Text.Trim() == String.Empty))
        {
            Label1.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "popup_Click()", true);
            valid = "n";
        }
        if (valid == "y")
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "infoupdate";
            cmd.Parameters.AddWithValue("@userid", userid);
            if (Textemail.Text.Trim() != String.Empty)
            {
                cmd.Parameters.AddWithValue("@email", Textemail.Text.Trim());
            }

            if (Textaddress.Text.Trim() != String.Empty)
            {
                cmd.Parameters.AddWithValue("@address", Textaddress.Text.Trim());
            }

            if (aadharno.Text.Trim() != String.Empty)
            {
                cmd.Parameters.AddWithValue("@aadharno", aadharno.Text.Trim());
            }

            if (panno.Text.Trim() != String.Empty)
            {
                cmd.Parameters.AddWithValue("@panno", panno.Text.Trim());
            }

            if (passportno.Text.Trim() != String.Empty && passportexp.Text.Trim() != String.Empty)
            {
                Label1.Visible = false;
                cmd.Parameters.AddWithValue("@passportno", passportno.Text.Trim());
                cmd.Parameters.AddWithValue("@passportexp", passportexp.Text.Trim());
            }

            if (dlno.Text.Trim() != String.Empty && dlexp.Text.Trim() != String.Empty)
            {
                Label2.Visible = false;
                cmd.Parameters.AddWithValue("@dlno", dlno.Text.Trim());
                cmd.Parameters.AddWithValue("@dlexp", dlexp.Text.Trim());
            }
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            string message = "Profile Updated Successfully";
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "')};";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        }
    }

    protected void updation(object source, RepeaterCommandEventArgs e)
    {

        if (e.CommandName == "btnotherupdate")
        {
            Label1.Visible = false;
            Label2.Visible = false;
            ch = e.Item.ItemIndex;
            Session["workinguid"] = Convert.ToString(userdt.Rows[ch][0]).Trim();
            userid = Session["workinguid"].ToString();
            displayconnect();
            display();
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "popup_Click()", true);
        }

    }
    protected void btnmyupdate(object sender, EventArgs e)
    {
        Label1.Visible = false;
        Label2.Visible = false;
        Session["workinguid"] = Session["uid"];
        userid = Session["workinguid"].ToString();
        displayconnect();
        display();
        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "popup_Click()", true);
    }
}