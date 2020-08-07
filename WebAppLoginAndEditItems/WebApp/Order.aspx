<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="WebApp.Order" %>
<%@ Register Src="Messages/SuccessMessage.ascx" TagPrefix="uc1" TagName="SuccessMessage" %>  
<%@ Register Src="Messages/ErrorMessage.ascx" TagPrefix="uc1" TagName="ErrorMessage" %>  

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <!-- Main Content -->
    <main>
        <div class="container mb-auto">
            <div class="card" style="border: none;">
                <div class="card-body">
                    <form id="form1" runat="server">
                        <div class="form-group">
                            <p class="h4">オーダーID</p>
                            <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control" ID="OrderId" placeholder="ORDER-001" />
                        </div>
                        <div class="form-group">
                            <p class="h4">アイテム項目</p>
                            <div id="item-columns">
                                <div class="item-columns-header border-top border-bottom border-light-2">
                                    <div class="row py-3">
                                        <div class="col-2 col-lg-1">
                                            No
                                        </div>
                                        <div class="col-3 col-lg-4">
                                            アイテムID
                                        </div>
                                        <div class="col">
                                            名称
                                        </div>
                                        <div class="col">
                                            数量
                                        </div>
                                    </div>
                                </div>
                                <div class="item-columns-body mb-3">
                                    <div class="row my-1">
                                        <div class="col-2 col-lg-1">
                                            <input type="text" name="xxx-rnnn-ItemNo" value="" class="form-control form-control-sm" />
                                        </div>
                                        <div class="col-3 col-lg-4">
                                            <input type="text" name="xxx-rnnn-ItemId" value="" class="form-control form-control-sm"/>
                                        </div>
                                        <div class="col">
                                            <input type="text" name="xxx-rnnn-ItemName" value="" class="form-control form-control-sm"/>
                                        </div>
                                        <div class="col">
                                            <select name="xxx-r4-ItemType" class="form-control form-control-sm">
                                                <option value="5">5</option>
                                                <option value="10">10</option>
                                                <option value="15">15</option>
                                                <option value="20">20</option>
                                                <option value="25">25</option>
                                                <option value="30">30</option>
                                            </select> 
                                        </div>
                                    </div>
                                </div>

                                <div class="item-columns-footer">
                                    <div id="parent-of-addrow" class="parent-of-addrow">
                                        <a id="item-columns-addrow" class="btn btn-outline-primary btn-sm">
                                            + Add 5 rows
                                        </a>
                                    </div>
                                </div>

                                <div class="item-column-template d-none">
                                    <div class="row my-1">
                                        <div class="col-2 col-lg-1">
                                            <input type="text" name="xxx-rnnn-ItemNo" value="" class="form-control form-control-sm" />
                                        </div>
                                        <div class="col-3 col-lg-4">
                                            <input type="text" name="xxx-rnnn-ItemId" value="" class="form-control form-control-sm"/>
                                        </div>
                                        <div class="col">
                                            <input type="text" name="xxx-rnnn-ItemName" value="" class="form-control form-control-sm"/>
                                        </div>
                                        <div class="col">
                                            <select name="xxx-rnnn-ItemName" class="form-control form-control-sm">
                                                <option value="5">5</option>
                                                <option value="10">10</option>
                                                <option value="15">15</option>
                                                <option value="20">20</option>
                                                <option value="25">25</option>
                                                <option value="30">30</option>
                                            </select>                          
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
    <script>
        // Add Rowボタンの処理
        $( "#item-columns>.item-columns-footer a" ).on( "click", function() {
            //テンプレート取得
            let template = $(this)
                            .parent()
                                .parent()
                                    .parent()
                                        .children(".item-column-template")
                                            .children()
                                                .clone();

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

                newItem.find("[name^='xxx-rnnn-']").each(function(){
                    $(this).attr('name',$(this).attr('name').replace('xxx-rnnn-','xxx-r'+newIndex.toString() +'-'));
                });
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
