using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QueroComprar : System.Web.UI.Page
{
    giulianoovendedorEntities dc = new giulianoovendedorEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["marcaselecao"] != null)
            {
                int fabricanteID = Convert.ToInt32(Session["marcaselecao"]);
                ddlFabricante.SelectedValue = Session["marcaselecao"].ToString();
                SelecionarModeloPelaMarca(fabricanteID);
            }
            //Session["precoselecao"] = ddlFaixaPreco.SelectedValue;
            //Session["modeloelecao"] = ddlFaixaPreco.SelectedValue;
            //Session["marcaselecao"] = ddlFabricante.SelectedValue;

            CarregarVeiculos();
            CarregarMarcas();
        }
    }

    private void CarregarVeiculos()
    {
        string condicoes = string.Empty;
        if (ddlModelo.SelectedIndex > 0)
        {
            string idModelo = ddlModelo.SelectedValue;
            condicoes += " and veiculos.modelo_id = " + idModelo;
        }
        else
        {
            if (Session["modeloelecao"] != null)
            {
                condicoes += " and veiculos.modelo_id = " + Session["modeloelecao"];
            }
            //Session["precoselecao"] = ddlFaixaPreco.SelectedValue;
            //Session["modeloelecao"] = ddlFaixaPreco.SelectedValue;
            //Session["marcaselecao"] = ddlFabricante.SelectedValue;
        }

        if (!string.IsNullOrWhiteSpace(txtAnoAte.Text))
        {
            string preco = txtAnoAte.Text;
            condicoes += " and veiculos.ano <= '" + preco + "'";
        }

        if (!string.IsNullOrWhiteSpace(txtAnoInicial.Text))
        {
            string preco = txtAnoInicial.Text;
            condicoes += " and veiculos.ano >= '" + preco + "'";
        }

        if (ddlTipo.SelectedIndex > 0)
        {
            string tipo = ddlTipo.SelectedValue;
            condicoes += " and veiculos.tipo_id = " + tipo;
        }


        if (ddlFaixaPreco.SelectedIndex > 0)
        {
            Session["precoselecao"] = ddlFaixaPreco.SelectedValue;

            string value = ddlFaixaPreco.SelectedValue;
            decimal number;
            // Parse a floating-point value with a thousands separator.
            if (Decimal.TryParse(value, out number))
            {
                condicoes += " and veiculos.ano <= " + number;
            }
        }
        else
        {
            if (Session["precoselecao"] != null)
            {
                condicoes += " and veiculos.ano <= " + Session["precoselecao"];
            }
            //Session["precoselecao"] = ddlFaixaPreco.SelectedValue;
            //Session["modeloelecao"] = ddlFaixaPreco.SelectedValue;
            //Session["marcaselecao"] = ddlFabricante.SelectedValue;
        }

        string sql = @"SELECT veiculos.id as codigo, veiculos.titulo, fabricante.descricao as fabricante, veiculos.ano, veiculos.cor, veiculos.km, veiculos.preco, max(imagens.arquivo) as arquivo
	            FROM giulianoovendedor.veiculos 
	            INNER JOIN giulianoovendedor.modelo ON veiculos.modelo_id = modelo.id
	            INNER JOIN giulianoovendedor.fabricante ON modelo.fabricante_id = fabricante.id
	            inner join giulianoovendedor.imagens on veiculos.id = imagens.veiculo_id and imagens.destaque = 1
                where 1=1 " + condicoes +
                @" group by veiculos.id, veiculos.titulo, fabricante.descricao, veiculos.ano, veiculos.cor, veiculos.km, veiculos.preco";

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["giulianoovendedorConnectionString2"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand(sql);
        using (con)
        {
            using (SqlDataAdapter da = new SqlDataAdapter())
            {
                cmd.Connection = con;
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);

                //if (ds.Tables[0].Rows.Count > 0)
                //{
                lvVeiculos.DataSource = ds;
                lvVeiculos.DataBind();
                //}
            }
        }
    }

    private void CarregarMarcas()
    {
        List<fabricante> listaMarcas = dc.fabricante.ToList();
        ddlFabricante.DataSource = listaMarcas;
        ddlFabricante.DataBind();
    }

    protected void ddlFabricante_DataBound(object sender, EventArgs e)
    {
        ddlFabricante.Items.Insert(0, new ListItem("Selecione...", "0"));
    }

    protected void ddlModelo_DataBound(object sender, EventArgs e)
    {
        ddlModelo.Items.Insert(0, new ListItem("Selecione...", "0"));
    }
    protected void ddlFabricante_SelectedIndexChanged(object sender, EventArgs e)
    {
        int fabricanteID = Convert.ToInt32(ddlFabricante.SelectedValue);
        SelecionarModeloPelaMarca(fabricanteID);
        Session["marcaselecao"] = ddlFabricante.SelectedValue;
    }

    private void SelecionarModeloPelaMarca(int fabricanteID)
    {
        List<modelo> listaModelos = dc.modelo.ToList();
        if (fabricanteID > 0)
        {
            listaModelos = listaModelos.Where(o => o.fabricante_id == fabricanteID).ToList();
        }
        ddlModelo.DataSource = listaModelos;
        ddlModelo.DataBind();
        ddlModelo.Enabled = true;
    }

    protected void ddlModelo_SelectedIndexChanged(object sender, EventArgs e)
    {
        CarregarVeiculos();
    }

    protected void ddlFaixaPreco_SelectedIndexChanged(object sender, EventArgs e)
    {
        CarregarVeiculos();
    }

    protected void lvVeiculos_PagePropertiesChanged(object sender, EventArgs e)
    {
        CarregarVeiculos();
    }

    protected void lbBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            CarregarVeiculos();
        }
        catch (Exception)
        {
            //throw;
        }
    }

    protected void ddlTipo_DataBound(object sender, EventArgs e)
    {
        try
        {
            ddlTipo.Items.Insert(0, new ListItem("Selecione...", "0"));
        }
        catch (Exception)
        {

            //throw;
        }
    }
}