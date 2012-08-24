<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/MasterPage.master"
    CodeFile="BookShoppingCartPage.aspx.cs" Inherits="BookShoppingCartPage" %>

<%@ Register Src="Controls/BooksShoppingCart.ascx" TagName="BooksShoppingCart" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:PlaceHolder ID="plcShoppingCart" runat="server">
        <fieldset>
            <legend>Your Shopping Cart</legend>
            <br />
            Below you see the items you have added to your shopping cart. Click Edit after an
            item to change the number of items you want to order. Click Delete if you want to
            remove the item completely.<br />
            <br />
            <uc1:BooksShoppingCart ID="BooksShoppingCart1" runat="server" />
            <br />
            <asp:Button ID="btnContinue" runat="Server" Text="Continue Shopping" OnClick="btnContinue_Click" />
            &nbsp &nbsp
            <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Check Out" OnClick="btnCheckout_Click" />
        </fieldset>
    </asp:PlaceHolder>
</asp:Content>
