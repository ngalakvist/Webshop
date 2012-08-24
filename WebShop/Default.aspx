<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ MasterType VirtualPath="~/MasterPage/MasterPage.master" %>
<%@ Register Src="Controls/BooksShoppingCart.ascx" TagName="BooksShoppingCart" TagPrefix="uc1" %>
 <%@ Register src="Controls/BookSlideShowl.ascx" tagname="BookSlideShowl" tagprefix="uc2" %>
 <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <style type="text/css">
        .productlist li
        {
            display: inline;
            float: left;
            margin-left: 15px;
            margin-bottom: 15px;
            border-bottom-style: solid;
            border-color: Gray;
        }
        .datapager
        {
            display: block;
            text-align: center;
            clear: both;
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
<div style="text-align:center">
     <%--   <uc2:BookSlideShowl ID="BookSlideShowl1" runat="server" />--%>
         </div>
        
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
        
            <asp:ListView ID="ListView1" runat="server" DataSourceID="LinqDataSource1" 
                onitemcommand="ListView1_ItemCommand1" 
                onitemdatabound="ListView1_ItemDataBound">
                <ItemTemplate>
                    <li>
                        <asp:Label ID="ProductIDLabel" Visible="false" runat="server" Text='<%# Eval("ProductID") %>'
                            Font-Bold="True" Font-Size="Medium" />
                        <br />
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' Font-Size="Medium"
                            Font-Bold="True" />
                        <br />
                        <asp:Label ID="PriceLabel" runat="server" Text='<%#FormatPrice(Eval("Price")) %>' Font-Bold="True"
                            Font-Size="Medium" />
                        <br />
                        <asp:ImageButton ID="ImageButton1" AlternateText="No Image available" runat="server"
                            ImageUrl='<%# Eval("PictureURL","~/ProductImages/{0}")%>' PostBackUrl='<%# Eval("ProductID","BookShopItem.aspx?ProductID={0}") %>'
                            Height="120" Width="100" />
                        <br />
                        ISBN:
                        <asp:Label ID="ISBNLabel" runat="server" Text='<%# Eval("ISBN") %>' />
                        <br />
                        <asp:LinkButton ID="ImageButton2" Text="See details" runat="server" PostBackUrl='<%# Eval("ProductID","BookShopItem.aspx?ProductID={0}") %>' />
                        <br />
                        
                        <asp:Button ID="searchBut" runat="server" Text="Compare price"  CommandName="search"
                            CommandArgument='<%# Container.DataItemIndex %>' />
                        <br />
                    </li>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <h4>
                        No data was returned.
                    </h4>
                </EmptyDataTemplate>
                <LayoutTemplate>
                    <ul class="productlist">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </ul>
                </LayoutTemplate>
            </asp:ListView>
            
            <div class="datapager">
                <asp:DataPager ID="DataPager1" PageSize="6" PagedControlID="ListView1" runat="server">
                    <Fields>
                        <asp:NumericPagerField />
                    </Fields>
                </asp:DataPager>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="BooksDataContext"
        Select="new (ProductID, Name, Description, Price, PictureURL, ISBN, CatgryId)"
        TableName="Products" Where="CatgryId == @CatgryId" OrderBy="ProductID desc">
        <WhereParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="CatgryId" QueryStringField="CatgryId"
                Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>
