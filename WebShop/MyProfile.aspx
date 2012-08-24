<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true"
    CodeFile="MyProfile.aspx.cs" Inherits="MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        My Profile</h1>
    <p>
        The My Profile page allows you to make changes to your personal profile. Besides
        changing your password, you can also tell us a bit about yourself.</p>
    <table class="style1">
        <tr>
            <td>
                Names
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" Columns="30" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                    Display="Dynamic" ErrorMessage="Name is required."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Address
            </td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" Columns="25" Rows="5" TextMode="multiLine" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress"
                    Display="Dynamic" ErrorMessage=" Address is required."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                City
            </td>
            <td>
                <asp:TextBox ID="txtCity" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCity"
                    Display="Dynamic" ErrorMessage="City required."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                County or Region
            </td>
            <td>
                <asp:TextBox ID="txtCounty" runat="server" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Post Code
            </td>
            <td>
                <asp:TextBox ID="txtPostCode" runat="server" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Country
            </td>
            <td>
                <asp:TextBox ID="txtCountry" runat="server" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Email
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save Profile" OnClick="btnSave_Click" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <br />
    <asp:ChangePassword ID="ChangePassword1" runat="server">
    </asp:ChangePassword>
</asp:Content>
