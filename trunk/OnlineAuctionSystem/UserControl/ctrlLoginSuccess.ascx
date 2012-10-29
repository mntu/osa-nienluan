<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlLoginSuccess.ascx.cs"
    Inherits="OnlineAuctionSystem.UserControl.ctrlLoginSuccess" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<table>
    <tr>
        <td>
            <b>Xin chào 
                <dx:ASPxLabel ID="lblUsername" runat="server" Font-Size="14px">
                </dx:ASPxLabel>
                !
            </b>
        </td>
        <td>
            <asp:Button ID="btnLogout" runat="server" Text="Đăng Xuất" 
                CssClass="art-button" onclick="btnLogout_Click" />
        </td>
    </tr>
</table>
