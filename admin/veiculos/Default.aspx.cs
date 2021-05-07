using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class admin_veiculos_Default : System.Web.UI.Page
{
    giulianoovendedorEntities dc = new giulianoovendedorEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CarregarMarcas();
            SetarImagemDestaque();
            CarregarContagem();

            if (Session["carroeditar"] != null)
            {
                int codigo = Convert.ToInt32(Session["carroeditar"]);
                CarregarVeiculo(codigo);
            }
        }
    }

    private void CarregarContagem()
    {
        lblNumeroVeiculos.Text = dc.veiculos.Where(o => o.ativo).Count().ToString();
    }

    private void SetarImagemDestaque()
    {
        List<int> listaVeiculos = dc.veiculos.Select(s => s.id).ToList();
        for (int i = 0; i < listaVeiculos.Count(); i++)
        {
            int carroid = listaVeiculos[i];
            List<imagens> listaImagensVeiculo = dc.imagens.Where(o => o.veiculo_id == carroid).ToList();
            bool carrotemDestaque = listaImagensVeiculo.Where(o => o.destaque == true).Any();
            if (!carrotemDestaque && listaImagensVeiculo.Count() > 0)
            {
                imagens imagem = listaImagensVeiculo.First();
                imagem.destaque = true;
                dc.SaveChanges();
            }
        }
        
       
    }

    private void CarregarMarcas()
    {
        List<fabricante> listaMarcas = dc.fabricante.OrderBy(o => o.descricao).ToList();
        ddlFabricante.DataSource = listaMarcas;
        ddlFabricante.DataBind();
    }

    protected void ddlFabricante_SelectedIndexChanged(object sender, EventArgs e)
    {
        int fabricanteID = Convert.ToInt32(ddlFabricante.SelectedValue);
        List<modelo> listaModelos = dc.modelo.ToList();
        listaModelos = listaModelos.Where(o => o.fabricante_id == fabricanteID).OrderBy(o => o.descricao).ToList();
        ddlModelo.DataSource = listaModelos;
        ddlModelo.DataBind();
    }

    protected void ddlFabricante_DataBound(object sender, EventArgs e)
    {
        ddlFabricante.Items.Insert(0, new ListItem("Selecione...", "0"));
    }

    protected void ddlModelo_DataBound(object sender, EventArgs e)
    {
        ddlModelo.Items.Insert(0, new ListItem("Selecione...", "0"));
    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        try
        {
            veiculos carro;
            string mensagem = "adicionado";
            if (string.IsNullOrWhiteSpace(lblId.Text))
            {
                carro = new veiculos();
            }
            else
            {
                mensagem = "atualizado";
                int codigoVeiculo = Convert.ToInt32(lblId.Text);
                carro = dc.veiculos.Where(o => o.id == codigoVeiculo).FirstOrDefault();
            }

            carro.ano = txtAno.Text;
            carro.km = !string.IsNullOrWhiteSpace(txtKm.Text) ? Convert.ToInt32(txtKm.Text) : 0;
            carro.ativo = true;
            carro.cor = txtCor.Text;
            carro.data_criacao = DateTime.Now;
            carro.destaque = false;
            carro.modelo_id = Convert.ToInt32(ddlModelo.SelectedValue);
            carro.preco = Convert.ToDecimal(txtPreco.Text);
            carro.titulo = txtTitulo.Text;
            carro.descricao = txtDescricao.Text;

            if (ddlTipo.SelectedIndex > 0)
                carro.tipo_id = Convert.ToInt32(ddlTipo.SelectedValue);
            
            if (string.IsNullOrWhiteSpace(lblId.Text))
            {
                dc.veiculos.Add(carro);
            }
            dc.SaveChanges();

            string filepath = Server.MapPath("\\fotos");
            HttpFileCollection uploadedFiles = Request.Files;
            Span1.Text = string.Empty;

            //if (string.IsNullOrWhiteSpace(lblId.Text))
            //{
                for (int i = 0; i < uploadedFiles.Count; i++)
                {
                    HttpPostedFile userPostedFile = uploadedFiles[i];
                    try
                    {
                        if (userPostedFile.ContentLength > 0)
                        {
                            imagens imagem = new imagens();
                            imagens imagemExiste = dc.imagens.Where(o => o.arquivo == userPostedFile.FileName && o.veiculo_id == carro.id).FirstOrDefault();
                            if(imagemExiste == null)
                            {
                                imagem.arquivo = userPostedFile.FileName;
                                imagem.destaque = false;
                                imagem.veiculo_id = carro.id;
                                dc.imagens.Add(imagem);
                                dc.SaveChanges();

                                userPostedFile.SaveAs(filepath + "\\" + Path.GetFileName(userPostedFile.FileName));
                            }
                            //Span1.Text += "<u>File #" + (i + 1) + "</u><br>";
                            //Span1.Text += "File Content Type: " + userPostedFile.ContentType + "<br>";
                            //Span1.Text += "File Size: " + userPostedFile.ContentLength + "kb<br>";
                            //Span1.Text += "File Name: " + userPostedFile.FileName + "<br>";
                        }
                    }
                    catch (Exception Ex)
                    {
                        Span1.Text += "Error: <br>" + Ex.Message;
                    }
                }
            //}
            //else
            //{

            //}

            Session["carroeditar"] = null;
            SetarImagemDestaque();
            lvVeiculos.DataBind();
            this.LimparCampos(this.Controls);

            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "SUCESSO", "alert('Veículo "+ mensagem + " com sucesso!');", true);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "ERRO", "alert('" + ex.Message + "');", true);
        }
    }

    private void LimparCampos(ControlCollection cc)
    {
        try
        {
            foreach (Control ctrl in cc)
            {
                TextBox tb = ctrl as TextBox;
                if (tb != null)
                    tb.Text = "";
                else
                    LimparCampos(ctrl.Controls);

                DropDownList ddl = ctrl as DropDownList;
                if (ddl != null)
                    ddl.SelectedIndex = 0;
                else
                    LimparCampos(ctrl.Controls);
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "Erro", "alert('" + ex.Message + "');", true);
        }
    }

    protected void Unnamed_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Editar")
        {
            int codigo = int.Parse(e.CommandArgument.ToString());
            Session["carroeditar"] = codigo;
            CarregarVeiculo(codigo);
        }
        else if (e.CommandName == "Deletar")
        {
            int codigo = int.Parse(e.CommandArgument.ToString());
            veiculos veiculo = dc.veiculos.Where(o => o.id == codigo).FirstOrDefault();

            List<imagens> listaImagemVeiculo = dc.imagens.Where(o => o.veiculo_id == veiculo.id).ToList();
            for (int i = 0; i < listaImagemVeiculo.Count(); i++)
            {
                dc.imagens.Remove(listaImagemVeiculo[i]);
                dc.SaveChanges();
            }

            dc.veiculos.Remove(veiculo);
            dc.SaveChanges();
        }

        lvVeiculos.DataBind();
    }

    private void CarregarVeiculo(int codigo)
    {
        veiculos veiculo = dc.veiculos.Where(o => o.id == codigo).First();

        modelo modelo = dc.modelo.Where(o => o.id == veiculo.modelo_id).FirstOrDefault();
        fabricante fabricante = dc.fabricante.Where(o => o.id == modelo.fabricante_id).FirstOrDefault();
        ddlFabricante.SelectedValue = fabricante.id.ToString();

        List<modelo> listaModelos = dc.modelo.ToList();
        listaModelos = listaModelos.Where(o => o.fabricante_id == fabricante.id).ToList();
        ddlModelo.DataSource = listaModelos;
        ddlModelo.DataBind();

        ddlModelo.SelectedValue = modelo.id.ToString();

        //txtDescricao.Text = veiculo.descricao;
        //ddlMarca.SelectedValue = veiculo.fabricante_id.ToString();
        lblId.Text = veiculo.id.ToString();
        txtAno.Text = veiculo.ano;
        txtCor.Text = veiculo.cor;
        txtKm.Text = veiculo.km.ToString();
        txtPreco.Text = veiculo.preco.ToString();
        txtTitulo.Text = veiculo.titulo;
        ddlModelo.SelectedValue = veiculo.modelo_id.ToString();
        txtDescricao.Text = veiculo.descricao;
        ddlTipo.SelectedValue = veiculo.tipo_id.ToString();

        CarregarImagensVeiculo(veiculo);
    }

    private void CarregarImagensVeiculo(veiculos veiculo)
    {
        var listaImagens = dc.imagens.Where(o => o.veiculo_id == veiculo.id).ToList();
        lvImagensVeiculos.DataSource = listaImagens;
        lvImagensVeiculos.DataBind();
        linhaImagens.Visible = listaImagens.Count() > 0;
    }

    protected void btnNovo_Click(object sender, EventArgs e)
    {
        lblId.Text = string.Empty;
        txtAno.Text = string.Empty;
        txtCor.Text = string.Empty;
        txtKm.Text = string.Empty;
        txtPreco.Text = string.Empty;
        txtTitulo.Text = string.Empty;
        txtDescricao.Text = string.Empty;
        ddlModelo.SelectedIndex = 0;
        ddlFabricante.SelectedIndex = 0;
    }

    protected void lvImagensVeiculos_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        int codigo = int.Parse(e.CommandArgument.ToString());
        imagens imagem = dc.imagens.Where(o => o.id == codigo).FirstOrDefault();
        int veiculoid = Convert.ToInt32(imagem.veiculo_id);

        if (e.CommandName == "imagemDestaque")
        {
            if (imagem != null)
            {
                imagem.destaque = true;
                dc.SaveChanges();
            }

            List<imagens> listaImagemVeiculo = dc.imagens.Where(o => o.id != codigo && o.veiculo_id == imagem.veiculo_id).ToList();
            for (int i = 0; i < listaImagemVeiculo.Count(); i++)
            {
                listaImagemVeiculo[i].destaque = false;
                dc.SaveChanges();
            }

            CarregarVeiculo(veiculoid);
        }
        else if (e.CommandName == "removerImagem")
        {
            dc.imagens.Remove(imagem);
            dc.SaveChanges();
            CarregarVeiculo(veiculoid);
        }
    }

}