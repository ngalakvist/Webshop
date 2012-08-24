<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="OrderCompleted.aspx.cs" Inherits="PayPal_OrderCompleted" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="sectiontitle">Order Completed</div>
   <p></p>
   <b>Thank you for your order!</b>
   <p></p>
   The transaction is currently being verified and processed. 
   You can the status of your order at any time from the <a href="../OrderHistory.aspx">Order History</a> page.
</asp:Content>

