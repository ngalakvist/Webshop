<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ShoppingCartBox.ascx.cs"
    Inherits="Controls_ShoppingCartBox" %>
<asp:Label ID="lblEmpty" runat="server" Text="Your cart is currently empty" Visible="false"></asp:Label>
<asp:Panel ID="Panel1" runat="server">
    <asp:Repeater ID="RepBooks" runat="server">
        <ItemTemplate>
           <strong> > </strong> <b> <small>
                <%# Eval("ProductName")%>
                <strong> - #<%#FormatPrice(Eval("Price")) %></strong>&nbsp;&nbsp (<%# Eval("Quantity") %>) </small> </b>   
            <br />
        </ItemTemplate>
    </asp:Repeater>
    <br />
    <asp:Label ID="TotalLabel" runat="server" Text=" " Font-Bold="True"></asp:Label>
    <br />
    <asp:HyperLink ID="ShoppingCartLink" runat="server" NavigateUrl="~/BookShoppingCartPage.aspx">View Shopping Cart</asp:HyperLink>
</asp:Panel>
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/OrderHistory.aspx">Order 
    History</asp:HyperLink>