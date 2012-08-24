<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SeeOrders.aspx.cs" Inherits="Management_SeeOrders" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Orders</title>
</head>
<body>
    <form id="form1" runat="server">
     <h1> Order Details </h1>
    <div> 
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="OrderID" DataSourceID="SqlDataSource2" ForeColor="#333333" 
            GridLines="None">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowSelectButton="True" />
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="OrderID" />
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" 
                    SortExpression="OrderDate" />
                <asp:BoundField DataField="OrderSentDate" HeaderText="OrderSentDate" 
                    SortExpression="OrderSentDate" />
                <asp:BoundField DataField="MemberName" HeaderText="MemberName" 
                    SortExpression="MemberName" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Address" HeaderText="Address" 
                    SortExpression="Address" />
                <asp:BoundField DataField="County" HeaderText="County" 
                    SortExpression="County" />
                <asp:BoundField DataField="PostCode" HeaderText="PostCode" 
                    SortExpression="PostCode" />
                <asp:BoundField DataField="Country" HeaderText="Country" 
                    SortExpression="Country" />
                <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" 
                    SortExpression="SubTotal" />
                <asp:BoundField DataField="Discount" HeaderText="Discount" 
                    SortExpression="Discount" />
                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
            </Columns>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:BookShopConnectionString %>" 
            DeleteCommand="DELETE FROM [Orders] WHERE [OrderID] = @original_OrderID AND [OrderDate] = @original_OrderDate AND [OrderSentDate] = @original_OrderSentDate AND [MemberName] = @original_MemberName AND [Name] = @original_Name AND [Address] = @original_Address AND [County] = @original_County AND [PostCode] = @original_PostCode AND [Country] = @original_Country AND [SubTotal] = @original_SubTotal AND [Discount] = @original_Discount AND [Total] = @original_Total" 
            InsertCommand="INSERT INTO [Orders] ([OrderDate], [OrderSentDate], [MemberName], [Name], [Address], [County], [PostCode], [Country], [SubTotal], [Discount], [Total]) VALUES (@OrderDate, @OrderSentDate, @MemberName, @Name, @Address, @County, @PostCode, @Country, @SubTotal, @Discount, @Total)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Orders]" 
            UpdateCommand="UPDATE [Orders] SET [OrderDate] = @OrderDate, [OrderSentDate] = @OrderSentDate, [MemberName] = @MemberName, [Name] = @Name, [Address] = @Address, [County] = @County, [PostCode] = @PostCode, [Country] = @Country, [SubTotal] = @SubTotal, [Discount] = @Discount, [Total] = @Total WHERE [OrderID] = @original_OrderID AND [OrderDate] = @original_OrderDate AND [OrderSentDate] = @original_OrderSentDate AND [MemberName] = @original_MemberName AND [Name] = @original_Name AND [Address] = @original_Address AND [County] = @original_County AND [PostCode] = @original_PostCode AND [Country] = @original_Country AND [SubTotal] = @original_SubTotal AND [Discount] = @original_Discount AND [Total] = @original_Total">
            <DeleteParameters>
                <asp:Parameter Name="original_OrderID" Type="Int32" />
                <asp:Parameter Name="original_OrderDate" Type="DateTime" />
                <asp:Parameter Name="original_OrderSentDate" Type="DateTime" />
                <asp:Parameter Name="original_MemberName" Type="String" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_County" Type="String" />
                <asp:Parameter Name="original_PostCode" Type="String" />
                <asp:Parameter Name="original_Country" Type="String" />
                <asp:Parameter Name="original_SubTotal" Type="Decimal" />
                <asp:Parameter Name="original_Discount" Type="Decimal" />
                <asp:Parameter Name="original_Total" Type="Decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="OrderDate" Type="DateTime" />
                <asp:Parameter Name="OrderSentDate" Type="DateTime" />
                <asp:Parameter Name="MemberName" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="County" Type="String" />
                <asp:Parameter Name="PostCode" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="SubTotal" Type="Decimal" />
                <asp:Parameter Name="Discount" Type="Decimal" />
                <asp:Parameter Name="Total" Type="Decimal" />
                <asp:Parameter Name="original_OrderID" Type="Int32" />
                <asp:Parameter Name="original_OrderDate" Type="DateTime" />
                <asp:Parameter Name="original_OrderSentDate" Type="DateTime" />
                <asp:Parameter Name="original_MemberName" Type="String" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_County" Type="String" />
                <asp:Parameter Name="original_PostCode" Type="String" />
                <asp:Parameter Name="original_Country" Type="String" />
                <asp:Parameter Name="original_SubTotal" Type="Decimal" />
                <asp:Parameter Name="original_Discount" Type="Decimal" />
                <asp:Parameter Name="original_Total" Type="Decimal" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="OrderDate" Type="DateTime" />
                <asp:Parameter Name="OrderSentDate" Type="DateTime" />
                <asp:Parameter Name="MemberName" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="County" Type="String" />
                <asp:Parameter Name="PostCode" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="SubTotal" Type="Decimal" />
                <asp:Parameter Name="Discount" Type="Decimal" />
                <asp:Parameter Name="Total" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
       <h1> Order Lines</h1> </div>
    
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="OrderLineID" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowSelectButton="True" />
                <asp:BoundField DataField="OrderLineID" HeaderText="OrderLineID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="OrderLineID" />
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" 
                    SortExpression="OrderID" />
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" 
                    SortExpression="ProductID" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                    SortExpression="Quantity" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            </Columns>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:BookShopConnectionString %>" 
            DeleteCommand="DELETE FROM [OrderLines] WHERE [OrderLineID] = @original_OrderLineID AND [OrderID] = @original_OrderID AND [ProductID] = @original_ProductID AND [Quantity] = @original_Quantity AND [Price] = @original_Price" 
            InsertCommand="INSERT INTO [OrderLines] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (@OrderID, @ProductID, @Quantity, @Price)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [OrderLines]" 
            UpdateCommand="UPDATE [OrderLines] SET [OrderID] = @OrderID, [ProductID] = @ProductID, [Quantity] = @Quantity, [Price] = @Price WHERE [OrderLineID] = @original_OrderLineID AND [OrderID] = @original_OrderID AND [ProductID] = @original_ProductID AND [Quantity] = @original_Quantity AND [Price] = @original_Price">
            <DeleteParameters>
                <asp:Parameter Name="original_OrderLineID" Type="Int32" />
                <asp:Parameter Name="original_OrderID" Type="Int32" />
                <asp:Parameter Name="original_ProductID" Type="Int32" />
                <asp:Parameter Name="original_Quantity" Type="Int16" />
                <asp:Parameter Name="original_Price" Type="Decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
                <asp:Parameter Name="ProductID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int16" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="original_OrderLineID" Type="Int32" />
                <asp:Parameter Name="original_OrderID" Type="Int32" />
                <asp:Parameter Name="original_ProductID" Type="Int32" />
                <asp:Parameter Name="original_Quantity" Type="Int16" />
                <asp:Parameter Name="original_Price" Type="Decimal" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
                <asp:Parameter Name="ProductID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int16" />
                <asp:Parameter Name="Price" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
