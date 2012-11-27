<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="AddCreditCard.aspx.cs" Inherits="OnlineAuctionSystem.AddCreditCard" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRoundPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="panel" runat="server" 
        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
        GroupBoxCaptionOffsetY="-28px" HeaderText="Thêm thẻ thanh toán" 
        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100%" 
        DefaultButton="btnAdd">
        <ContentPaddings Padding="14px" />
        <HeaderStyle Font-Bold="True" />
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
            <div align="center">
                <table>
                <tr>
                    <td colspan="3" align="center">
                        <dx:ASPxLabel ID="lblError" runat="server" Font-Bold="True" Font-Size="11pt" 
                            ForeColor="Red">
                        </dx:ASPxLabel>
                    </td>
                    <td></td>
                </tr>
                    <tr>
                        <td>Loại Thẻ:</td>
                        <td colspan="2">
                            <dx:ASPxComboBox ID="cmbType" runat="server" ValueType="System.String" 
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                LoadingPanelImagePosition="Top" ShowShadow="False" 
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="210px">
                                <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                </LoadingPanelImage>
                                <DropDownButton>
                                    <Image>
                                        <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" 
                                            PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                    </Image>
                                </DropDownButton>
                                <ValidationSettings Display="Dynamic">
                                    <ErrorFrameStyle ImageSpacing="4px">
                                        <ErrorTextPaddings PaddingLeft="4px" />
                                    </ErrorFrameStyle>
                                    <RequiredField ErrorText="" />
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvMonth0" runat="server" 
                                ControlToValidate="cmbType" ErrorMessage="Vui lòng chọn loại thẻ!" 
                                ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Mã Số Thẻ:</td>
                        <td colspan="2">
                            <dx:ASPxTextBox ID="txtCardNum" runat="server" Width="210px" 
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                <MaskSettings Mask="0000-0000-0000-0000" />
                                <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                    <ErrorFrameStyle ImageSpacing="4px">
                                        <ErrorTextPaddings PaddingLeft="4px" />
                                    </ErrorFrameStyle>
                                    <RequiredField ErrorText="" IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>Hết Hạn:</td>
                        <td>
                            <div style="float:left; width: 90px;">
                                <dx:ASPxComboBox ID="cmbMonth" runat="server" 
                                    ValueType="System.String" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                                    CssPostfix="Aqua" LoadingPanelImagePosition="Top" SelectedIndex="0" 
                                    ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                                    Width="80px">
                                <Items>
                                    <dx:ListEditItem Selected="True" Text="-Tháng-" />
                                    <dx:ListEditItem Text="01" Value="01" />
                                    <dx:ListEditItem Text="02" Value="02" />
                                    <dx:ListEditItem Text="03" Value="03" />
                                    <dx:ListEditItem Text="03" Value="03" />
                                    <dx:ListEditItem Text="04" Value="04" />
                                    <dx:ListEditItem Text="05" Value="05" />
                                    <dx:ListEditItem Text="06" Value="06" />
                                    <dx:ListEditItem Text="07" Value="07" />
                                    <dx:ListEditItem Text="08" Value="08" />
                                    <dx:ListEditItem Text="09" Value="09" />
                                    <dx:ListEditItem Text="10" Value="10" />
                                    <dx:ListEditItem Text="11" Value="11" />
                                    <dx:ListEditItem Text="12" Value="12" />
                                </Items>
                                <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                </LoadingPanelImage>
                                <DropDownButton>
                                    <Image>
                                        <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" 
                                            PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                    </Image>
                                </DropDownButton>
                                <ValidationSettings>
                                    <ErrorFrameStyle ImageSpacing="4px">
                                        <ErrorTextPaddings PaddingLeft="4px" />
                                    </ErrorFrameStyle>
                                </ValidationSettings>
                            </dx:ASPxComboBox></div> -
                            </td><td>
                            <dx:ASPxTextBox ID="txtYear" runat="server" Width="100px" 
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" NullText="Năm" 
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                <MaskSettings Mask="0000" />
                                <ValidationSettings Display="Dynamic">
                                    <ErrorFrameStyle ImageSpacing="4px">
                                        <ErrorTextPaddings PaddingLeft="4px" />
                                    </ErrorFrameStyle>
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvMonth" runat="server" 
                                ControlToValidate="cmbMonth" 
                                ErrorMessage="Vui lòng chọn tháng!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <dx:ASPxButton ID="btnCancel" runat="server" 
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                PostBackUrl="~/CreditCard.aspx" 
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Text="Hủy bỏ" 
                                Width="100px" CausesValidation="False">
                            </dx:ASPxButton>
                        </td>
                        <td>
                            <dx:ASPxButton ID="btnAdd" runat="server" 
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                OnClick="btnAdd_Click" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                                Text="Thêm" Width="100px">
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
