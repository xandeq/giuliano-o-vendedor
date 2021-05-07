using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();

        //if (Session["usuario"] == null && Session["senha"] == null)
        //{
        //    Response.Redirect("~/admin/login.aspx");
        //}
    }

    protected void btnSair_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        try
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
            Response.Expires = -1000;
            Response.CacheControl = "no-cache";
            //Response.Redirect("login.aspx", true);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        Response.Redirect("~/admin/Login.aspx");
    }
}
