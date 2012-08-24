<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <asp:LoginView ID="LoginView1" runat="server">
    <AnonymousTemplate>
        
    <asp:Login ID="Login1" runat="server" 
        CreateUserText="Sign Up for an Account and upload Books" 
        CreateUserUrl="SignUp.aspx" Width="285px"  
            onloggedin="Login1_LoggedIn">
    </asp:Login>
    <br />
    <br />
    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server">
    <MailDefinition Subject="Your New Password for www.Secondhandbooks.com" 
        BodyFileName="~/SignUpMail.txt"
         From="secondhandbooks@gmail.com"></MailDefinition>
        </asp:PasswordRecovery>
    </AnonymousTemplate>
    <LoggedInTemplate>
    You are logged in
    
    </LoggedInTemplate>
    </asp:LoginView>
    
</asp:Content>

