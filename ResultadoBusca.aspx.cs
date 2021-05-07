using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ResultadoBusca : System.Web.UI.Page
{
    giulianoovendedorEntities dc = new giulianoovendedorEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        CarregarVeiculos();
    }

    protected void ddlFabricante_DataBound(object sender, EventArgs e)
    {
        ddlFabricante.Items.Insert(0, new ListItem("Selecione...", "0"));
    }

    protected void ddlFabricante_SelectedIndexChanged(object sender, EventArgs e)
    {
        int fabricanteID = Convert.ToInt32(ddlFabricante.SelectedValue);
        SelecionarModeloPelaMarca(fabricanteID);
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

        if (Request.QueryString["modeloid"] != null)
        {
            ddlModelo.SelectedValue = Request.QueryString["modeloid"].ToString();
        }
    }

    protected void ddlModelo_DataBound(object sender, EventArgs e)
    {
        ddlModelo.Items.Insert(0, new ListItem("Selecione...", "0"));
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

    private void CarregarVeiculos()
    {
        string url = "ResultadoBusca.aspx" + "?carros=fantasticos";

        string queryURL = string.Empty;
        string condicoes = string.Empty;


        if (Request.QueryString["fabricanteid"] != null)
        {
            CarregarMarcas();
            ddlFabricante.SelectedValue = Request.QueryString["fabricanteid"].ToString();
            int fabricanteID = Convert.ToInt32(Request.QueryString["fabricanteid"].ToString());
            SelecionarModeloPelaMarca(fabricanteID);
            condicoes += " and fabricante.id = " + Request.QueryString["fabricanteid"].ToString();
            queryURL += "&fabricanteid=" + ddlFabricante.SelectedValue;
        }

        if (Request.QueryString["modeloid"] != null)
        {
            ddlModelo.SelectedValue = Request.QueryString["modeloid"];
            condicoes += " and modelo.id = " + Request.QueryString["modeloid"].ToString();
            queryURL += "&modeloid=" + ddlModelo.SelectedValue;
        }

        if (Request.QueryString["anoinicio"] != null && Request.QueryString["anofim"] != "0")
        {
            txtAnoAte.Text = Request.QueryString["anoinicio"].ToString();
            condicoes += " and veiculos.ano >= " + Request.QueryString["anoinicio"].ToString();
            queryURL += "&anoinicio=" + ddlModelo.SelectedValue;
        }

        if (Request.QueryString["anofim"] != null && Request.QueryString["anofim"] != "0")
        {
            txtAnoInicial.Text = Request.QueryString["anofim"].ToString();
            condicoes += " and veiculos.ano <= " + Request.QueryString["anofim"].ToString();
            queryURL += "&anofim=" + Request.QueryString["anofim"].ToString();
        }
        

        //if (!string.IsNullOrWhiteSpace(condicoes))
        //    Response.Redirect(url + condicoes);

        string sql = @"SELECT veiculos.id as codigo,  veiculos.titulo, fabricante.descricao as fabricante, veiculos.ano, veiculos.cor, veiculos.km, veiculos.preco, max(imagens.arquivo) as arquivo
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
        //if (!carregou)
        //{
        //    Response.Redirect(url + queryURL);
        //    carregou = true;
        //}
    }

    private void CarregarMarcas()
    {
        List<fabricante> listaMarcas = dc.fabricante.ToList();
        ddlFabricante.DataSource = listaMarcas;
        ddlFabricante.DataBind();
    }

    protected void lbReiniciar_Click(object sender, EventArgs e)
    {
        try
        {

        }
        catch (Exception)
        {

            throw;
        }
    }
}