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
                        <asp:FormView ID="orderDetail" runat="server" ItemType="WebApp.Models.Order" SelectMethod ="GetOrder" RenderOuterTable="false">
                        <ItemTemplate>

                            <div class="form-group">
                                <p class="h4">ID</p>
                                <%-- <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control" ID="OrderId" placeholder="xxxx-001" />--%>
                                <input type="text" class="form-control" name="OrderId" placeholder="IDを入力してください。" value="<%#: Item.OrderId %>"/>
                            </div>
                            <div class="form-group">
                                <p class="h4">説明</p>
                                <%-- <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" ID="OrderDescription" placeholder="説明を入力。" />--%>
                                <textarea name="OrderDescription" rows="3" class="form-control"><%#: Item.OrderDescription %></textarea>
                            </div>
                            <div class="form-group">
                                <p class="h4">項目</p>
                                <nav>
                                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                        <a class="nav-item nav-link <%#: (Item.isBulk?"":"active") %>" id="add-columns-tab" data-toggle="tab" href="#nav-textarea" role="tab" aria-controls="nav-textarea" aria-selected="false">一括入力</a>
                                        <a class="nav-item nav-link <%#: (Item.isBulk?"active":"") %>" id="add-column-tab" data-toggle="tab" href="#nav-list" role="tab" aria-controls="nav-list" aria-selected="true">個別入力</a>
                                    </div>
                                </nav>
                                <div class="tab-content" id="nav-tabContent">
                                    <!-- 一括入力タブ -->
                                    <div class="tab-pane fade <%#: (Item.isBulk?"":"show active") %>" id="nav-textarea" role="tabpanel" aria-labelledby="nav-textarea-tab">
                                        <div class="my-1">
                                            <asp:Button runat="server" OnClick="AddColumns" Text="一括入力内容反映" CssClass="btn btn-secondary btn-sm" Id="AddColumnsButton"/>
                                            <span>※項目を改行区切りで入力。</span>
                                            <div class="row my-1">
                                                <div class="col-6">
                                                    <%-- <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" Id="BulkRegistration" rows="10" /> --%>
                                                    <textarea name="BulkRegistration" rows="10" class="form-control"><%#: Item.BulkRegistration %></textarea>
                                                </div>
                                                <div class="col-6">
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 個別入力タブ -->
                                    <div class="tab-pane fade <%#: (Item.isBulk?"show active":"") %>" id="nav-list" role="tabpanel" aria-labelledby="nav-list-tab">
                                        <asp:ListView runat="server"
                                            SelectMethod="GetItems"
                                            ItemType="WebApp.Models.Item"
                                            ID="ItemColumns"
                                        >
                                        <LayoutTemplate>
                                            <div id="item-columns" class="my-1">
                                                <div class="item-columns-header border-bottom border-light-2">
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
                                                    <input type="text" name="ItemId" value="<%#: Item.Id %>" class="form-control form-control-sm <%#: (Item.isValid?"":"border-danger") %>"/>
                                                    <p class="text-danger <%#: (Item.isValid?"invisible":"") %>">存在する項目IDを指定してください。</p>
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
                                </div>
                            </div>
                            <asp:Button runat="server" OnClick="AddOrUpdate" Text="登録" CssClass="btn btn-primary btn-lg" Id="AddOrUpdateButton"/>

                        </ItemTemplate>
                        </asp:FormView>
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
        $(function(){
            // Add Rowボタンの処理
            $( "#item-columns>.item-columns-footer a").on("click", function () {
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

            //一括入力内容反映ボタンクリック時の処理
            $("#AddColumnsButton").on("click", function () {
                console.log('AddColumnsButton');
            });

            //一括入力タブクリック時の処理
            $("#add-columns-tab").on("click", function () {
                console.log('AddColumnsTab');
                var textarea_value = "";
                $("#item-columns>.item-columns-body input[name='ItemId']").each(function (index) {
                    textarea_value+=($(this).val()+"\n");
                });
                console.log(textarea_value);
                $('#nav-textarea textarea').val(textarea_value);
            });

            //個別入力タブクリック時の処理
            $("#add-column-tab").on("click", function () {
                console.log('AddColumnTab');
            });
        });
    </script>
</asp:Content>
