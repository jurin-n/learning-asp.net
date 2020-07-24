<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Item.aspx.cs" Inherits="WebApp.Item" %>

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
</head>
<body>
    <div class="container">
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
            <asp:Button runat="server" OnClick="AddOrEdit" Text="登録" CssClass="btn btn-primary"/>
        </form>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
