<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Giuliano | ÁREA ADMINISTRATIVA</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:600" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <script src="http://mymaplist.com/js/vendor/TweenLite.min.js"></script>
        <!-- This is a very simple parallax effect achieved by simple CSS 3 multiple backgrounds, made by http://twitter.com/msurguy -->
        <div class="row bgazul">
            <div class="container">
                <div class="col-md-12">
                    <asp:Image ImageUrl="~/img/imgtopo5.png" runat="server" CssClass="img-responsive" />
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row vertical-offset-100">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <img src="img/logopmvv.png" class="img-fluid" />
                            <div class="alert alert-info" role="alert">ACESSO AO SISTEMA</div>
                        </div>
                        <div class="panel-body">
                            <fieldset>
                                <div class="form-group">
                                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="Usuário" />
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtSenha" runat="server" CssClass="form-control" placeholder="Senha" TextMode="Password" />
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <asp:CheckBox ID="chkPersist" runat="server" Text="Lembrar" CssClass="checkbox" />
                                    </label>
                                </div>
                                <asp:Button Text="Entrar" runat="server" CssClass="btn btn-lg btn-success btn-block" ID="btnLogin" OnClick="btnLogin_Click" />
                                <asp:Label ID="errorLabel" runat="server" ForeColor="#ff3300"></asp:Label>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/scripts.js"></script>
    </form>
</body>
</html>
