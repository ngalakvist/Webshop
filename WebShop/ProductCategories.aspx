<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="ProductCategories.aspx.cs" Inherits="ProductCategories" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="ProductID" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" AllowSorting="True">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:TemplateField HeaderText="PictureURL" SortExpression="PictureURL">
                <ItemTemplate>
  <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("PictureURL",@"ProductImages\thumb_{0}")%>' PostBackUrl='<%# Eval("ProductID","BookShopItem.aspx?ProductID={0}") %>'/><br />

                 </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PictureURL") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BookShopConnectionString %>" 
        
    SelectCommand="SELECT [ProductID], [Name], [Price], [PictureURL], [ISBN] FROM [Products] WHERE ([CatgryId] = @CatgryId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CatgryId" 
                QueryStringField="CatgryId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

