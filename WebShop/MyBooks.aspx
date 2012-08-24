<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterSecBooks.master" AutoEventWireup="true" CodeFile="MyBooks.aspx.cs" Inherits="MyBooks" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>
 <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <strong>Edit Book </strong>
<hr />
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="532px" 
        AllowPaging="True" AutoGenerateRows="False" CellPadding="4" 
        DataKeyNames="ProductID" DataSourceID="LinqDataSource1" ForeColor="#333333" 
        GridLines="None" DefaultMode="Edit">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <Fields>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <EditItemTemplate>
           <cc1:Editor ID="EditorEdit"  Height="400px" Width="100%" runat="server" Content='<%# Bind("Description") %>' />

                  </EditItemTemplate>
                <InsertItemTemplate>
         <cc1:Editor ID="Editor1" runat="server" />                 
                 </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="PictureURL" HeaderText="PictureURL" 
                SortExpression="PictureURL" />
            <asp:TemplateField HeaderText="CatgryId" SortExpression="CatgryId">
                <EditItemTemplate>
                 <asp:DropDownList ID="DropDownCat" runat="server">
                  </asp:DropDownList>
                 </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                 </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CatgryId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UserName" HeaderText="UserName" 
                SortExpression="UserName" />
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
            <asp:BoundField DataField="Status" HeaderText="Status" 
                SortExpression="Status" />
            <asp:BoundField DataField="SKU" HeaderText="SKU" SortExpression="SKU" />
            <asp:BoundField DataField="Votes" HeaderText="Votes" SortExpression="Votes" />
            <asp:BoundField DataField="AddedDate" HeaderText="AddedDate" 
                SortExpression="AddedDate" />
            <asp:BoundField DataField="UnitsInStock" HeaderText="UnitsInStock" 
                SortExpression="UnitsInStock" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Fields>
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>

     <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="BooksDataContext" EnableDelete="True" EnableUpdate="True" 
        OrderBy="ProductID" TableName="Products" EntityTypeName="" 
        Where="UserName == @UserName">
         <WhereParameters>
             <asp:ProfileParameter Name="UserName" PropertyName="UserName" Type="String" />
         </WhereParameters>
    </asp:LinqDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:BookShopConnectionString %>" 
        DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = @original_ProductID AND [Name] = @original_Name AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND [Price] = @original_Price AND (([PictureURL] = @original_PictureURL) OR ([PictureURL] IS NULL AND @original_PictureURL IS NULL)) AND (([CatgryId] = @original_CatgryId) OR ([CatgryId] IS NULL AND @original_CatgryId IS NULL)) AND (([ISBN] = @original_ISBN) OR ([ISBN] IS NULL AND @original_ISBN IS NULL))" 
        InsertCommand="INSERT INTO [Products] ([Name], [Description], [Price], [PictureURL], [CatgryId], [ISBN]) VALUES (@Name, @Description, @Price, @PictureURL, @CatgryId, @ISBN)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [ProductID], [Name], [Description], [Price], [PictureURL], [CatgryId], [ISBN] FROM [Products] WHERE ([ProductID] = @ProductID)" 
        UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Description] = @Description, [Price] = @Price, [PictureURL] = @PictureURL, [CatgryId] = @CatgryId, [ISBN] = @ISBN WHERE [ProductID] = @original_ProductID AND [Name] = @original_Name AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND [Price] = @original_Price AND (([PictureURL] = @original_PictureURL) OR ([PictureURL] IS NULL AND @original_PictureURL IS NULL)) AND (([CatgryId] = @original_CatgryId) OR ([CatgryId] IS NULL AND @original_CatgryId IS NULL)) AND (([ISBN] = @original_ISBN) OR ([ISBN] IS NULL AND @original_ISBN IS NULL))">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="ProductID" 
                QueryStringField="ProductID" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_ProductID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Price" Type="Decimal" />
            <asp:Parameter Name="original_PictureURL" Type="String" />
            <asp:Parameter Name="original_CatgryId" Type="Int32" />
            <asp:Parameter Name="original_ISBN" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="PictureURL" Type="String" />
            <asp:Parameter Name="CatgryId" Type="Int32" />
            <asp:Parameter Name="ISBN" Type="String" />
            <asp:Parameter Name="original_ProductID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Price" Type="Decimal" />
            <asp:Parameter Name="original_PictureURL" Type="String" />
            <asp:Parameter Name="original_CatgryId" Type="Int32" />
            <asp:Parameter Name="original_ISBN" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="PictureURL" Type="String" />
            <asp:Parameter Name="CatgryId" Type="Int32" />
            <asp:Parameter Name="ISBN" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <strong>My Books on sale</strong>
    <hr />
    <asp:GridView ID="GridView1" runat="server" BackColor="White" 
        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        ForeColor="Black" GridLines="Vertical" Width="460px">
        <RowStyle BackColor="#F7F7DE" />
        <FooterStyle BackColor="#CCCC99" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    
    </asp:GridView>
    <br />
    <br />
    
    <strong> Feed Back and Books sold </strong>
    <br />
     
    <asp:GridView ID="GridView2" runat="server" BackColor="White" 
        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        ForeColor="Black" GridLines="Vertical">
        <RowStyle BackColor="#F7F7DE" />
        <FooterStyle BackColor="#CCCC99" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    </asp:Content>

