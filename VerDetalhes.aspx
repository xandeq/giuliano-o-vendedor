<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VerDetalhes.aspx.cs" Inherits="VerDetalhes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpCabecalho" runat="Server">
    <%--<meta property="og:url" content="http://www.vilavelha.es.gov.br/noticias/2018/01/calendario-fiscal-define-datas-para-pagamento-de-tributos-18741" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="Calendário fiscal define datas para pagamento de tributos" />
    <meta property="og:description" content="Haverá desconto de até 8% para pagamento do IPTU em cota única" />
    <meta property="og:image" content="http://www.vilavelha.es.gov.br/midia/imagens/2017/12/26951_08122017_326x290.jpg" />--%>
    <meta property="og:type" content="website" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpConteudo" runat="Server">
    <asp:ListView ID="lvVeiculos" runat="server" DataSourceID="sqldsDetalheVeiculo">
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <ItemTemplate>
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <asp:Label ID="tituloLabel" runat="server" Text='<%# Eval("titulo") %>' /></h3>
                            <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
                        </div>
                        <div class="panel-body">
                            <b>ANO:</b>
                            <asp:Label ID="anoLabel" runat="server" Text='<%# Eval("ano") %>' />
                            <br />
                            <b>COR:</b>
                            <asp:Label ID="corLabel" runat="server" Text='<%# Eval("cor") %>' />
                            <br />
                            <b>Quilometragem:</b>
                            <asp:Label ID="kmLabel" runat="server" Text='<%# Eval("km") %>' />
                            <br />
                            <b>Preço:</b>
                            <asp:Label ID="precoLabel" runat="server" Text='<%# Convert.ToDecimal(Eval("preco")).ToString("R$ #,###.00") %>' />
                        </div>
                    </div>
                    <hr />
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                        </div>
                        <div class="panel-body">
                            <asp:Label ID="lblDescricao" runat="server" Text='<%# Eval("descricao") %>' />
                        </div>
                    </div>
                    <hr />
                    <div class="row alert-info" style="padding: 20px">
                        <div class="col-md-12">
                            <h4 class="text-center"><i class="fa fa-photo"></i>ENTRE EM CONTATO</h4>
                        </div>
                        <div class="col-md-6 text-center">
                            <i class="fa fa-whatsapp"></i><i class="fa fa-phone"></i>(27)99516-6975
                        </div>
                        <div class="col-md-6 text-center">
                            <asp:LinkButton ID="lbEstouInteressado" runat="server" PostBackUrl='<%# "Contato.aspx?carroid=" + Eval("id") %>' CssClass="btn btn-success">
                                        <i class="fa fa-check"></i> Estou interessado!
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">FOTOS DO VEÍCULO</h3>
                            <hr />
                            <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
                        </div>
                        <div class="panel-body">
                            <h5>* Clique na imagem para abrí-la em tamanho maior</h5>
                            <asp:ListView ID="lvImagensVeiculos" runat="server" DataSourceID="sqldsImagens">
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" CssClass="example-image-link" NavigateUrl='<%# "http://www.giulianoovendedor.com.br/fotos/" + Eval("arquivo") %>' data-lightbox="example-1">
                                        <asp:Image runat="server" ImageUrl='<%# "http://www.giulianoovendedor.com.br/fotos/" + Eval("arquivo") %>' Style="height: 150px" class="example-image" AlternateText='<%# "Foto do carro " + Eval("id") + " " + Eval("arquivo") %>' />
                                    </asp:HyperLink>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <span id="itemPlaceholderContainer" runat="server" style="">
                                        <span runat="server" id="itemPlaceholder" />
                                    </span>
                                </LayoutTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="sqldsImagens" runat="server"
                                ConnectionString="<%$ ConnectionStrings:giulianoovendedorConnectionString2 %>"
                                SelectCommand="SELECT id,arquivo,veiculo_id FROM giulianoovendedor.imagens WHERE (veiculo_id = @id) ">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="id" QueryStringField="id" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <!-- Load Facebook SDK for JavaScript -->
                    <div id="fb-root"></div>
                    <script>(function (d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id)) return;
                            js = d.createElement(s); js.id = id;
                            js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1";
                            fjs.parentNode.insertBefore(js, fjs);
                        }(document, 'script', 'facebook-jssdk'));</script>
                    <div class="row alert-info" style="padding: 20px">
                        <div class="col-md-12">
                            <h4 class="text-center"><i class="fa fa-facebook"></i>COMPARTILHE</h4>
                        </div>
                        <div class="col-md-6 text-center">
                            <a href="https://api.whatsapp.com/send?text=<%# HttpContext.Current.Request.Url.AbsoluteUri.ToString() %>" data-action="share/whatsapp/share">
                                <asp:Image ImageUrl="http://www.vilavelha.es.gov.br/img/WhatsApp-icon.png" runat="server" Width="28" />
                            </a>
                        </div>
                        <div class="col-md-6 text-center">
                            <div class="fb-share-button" data-href="http://www.giulianoovendedor.com.br" data-layout="button" data-size="small" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=<%# HttpContext.Current.Request.Url.AbsoluteUri.ToString() %>&amp;src=sdkpreparse">Compartilhar</a></div>
                        </div>
                    </div>
                </div>

            </div>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="sqldsDetalheVeiculo" runat="server" ConnectionString="<%$ ConnectionStrings:giulianoovendedorConnectionString2 %>"
        SelectCommand="SELECT veiculos.id, veiculos.titulo, fabricante.descricao as fabricante, veiculos.ano, veiculos.cor, veiculos.km, veiculos.preco, veiculos.descricao 
        FROM giulianoovendedor.veiculos 
        INNER JOIN giulianoovendedor.modelo ON veiculos.modelo_id = modelo.id 
        INNER JOIN giulianoovendedor.fabricante ON modelo.fabricante_id = fabricante.id 
        WHERE (veiculos.id = @id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

