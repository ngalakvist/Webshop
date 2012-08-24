<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" Title="Untitled Page" %>

 
<%@ Register src="Controls/ContactForm.ascx" tagname="ContactForm" tagprefix="uc1" %>

 
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    
     
    <uc1:ContactForm ID="ContactForm1" runat="server" />
     
    
     
</asp:Content>

