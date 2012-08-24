<%@ Page Language="C#" AutoEventWireup="true" codefile="UpdateProducts.aspx.cs" Inherits="UpdateProducts" %>
<%@ Register TagPrefix="wu" TagName="PictureUpload" Src="~/Controls/PictureUpload.ascx" %>

 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
    <asp:linkbutton id="btnNewItem" runat="server" commandname="New" onclick="btnNewItem_Click">Add New Item</asp:linkbutton>
    <br /><br />
    
    <div style="float:left; margin-right: 10px;">
    <asp:sqldatasource id="SqlDataSource1" runat="server"
        deletecommand="DELETE FROM [Products] WHERE [ProductID] = @ProductID"
        insertcommand="INSERT INTO [Products] ([Name], [Description], [Price], [PictureURL]) VALUES (@Name, @Description, @Price, @PictureURL)"
        selectcommand="SELECT [ProductID], [Name], [Description], [Price], [PictureURL] FROM [Products]"
        updatecommand="UPDATE [Products] SET [Name] = @Name, [Description] = @Description, [Price] = @Price, [PictureURL] = @PictureURL WHERE [ProductID] = @ProductID"
        connectionstring="<%$ ConnectionStrings:BookShopConnectionString%>">
        <DeleteParameters>
            <asp:Parameter Type="Int32" Name="ProductID"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Type="String" Name="Name"></asp:Parameter>
            <asp:Parameter Type="String" Name="Description"></asp:Parameter>
            <asp:Parameter Type="Decimal" Name="Price"></asp:Parameter>
            <asp:Parameter Type="String" Name="PictureURL"></asp:Parameter>
            <asp:Parameter Type="Int32" Name="ProductID"></asp:Parameter>
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Type="String" Name="Name"></asp:Parameter>
            <asp:Parameter Type="String" Name="Description"></asp:Parameter>
            <asp:Parameter Type="Decimal" Name="Price"></asp:Parameter>
            <asp:Parameter Type="String" Name="PictureURL"></asp:Parameter>
        </InsertParameters>
    </asp:sqldatasource>
    <asp:datalist id="DataList1" runat="server" datakeyfield="ProductID" datasourceid="SqlDataSource1"
        repeatcolumns="4"  CellPadding="20">
        <ItemTemplate>
            <asp:Image ImageUrl='<%# Eval("PictureURL", "~/ProductImages/thumb_{0}") %>' runat="server" id="PictureURLImage" style="float:left; "/>
            <asp:Label Text='<%# Eval("Name") %>' runat="server" id="NameLabel" style="font-weight:bold"/><br />
            <asp:Label Text='<%# Eval("Price", "{0:c}") %>' runat="server" id="PriceLabel"/><br />
            <asp:LinkButton id="LinkButton1" runat="server" CommandName="Select">Select</asp:LinkButton>
        </ItemTemplate>
        <SelectedItemStyle BorderColor="#ff9900" BorderStyle="dashed" BorderWidth="1px" />
        <ItemStyle VerticalAlign="top" HorizontalAlign="left" />
    </asp:datalist>
    
    <asp:sqldatasource id="SqlDataSource2" runat="server"
        selectcommand="SELECT [ProductID], [Name], [Description], [Price], [PictureURL] FROM [Products] WHERE ([ProductID] = @ProductID)"
        DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = @ProductID"
        InsertCommand="INSERT INTO [Products] ([Name], [Description], [Price], [PictureURL]) VALUES (@Name, @Description, @Price, @PictureURL)"
        UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Description] = @Description, [Price] = @Price, [PictureURL] = @PictureURL WHERE [ProductID] = @ProductID"
        connectionstring="<%$ ConnectionStrings:BookShopConnectionString %>"
        OnInserted="SqlDataSource2_Inserted" OnUpdated="SqlDataSource2_Updated" OnDeleted="SqlDataSource2_Deleted">
            <DeleteParameters>
                <asp:Parameter Type="Int32" Name="ProductID"></asp:Parameter>
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Type="String" Name="Name"></asp:Parameter>
                <asp:Parameter Type="String" Name="Description"></asp:Parameter>
                <asp:Parameter Type="Decimal" Name="Price"></asp:Parameter>
                <asp:Parameter Type="String" Name="PictureURL"></asp:Parameter>
                <asp:Parameter Type="Int32" Name="ProductID"></asp:Parameter>
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter Name="ProductID" Type="Int32" ControlID="DataList1" PropertyName="SelectedValue"></asp:ControlParameter>
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Type="String" Name="Name"></asp:Parameter>
                <asp:Parameter Type="String" Name="Description"></asp:Parameter>
                <asp:Parameter Type="Decimal" Name="Price"></asp:Parameter>
                <asp:Parameter Type="String" Name="PictureURL"></asp:Parameter>
            </InsertParameters>
    </asp:sqldatasource>
    <asp:detailsview id="DetailsView1" runat="server" datasourceid="SqlDataSource2" BorderWidth="0"
        autogeneraterows="False" datakeynames="ProductID"
        AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" AutoGenerateInsertButton="True">
        <FooterTemplate>
            <asp:ValidationSummary id="ValidationSummary1" runat="server"></asp:ValidationSummary> 
        </FooterTemplate>
        <Fields>
            <asp:BoundField HeaderText="ProductID" DataField="ProductID" SortExpression="ProductID" visible="False"></asp:BoundField>
            <asp:BoundField HeaderText="Name" DataField="Name" SortExpression="Name"></asp:BoundField>
            <asp:BoundField HeaderText="Price" DataField="Price" SortExpression="Price" DataFormatString="{0:c}"></asp:BoundField>
            <asp:TemplateField SortExpression="Description" HeaderText="Description"><EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("Description") %>' id="TextBox2" Columns="50" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server"
                        errormessage="You must enter a description" controltovalidate="TextBox2">*</asp:requiredfieldvalidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Description") %>' id="Label2"></asp:Label>
                </ItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("Description") %>' id="TextBox2" Columns="50" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server"
                        errormessage="You must enter a description" controltovalidate="TextBox2">*</asp:requiredfieldvalidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField SortExpression="PictureURL" HeaderText="PictureURL"><EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("PictureURL") %>' id="txtPictureURL"></asp:TextBox><br />
                    <wu:PictureUpload id="PictureUpload1" runat="server" UploadImageType="Product"
                        OnFileUploaded="FileUploaded"></wu:PictureUpload>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("PictureURL") %>' id="Label1"></asp:Label>
                </ItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("PictureURL") %>' id="txtPictureURL"></asp:TextBox><br />
                    <wu:PictureUpload id="PictureUpload2" runat="server" UploadImageType="Product"
                        OnFileUploaded="FileUploaded"></wu:PictureUpload>
                </InsertItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:detailsview>
    </div>
 
    </form>
</body>
</html>