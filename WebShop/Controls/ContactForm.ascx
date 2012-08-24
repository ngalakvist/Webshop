<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactForm.ascx.cs" Inherits="Controls_ContactForm" %>
<style type="text/css">
  .style1
  {
    width: 100%;
  }
</style>
<script type="text/javascript">
  function ValidatePhoneNumbers(source, args)
  {
    var txtPhoneHome = document.getElementById('<%= txtPhoneHome.ClientID %>');
    var txtPhoneBusiness = document.getElementById('<%= txtPhoneBusiness.ClientID %>');
    if (txtPhoneHome.value != '' || txtPhoneBusiness.value != '')
    {
      args.IsValid = true;
    }
    else
    {
      args.IsValid = false;
    }
  }
</script>

<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>
    <table class="style1" runat="server" id="FormTable">
      <tr>
        <td colspan="3">
          <h1>
            Get in touch with us</h1>
          <p>
            Use the form below to get in touch with us. Enter your name, e-mail address and 
            your home or phone number to get in touch with us.<br />
          </p>
        </td>
      </tr>
      <tr>
        <td>
          Your name</td>
        <td>
          <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        </td>
        <td>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtName" ErrorMessage="Please enter your name">*</asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td>
          Your e-mail address</td>
        <td>
          <asp:TextBox ID="txtEmailAddress" runat="server"></asp:TextBox>
        </td>
        <td>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ErrorMessage="Please enter an e-mail address" 
            ControlToValidate="txtEmailAddress" Display="Dynamic">*</asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="Please enter a valid e-mail address" 
            ControlToValidate="txtEmailAddress" Display="Dynamic" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
        </td>
      </tr>
      <tr>
        <td>
          Your e-mail address again</td>
        <td>
          <asp:TextBox ID="txtEmailAddressConfirm" runat="server"></asp:TextBox>
        </td>
        <td>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ErrorMessage="Please confirm the e-mail address" 
            ControlToValidate="txtEmailAddressConfirm" Display="Dynamic">*</asp:RequiredFieldValidator>
          <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ErrorMessage="Please retype the e-mail address" 
            ControlToCompare="txtEmailAddress" ControlToValidate="txtEmailAddressConfirm" 
            Display="Dynamic">*</asp:CompareValidator>
        </td>
      </tr>
      <tr>
        <td>
          Home phone number</td>
        <td>
          <asp:TextBox ID="txtPhoneHome" runat="server"></asp:TextBox>
        </td>
        <td>
          <asp:CustomValidator ID="CustomValidator1" runat="server" 
            ClientValidationFunction="ValidatePhoneNumbers" Display="Dynamic" 
            ErrorMessage="Please enter your home or business phone number" 
            onservervalidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
        </td>
      </tr>
      <tr>
        <td>
          Business phone number</td>
        <td>
          <asp:TextBox ID="txtPhoneBusiness" runat="server"></asp:TextBox>
        </td>
        <td>
          &nbsp;</td>
      </tr>
      <tr>
        <td>
          Comments</td>
        <td>
          <asp:TextBox ID="txtComments" runat="server" Height="50px" TextMode="MultiLine" 
            Width="350px"></asp:TextBox>
        </td>
        <td>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ErrorMessage="Please enter a comment" ControlToValidate="txtComments" 
            Display="Dynamic">*</asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td>
          &nbsp;</td>
        <td>
          <asp:Button ID="btnSend" runat="server" Text="Send" onclick="btnSend_Click" />
        </td>
        <td>
          &nbsp;</td>
      </tr>
      <tr>
        <td colspan="3">
          <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            HeaderText="Please correct the following errors before you press the Send button" />
        </td>
      </tr>
    </table>
    <asp:Label ID="lblMessage" runat="server" Text="Message Sent" Visible="false"></asp:Label>
  </ContentTemplate>
</asp:UpdatePanel>
 