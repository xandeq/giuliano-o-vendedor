using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net.Mail;
using System.Net;

public partial class Financiamento : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        try
        {
            MailMessage oEmail = new MailMessage();
            MailAddress sDe = new MailAddress(txtDPEEmail.Text);
            oEmail.To.Add(new MailAddress("giulianoovendedor@gmail.com", "Giuliano o Vendedor"));
            oEmail.To.Add(new MailAddress("contato@alexandrequeiroz.com.br", "Alexandre Queiroz"));
            oEmail.From = sDe;
            oEmail.Priority = MailPriority.Normal;
            oEmail.IsBodyHtml = true;
            oEmail.Subject = "FINANCIAMENTO - " + txtDPENomeCompleto.Text;

            string corpo = string.Empty;
            corpo += "<h4>VEÍCULO DE INTERESSE</h4>";
            corpo += "<p>" + txtVeiculoInteresse.Text + "</p>";
            corpo += "<h4>DADOS PESSOAIS</h4>";
            corpo += "<p>CPF:" + txtDPECPF.Text + "</p>";
            corpo += "<p>Data Nascimento:" + txtDPEDataNascimento.Text + "</p>";
            corpo += "<p>Email:" + txtDPEEmail.Text + "</p>";
            corpo += "<p>Endereço:" + txtDPEEndereço.Text + "</p>";
            corpo += "<p>Estado Civil:" + txtDPEEstadoCivil.Text + "</p>";
            corpo += "<p>Identidade:" + txtDPEIdentidade.Text + "</p>";
            corpo += "<p>NATURALIDADE:" + txtDPENATURALIDADE.Text + "</p>";
            corpo += "<p>Nome Completo:" + txtDPENomeCompleto.Text + "</p>";
            corpo += "<p>Nome Mãe:" + txtDPENomeMae.Text + "</p>";
            corpo += "<p>Nome Pai:" + txtDPENomePai.Text + "</p>";
            corpo += "<p>Telefone 1:" + txtDPETelefone1.Text + "</p>";
            corpo += "<p>Telefone 2:" + txtDPETelefone2.Text + "</p>";
            corpo += "<p>Tempo Residencia:" + txtDPETempoResidencia.Text + "</p>";
            corpo += "<h4>DADOS PROFISSIONAIS</h4>";
            corpo += "<p>Cargo:" + txtDPRCargo.Text + "</p>";
            corpo += "<p>Empresa:" + txtDPREmpresa.Text + "</p>";
            corpo += "<p>Endereço Empresa:" + txtDPREnderecoEmpresa.Text + "</p>";
            corpo += "<p>Renda Bruta:" + txtDPRRendaBruta.Text + "</p>";
            corpo += "<p>Telefone Empresa:" + txtDPRTelefoneEmpresa.Text + "</p>";
            corpo += "<p>Tempo Emprego:" + txtDPRTempoEmprego.Text + "</p>";
            corpo += "<h4>DADOS BANCARIOS</h4>";
            corpo += "<p>Agência:" + txtRBAgencia.Text + "</p>";
            corpo += "<p>Banco:" + txtRBBanco.Text + "</p>";
            corpo += "<p>Conta:" + txtRBConta.Text + "</p>";

            oEmail.Body = "<b>Foi realizado um FINANCIAMENTO pelo e-mail. Seguem abaixo os dados:</b><br /><br />" +
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
        txtDPECPF.Text = string.Empty;
        txtDPEDataNascimento.Text = string.Empty;
        txtDPEEmail.Text = string.Empty;
        txtDPEEndereço.Text = string.Empty;
        txtDPEEstadoCivil.Text = string.Empty;
        txtDPEIdentidade.Text = string.Empty;
        txtDPENATURALIDADE.Text = string.Empty;
        txtDPENomeCompleto.Text = string.Empty;
        txtDPENomeMae.Text = string.Empty;
        txtDPENomePai.Text = string.Empty;
        txtDPETelefone1.Text = string.Empty;
        txtDPETelefone2.Text = string.Empty;
        txtDPETempoResidencia.Text = string.Empty;
        txtDPRCargo.Text = string.Empty;
        txtDPREmpresa.Text = string.Empty;
        txtDPREnderecoEmpresa.Text = string.Empty;
        txtDPRRendaBruta.Text = string.Empty;
        txtDPRTelefoneEmpresa.Text = string.Empty;
        txtDPRTempoEmprego.Text = string.Empty;
        txtRBAgencia.Text = string.Empty;
        txtRBBanco.Text = string.Empty;
        txtRBConta.Text = string.Empty;
    }
}