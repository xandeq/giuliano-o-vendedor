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

public partial class _Default : System.Web.UI.Page
{
    giulianoovendedorEntities dc = new giulianoovendedorEntities();

    public bool carregou { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CarregarMarcas();
            CarregarVeiculos();
        }
    }

    private void VerificaQueryString()
    {
        try
        {

        }
        catch (Exception)
        {
            throw;
        }
    }

    private void CarregarDados()
    {
        try
        {

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('ex.Message=" + ex.Message + " ex.InnerException=" + ex.InnerException + "')</script>");
        }
    }

    private void CarregarVeiculos()
    {
        string url = "Default2.aspx" + "?carros=fantasticos";

        string queryURL = string.Empty;
        string condicoes = string.Empty;


        if (ddlFabricante.SelectedIndex > 0)
        {
            condicoes += " and fabricante.id = " + ddlFabricante.SelectedValue;
            queryURL += "&fabricanteid=" + ddlFabricante.SelectedValue;
        }

        if (ddlModelo.SelectedIndex > 0)
        {
            condicoes += " and modelo.id = " + ddlModelo.SelectedValue;
            queryURL += "&modeloid=" + ddlModelo.SelectedValue;
        }

        if (ddlFaixaPreco.SelectedIndex > 0)
        {
            condicoes += " and veiculos.preco <= " + ddlFaixaPreco.SelectedValue;
            queryURL += "&veiculopreco=" + ddlFaixaPreco.SelectedValue;
        }

        if (!string.IsNullOrWhiteSpace(txtAnoAte.Text))
        {
            string anoate = !string.IsNullOrWhiteSpace(txtAnoAte.Text) ? txtAnoAte.Text : DateTime.Now.Year.ToString();
            condicoes += " and veiculos.ano <= " + anoate;
            queryURL += "&AnoAte=" + anoate;
        }

        if (!string.IsNullOrWhiteSpace(txtAnoInicial.Text))
        {
            string anoinicial = !string.IsNullOrWhiteSpace(txtAnoInicial.Text) ? txtAnoInicial.Text : "0";
            condicoes += " and veiculos.ano >= " + anoinicial;
            queryURL += "&AnoInicial=" + anoinicial;
        }

        if (ddlTipo.SelectedIndex > 0)
        {
            condicoes += " and veiculos.tipo_id <= " + ddlTipo.SelectedValue;
            queryURL += "&veiculotipoid=" + ddlTipo.SelectedValue;
        }


        string sql = @"SELECT veiculos.id as codigo, veiculos.titulo, fabricante.descricao as fabricante, veiculos.tipo_id, veiculos.ano, veiculos.cor, veiculos.km, veiculos.preco, max(imagens.arquivo) as arquivo
	            FROM giulianoovendedor.veiculos 
	            INNER JOIN giulianoovendedor.modelo ON veiculos.modelo_id = modelo.id
	            INNER JOIN giulianoovendedor.fabricante ON modelo.fabricante_id = fabricante.id
	            inner join giulianoovendedor.imagens on veiculos.id = imagens.veiculo_id and imagens.destaque = 1
                where 1=1 " + condicoes +
                @" group by veiculos.id, veiculos.titulo, fabricante.descricao, veiculos.ano, veiculos.cor, veiculos.km, veiculos.preco, veiculos.tipo_id";

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

        if (Request.QueryString["fabricanteid"] != null)
        {
            ddlFabricante.SelectedValue = Request.QueryString["fabricanteid"].ToString();
            int fabricanteID = Convert.ToInt32(Request.QueryString["fabricanteid"].ToString());
            SelecionarModeloPelaMarca(fabricanteID);
        }
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

    protected void lbBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            CarregarVeiculos();
        }
        catch (Exception ex)
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