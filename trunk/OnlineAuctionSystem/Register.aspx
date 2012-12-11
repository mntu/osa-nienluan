<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="OnlineAuctionSystem.Register" %>

<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="panel" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
        Width="100%" HeaderText="Đăng ký thành viên" DefaultButton="btnNext">
        <ContentPaddings Padding="14px"></ContentPaddings>
        <ContentPaddings Padding="14px" />
        <HeaderStyle Font-Bold="True" />
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
            <div id="divTerm" align="left" runat="server">
                <div style="border: 1px solid #CCCCCC; font-size: 12pt; padding:5px;">
                    <div style="text-align: center;">
                        <h3>
                            QUY ĐỊNH ĐĂNG KÝ THÀNH VIÊN</h3>
                    </div>
                    <p>
                        - Thông tin khi đăng ký phải là thông tin thật, chính xác để phục vụ tốt cho việc
                        mua bán trên website.<br />
                        - Khai báo sản phẩm phải đúng thông tin thật của sản phẩm để đảm bảo uy tín của
                        bạn cũng như của website.<br />
                        - Sản phẩm đấu giá phải được gởi đến công ty của chúng tôi trong vào 48 giờ kể từ
                        ngày đăng, nêu không chúng tôi sẽ hủy sản phẩm của bạn.<br />
                        - Phí đấu giá sẽ được chúng tôi thu theo phần trăm giá của sản phẩm (cụ thể trong
                        mục đăng sản phẩm).<br />
                    </p>
                </div>
                <dx:ASPxCheckBox ID="chkAccept" runat="server" Text="Tôi đồng ý với quy định của website"
                    Font-Bold="True" OnCheckedChanged="chkAccept_CheckedChanged" 
                    AutoPostBack="True">
                </dx:ASPxCheckBox>
                <div align="center">
                <dx:ASPxButton ID="btnNext1" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" 
                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Text="Tiếp Tục"
                                    OnClick="btnNext1_Click" Width="100px">
                                </dx:ASPxButton>
                                </div>
                </div>
                <div id="divPersonInfo" align="center" runat="server">
                    <table>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Tài Khoản(*):
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtUsername" runat="server" Width="250px" 
                                    MaxLength="20" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <ValidationSettings>
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td width="200px">
                                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                                    ControlToValidate="txtUsername" ErrorMessage="Vui lòng nhập tài khoàn!" 
                                    ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Mật Khẩu(*):
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtPassword1" runat="server" Width="250px" Password="True" 
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
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                    ControlToValidate="txtPassword1" ErrorMessage="Vui lòng nhập mật khẩu!" 
                                    ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Nhập lại Mật Khẩu(*):
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtPassword2" runat="server" Width="250px" Password="True" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <ValidationSettings>
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <asp:CompareValidator ID="cvPassword" runat="server" 
                                    ControlToCompare="txtPassword1" ControlToValidate="txtPassword2" 
                                    ErrorMessage="Mật khẩu không trùng khớp!" ForeColor="Red" 
                                    SetFocusOnError="True" Display="Dynamic"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Họ Tên(*):
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtFullname" runat="server" Width="250px" 
                                    MaxLength="50" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <ValidationSettings>
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvFullname" runat="server" 
                                    ControlToValidate="txtFullname" ErrorMessage="Vui lòng nhập họ tên!" 
                                    ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email(*):
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtEmail1" runat="server" Width="250px" 
                                    MaxLength="50" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <ValidationSettings>
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                                    ControlToValidate="txtEmail1" Display="Dynamic" 
                                    ErrorMessage="Email không hợp lệ" ForeColor="Red" SetFocusOnError="True" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="txtEmail1" ErrorMessage="Vui lòng nhập email!" 
                                    ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Nhập lại Email(*):
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtEmail2" runat="server" Width="250px" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <ValidationSettings>
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <asp:CompareValidator ID="cvEmail" runat="server" ControlToCompare="txtEmail1" 
                                    ControlToValidate="txtEmail2" ErrorMessage="Xác nhận email không trùng khớp!" 
                                    ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Số Điện Thoại(*):
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtPhone" runat="server" Width="250px" 
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
                                <asp:RegularExpressionValidator ID="revPhone" runat="server" 
                                    ControlToValidate="txtPhone" Display="Dynamic" 
                                    ErrorMessage="Số điện thoại không hợp lệ!" ForeColor="Red" 
                                    SetFocusOnError="True" ValidationExpression="0\d{9,10}"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                                    ControlToValidate="txtPhone" ErrorMessage="Vui lòng nhập số điện thoại!" 
                                    ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Địa chỉ 1(*):
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtAddress1" runat="server" Width="250px" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <ValidationSettings>
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                                    ControlToValidate="txtAddress1" ErrorMessage="Vui lòng nhập địa chỉ!" 
                                    ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Đia chỉ 2:
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtAddress2" runat="server" Width="250px" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <ValidationSettings>
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                Câu Hỏi bảo mật(*):
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cmbQuestion" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" LoadingPanelImagePosition="Top" SelectedIndex="0" ShowShadow="False"
                                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                                    ValueType="System.String" Width="250px">
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
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                Trả lời(*):
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtAnswer" runat="server" Width="250px" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <ValidationSettings>
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvAnswer" runat="server" 
                                    ControlToValidate="txtAnswer" ErrorMessage="Vui lòng nhập câu trả lời!" 
                                    ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                        <td>Mã xác thực:</td>
                            <td colspan="2" align="left">
                                <dx:ASPxCaptcha ID="captcha" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                    </LoadingPanelImage>
                                    <ValidationSettings ErrorText="Mã xác thực không đúng!" 
                                        EnableValidation="False">
                                    </ValidationSettings>
                                    <RefreshButton Position="Top" Text="Hiện hình khác">
                                    </RefreshButton>
                                    <TextBox LabelText="Nhập các ký tự trên hình:" Position="Bottom" />
                                    <ChallengeImage ForegroundColor="#426798" BackgroundColor="#F2F8FF" BorderColor="#AECAF0"
                                        BorderWidth="1">
                                    </ChallengeImage>
                                </dx:ASPxCaptcha>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <dx:ASPxButton ID="btnRegister" runat="server" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Text="Đăng Ký" 
                                    OnClick="btnRegister_Click" Width="100px">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
