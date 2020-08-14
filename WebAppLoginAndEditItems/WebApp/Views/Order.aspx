<%@ Page Title="" Language="C#" MasterPageFile="~/SiteWithNavAndFooter.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="WebApp.Views.Order" %>
<%@ Register Src="~/Messages/SuccessMessage.ascx" TagPrefix="uc1" TagName="SuccessMessage" %>  
<%@ Register Src="~/Messages/ErrorMessage.ascx" TagPrefix="uc1" TagName="ErrorMessage" %>  

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <!-- Main Content -->
    <main>
        <div class="container mb-auto">
            <div class="card" style="border: none;">
                <div class="card-body">
                    <form id="form1" runat="server">
                        <div class="form-group">
                            <p class="h4">ID</p>
                            <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control" ID="OrderId" placeholder="xxxx-001" />
                        </div>
                        <div class="form-group">
                            <p class="h4">説明</p>
                            <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" ID="OrderDescription" placeholder="説明を入力。" />
                        </div>
                        <div class="form-group">
                            <p class="h4">項目</p>
                            <asp:ListView runat="server"
                                SelectMethod="GetItems"
                                ItemType="WebApp.Models.Item" 
                            >
                                <LayoutTemplate>
                                    <div id="item-columns">
                                        <div class="item-columns-header border-top border-bottom border-light-2">
                                            <div class="row py-3">
                                                <div class="col-2 col-lg-1">
                                                    No
                                                </div>
                                                <div class="col-2 col-lg-2">
                                                    項目ID
                                                </div>
                                                <div class="col">
                                                    名称
                                                </div>
                                                <div class="col-3">
                                                    説明
                                                </div>
                                                <div class="col">
                                                    データ型
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item-columns-body mb-3">
                                            <span runat="server" id="itemPlaceholder" />
                                        </div>
                                        <div class="item-columns-footer">
                                            <div id="parent-of-addrow" class="parent-of-addrow">
                                                <a id="item-columns-addrow" class="btn btn-outline-primary btn-sm">
                                                    + Add 5 rows
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <div class="row my-1">
                                        <div class="col-2 col-lg-1">
                                            <input type="text" name="ItemNo" value="<%#: Item.No %>" class="form-control form-control-sm" />
                                        </div>
                                        <div class="col-2 col-lg-2">
                                            <input type="text" name="ItemId" value="<%#: Item.Id %>" class="form-control form-control-sm"/>
                                            <%--
                                            asp:TextBox を使うとinputタグのname属性がASP.NETで自動採番される。
                                        　　このため、Add 5 rowsボタンクリックでJavaScriptつかって追加したカラムの
                                            inputタグに設定するname属性をASP.NETのルールにしないといけないが
                                            どういったルールかわからない。
                                            このため、asp:TextBox使わずHTMLのinputタグを直接使う方がよさそう。
                                            <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control form-control-sm" Id="ItemName" placeholder="アイテム００１" />
                                            --%>
                                        </div>
                                        <div class="col">
                                            <input type="text" name="ItemName" value="<%#: Item.Name %>" class="form-control form-control-sm"/>
                                        </div>
                                        <div class="col-3">
                                            <textarea name="ItemDescription" rows="3" class="form-control form-control-sm"><%#: Item.Description %></textarea>
                                        </div>
                                        <div class="col">
                                            <select name="ItemType" class="form-control form-control-sm">
                                                <option value="NVARCHAR"  <%#: getSelected("NVARCHAR", Item.Type) %>>NVARCHAR</option>
                                                <option value="NUMBER" <%#: getSelected("NUMBER", Item.Type) %>>NUMBER</option>
                                            </select>                          
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                        <asp:Button runat="server" OnClick="AddOrUpdate" Text="登録" CssClass="btn btn-primary btn-lg" Id="AddOrUpdateButton"/>
                    </form>
                    <div class="d-none" id="html-template-001">
                        <!-- Add 5 rowsボタンで利用するHTMLテンプレート -->
                        <div class="row my-1">
                            <div class="col-2 col-lg-1">
                                <input type="text" name="ItemNo" value="" class="form-control form-control-sm" />
                            </div>
                            <div class="col-2 col-lg-2">
                                <input type="text" name="ItemId" value="" class="form-control form-control-sm"/>
                            </div>
                            <div class="col">
                                <input type="text" name="ItemName" value="" class="form-control form-control-sm"/>
                            </div>
                            <div class="col-3">
                                <textarea name="ItemDescription" rows="3" class="form-control form-control-sm"></textarea>
                            </div>
                            <div class="col">
                                <select name="ItemType" class="form-control form-control-sm">
                                    <option value="NVARCHAR">NVARCHAR</option>
                                    <option value="NUMBER">NUMBER</option>
                                </select>                          
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <script>
        // Add Rowボタンの処理
        $( "#item-columns>.item-columns-footer a" ).on( "click", function() {
            //テンプレート取得
            let template = $("#html-template-001").children().clone();

            //テンプレート加工
            let count = $(this)
                            .parent()
                                .parent()
                                    .parent()
                                        .children(".item-columns-body")
                                            .children().length;
            for (let i = 0; i < 5; i++) {
                let newIndex = count + i + 1;
                let newItem = template.clone();

                //newItem.find("[name^='xxx-rnnn-']").each(function(){
                //    $(this).attr('name',$(this).attr('name').replace('xxx-rnnn-','xxx-r'+newIndex.toString() +'-'));
                //});

                //テンプレートを一覧の下に挿入
                $(this)
                    .parent()
                        .parent()
                            .parent()
                                .children(".item-columns-body")
                                    .append(newItem);
            }
        });
    </script>
</asp:Content>
