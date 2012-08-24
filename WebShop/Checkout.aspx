<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/MasterSecBooks.master"
    CodeFile="Checkout.aspx.cs" Inherits="Checkout" Title="Checkout" %>

<%@ Register TagPrefix="wu" TagName="BooksShoppingCart" Src="~/Controls/BooksShoppingCart.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="NoCartlabel" runat="server" Visible="false">
        There are no items in your cart. Visit the shop to buy items.
    </asp:Label>
    <div style="float: right">
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" Visible="False" />
            </AnonymousTemplate>
        </asp:LoginView>
    </div>
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="2" OnFinishButtonClick="Wizard1_FinishButtonClick"
        OnNextButtonClick="Wizard1_NextButtonClick" 
        OnActiveStepChanged="Wizard1_ActiveStepChanged">
        <WizardSteps>
            <asp:WizardStep runat="server" Title="Login" AllowReturn="False">
                <asp:Login ID="Login1" runat="server" CreateUserText="Not a member? Create an account"
                    CreateUserUrl="~/Default.aspx">
                </asp:Login>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Delivery Address">
                <asp:CheckBox ID="chkUseProfileAddress" runat="server" AutoPostBack="True" Text="Use membership address"
                    OnCheckedChanged="chkUseProfileAddress_CheckedChanged"></asp:CheckBox><br />
                <table border="0">
                    <tr>
                        <td>
                            Name
                        </td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Address
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            City
                        </td>
                        <td>
                            <asp:TextBox ID="txtCity" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            County
                        </td>
                        <td>
                            <asp:TextBox ID="txtCounty" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Postcode
                        </td>
                        <td>
                            <asp:TextBox ID="txtPostCode" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Country
                        </td>
                        <td>
                            <asp:TextBox ID="txtCountry" runat="server" />
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Payment">
                <div style="text-align: center; padding-right:10; background-color: AntiqueWhite; font-weight: bold;">
                    <b>Order Details </b>
                    <br />
                    <asp:Repeater ID="repOrderDetails" runat="server">
                        <ItemTemplate>
                            <strong>> </strong><b><small>
                                <%# Eval("ProductName")%>
                                - #<%# Eval("Price") %>&nbsp;&nbsp (<%# Eval("Quantity") %>) </small></b>
                            <br />
                        </ItemTemplate>
                        <SeparatorTemplate>
                        </SeparatorTemplate>
                    </asp:Repeater>
                    <hr />
                    Subtotal:&nbsp
                    <asp:Literal runat="server" ID="lblSubtotal" />
                    <br />
                    <u>Total:&nbsp</u><asp:Literal runat="server" ID="lblTotal" />
                    <br />
                    <hr />
                    <b>Shipping Details</b>
                    <br />
                    <asp:Literal runat="server" ID="lblShippingMethod" />
                    <br />
                    <asp:Literal runat="server" ID="lblFirstName" />
                    <br />
                    <asp:Literal runat="server" ID="lblStreet" /><br />
                    <asp:Literal runat="server" ID="lblCity" />
                    <asp:Literal runat="server" ID="lblState" />
                    <asp:Literal runat="server" ID="lblPostalCode" /><br />
                    <asp:Literal runat="server" ID="lblCountry" />
                </div>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Finish">
                <wu:BooksShoppingCart runat="server" ID="BooksShoppingCart1"></wu:BooksShoppingCart>
                <br />
                <br />
                Please confirm you wish to have deducted from your credit card.
                <br />
              <div> <img src="images/PayPal.gif" alt="Paypal Logo" /> </div> 
              <br />
            </asp:WizardStep>
            <asp:WizardStep runat="server" StepType="Complete" Title="Order Complete">
                Thank you for your order. Order
            </asp:WizardStep>
        </WizardSteps>
        <SideBarStyle VerticalAlign="Top"></SideBarStyle>
    </asp:Wizard>
    <asp:Label ID="CreateOrderErrorLabel" runat="server" Visible="false">
        We are sorry but there was an error creating you order.<br /><br />
        The site administrator has been notified of this, and the club shop <br />
        have been sent copies of your order details, so once they've finished their <br />
        afternoon tea, they will process the order and send you a manual email confirmation.
    </asp:Label>
</asp:Content>
