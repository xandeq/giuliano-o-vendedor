<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_marcas_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpCabecalhoAdmin" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpConteudoAdmin" Runat="Server">
    <asp:ListView ID="lvMarcas" runat="server" DataSourceID="sqldsMarcas" DataKeyNames="id" InsertItemPosition="LastItem">
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Atualizar" cssclass="btn btn-info" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" cssclass="btn btn-danger" />
                </td>
                <td>
                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="descricaoTextBox" runat="server" Text='<%# Bind("descricao") %>' CssClass="form-control" />
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
        <InsertItemTemplate>
            <tr>
                <td colspan="3"><h3>ADICIONAR MODELO</h3></td>
            </tr>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Salvar" cssclass="btn btn-success" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Limpar" cssclass="btn btn-info" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="descricaoTextBox" runat="server" Text='<%# Bind("descricao") %>' CssClass="form-control" />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Excluir" cssclass="btn btn-danger" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" cssclass="btn btn-warning" />
                </td>
                <td>
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                </td>
                <td>
                    <asp:Label ID="descricaoLabel" runat="server" Text='<%# Eval("descricao") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" class="table table-responsive table-bordered table-striped table-hover">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0"  class="table table-responsive table-bordered table-striped table-hover">
                            <tr runat="server" style="">
                                <th runat="server"></th>
                                <th runat="server">Código</th>
                                <th runat="server">Nome da Marca</th>
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
<asp:SqlDataSource ID="sqldsMarcas" runat="server" ConnectionString="<%$ ConnectionStrings:giulianoovendedorConnectionString2 %>" 
    DeleteCommand="DELETE FROM giulianoovendedor.fabricante WHERE [id] = @id" 
    InsertCommand="INSERT INTO giulianoovendedor.fabricante ([descricao]) VALUES (@descricao)" 
    SelectCommand="SELECT * FROM giulianoovendedor.fabricante ORDER BY [descricao] ASC" 
    UpdateCommand="UPDATE giulianoovendedor.fabricante SET [descricao] = @descricao WHERE [id] = @id">
    <DeleteParameters>
        <asp:Parameter Name="id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="descricao" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="descricao" Type="String" />
        <asp:Parameter Name="id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

