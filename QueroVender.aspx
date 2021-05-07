<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QueroVender.aspx.cs" Inherits="QueroVender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpCabecalho" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpConteudo" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>DADOS </legend>
                <div class="row">
                    <div class="col">
                        <asp:Label Text="Digite os dados do seu veiculo" runat="server" />
                        <asp:TextBox ID="txtDadosVeiculo" CssClass="form-control" runat="server" placeholder="Carro, modelo e ano" />
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Label Text="NOME" runat="server" />
                        <asp:TextBox ID="txtNome" CssClass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Obrigatório" ControlToValidate="txtNome">Obrigatório</asp:RequiredFieldValidator>
                    </div>
                    <div class="col">
                        <asp:Label Text="E-MAIL" runat="server" />
                        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Obrigatório" ControlToValidate="txtEmail">Obrigatório</asp:RequiredFieldValidator>
                    </div>
                    <div class="col">
                        <asp:Label Text="Telefone" runat="server" />
                        <asp:TextBox ID="txtTelefone" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Label Text="Informações Adicionais" runat="server" />
                        <asp:TextBox ID="txtInfo" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="4" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-4">
                        <asp:LinkButton ID="btnEnviar" runat="server" OnClick="btnEnviar_Click" CssClass="btn btn-success">
                            <i class="fa fa-send"></i> Enviar 
                        </asp:LinkButton>
                    </div>
                    <div class="col-md-4">
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpRodape" runat="Server">
</asp:Content>

