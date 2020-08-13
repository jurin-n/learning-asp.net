<%@ Page Language="C#" MasterPageFile="~/SiteWithNavAndFooter.Master" AutoEventWireup="true" CodeBehind="Item.aspx.cs" Inherits="WebApp.Views.Item" %>
<%@ Register Src="~/Messages/SuccessMessage.ascx" TagPrefix="uc1" TagName="SuccessMessage" %>  
<%@ Register Src="~/Messages/ErrorMessage.ascx" TagPrefix="uc1" TagName="ErrorMessage" %>  

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <!-- Main Content -->
    <main>
        <div class="container">
            <div class="card" style="border: none;">
                <div class="card-body">
                    <form id="form1" runat="server">
                        <div class="form-group">
                            <p class="h4">アイテムID</p>
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
</asp:Content>
