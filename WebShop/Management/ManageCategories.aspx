<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSecBooks.master" AutoEventWireup="true" CodeFile="ManageCategories.aspx.cs" Inherits="Management_ManageCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<strong>Add categories to the bookshop</strong>
<hr />
<br />
<asp:DetailsView ID ="dvCat" runat="server" AutoGenerateRows="False" 
        CellPadding="4" DataKeyNames="CategoryId" DataSourceID="LinqDataSourceCat" 
        ForeColor="#333333" GridLines="None" Height="147px" Width="394px" 
        AllowPaging="True" >
    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
    <Fields>
        <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" 
            InsertVisible="False" ReadOnly="True" SortExpression="CategoryId" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
            ShowInsertButton="True" />
    </Fields>
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>
    <br />
    <strong>All Categories </strong>
    <hr />
    
    <div> 
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="2" DataKeyNames="CategoryId" 
            DataSourceID="LinqDataSourceCat" ForeColor="Black" GridLines="None" 
            Width="394px" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
            BorderWidth="1px">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" 
                    InsertVisible="False" ReadOnly="True" SortExpression="CategoryId" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
        </asp:GridView>   
    </div>
<br />
    <asp:LinqDataSource ID="LinqDataSourceCat" runat="server" 
        ContextTypeName="BooksDataContext" EnableDelete="True" EnableInsert="True" 
        EnableUpdate="True" TableName="ProductCategories">
    </asp:LinqDataSource>
</asp:Content>

