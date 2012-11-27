<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true"
    CodeBehind="PasswordRecover.aspx.cs" Inherits="OnlineAuctionSystem.PasswordRecover" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="panel" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" 
        HeaderText="Quên Mật Khẩu" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
        Width="100%" DefaultButton="btnSubmit">
        <ContentPaddings Padding="14px" />
        <HeaderStyle Font-Bold="True" />
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <div id="divForm" align="center" runat="server">
                    <table>
                        <tr>
                            <td>
                                Tài Khoản(*):
                            </td>
                            <td style="margin-left: 80px">
                                <dx:ASPxTextBox ID="txtUsername" runat="server" Width="250px">
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Vui lòng nhập Tài Khoản của bạn!"
                                    ControlToValidate="txtUsername" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Câu Hỏi Bảo Mật:
                            </td>
                            <td style="margin-left: 80px">
                                <dx:ASPxComboBox ID="cmbQuestion" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                    ValueType="System.String" SelectedIndex="0" Width="250px">
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
                                Trả Lời(*):
                            </td>
                            <td style="margin-left: 80px">
                                <dx:ASPxTextBox ID="txtAnswer" runat="server" Width="250px">
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvAnswer" runat="server" ErrorMessage="Vui lòng nhập câu trả lời của bạn!"
                                    ControlToValidate="txtAnswer" Display="Dynamic" ForeColor="Red" 
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td style="margin-left: 80px">
                                <dx:ASPxButton ID="btnSubmit" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                                    Text="Gửi Đi" OnClick="btnSubmit_Click" Width="100px">
                                </dx:ASPxButton>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="divResult" align="center" runat="server">

                    <dx:ASPxLabel ID="lblUsername" runat="server" 
                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                        Text="Tài Khoản:" Font-Size="11pt">
                    </dx:ASPxLabel><br />
                    <dx:ASPxLabel ID="lblLablePass" runat="server" 
                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                        Text="Mật Khẩu:" Font-Size="11pt">
                    </dx:ASPxLabel>
                    <dx:ASPxLabel ID="lblPassword" runat="server" 
                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                        Text="" Font-Bold="True" Font-Size="11pt">
                    </dx:ASPxLabel>
                    <dx:ASPxLabel ID="lblError" runat="server" 
                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                        Text="" Font-Bold="True" Font-Size="11pt" ForeColor="Red">
                    </dx:ASPxLabel>

                    <br />
                    <dx:ASPxHyperLink ID="lkBack" runat="server" 
                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                        Font-Bold="True" Font-Size="11pt" Text="Quay Lại" 
                        NavigateUrl="~/PasswordRecover.aspx" >
                    </dx:ASPxHyperLink>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<dx:ASPxHyperLink ID="lkLogin" runat="server" 
                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                        Font-Bold="True" Font-Size="11pt" Text="Đăng Nhập" 
                        NavigateUrl="~/Login.aspx">
                    </dx:ASPxHyperLink>

                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
