<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true"
    CodeFile="OrderHistory.aspx.cs" Inherits="OrderHistory" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<h3>Order History</h3>
    <asp:Repeater ID="Repeater1" runat="server" 
        onitemcommand="Repeater1_ItemCommand">
        <ItemTemplate>
         <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' Visible="False" />
                    <br />
            Order Date:
            <%# Eval("OrderDate")%>
            <br />
            Product Name:
           <asp:HyperLink ID="feedBackLink" runat="server" Text='<%# Eval("ProductName") %>'
                         NavigateUrl='<%# Eval("ProductID","BookFeedBack.aspx?ProductID={0}") %>' 
                          />
                          <br />
            Price:
            <%# Eval("Price")%>
            <br />
            Quantity :<%# Eval("Quantity")%><br />
            
        </ItemTemplate>
        <SeparatorTemplate>
            <hr style="width: 99%;" />
        </SeparatorTemplate>
    </asp:Repeater>

    <hr />


    </asp:Content>
