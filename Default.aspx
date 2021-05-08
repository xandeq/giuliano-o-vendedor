<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpCabecalho" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpConteudo" runat="Server">
    <asp:UpdatePanel ID="upVeiculo" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-12">
                    <h3 class="text-center"><i class="fa fa-car"></i>ENCONTRE SEU CARRO</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <fieldset class="col-md-12">
                        <legend>
                            <h5>Filtros</h5>
                        </legend>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Label AssociatedControlID="ddlFabricante" Text="Marca:" runat="server" />
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlFabricante"
                                            OnDataBound="ddlFabricante_DataBound" DataTextField="descricao"
                                            DataValueField="id" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlFabricante_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Label AssociatedControlID="ddlModelo" Text="Modelo" runat="server" />
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlModelo"
                                            DataTextField="descricao" DataValueField="id"
                                            OnDataBound="ddlModelo_DataBound" Enabled="false">
                                        </asp:DropDownList>
                                    </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlFabricante" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <div class="col-md-12">
                            <asp:Label AssociatedControlID="ddlFaixaPreco" Text="Faixa de preço" runat="server" />
                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlFaixaPreco">
                                <asp:ListItem Value="0">Selecione o Preço</asp:ListItem>
                                <asp:ListItem Value="10000">Até R$10.000,00</asp:ListItem>
                                <asp:ListItem Value="20000">Até R$20.000,00</asp:ListItem>
                                <asp:ListItem Value="30000">Até R$30.000,00</asp:ListItem>
                                <asp:ListItem Value="40000">Até R$40.000,00</asp:ListItem>
                                <asp:ListItem Value="50000">Até R$50.000,00</asp:ListItem>
                                <asp:ListItem Value="80000">Até R$80.000,00</asp:ListItem>
                                <asp:ListItem Value="150000">Até R$150.000,00</asp:ListItem>
                                <asp:ListItem Value="250000">Até R$250.000,00</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <asp:Label runat="server" AssociatedControlID="txtAnoInicial">Ano de:</asp:Label>
                        <asp:TextBox ClientIDMode="Static" ID="txtAnoInicial" runat="server" CssClass="form-control"
                            MaxLength="4" />
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <asp:Label runat="server" AssociatedControlID="txtAnoAte">Ano até:</asp:Label>
                        <asp:TextBox ClientIDMode="Static" ID="txtAnoAte" runat="server" CssClass="form-control"
                            MaxLength="4" />
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <asp:Label runat="server" AssociatedControlID="txtAnoAte">Tipo:</asp:Label>
                        <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-control" DataSourceID="SQLDSTipos"
                            DataTextField="descricao" DataValueField="id" OnDataBound="ddlTipo_DataBound">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SQLDSTipos" runat="server"
                            ConnectionString="<%$ ConnectionStrings:giulianoovendedorConnectionString2 %>"
                            SelectCommand="SELECT * FROM [giulianoovendedor].[giulianoovendedor].[tipos] ORDER BY [descricao]">
                        </asp:SqlDataSource>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:Label runat="server" AssociatedControlID="lbBuscar">.</asp:Label>
                        <asp:LinkButton ID="lbBuscar" runat="server" OnClick="lbBuscar_Click" CssClass="btn btn-success"
                            CausesValidation="false">
                            <i class="fa fa-search"></i> Buscar
                        </asp:LinkButton>
                        <asp:LinkButton ID="lbReiniciar" runat="server" OnClick="lbReiniciar_Click"
                            CssClass="btn btn-warning" CausesValidation="false">
                            <i class="fa fa-repeat"></i> Reiniciar
                        </asp:LinkButton>
                    </div>
                </div>
                </fieldset>
            </div>
            <div class="col-md-9">
                <hr class="dropdown-divider" style="margin: 17px auto" />
                <div class="row" id="#busca">
                    <asp:ListView ID="lvVeiculos" runat="server" GroupItemCount="4">
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>Nenhum veículo encontrado.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <EmptyItemTemplate>
                            <td runat="server" />
                        </EmptyItemTemplate>
                        <GroupTemplate>
                            <div class="row" id="itemPlaceholderContainer" runat="server">
                                <div class="col-md-4" id="itemPlaceholder" runat="server"></div>
                            </div>
                        </GroupTemplate>
                        <ItemTemplate>
                            <div class="col-lg-3 col-md-3 mb-3">
                                <div class="card h-100 text-center">
                                    <asp:HyperLink NavigateUrl='<%# "~/VerDetalhes.aspx?id=" + Eval("codigo") %>'
                                        runat="server">
                                        <asp:Image CssClass="card-img-top"
                                            ImageUrl='<%# "http://www.giulianoovendedor.com.br/fotos/" + Eval("arquivo") %>'
                                            runat="server"
                                            AlternateText='<%# "Foto " + Eval("codigo") + " " + Eval("arquivo") %>' />
                                    </asp:HyperLink>
                                    <div class="card-body">
                                        <h3 class="card-title"
                                            style="font-size: 18px !important; font-weight: bold !important">
                                            <asp:HyperLink
                                                NavigateUrl='<%# "~/VerDetalhes.aspx?id=" + Eval("codigo") %>'
                                                runat="server">
                                                <asp:Label ID="tituloLabel" runat="server"
                                                    Text='<%# Eval("titulo") %>' />
                                            </asp:HyperLink>
                                        </h3>
                                        <div class="product-price-col">
                                            <div class="price-container-desktop">
                                                <h4 class="label-col">Preço:
                                                    <asp:Label ID="Label2" runat="server"
                                                        Text='<%# Convert.ToDecimal(Eval("preco")).ToString("R$ #,###.00") %>' />
                                                </h4>
                                            </div>
                                        </div>
                                        <h4 class="label-col">Km:
                                            <b class="product-price-col">
                                                <asp:Label ID="kmLabel" runat="server"
                                                    Text='<%# Eval("km") == DBNull.Value || string.IsNullOrWhiteSpace(Convert.ToString(Eval("km"))) ? "N/I" : Convert.ToDecimal(Eval("km")).ToString("#.###") %>' />
                                            </b>
                                        </h4>
                                        <h4 class="label-col">Cor:
                                            <b class="product-price-col">
                                                <asp:Label ID="corLbl" runat="server" Text='<%# Eval("cor") %>' />
                                            </b>
                                        </h4>
                                        <h4 class="label-col">Ano:
                                            <b class="product-price-col">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ano") %>' />
                                            </b>
                                        </h4>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div class="row">
                                <div class="col-md-12" style="margin: 20px auto">
                                    <asp:DataPager ID="DataPager2" runat="server" PageSize="24">
                                        <Fields>
                                            <asp:TemplatePagerField>
                                                <PagerTemplate>Página </PagerTemplate>
                                            </asp:TemplatePagerField>
                                            <asp:NextPreviousPagerField ButtonCssClass="btn btn-info"
                                                ButtonType="Button" ShowFirstPageButton="True"
                                                ShowNextPageButton="False" ShowPreviousPageButton="False"
                                                FirstPageText="Primeira" LastPageText="Última" NextPageText="Próxima"
                                                PreviousPageText="Anterior" />
                                            <asp:NumericPagerField ButtonCount="90" />
                                            <asp:NextPreviousPagerField ButtonCssClass="btn btn-info"
                                                ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False"
                                                ShowPreviousPageButton="False" FirstPageText="Primeira"
                                                LastPageText="Última" NextPageText="Próxima"
                                                PreviousPageText="Anterior" />
                                        </Fields>
                                    </asp:DataPager>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12" style="margin: 20px auto">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="30">
                                        <Fields>
                                            <asp:TemplatePagerField>
                                                <PagerTemplate>Página </PagerTemplate>
                                            </asp:TemplatePagerField>
                                            <asp:NextPreviousPagerField ButtonCssClass="btn btn-info"
                                                ButtonType="Button" ShowFirstPageButton="True"
                                                ShowNextPageButton="False" ShowPreviousPageButton="False"
                                                FirstPageText="Primeira" LastPageText="Última" NextPageText="Próxima"
                                                PreviousPageText="Anterior" />
                                            <asp:NumericPagerField ButtonCount="90" />
                                            <asp:NextPreviousPagerField ButtonCssClass="btn btn-info"
                                                ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False"
                                                ShowPreviousPageButton="False" FirstPageText="Primeira"
                                                LastPageText="Última" NextPageText="Próxima"
                                                PreviousPageText="Anterior" />
                                        </Fields>
                                    </asp:DataPager>
                                </div>
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlFabricante" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlModelo" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlFaixaPreco" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpRodape" runat="Server">
    <script>
        $(document).ready(function () {
            $('.masthead').show();
        })
    </script>
</asp:Content>