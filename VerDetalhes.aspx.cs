using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class VerDetalhes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        giulianoovendedorEntities db = new giulianoovendedorEntities();

        if (Request.QueryString["id"] != null)
        {
            int idVeiculo = Convert.ToInt32(Request.QueryString["id"]);
            veiculos veiculo = db.veiculos.Where(o => o.id == idVeiculo).FirstOrDefault();

            HtmlMeta meta = new HtmlMeta();
            meta.Attributes["property"] = "og:title";
            meta.Content = "GIULIANO O VENDEDOR - " + veiculo.titulo + " - Ano " + veiculo.ano + " - " + veiculo.cor + " - " + veiculo.km + " km rodados - " + Convert.ToDecimal(veiculo.preco).ToString("R$ #,###.00");
            Page.Header.Controls.Add(meta);

            meta.Attributes["property"] = "og:image";
            meta.Content = "http://www.giulianoovendedor.com.br/fotos/" + veiculo.imagens.FirstOrDefault().arquivo;
            Page.Header.Controls.Add(meta);

            Page.Title = "GIULIANO O VENDEDOR - " + veiculo.titulo + " - Ano " + veiculo.ano + " - " + veiculo.cor + " - " + veiculo.km + " km rodados - " + Convert.ToDecimal(veiculo.preco).ToString("R$ #,###.00");
        }
    }
}