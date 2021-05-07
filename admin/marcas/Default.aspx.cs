using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_marcas_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label titulo = (Label)Master.FindControl("lblTituloPagina");
        titulo.Text = "Marcas";
    }
}