<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_veiculos_Default" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpCabecalhoAdmin" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpConteudoAdmin" runat="Server">
    <div class="row">
        <div class="col-md-4">
            <h3>ADICIONAR VEÍCULO</h3>
            <asp:Label AssociatedControlID="lblId" Text="Código:" runat="server" />
            <asp:Label ID="lblId" runat="server" />
            <br />
            <asp:Label AssociatedControlID="txtTitulo" Text="Título" runat="server" />
            <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control" />
            <br />
            <asp:UpdatePanel ID="upVeiculo" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <asp:Label AssociatedControlID="ddlFabricante" Text="Marca:" runat="server" />
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlFabricante"
                        OnSelectedIndexChanged="ddlFabricante_SelectedIndexChanged" OnDataBound="ddlFabricante_DataBound"
                        DataTextField="descricao" DataValueField="id" AutoPostBack="true">
                    </asp:DropDownList>
                    <br />
                    <asp:Label AssociatedControlID="ddlModelo" Text="Modelo" runat="server" />
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlModelo" DataTextField="descricao" DataValueField="id" OnDataBound="ddlModelo_DataBound">
                    </asp:DropDownList>
                    <br />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlFabricante" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
            <br />
            <asp:Label AssociatedControlID="txtDescricao" Text="Descrição" runat="server" />
            <asp:TextBox ID="txtDescricao" runat="server" CssClass="textarea-editor" Width="400" TextMode="MultiLine" Rows="40" />
            <br />
            <asp:Label AssociatedControlID="txtAno" Text="Ano" runat="server" />
            <asp:TextBox ID="txtAno" runat="server" CssClass="form-control" />
            <br />
            <asp:Label AssociatedControlID="txtCor" Text="Cor" runat="server" />
            <asp:TextBox ID="txtCor" runat="server" CssClass="form-control" />
            <br />
            <asp:Label AssociatedControlID="txtKm" Text="Kilometragem" runat="server" />
            <asp:TextBox ID="txtKm" runat="server" CssClass="form-control" />
            <br />
            <asp:Label AssociatedControlID="txtPreco" Text="Preço" runat="server" />
            <asp:TextBox ID="txtPreco" runat="server" CssClass="form-control" />
            <br />
            <asp:Label AssociatedControlID="ddlTipo" Text="Tipo" runat="server" />
            <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-control" DataSourceID="SQLDSTipos" DataTextField="descricao" DataValueField="id"></asp:DropDownList>
            <asp:SqlDataSource ID="SQLDSTipos" runat="server" 
                ConnectionString="<%$ ConnectionStrings:giulianoovendedorConnectionString2 %>" 
                SelectCommand="SELECT * FROM [giulianoovendedor].[giulianoovendedor].[tipos] ORDER BY [descricao]"></asp:SqlDataSource>
            <br />
            <%--<asp:Label AssociatedControlID="cbAtivo" Text="Ativo?" runat="server" />
            <asp:CheckBox ID="cbAtivo" runat="server" CssClass="form-control" />
            <br />--%>
            <asp:Label AssociatedControlID="fuFotos" Text="Imagens do Veículo" runat="server" />
            <asp:FileUpload ID="fuFotos" runat="server" AllowMultiple="true" />
            <b>Selecione várias imagens de uma vez</b>
            <%--<asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick ="UploadMultipleFiles" accept ="image/gif, image/jpeg" />--%>
            <div class="row" id="linhaImagens" runat="server" visible="false">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">FOTOS DO VEÍCULO</h3>
                            <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
                        </div>
                        <div class="panel-body">
                            <asp:ListView ID="lvImagensVeiculos" runat="server" OnItemCommand="lvImagensVeiculos_ItemCommand">
                                <ItemTemplate>
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <asp:LinkButton runat="server" CommandName="imagemDestaque" CommandArgument='<%# Eval("id") %>' Visible='<%# !Convert.ToBoolean(Eval("destaque")) %>'>
                                                <asp:Image ImageUrl="http://icons.iconarchive.com/icons/hopstarter/soft-scraps/256/Button-Turn-On-icon.png" Height="24px" runat="server"  AlternateText="Selecionar esta Imagem da Capa do Veículo" ToolTip="Selecionar esta Imagem da Capa do Veículo" />
                                            </asp:LinkButton>
                                            <asp:Image ImageUrl="http://www.easyhoroscope.com/wp-content/themes/easyhoroscopev2/images/background/star.png" Height="24px" runat="server" Visible='<%# Convert.ToBoolean(Eval("destaque")) %>' AlternateText="Imagem da Capa do Veículo" ToolTip="Imagem da Capa do Veículo" />
                                            <br />
                                            <asp:HyperLink runat="server" CssClass="example-image-link" NavigateUrl='<%# "~/fotos/" + Eval("arquivo") %>' data-lightbox="example-1">
                                            <asp:Image runat="server" ImageUrl='<%# "~/fotos/" + Eval("arquivo") %>' Style="height: 50px" class="example-image" />
                                            </asp:HyperLink>
                                            <p>
                                                <asp:LinkButton runat="server" CommandName="removerImagem" CommandArgument='<%# Eval("id") %>' OnClientClick="return confirm('Tem certeza que deseja excluir ?')">
                                                    <asp:Image ImageUrl="https://ww6.yorkmaps.ca/Html5Viewer24/Resources/Images/Icons/Toolbar/trash-24.png" Height="24px" runat="server"  AlternateText="Excluir imagem" ToolTip="Excluir imagem" />
                                                </asp:LinkButton>
                                            </p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <div class="row" id="itemPlaceholderContainer" runat="server" style="">
                                        <div class="col-md-12" runat="server" id="itemPlaceholder" />
                                    </div>
                                </LayoutTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <asp:Label ID="lblSuccess" runat="server" ForeColor="Green" />
            <asp:LinkButton ID="btnSalvar" runat="server" CssClass="btn btn-success" OnClick="btnSalvar_Click">
                <i class="fa fa-save"></i> Salvar
            </asp:LinkButton>
            <asp:LinkButton ID="btnNovo" runat="server" CssClass="btn btn-primary" OnClick="btnNovo_Click">
                <i class="fa fa-plus"></i> Novo
            </asp:LinkButton>
            <asp:Label ID="Span1" runat="server" />
        </div>
        <div class="col-md-8">
            <div class="alert alert-info text-center">
                <h3>
                    ESTOQUE: <asp:Label ID="lblNumeroVeiculos" runat="server" Font-Bold="True" /> veículos ativos</h3>
            </div>
            <asp:ListView ID="lvVeiculos" runat="server" DataSourceID="sqldsVeiculos" OnItemCommand="Unnamed_ItemCommand">
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <p>
                                <asp:Label ID="descricaoLabel" runat="server" Text='<%# Eval("fabricante") %>' /></p>
                            <h4>
                                <asp:Label Text='<%# Eval("id") %>' runat="server" />
                                -
                                <asp:Label ID="tituloLabel" runat="server" Text='<%# Eval("titulo") %>' /></h4>
                            <p>
                                <asp:Image runat="server" ImageUrl='<%# "~/fotos/" + Eval("arquivo") %>' Style="height: 60px" class="example-image" /></p>
                            <p>ANO
                                <asp:Label ID="anoLabel" runat="server" Text='<%# Eval("ano") %>' Font-Bold="true" />, COR
                                <asp:Label ID="corLabel" runat="server" Text='<%# Eval("cor") %>' /></p>
                            <h6 style="color: #1d9010">Carro inserido dia
                                <asp:Label Text='<%# DateTime.Parse(Eval("data_criacao").ToString()).ToString("dd/MM/yyyy hh:mm") %>' runat="server" /></h6>
                        </td>
                        <td>
                            <asp:Label ID="kmLabel" runat="server" Text='<%# Eval("km") == DBNull.Value ? "N/I" : Convert.ToDecimal(Eval("km")).ToString("#.###") %>' />
                        </td>
                        <td>
                            <asp:Label ID="precoLabel" runat="server" Text='<%# Convert.ToDecimal(Eval("preco")).ToString("R$ #,###.00") %>' />
                        </td>
                        <td>
                            <asp:Label ID="tipoLabel" runat="server" Text='<%# Eval("Tipo") %>' />
                        </td>
                        <td>
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Editar" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-warning">
                                <i class="fa fa-pencil"></i> Editar
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnDeletar" runat="server" CommandName="Deletar" CommandArgument='<%# Eval("id") %>' Text="Editar" CssClass="btn btn-danger" OnClientClick="return confirm('Tem certeza que deseja excluir este veículo?')">
                                <i class="fa fa-trash"></i> Excluir
                            </asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table table-responsive table-bordered table-striped table-hover">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" class="table table-responsive table-bordered table-striped table-hover">
                                    <tr runat="server" style="">
                                        <td colspan="4">
                                            <h3>LISTA DE VEÍCULOS</h3>
                                        </td>
                                    </tr>
                                    <tr runat="server" style="">
                                        <th runat="server">Veículo</th>
                                        <th runat="server">KM</th>
                                        <th runat="server">Valor</th>
                                        <th></th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="100">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" FirstPageText="Primeira" LastPageText="Última" NextPageText="Próxima" PreviousPageText="Anterior" />
                                        <asp:NumericPagerField ButtonCount="20" />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" FirstPageText="Primeira" LastPageText="Última" NextPageText="Próxima" PreviousPageText="Anterior" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="sqldsVeiculos" runat="server" ConnectionString="<%$ ConnectionStrings:giulianoovendedorConnectionString2 %>"
                SelectCommand="WITH ranking AS (
                SELECT veiculos.id, veiculos.titulo, fabricante.descricao as fabricante, veiculos.ano, veiculos.cor, veiculos.km, veiculos.preco, veiculos.data_criacao, imagens.arquivo,
	            ROW_NUMBER() OVER(PARTITION BY veiculos.id 
                ORDER BY veiculos.titulo DESC) AS linha, tipos.descricao as tipo
                FROM giulianoovendedor.veiculos 
                INNER JOIN giulianoovendedor.modelo ON veiculos.modelo_id = modelo.id
                INNER JOIN giulianoovendedor.fabricante ON modelo.fabricante_id = fabricante.id
                INNER JOIN giulianoovendedor.imagens on veiculos.id = giulianoovendedor.imagens.veiculo_id
				LEFT JOIN giulianoovendedor.tipos ON veiculos.tipo_id = tipos.id)
                SELECT r.*
                FROM ranking r
                WHERE r.linha = 1"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

