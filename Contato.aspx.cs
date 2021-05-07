using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contato : System.Web.UI.Page
{
    giulianoovendedorEntities dc = new giulianoovendedorEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["carroid"] != null)
        {
            int carroid = Convert.ToInt32(Request.QueryString["carroid"]);
            veiculos carro = dc.veiculos.Where(o => o.id == carroid).FirstOrDefault();
            if(carro != null)
            {
                txtMensagem.Text = "Prezado Giuliano, estou interessado no " + carro.titulo + " ! Me liga.";
            }
        }
    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        try
        {
            MailMessage oEmail = new MailMessage();
            MailAddress sDe = new MailAddress(txtEmail.Text);
            oEmail.To.Add("contato@giulianoovendedor.com.br");
            oEmail.To.Add("xandeq@gmail.com");
            // Com cópia para testar. Lembrar de apagar
            oEmail.Bcc.Add("xandeq@gmail.com");
            oEmail.From = sDe;
            oEmail.Priority = MailPriority.Normal;
            oEmail.IsBodyHtml = true;
            oEmail.Subject = "Contato do Site - Giuliano O Vendedor";
            oEmail.Body = "<b>Foi realizado um contato pelo e-mail. Seguem abaixo os dados:</b><br /><br />" +
                          "<b>Nome:</b> " + txtNome.Text + "<br />" +
                          "<b>E-mail:</b> " + txtEmail.Text + "<br />" +
                          "<b>Telefone:</b> " + txtTelefone.Text + "<br />" +
                          "<b>Motivo do chamado:</b> " + txtMensagem.Text + "<br />" +
                          "<p>Este e-mail foi enviado através da página giulianoovendedor.com.br</p>";

            SmtpClient oEnviar = new SmtpClient();
            oEnviar.Host = "mail.maroon.mysitehosted.com";
            //oEnviar.Host = "smtp.costaneraarmazem.com.br";
            oEnviar.Port = 587;
            //oEnviar.EnableSsl = true;
            oEnviar.Credentials = new NetworkCredential("mail@giulianoovendedor.com.br", "giuliano10#");
            oEnviar.Send(oEmail);
            Response.Write("<SCRIPT type='text/javascript'>alert('E-mail enviado com sucesso')</script>");
            oEmail.Dispose();

            this.LimparCampos();
        }
        catch (Exception ex)
        {
            Response.Write(ex.InnerException.ToString());
        }
    }

    private void LimparCampos()
    {
        txtNome.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtTelefone.Text = string.Empty;
        txtMensagem.Text = string.Empty;
    }
}