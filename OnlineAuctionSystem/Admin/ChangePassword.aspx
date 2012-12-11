<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="OnlineAuctionSystem.Admin.ChangePassword" %>
<%@ Register assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRoundPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<dx:ASPxRoundPanel ID="panel" runat="server" 
        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
        GroupBoxCaptionOffsetY="-28px" HeaderText="Đổi Mật Khẩu" 
        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100%">
        <ContentPaddings Padding="14px" />
        <HeaderStyle Font-Bold="True" />
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
            <div align="center">
                <table>
                <tr>
                        <td colspan="4" align="center">

                            <dx:ASPxLabel ID="lblError" runat="server" 
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                Font-Bold="True" Font-Size="11pt" ForeColor="Red">
                            </dx:ASPxLabel>

                        </td>
                    </tr>
                    <tr>
                        <td>Mật Khẩu Cũ(*):</td>
                        <td colspan="2">
                            <dx:ASPxTextBox ID="txtOldPass" runat="server" 
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="210px" 
                                MaxLength="20" Password="True">
                                <ValidationSettings>
                                    <ErrorFrameStyle ImageSpacing="4px">
                                        <ErrorTextPaddings PaddingLeft="4px" />
                                    </ErrorFrameStyle>
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvPassword0" runat="server" 
                                ControlToValidate="txtOldPass" Display="Dynamic" 
                                ErrorMessage="Vui lòng nhập mật khẩu cũ!" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                            <td>
                                Mật Khẩu(*):
                            </td>
                            <td colspan="2">
                                <dx:ASPxTextBox ID="txtNewPass" runat="server" Width="210px" Password="True" 
                                    MaxLength="20" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <ValidationSettings>
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvPassword1" runat="server" 
                                    ControlToValidate="txtNewPass" ErrorMessage="Vui lòng nhập mật khẩu mới!" 
                                    ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Nhập lại Mật Khẩu(*):
                            </td>
                            <td colspan="2">
                                <dx:ASPxTextBox ID="txtRePass" runat="server" Width="210px" Password="True" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <ValidationSettings>
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:CompareValidator ID="cvPassword" runat="server" 
                                    ControlToCompare="txtNewPass" ControlToValidate="txtRePass" 
                                    ErrorMessage="Mật khẩu không trùng khớp!" ForeColor="Red" 
                                    SetFocusOnError="True" Display="Dynamic"></asp:CompareValidator>
                            </td>
                        </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                            <td>
                                <dx:ASPxButton ID="btnCancle" runat="server" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    OnClick="btnCancle_Click" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                                    Text="Hủy Bỏ" Width="100px" CausesValidation="False">
                                </dx:ASPxButton>
                        </td>
                        <td>
                            <dx:ASPxButton ID="btnUpdate" runat="server" 
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                OnClick="btnUpdate_Click" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                                Text="Cập Nhật" Width="100px">
                            </dx:ASPxButton>
                        </td>
                        <td style="margin-left: 40px">
                            &nbsp;</td>
                    </tr>
                </table>
            </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
