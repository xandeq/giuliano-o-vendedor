using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtUsuario.Text == "admin" && txtSenha.Text == "giuliano10#")
            {

                SetaVariaveisSessao();

                //Create the ticket, and add the groups.
                bool isCookiePersistent = chkPersist.Checked;
                FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(txtUsuario.Text, true, 60000);

                //Encrypt the ticket.
                String encryptedTicket = FormsAuthentication.Encrypt(authTicket);

                //Create a cookie, and then add the encrypted ticket to the cookie as data.
                HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);

                if (true == isCookiePersistent)
                    authCookie.Expires = authTicket.Expiration;

                //Add the cookie to the outgoing cookies collection.
                Response.Cookies.Add(authCookie);

                //You can redirect now.
                Response.Redirect("Default.aspx");
            }
            else
            {
                errorLabel.Text = "Authentication did not succeed. Check user name and password.";
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "Erro", "alert('" + ex.Message + "');", true);
        }
    }

    private void SetaVariaveisSessao()
    {
        try
        {
            Session["usuario"] = txtUsuario.Text;
            Session["senha"] = txtSenha.Text;
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "Erro", "alert('" + ex.Message + "');", true);
        }
    }
}