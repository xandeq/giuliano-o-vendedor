using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_modelos_Default : System.Web.UI.Page
{
    giulianoovendedorEntities dc = new giulianoovendedorEntities();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Label titulo = (Label)Master.FindControl("lblTituloPagina");
        titulo.Text = "Modelos";
    }

    protected void lvModelos_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        DropDownList ddlMarca = (e.Item.FindControl("ddlMarca") as DropDownList);
    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        modelo modeloNovo = null;
        if (string.IsNullOrWhiteSpace(lblId.Text))
        {
            modeloNovo = new modelo();
        }
        else
        {
            int codigo = Convert.ToInt32(lblId.Text);
            dc.modelo.Where(o => o.id == codigo).First();
        }

        modeloNovo.descricao = txtDescricao.Text;
        modeloNovo.fabricante_id = Convert.ToInt32(ddlMarca.SelectedValue);
        if (string.IsNullOrWhiteSpace(lblId.Text))
            dc.modelo.Add(modeloNovo);
        dc.SaveChanges();

        LimparCampos();
        lvModelos.DataBind();

        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "Erro", "alert('Modelo salvo com sucesso!');", true);
    }
    protected void ddlMarca_DataBound(object sender, EventArgs e)
    {
        ddlMarca.Items.Insert(0, new ListItem("Seleciona", "0"));
    }

    private void LimparCampos()
    {
        lblId.Text = string.Empty;
        txtDescricao.Text = string.Empty;
        ddlMarca.SelectedIndex = 0;
    }
    protected void lvModelos_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if(e.CommandName=="Editar")
        {
            int codigo = int.Parse(e.CommandArgument.ToString());
            modelo modeloEditar = dc.modelo.Where(o => o.id == codigo).First();
            txtDescricao.Text = modeloEditar.descricao;
            ddlMarca.SelectedValue = modeloEditar.fabricante_id.ToString();
            lblId.Text = modeloEditar.id.ToString();
        }
        else if (e.CommandName == "Deletar")
        {
            int codigo = int.Parse(e.CommandArgument.ToString());
            modelo modeloDeletar = dc.modelo.Where(o => o.id == codigo).FirstOrDefault();
            if(modeloDeletar != null)
            {
                var listaVeiculos = dc.veiculos.Where(o => o.modelo_id == 88).ToList();
                for (int i = 0; i < listaVeiculos.Count(); i++)
                {
                    dc.veiculos.Remove(listaVeiculos[i]);
                    dc.SaveChanges();
                }


                dc.modelo.Remove(modeloDeletar);
                dc.SaveChanges();

                lvModelos.DataBind();
            }
        }
    }
    protected void btnNovo_Click(object sender, EventArgs e)
    {
        LimparCampos();
    }
}