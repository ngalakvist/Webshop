<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true"
    CodeFile="BookFeedBack.aspx.cs" Inherits="BookFeedBack" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookShopConnectionString %>"
        SelectCommand="SELECT [ProductID], [Name], [Description], [Price], [PictureURL] FROM [Products] WHERE ([ProductID] = @ProductID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductID" QueryStringField="ProductID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="ProductID" DataSourceID="SqlDataSource1"
        CellPadding="4" ForeColor="#333333" Height="45px" Width="460px">
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
            <div style="background-color: #C0C0C0; width: 460px; height: 5px;">
            </div>
            <strong>Name:&nbsp;</strong><asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>'></asp:Label><br />
            <div style="background-color: #C0C0C0; width: 460px; height: 5px;">
            </div>
            <strong>Description:&nbsp;</strong>
            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>'></asp:Label><br />
            <div style="background-color: #C0C0C0; width: 460px; height: 5px;">
            </div>
            <strong>Price:&nbsp;</strong>
            <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price","{0:##0.00}") %>'></asp:Label><br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <hr />
    <strong style="text-align:center"> Feed back messages  about this seller</strong>
    <asp:DataList ID="DataList2" runat="server" CellPadding="4" 
        DataKeyField="CommentId" DataSourceID="SqlDataSource2" ForeColor="#333333" 
        Width="472px">
        <AlternatingItemStyle BackColor="White" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#E3EAEB" />
        <ItemTemplate>
           
            Feed back message:
            <asp:Label ID="FeedBackMessageLabel" runat="server" 
                Text='<%#Eval("FeedBackMessage") %>' />
          <br />
            <%--<asp:Label ID="ProductIDLabel" runat="server" Visible ="false" Text='<%# Eval("ProductID") %>' />
            <br />--%>
            From:
            <asp:Label ID="AddedByLabel" runat="server" Text='<%# Eval("AddedBy") %>' />
            <br />
            Added date:
            <asp:Label ID="AddedDateLabel" runat="server" Text='<%# Eval("AddedDate") %>' />
            <br />
<br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookShopConnectionString %>"
        
        SelectCommand="SELECT * FROM [Comment_tb] WHERE ([ProductID] = @ProductID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductID" QueryStringField="ProductID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <hr />
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
        AutoGenerateRows="False" DataKeyNames="CommentId" 
        DataSourceID="LinqDataSource2" DefaultMode="Insert" 
        oniteminserted="DetailsView1_ItemInserted" 
        oniteminserting="DetailsView1_ItemInserting" 
        ondatabound="DetailsView1_DataBound" onload="DetailsView1_Load" 
        onpageindexchanging="DetailsView1_PageIndexChanging">
        <Fields>
            <asp:TemplateField HeaderText="Message" 
                SortExpression="FeedBackMessage">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FeedBackMessage") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Height="184px" 
                        Text='<%#Bind("FeedBackMessage") %>' TextMode="MultiLine" Width="350px"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FeedBackMessage") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" InsertText="Submit" 
                ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:LinqDataSource ID="LinqDataSource2" runat="server" 
        ContextTypeName="BooksDataContext" EnableInsert="True" EntityTypeName="" 
        TableName="Comment_tbs" Where="ProductID == @ProductID">
        <WhereParameters>
            <asp:QueryStringParameter  Name="ProductID" 
                QueryStringField="ProductID" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="BooksDataContext"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="Comment_tbs"
        Where="ProductID == @ProductID">
        <WhereParameters>
            <asp:QueryStringParameter Name="ProductID" QueryStringField="ProductID" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>
