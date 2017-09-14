using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Masterhead : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogout(object sender, EventArgs e)
    {
        Session.Remove("uid");
        Session.Remove("workinguid");
        Response.Redirect("loginpage.aspx");
    }
    protected void btnhome(object sender, EventArgs e)
    {
        Session["workinguid"] = Session["uid"];
        Response.Redirect("loginhome.aspx");
    }
    protected void btnprofile(object sender, EventArgs e)
    {
        Session["workinguid"] = Session["uid"];
        Response.Redirect("profile.aspx");
    }
    protected void btnupdateinfo(object sender, EventArgs e)
    {
        Session["workinguid"] = Session["uid"];
        Response.Redirect("update.aspx");
    }
    protected void btninsert(object sender, EventArgs e)
    {
        Session["workinguid"] = Session["uid"];
        Response.Redirect("registration.aspx");
    }
}
