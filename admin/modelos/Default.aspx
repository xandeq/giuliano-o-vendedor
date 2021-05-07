<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_modelos_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpCabecalhoAdmin" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpConteudoAdmin" runat="Server">
    <div class="row">
        <div class="col-md-6">
            <asp:ListView 
                ID="lvModelos" 
                runat="server" 
                DataKeyNames="id" 
                DataSourceID="sqldsModelos" 
                OnItemDataBound="lvModelos_ItemDataBound" 
                OnItemCommand="lvModelos_ItemCommand">
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Atualizar" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-danger" />
                        </td>
                        <td>
                            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="descricaoTextBox" runat="server" Text='<%# Bind("descricao") %>' CssClass="form-control" />
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-control"
                                DataSourceID="sqldsMarcas"
                                DataTextField="descricao"
                                DataValueField="id"
                                SelectedValue='<%# Bind("fabricid") %>' />
                            <asp:SqlDataSource ID="sqldsMarcas" runat="server" ConnectionString="<%$ ConnectionStrings:giulianoovendedorConnectionString2 %>" SelectCommand="SELECT id,descricao FROM giulianoovendedor.fabricante order by descricao"></asp:SqlDataSource>
                        </td>
                    </tr>
                </EditItemTemplate>
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
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Deletar" CommandArgument='<%# Eval("id") %>' Text="Excluir" CssClass="btn btn-danger" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Editar" CommandArgument='<%# Eval("id") %>' Text="Editar" CssClass="btn btn-warning" />
                        </td>
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="descricaoLabel" runat="server" Text='<%# Eval("descricao") %>' />
                        </td>
                        <td>
                            <asp:Label ID="fabricante_idLabel" runat="server" Text='<%# Eval("fabricante_id") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table table-responsive table-bordered table-striped table-hover">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table table-responsive table-bordered table-striped table-hover">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">Código</th>
                                        <th runat="server">Modelo</th>
                                        <th runat="server">Marca</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="sqldsModelos" runat="server" ConnectionString="<%$ ConnectionStrings:giulianoovendedorConnectionString2 %>"
                DeleteCommand="DELETE FROM [modelo] WHERE [id] = @id"
                SelectCommand="SELECT        giulianoovendedor.modelo.id, giulianoovendedor.modelo.descricao, giulianoovendedor.fabricante.descricao AS fabricante_id, giulianoovendedor.fabricante.id as fabricid
        FROM            giulianoovendedor.fabricante INNER JOIN
        giulianoovendedor.modelo ON giulianoovendedor.fabricante.id = giulianoovendedor.modelo.fabricante_id"
                UpdateCommand="UPDATE [modelo] SET [descricao] = @descricao, [fabricante_id] = @fabricante_id WHERE [id] = @fabricid">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="descricao" Type="String" />
                    <asp:Parameter Name="fabricante_id" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descricao" Type="String" />
                    <asp:Parameter Name="fabricante_id" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-12">
                    <h3><i class="fa fa-plus"></i> ADICIONAR MODELO
                    </h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <asp:Label ID="Label2" runat="server" AssociatedControlID="lblId" Text="Código:" />
                    <asp:Label ID="lblId" runat="server" />
                </div>
                <div class="col-md-12">
                    <asp:Label ID="idLabel" runat="server" AssociatedControlID="txtDescricao" Text="Descrição:" />
                    <asp:TextBox ID="txtDescricao" runat="server" CssClass="form-control" placeholder="Palio ou Corsa ou HB20" />
                </div>
                <div class="col-md-12">
                    <asp:Label ID="Label1" runat="server" AssociatedControlID="ddlMarca" Text="Marca:" />
                    <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-control"
                        DataSourceID="sqldsMarcas"
                        DataTextField="descricao"
                        DataValueField="id" OnDataBound="ddlMarca_DataBound" />
                    <asp:SqlDataSource ID="sqldsMarcas" runat="server" ConnectionString="<%$ ConnectionStrings:giulianoovendedorConnectionString2 %>" SelectCommand="SELECT id,descricao FROM giulianoovendedor.fabricante order by descricao"></asp:SqlDataSource>
                </div>
                <div class="col-md-12">
                    <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="btn btn-success" OnClick="btnSalvar_Click" />
                    <asp:Button ID="btnNovo" runat="server" Text="Novo" CssClass="btn btn-success" OnClick="btnNovo_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>

