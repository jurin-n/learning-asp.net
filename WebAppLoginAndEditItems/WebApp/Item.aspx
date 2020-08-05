<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Item.aspx.cs" Inherits="WebApp.Item" %>
<%@ Register Src="Messages/SuccessMessage.ascx" TagPrefix="uc1" TagName="SuccessMessage" %>  
<%@ Register Src="Messages/ErrorMessage.ascx" TagPrefix="uc1" TagName="ErrorMessage" %>  
  
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css"/>

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css"/>

    <title></title>
</head>
<body>
    <!-- Navgation Bar -->
    <nav class="navbar navbar-expand-sm navbar-light p-0 demoapp-navbar-bg-color">
        <div class="container">
            <a href="/" class="navbar-brand">
                Demo App
            </a>
            <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav">
                    <li class="nav-item px-2">
                        <a href="#" class="nav-link active">
                            あああ情報
                        </a>
                    </li>
                    <li class="nav-item px-2">
                        <a href="#" class="nav-link">
                            いいい情報
                        </a>
                    </li>
                    <li class="nav-item px-2">
                        <a href="#" class="nav-link">
                            項目情報
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a href="Logout.aspx" class="nav-link">
                            Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Header -->
    <header class="py-2">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>
                        Item 新規登録
                    </h1>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main>
        <div class="container">
            <div class="card" style="border: none;">
                <div class="card-body">
                    <form id="form1" runat="server">
                        <div class="form-group">
                            <p class="h4">Item ID</p>
                            <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control" ID="ItemId" placeholder="ID001" />
                        </div>
                        <div class="form-group">
                            <p class="h4">名前</p>
                            <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control" Id="ItemName" placeholder="アイテム００１" />
                        </div>
                        <div class="form-group">
                            <p class="h4">説明</p>
                            <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" Id="Description" rows="5" />
                        </div>
                        <asp:Button runat="server" OnClick="AddOrUpdate" Text="登録" CssClass="btn btn-primary btn-lg" Id="AddOrUpdateButton"/>
                    </form>
                </div>
            </div>
            <div class="card" style="border: none;">
                <div class="card-body">
                    <uc1:SuccessMessage ID="SuccessMessage01" runat="server"/>
                    <uc1:ErrorMessage ID="ErrorMessage01" runat="server"/>
                </div>
            </div>
        </div>

        <!-- コンテンツの量が少ない場合は、footerの下があかない程度にdivでつめる。 -->
        <div style="height:200px"></div>
    </main>

    <!-- Footer -->
    <footer class="demoapp-navbar-bg-color mt-5 p-5">
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="lead text-center">
                        footer text
                    </p>
                </div>
            </div>
        </div>
    </footer>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
