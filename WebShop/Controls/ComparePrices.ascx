<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ComparePrices.ascx.cs" Inherits="Controls_ComparePrices" %>
<style type="text/css">
    .style1
    {
        width: 101px;
    }
</style>
<h3>Compare Prices</h3>
<table style="width: 100%;">

    <tr>
        <td class="style1">
           Book title :
        </td>
        <td>
             <asp:TextBox ID="txtBkTitle" runat="server" Width="218px"></asp:TextBox> &nbsp;
        </td>
        
    </tr>
    <tr>
        <td class="style1">
           Author :
        </td>
        <td>
            <asp:TextBox ID="txtAuthor" runat="server" Width="218px"></asp:TextBox>
        </td>
        
    </tr>
    <tr>
        <td class="style1">
           Book ISBN :
        </td>
        <td>
            <asp:TextBox ID="txtISBN" runat="server" Width="219px"></asp:TextBox>
        </td>
         
    </tr>
    <tr> 
    <td></td>
    <td>
        <asp:Button ID="btnCompare" runat="server" Text="Find the best price" 
            onclick="btnCompare_Click" /> </td></tr>
</table>
<asp:Panel ID="Panel1" runat="server">
Results from search
</asp:Panel>

