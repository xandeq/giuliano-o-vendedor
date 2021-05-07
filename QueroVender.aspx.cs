using System;
using System.Net;
using System.Net.Mail;

public partial class QueroVender : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        try
        {
            MailMessage oEmail = new MailMessage();
            MailAddress sDe = new MailAddress(txtEmail.Text);
            oEmail.To.Add(new MailAddress("giulianoovendedor@gmail.com", "Giuliano o Vendedor"));
            oEmail.To.Add(new MailAddress("contato@alexandrequeiroz.com.br", "Alexandre Queiroz"));
            oEmail.From = sDe;
            oEmail.Priority = MailPriority.Normal;
            oEmail.IsBodyHtml = true;
            oEmail.Subject = "QUERO VENDER - " + txtNome.Text;

            string corpo = string.Empty;
            corpo += "<h4>DADOS PESSOAIS</h4>";
            corpo += "<p>NOME:" + txtNome.Text + "</p>";
            corpo += "<p>EMAIL:" + txtEmail.Text + "</p>";
            corpo += "<p>TELEFONE:" + txtTelefone.Text + "</p>";
            corpo += "<p>DADOS ADICIONAIS:" + txtInfo.Text + "</p><br>";
            corpo += "<p>DADOS VEÍCULO:" + txtDadosVeiculo.Text + "</p>";


            oEmail.Body = "<b>Foi realizado um QUERO VENDER MEU CARRO pelo e-mail. Seguem abaixo os dados:</b><br /><br />" +
                            corpo +
                          "<p>Este e-mail foi enviado através da página GiulianoOVendedor.com.br</p>";

            SmtpClient oEnviar = new SmtpClient();
            oEnviar.Host = "giulianoovendedor.com.br";
            //oEnviar.Host = "smtp.costaneraarmazem.com.br";
            oEnviar.Port = 25;
            oEnviar.EnableSsl = false;
            oEnviar.Credentials = new NetworkCredential("mail@giulianoovendedor.com.br", "Giuliano10#");
            oEnviar.Send(oEmail);
            Response.Write("<SCRIPT type='text/javascript'>alert('E-mail enviado com sucesso')</script>");
            LimparControles();
            oEmail.Dispose();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
    }

    private void LimparControles()
    {
        txtDadosVeiculo.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtInfo.Text = string.Empty;
        txtNome.Text = string.Empty;
        txtTelefone.Text = string.Empty;
    }
}