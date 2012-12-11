<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="EditAccount.aspx.cs" Inherits="OnlineAuctionSystem.Admin.EditAccount" %>

<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="panel" runat="server" 
        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
        GroupBoxCaptionOffsetY="-28px" HeaderText="Chỉnh sửa tài khoản: " 
        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100%">
        <ContentPaddings Padding="14px" />
        <HeaderStyle Font-Bold="True" />
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
            <table align="center">
                    <tr>
                        <td>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                        </td>
                        <td colspan="2" >
                            <dx:ASPxButton ID="btnResetPass" runat="server" Text="Đặt lại mật khẩu" 
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="200px" 
                                OnClick="btnResetPass_Click">
                            </dx:ASPxButton>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Họ tên(*):
                        </td>
                        <td colspan="2">
                            <dx:ASPxTextBox ID="txtFullname" runat="server" Width="200px">
                                <ValidationSettings>
                                    <RequiredField ErrorText="Vui lòng nhập họ tên!" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtFullname" ErrorMessage="Vui lòng nhập họ tên!" 
                                ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email(*):
                        </td>
                        <td colspan="2">
                            <dx:ASPxTextBox ID="txtEmail" runat="server" Width="200px">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField ErrorText="Vui lòng nhập email!" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtEmail" ErrorMessage="Vui lòng nhập email!" 
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="txtEmail" Display="Dynamic" 
                                ErrorMessage="Email không hợp lệ!" ForeColor="Red" SetFocusOnError="True" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Số điện thoại(*):
                        </td>
                        <td colspan="2">
                            <dx:ASPxTextBox ID="txtPhone" runat="server" Width="200px">
                                <ValidationSettings>
                                    <RequiredField ErrorText="Vui lòng nhập số điện thoại!" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="txtPhone" Display="Dynamic" 
                                ErrorMessage="Số điện thoại không hợp lệ!" ForeColor="Red" 
                                SetFocusOnError="True" ValidationExpression="0\d{9,10}"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtPhone" ErrorMessage="Vui lòng nhập số điện thoại!" 
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Địa chỉ(*):
                        </td>
                        <td colspan="2">
                            <dx:ASPxMemo ID="txtAddress" runat="server" Height="71px" Width="200px">
                                <ValidationSettings>
                                    <RequiredField ErrorText="Vui lòng nhập địa chỉ!" />
                                </ValidationSettings>
                            </dx:ASPxMemo>
                        </td>
                        <td valign="top">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtAddress" ErrorMessage="Vui lòng nhập địa chỉ!" 
                                ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td align="left">
                            <dx:ASPxButton ID="btnCancel" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                                Text="Hủy Bỏ" CausesValidation="False" Width="100px" 
                                OnClick="btnCancel_Click">
                            </dx:ASPxButton>
                        </td>
                        <td align="left">
                            <dx:ASPxButton ID="btnAdd" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                                Text="Hoàn Tất" Width="100px" OnClick="btnAdd_Click">
                            </dx:ASPxButton>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
