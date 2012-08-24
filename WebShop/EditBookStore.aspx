<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSecBooks.master" AutoEventWireup="true" CodeFile="EditBookStore.aspx.cs" Inherits="EditBookStore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="LinqDataSource1" AllowSorting="True" DataKeyNames="ProductID">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowSelectButton="True" />
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" 
                SortExpression="ProductID" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="PictureURL" HeaderText="PictureURL" 
                SortExpression="PictureURL" />
            <asp:BoundField DataField="CatgryId" HeaderText="CatgryId" 
                SortExpression="CatgryId" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" 
                SortExpression="UserName" />
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="BooksDataContext" EnableDelete="True" EnableUpdate="True" 
        OrderBy="ProductID" TableName="Products">
    </asp:LinqDataSource>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
    SelectMethod="GetBooks" TypeName="Books" 
        DeleteMethod="DeleteArticle" DataObjectTypeName="Product">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="" Name="ProductID" 
            QueryStringField="ProductID" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
</asp:Content>

