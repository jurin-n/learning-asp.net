<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetailsList.aspx.cs" Inherits="WingtipToys.ProductDetailList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table border="1">
        <tr>
            <th>01</th>
            <th>02</th>
            <th>03</th>
            <th>04</th>
            <th>05</th>
            <th>06</th>
        </tr>
        <asp:ListView ID="productDetailsList" runat="server" 
            ItemType="WingtipToys.Models.ProductDetails" SelectMethod="GetProductDetailsList">
            <ItemTemplate>
                <tr>
                    <td>
                        <%#:Item.ProductID%>
                    </td>
                    <td>
                        <%#:Item.ProductName%>
                    </td>
                    <td>
                        <%#:Item.ProductDescription%>
                    </td>
                    <td>
                        <%#:Item.CategoryID%>
                    </td>
                    <td>
                        <%#:Item.CategoryName%>
                    </td>
                    <td>
                        <%#:Item.CategoryDescription%>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
        </table>
</asp:Content>
