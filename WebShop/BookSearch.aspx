<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="BookSearch.aspx.cs" Inherits="BookSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:DataList ID="DataList1" runat="server" 
    DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
        Height="45px" Width="460px">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingItemStyle BackColor="White" />
            <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PictureURL",@"ProductImages\thumb_{0}") %>' />
                <br />
                <asp:Label ID="PictureURLLabel" runat="server" Text='<%# Eval("PictureURL") %>' Visible="False"></asp:Label>
                &nbsp;<br />
                <div style="background-color: #C0C0C0; width: 460px; height: 5px;" ></div>
                <strong> Name:&nbsp;</strong><asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>'></asp:Label><br />
                                <div style="background-color: #C0C0C0; width: 460px; height: 5px;" ></div>

               <strong>Description:&nbsp;</strong> <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>'></asp:Label><br />
                               <div style="background-color: #C0C0C0; width: 460px; height: 5px;" ></div>

             <strong>  Price:&nbsp;</strong>  <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price","{0:##0.00}") %>'></asp:Label><br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:Button ID="btnAddToCart1" runat="server"  Text="Add to Cart" OnClick="btnAddToCart1_Click"
             />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Return To Shop</asp:HyperLink>
       
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BookShopConnectionString %>" 
        SelectCommand="SELECT[ProductID], [Name], [Description], [Price], [PictureURL], [ISBN] FROM [Products] WHERE ([ProductID] = @ProductID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductID" QueryStringField="ProductID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

