<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Calculator.ascx.cs" Inherits="Controls_Calculator" %>
 
 
    <div>
    <table>
      <tr>
        <td colspan="3">
          <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label>
        </td>
      </tr>
      <tr>
        <td>
          <asp:TextBox ID="txtValueOne" runat="server"></asp:TextBox>
        </td>
        <td>
          <asp:DropDownList ID="lstOperator" runat="server">
            <asp:ListItem>+</asp:ListItem>
            <asp:ListItem>-</asp:ListItem>
            <asp:ListItem>*</asp:ListItem>
            <asp:ListItem>/</asp:ListItem>
          </asp:DropDownList>
        </td>
        <td>
          <asp:TextBox ID="txtValueTwo" runat="server"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td>
          &nbsp;
        </td>
        <td>
        </td>
        <td>
          &nbsp;
        </td>
      </tr>
    </table>       

  </div>     
   <div><asp:Button ID="btnCalculate" runat="server" OnClick="btnCalculate_Click" Text="Calculate" />
 </div>
   


 