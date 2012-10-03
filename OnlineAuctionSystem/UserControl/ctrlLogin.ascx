<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlLogin.ascx.cs" Inherits="OnlineAuctionSystem.UserControl.ctrlLogin" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<table>
    <tr>
        <td>
            <b>Tài khoản:</b>
        </td>
        <td>
            <asp:TextBox ID="txtUsername" runat="server" MaxLength="20" TextMode="Password" 
                Width="100px"></asp:TextBox>
        </td>
        <td>
            &nbsp;<b>Mật Khẩu:</b>
        </td>
        <td>
            <asp:TextBox ID="txtPassword" runat="server" MaxLength="20" Width="100px" 
                TextMode="Password"></asp:TextBox>
        </td>
        <td>
            <asp:Button ID="btnLogin" runat="server" CssClass="art-button" Text="Đăng Nhập" />
        </td>
    </tr>
</table>
