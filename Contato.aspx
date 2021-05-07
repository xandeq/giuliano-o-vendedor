<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contato.aspx.cs" Inherits="Contato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpCabecalho" runat="Server">
    <style type="text/css">
        .jumbotron {
            background: #358CCE;
            color: #FFF;
            border-radius: 0px;
        }

        .jumbotron-sm {
            padding-top: 24px;
            padding-bottom: 24px;
        }

        .jumbotron small {
            color: #FFF;
        }

        .h1 small {
            font-size: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpConteudo" runat="Server">
    <div class="jumbotron jumbotron-sm">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-lg-12">
                    <h1 class="h1"><i class="fa fa-envelope"></i><i class="fa fa-phone"></i>Fale <small>Comigo</small></h1>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="well well-sm">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="name">
                                    Nome:
                                </label>
                                <asp:TextBox ID="txtNome" CssClass="form-control" runat="server" placeholder="Digite seu Nome" />
                            </div>
                            <div class="form-group">
                                <label for="email">
                                    E-mail:
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span>
                                    </span>
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Digite seu email" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email">
                                    Telefone:
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span>
                                    </span>
                                    <asp:TextBox ID="txtTelefone" CssClass="form-control" runat="server" placeholder="Digite seu Telefone" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="name">
                                    Mensagem:
                                </label>
                                <asp:TextBox ID="txtMensagem" CssClass="form-control" runat="server" placeholder="Digite Mensagem" Rows="9" Columns="25" TextMode="MultiLine" />
                            </div>
                        </div>
                        <div class="col-md-12">
                            <asp:LinkButton ID="btnEnviar" CssClass="btn btn-primary pull-right" runat="server" OnClick="btnEnviar_Click">
                                    <i class="fa fa-send"></i> Enviar
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <fieldset>
                    <legend><span class="fa fa-building"></span>Nosso escritório</legend>
                    <address>
                        <p><strong>Endereço</strong></p>
                        <p>Av. Primeira Avenida, 1277 , Parque Residencial Laranjeiras - Serra/ES</p>
                        <p><strong>Telefone</strong></p>
                        <p>(27) 99256-8595</p>
                        <p>(27) 99516-6975</p>
                        <p><strong>E-mail</strong></p>
                        <p><a href="mailto:contato@giulianoovendedor.com.br">giulianoovendedor@gmail.com</a></p>
                        <p><strong>Horário de funcionamento</strong></p>
                        Segunda à sexta: 8:30 às 18:30<br />
                        Sábados: 8:30 às 14:00
                    </address>
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>

