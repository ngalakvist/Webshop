<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true"
    CodeFile="NewShop.aspx.cs" Inherits="NewShop" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Src="Controls/PictureUpload.ascx" TagName="PictureUpload" TagPrefix="uc1" %>
<%@ Register Src="Controls/Calculator.ascx" TagName="Calculator" TagPrefix="uc2" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager> 
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="391px" AutoGenerateRows="False"
        CellPadding="4" DataKeyNames="ProductID" DataSourceID="LinqDataSource1" DefaultMode="Insert"
        ForeColor="#333333" GridLines="None" 
        oniteminserted="DetailsView1_ItemInserted">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <Fields>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False"
                ReadOnly="True" SortExpression="ProductID" />
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldName" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="Enter Book Name"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <InsertItemTemplate>
                    <cc1:Editor ID="Editor1" runat="server" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price" SortExpression="Price">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtUnitPrice" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox><asp:CompareValidator
                        ID="valUnitPriceType" runat="server" Operator="DataTypeCheck" Type="Currency"
                        ControlToValidate="txtUnitPrice" Text="The Unit Price must be a double." ToolTip="The Unit Price must be a double."
                        Display="dynamic" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Price") %>'></asp:Label></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CatgryId" SortExpression="CatgryId">   
                    <ItemTemplate>
                    <asp:Label ID="LabelCategory" runat="server" Text='<%# Bind("CatgryId") %>'></asp:Label>
                </ItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CategoryId" 
                        SelectedValue='<%# Bind("CatgryId") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BookShopConnectionString %>" 
                        SelectCommand="SELECT [CategoryId], [Name] FROM [ProductCategory]"></asp:SqlDataSource>
                </InsertItemTemplate>
                
            </asp:TemplateField>
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName"
                Visible="False" />
            <asp:TemplateField HeaderText="ISBN" SortExpression="ISBN">
                <InsertItemTemplate>
                    <asp:TextBox ID="TxtISBN" runat="server" Text='<%# Bind("ISBN") %>'></asp:TextBox><%--                    <asp:RegularExpressionValidator ID="RegularExpressionISBN" runat="server" ErrorMessage="Enter right Number "
                        ControlToValidate="TxtISBN" ValidationExpression="\x20(?=.{13}$)\d{1,5}([- ])\d{1,7}\1\d{1,6}\1(\d|X)$">
                    
                    </asp:RegularExpressionValidator>
--%></InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("ISBN") %>'></asp:Label></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" Visible="False" />
            <asp:TemplateField HeaderText="SKU" SortExpression="SKU">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("SKU") %>'></asp:TextBox><asp:RequiredFieldValidator
                        ID="valRequireSKU" runat="server" ControlToValidate="TextBox5" SetFocusOnError="true"
                        Text="The SKU field is required." ToolTip="The SKU field is required." Display="Dynamic"></asp:RequiredFieldValidator></InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("SKU") %>'></asp:Label></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Votes" HeaderText="Votes" SortExpression="Votes" Visible="False" />
            <asp:TemplateField HeaderText="PictureURL" SortExpression="PictureURL">
                <InsertItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("PictureURL") %>' ID="txtPictureURL"></asp:TextBox><br />
                    <uc1:PictureUpload ID="PictureUpload2" runat="server" UploadImageType="Product" OnFileUploaded="FileUploaded" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("PictureURL") %>'></asp:Label></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="AddedDate" HeaderText="AddedDate" SortExpression="AddedDate"
                Visible="False" />
            <asp:BoundField DataField="UnitsInStock" HeaderText="UnitsInStock" SortExpression="UnitsInStock"
                Visible="False" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="BooksDataContext"
        EnableInsert="True" TableName="Products" OnInserting="LinqDataSource1_Inserting1">
    </asp:LinqDataSource>
   
    <br />
    <hr />
    <h3>
        Calculator</h3>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <uc2:Calculator ID="Calculator1" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    &nbsp;
</asp:Content>
