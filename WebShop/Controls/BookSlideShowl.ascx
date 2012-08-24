<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BookSlideShowl.ascx.cs" Inherits="Controls_BookSlideShowl" %>
<div>
    
    <div id="photos">
        <asp:ListView ID="lstPhotos" runat="server">
        <ItemTemplate>
            <img src='<%# ResolveUrl(Container.DataItem.ToString()) %>' width="140" height="195" />
        </ItemTemplate>
        </asp:ListView>
    </div>

    <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.2.js"></script> 
    <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.cycle/2.88/jquery.cycle.all.js"></script> 
    <script type="text/javascript">

        $("#photos").cycle("toss");
 
    </script> 

    </div>