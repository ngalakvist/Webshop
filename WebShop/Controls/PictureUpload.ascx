<%@ Control Language="C#" AutoEventWireup="true" codefile="PictureUpload.ascx.cs" inherits="PictureUpload" %>

<asp:FileUpload ID="FileUpload1" Runat="server" />
<asp:Button ID="btnUpload" Runat="server" Text="Upload Picture" OnClick="btnUpload_Click"
    Width="127px" Height="21px" />
<asp:Label ID="Status" Runat="server"></asp:Label>
