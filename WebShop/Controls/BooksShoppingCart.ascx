<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BooksShoppingCart.ascx.cs" Inherits="BooksShoppingCart" %>
 <%@ Import Namespace="BookShop.Commerce" %>
 <asp:GridView ID="CartGrid" Runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID"
        OnRowEditing="CartGrid_RowEditing" OnRowUpdating="CartGrid_RowUpdating"
        OnRowDeleting="CartGrid_RowDeleting" 
    OnRowCancelingEdit="CartGrid_RowCancelingEdit" CellPadding="4" 
    ForeColor="#333333" GridLines="None" onrowdeleted="CartGrid_RowDeleted">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Image id="ProductImage" Runat="server" ImageUrl='<%# Eval("ProductImageURL", "~/ProductImages/thumb_{0}")%>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ProductName" HeaderText="Product" ReadOnly="True" />
            <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#FormatPrice(Eval("Price"))%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="LineTotal" HeaderText="Total" DataFormatString="{0:c}" ReadOnly="True" />
            <asp:TemplateField HeaderText="Quantity">
                <EditItemTemplate>
                    <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                   <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Bind("Quantity") %>' MaxLength="6"
                    Width="30px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valRequireQuantity" runat="server" ControlToValidate="txtQuantity"
                    SetFocusOnError="true" Text="The Quantity field is required."
                    ToolTip="The Quantity field is required." Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="valQuantityType" runat="server" Operator="DataTypeCheck"
                    Type="Integer" ControlToValidate="txtQuantity" Text="The Quantity must be an integer."
                    ToolTip="The Quantity must be an integer." Display="dynamic" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/Delete.gif" DeleteText="Delete product"
            ShowDeleteButton="True">
            <ItemStyle HorizontalAlign="Center" Width="20px" />
        </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <EmptyDataTemplate>
            There is nothing in your shopping cart. You can buy items from the 
            <a href="Default.aspx">Shop</a>.
        </EmptyDataTemplate>
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <br />

     <asp:Panel runat="server" ID="panTotals">
     
            <div style="text-align:center; font-weight: bold; padding-top: 4px;">
            <u>Total:</u> <asp:Literal runat="server" ID="TotalLabel" />
              &nbsp
                <asp:Button ID="btnUpdateTotals" runat="server" OnClick="btnUpdateTotals_Click" 
                    Text="Update totals" />
               <br /><br />
                 Shipping Method: 
               
                   <asp:DropDownList ID="ddShippingMethod" runat="server">
                   </asp:DropDownList>          
            </div>
            </asp:Panel>