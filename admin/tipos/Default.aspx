<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_tipos_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpCabecalhoAdmin" runat="Server">
    <style type="text/css">
        .pagenavi a, .pagenavi span {
            min-width: 24px;
            min-height: 20px;
            line-height: 100%;
            text-decoration: none;
            text-align: center;
            margin: 0 3px;
            padding: 4px 0 0;
            vertical-align: middle;
            display: inline-block;
            zoom: 1;
            *display: inline;
            -webkit-border-radius: 10em;
            -moz-border-radius: 10em;
            border-radius: 10em
        }

        .pagenavi a {
            background: #666;
            color: #fff;
            text-decoration: none
        }

            .pagenavi a:hover {
                background-color: #333;
                text-decoration: none;
            }

        .pagenavi .current {
            color: #666;
            text-decoration: none
        }

        .post-nav {
            margin: 0 0 30px;
            padding: 15px 0;
            clear: both;
            font-size: 14px;
        }

        .pagenavi {
            padding: 0;
            text-align: right;
            margin: 0;
            float: right;
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpConteudoAdmin" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3><i class="fa fa-plus"></i>TIPOS
                </h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:ListView ID="lvTipos" runat="server" DataSourceID="sqldsTipos" DataKeyNames="id" InsertItemPosition="LastItem" class="table table-striped table hover">
                    <EditItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Atualizar" CssClass="btn btn-warning" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-danger" />
                            </td>
                            <td>
                                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="descricaoTextBox" runat="server" Text='<%# Bind("descricao") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>Nenhum registro.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Salvar" CssClass="btn btn-success" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Limpar" CssClass="btn btn-info" />
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                <asp:TextBox ID="descricaoTextBox" runat="server" Text='<%# Bind("descricao") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Deletar" CssClass="btn btn-danger" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" CssClass="btn btn-warning" />
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
                        <table runat="server" class="table table-striped table hover">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="0" class="table table-striped table hover">
                                        <tr runat="server" style="">
                                            <th runat="server"></th>
                                            <th runat="server">id</th>
                                            <th runat="server">descricao</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="">
                                    <div class="pagenavi">
                                        <asp:DataPager ID="DataPagerList" runat="server" PageSize="50">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="false"
                                                    FirstPageText="&#171;" ShowNextPageButton="false" ShowFirstPageButton="true" ShowPreviousPageButton="False" />
                                                <asp:NumericPagerField ButtonType="Link" ButtonCount="5" />
                                                <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" LastPageText="&#187;" ShowNextPageButton="false" ShowFirstPageButton="false" ShowPreviousPageButton="False" />
                                            </Fields>
                                        </asp:DataPager>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="sqldsTipos" runat="server" ConnectionString="<%$ ConnectionStrings:giulianoovendedorConnectionString2 %>"
                    DeleteCommand="DELETE FROM [giulianoovendedor].[giulianoovendedor].[tipos] WHERE [id] = @id"
                    SelectCommand="SELECT [id], [descricao] FROM [giulianoovendedor].[giulianoovendedor].[tipos] ORDER BY [descricao]"
                    UpdateCommand="UPDATE [giulianoovendedor].[giulianoovendedor].[tipos] SET [descricao] = @descricao WHERE [id] = @id"
                    InsertCommand="INSERT INTO [giulianoovendedor].[giulianoovendedor].[tipos] ([descricao]) VALUES (@descricao)">
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
            </div>
        </div>
    </div>
</asp:Content>

