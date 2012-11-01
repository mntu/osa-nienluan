<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true"
    CodeBehind="ChangeProfile.aspx.cs" Inherits="OnlineAuctionSystem.ChangeProfile" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="panel" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" HeaderText="Thông tin tài khoàn"
        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100%">
        <ContentPaddings Padding="14px" />
        <HeaderStyle Font-Bold="True" />
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <div align="center">
                    <table>
                        <tr>
                            <td>
                                Họ Tên(*):
                            </td>
                            <td colspan="2">
                                <dx:ASPxTextBox ID="txtFullname" runat="server" Width="250px" MaxLength="50" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <ValidationSettings>
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvFullname" runat="server" ControlToValidate="txtFullname"
                                    ErrorMessage="Vui lòng nhập họ tên!" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email(*):
                            </td>
                            <td colspan="2">
                                <dx:ASPxTextBox ID="txtEmail" runat="server" Width="250px" MaxLength="50" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <ValidationSettings>
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                    Display="Dynamic" ErrorMessage="Email không hợp lệ" ForeColor="Red" SetFocusOnError="True"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="Vui lòng nhập email!" ForeColor="Red" SetFocusOnError="True" 
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Số Điện Thoại(*):
                            </td>
                            <td colspan="2">
                                <dx:ASPxTextBox ID="txtPhone" runat="server" Width="250px" MaxLength="20" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <ValidationSettings>
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone"
                                    Display="Dynamic" ErrorMessage="Số điện thoại không hợp lệ!" ForeColor="Red"
                                    SetFocusOnError="True" ValidationExpression="0\d{9,10}"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone"
                                    ErrorMessage="Vui lòng nhập số điện thoại!" ForeColor="Red" SetFocusOnError="True"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Địa chỉ 1(*):
                            </td>
                            <td colspan="2">
                                <dx:ASPxTextBox ID="txtAddress1" runat="server" Width="250px" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <ValidationSettings>
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress1"
                                    ErrorMessage="Vui lòng nhập địa chỉ!" ForeColor="Red" SetFocusOnError="True"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Đia chỉ 2:
                            </td>
                            <td colspan="2">
                                <dx:ASPxTextBox ID="txtAddress2" runat="server" Width="250px" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <ValidationSettings>
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Câu Hỏi bảo mật(*):
                            </td>
                            <td colspan="2">
                                <dx:ASPxComboBox ID="cmbQuestion" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" LoadingPanelImagePosition="Top" SelectedIndex="0"
                                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" ValueType="System.String"
                                    Width="250px">
                                    <Items>
                                        <dx:ListEditItem Selected="True" Text="Bạn sinh ra ở đâu ?" Value="Bạn sinh ra ở đâu ?" />
                                        <dx:ListEditItem Text="Người bạn yêu nhất là ai ?" Value="Người bạn yêu nhất là ai ?" />
                                        <dx:ListEditItem Text="Cha của bạn làm nghề gì ?" Value="Cha của bạn làm nghề gì ?" />
                                        <dx:ListEditItem Text="Tên ngôi trường đầu tiên của bạn là gì ?" Value="Tên ngôi trường đầu tiên của bạn là gì ?" />
                                        <dx:ListEditItem Text="Bạn đã trải qua thời thơ ấu ở đâu ?" Value="Bạn đã trải qua thời thơ ấu ở đâu ?" />
                                        <dx:ListEditItem Text="Người thầy đầu tiên của bản là ai ?" Value="Người thầy đầu tiên của bản là ai ?" />
                                    </Items>
                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                    </LoadingPanelImage>
                                    <DropDownButton>
                                        <Image>
                                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                        </Image>
                                    </DropDownButton>
                                    <ValidationSettings>
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Trả lời(*):
                            </td>
                            <td colspan="2">
                                <dx:ASPxTextBox ID="txtAnswer" runat="server" Width="250px" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <ValidationSettings>
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvAnswer" runat="server" ControlToValidate="txtAnswer"
                                    ErrorMessage="Vui lòng nhập câu trả lời!" ForeColor="Red" SetFocusOnError="True"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <dx:ASPxButton ID="btnCancel" runat="server" Text="Hủy Bỏ" 
                                    CausesValidation="False" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                                    CssPostfix="Aqua" OnClick="btnCancel_Click" 
                                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                </dx:ASPxButton>
                            </td>
                            <td>
                                <dx:ASPxButton ID="btnUpdate" runat="server" Text="Cập Nhật" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    OnClick="btnUpdate_Click" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                </dx:ASPxButton>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
