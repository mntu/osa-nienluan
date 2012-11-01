<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlLogin.ascx.cs" Inherits="OnlineAuctionSystem.UserControl.ctrlLogin" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<table>
    <tr>
        <td>
            <b>Tài khoản:</b>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtUsername" runat="server" Width="100px" 
                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                NullText="Tài khoản..." SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
            </dx:ASPxTextBox>
        </td>
        <td>
            &nbsp;<b>Mật Khẩu:</b>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtPassword" runat="server" Width="100px" Password=True 
                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                NullText="password" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
            </dx:ASPxTextBox>
        </td>
        <td>
            <asp:Button ID="btnLogin" runat="server" CssClass="art-button" Text="Đăng Nhập" 
                onclick="btnLogin_Click" CausesValidation="False" />
        </td>
    </tr>
</table>
