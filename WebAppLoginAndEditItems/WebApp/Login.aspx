<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css"/>

    <title></title>
    <style>
        html,body {
            height: 100%;
        }
    </style>
</head>
<body>
    <div class="container h-100">
        <div class="row h-100">
            <div class="col my-auto">
                <div class="card mx-auto" style="width: 20rem;height: 28rem;">
                    <div class="card-body" >
                        <h3 class="text-center pt-5">Login form</h3>
                        <form id="form1" runat="server" autocomplete="off">
                            <div class="form-group">
                                <label for="userId">ユーザID</label>
                                <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control" ID="UserId"/>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <asp:TextBox runat="server" TextMode="password" CssClass="form-control" ID="Password" />
                            </div>
                            <asp:Button runat="server" OnClick="LogIn" Text="ログイン" CssClass="btn btn-primary" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
