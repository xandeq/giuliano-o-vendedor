<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Financiamento.aspx.cs" Inherits="Financiamento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpCabecalho" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpConteudo" runat="Server">
    <asp:ValidationSummary
        ID="ValidationSummary1"
        runat="server"
        HeaderText="Ocorreram os seguintes erros..."
        ShowMessageBox="false"
        DisplayMode="BulletList"
        ShowSummary="true"
        BackColor="#FF7D7D"
        Width="450"
        ForeColor="White"
        Font-Size="X-Large"
        Font-Italic="true" />
    <br />
    <br />
    <div class="row">
        <div class="col-md-12">
            <div class="jumbotron">
                <h1>FINANCIAMENTO</h1>
                <p>Preencha o formulário abaixo para aprovar seu financiamento.</p>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>VEÍCULO DE INTERESSE</legend>
                <div class="row">
                    <div class="col">
                        <asp:Label Text="VEÍCULO DE INTERESSE" runat="server" />
                        <asp:TextBox ID="txtVeiculoInteresse" CssClass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Preenchimento do veículo Obrigatório" ControlToValidate="txtVeiculoInteresse">Preenchimento Obrigatório</asp:RequiredFieldValidator>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>DADOS PESSOAIS</legend>
                <div class="row">
                    <div class="col">
                        <asp:Label Text="NOME COMPLETO" runat="server" />
                        <asp:TextBox ID="txtDPENomeCompleto" CssClass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Preenchimento do Nome Obrigatório" ControlToValidate="txtDPENomeCompleto">Preenchimento Obrigatório</asp:RequiredFieldValidator>
                    </div>
                    <div class="col">
                        <asp:Label Text="CPF" runat="server" />
                        <asp:TextBox ID="txtDPECPF" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Label Text="IDENTIDADE (NUMERO, ORGAO EMISSOR, DATA DE EMISSAO)" runat="server" />
                        <asp:TextBox ID="txtDPEIdentidade" CssClass="form-control" runat="server" />
                    </div>
                    <div class="col">
                        <asp:Label Text="DATA DE NASCIMENTO" runat="server" />
                        <asp:TextBox ID="txtDPEDataNascimento" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Label Text="NOME DA MAE" runat="server" />
                        <asp:TextBox ID="txtDPENomeMae" CssClass="form-control" runat="server" />
                    </div>
                    <div class="col">
                        <asp:Label Text="NOME DO PAI" runat="server" />
                        <asp:TextBox ID="txtDPENomePai" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Label Text="NATURALIDADE" runat="server" />
                        <asp:TextBox ID="txtDPENATURALIDADE" CssClass="form-control" runat="server" />
                    </div>
                    <div class="col">
                        <asp:Label Text="ESTADO CIVIL" runat="server" />
                        <asp:TextBox ID="txtDPEEstadoCivil" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Label Text="E-MAIL" runat="server" />
                        <asp:TextBox ID="txtDPEEmail" CssClass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Preenchimento do e-mail obrigatório" ControlToValidate="txtDPEEmail">Preenchimento Obrigatório</asp:RequiredFieldValidator>
                    </div>
                    <div class="col">
                        <asp:Label Text="TELEFONE 01" runat="server" />
                        <asp:TextBox ID="txtDPETelefone1" CssClass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Preenchimento do telefone Obrigatório" ControlToValidate="txtDPETelefone1">Preenchimento Obrigatório</asp:RequiredFieldValidator>
                    </div>
                    <div class="col">
                        <asp:Label Text="TELEFONE 02" runat="server" />
                        <asp:TextBox ID="txtDPETelefone2" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Label Text="ENDEREÇO COMPLETO COM CEP" runat="server" />
                        <asp:TextBox ID="txtDPEEndereço" CssClass="form-control" runat="server" />
                    </div>
                    <div class="col">
                        <asp:Label Text="TEMPO DE RESIDENCIA" runat="server" />
                        <asp:TextBox ID="txtDPETempoResidencia" CssClass="form-control" runat="server" />
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>DADOS PROFISSIONAIS</legend>
                <div class="row">
                    <div class="col">
                        <asp:Label Text="EMPRESA ONDE TRABALHA" runat="server" />
                        <asp:TextBox ID="txtDPREmpresa" CssClass="form-control" runat="server" />
                    </div>
                    <div class="col">
                        <asp:Label Text="ENDEREÇO DA EMPRESA COMPLETO COM CEP" runat="server" />
                        <asp:TextBox ID="txtDPREnderecoEmpresa" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Label Text="TELEFONE DA EMPRESA" runat="server" />
                        <asp:TextBox ID="txtDPRTelefoneEmpresa" CssClass="form-control" runat="server" />
                    </div>
                    <div class="col">
                        <asp:Label Text="CARGO(FUNÇÃO)" runat="server" />
                        <asp:TextBox ID="txtDPRCargo" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Label Text="RENDA BRUTA" runat="server" />
                        <asp:TextBox ID="txtDPRRendaBruta" CssClass="form-control" runat="server" />
                    </div>
                    <div class="col">
                        <asp:Label Text="TEMPO DE EMPREGO" runat="server" />
                        <asp:TextBox ID="txtDPRTempoEmprego" CssClass="form-control" runat="server" />
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>REFERÊNCIA BANCÁRIA</legend>
                <div class="row">
                    <div class="col">
                        <asp:Label Text="NOME DO BANCO" runat="server" />
                        <asp:TextBox ID="txtRBBanco" CssClass="form-control" runat="server" />
                    </div>
                    <div class="col">
                        <asp:Label Text="AGÊNCIA" runat="server" />
                        <asp:TextBox ID="txtRBAgencia" CssClass="form-control" runat="server" />
                    </div>
                    <div class="col">
                        <asp:Label Text="CONTA" runat="server" />
                        <asp:TextBox ID="txtRBConta" CssClass="form-control" runat="server" />
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
            <asp:LinkButton ID="btnEnviar" runat="server" OnClick="btnEnviar_Click" CssClass="btn btn-success">
                <i class="fa fa-send"></i> Enviar Solicitação
            </asp:LinkButton>
        </div>
        <div class="col-md-4">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpRodape" runat="Server">
</asp:Content>

