<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search.ascx.cs" Inherits="Controls_Search" %>
<asp:TextBox ID="txtSearch" runat="server" Width="144px"></asp:TextBox>
                <asp:Button ID="butSearch" runat="server" Text="Search" OnClick="butSearch_Click" />
                <br />
                <br />
                <asp:ListView runat="server" ID="lv" Visible="False">
                    <LayoutTemplate>
                        <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                    </LayoutTemplate>
                    <ItemTemplate>
                        <asp:HyperLink runat="server" ID="link" Text='<%#Eval("Name") %>' NavigateUrl='<%#Eval("ProductID","~/BookSearch.aspx?ProductID={0}") %>' />
                        <br />
                    </ItemTemplate>
                    <EmptyDataTemplate> Found No Entries</EmptyDataTemplate>
                </asp:ListView>