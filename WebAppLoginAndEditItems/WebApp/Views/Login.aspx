<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/SiteBlank.Master" CodeBehind="Login.aspx.cs" Inherits="WebApp.Views.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
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
</asp:Content>
