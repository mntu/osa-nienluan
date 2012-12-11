<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="OnlineAuctionSystem.Login" %>

<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--    <div class="content-header">
    <div>Trang chu</div>
    </div>--%>
    <dx:ASPxRoundPanel ID="panelLogin" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" HeaderText="Đăng Nhập" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
        Width="100%" DefaultButton="btnLogin">
        <ContentPaddings Padding="14px" />
        <HeaderStyle Font-Bold="True" />
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <div align="center">
                    <table>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red">Vui lòng nhập Tài khoản và Mật khẩu của bạn</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Tài Khoản:
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtUsername" runat="server" Width="170px">
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Mật Khẩu:
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtPassword" runat="server" Width="170px" Password="True">
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <dx:ASPxHyperLink ID="lkLossPassword" runat="server" Text="Quên Mật Khẩu ?" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                                    NavigateUrl="~/PasswordRecover.aspx">
                                </dx:ASPxHyperLink>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                        <td></td>
                            <td >
                                <dx:ASPxButton ID="btnLogin" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Text="Đăng Nhập"
                                    OnClick="btnLogin_Click" Width="100px">
                                </dx:ASPxButton>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
