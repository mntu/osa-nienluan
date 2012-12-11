<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlEditProduct.ascx.cs" Inherits="OnlineAuctionSystem.UserControl.ctrlEditProduct" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<div id="divProduct" runat="server" align="left">
    <table align="center">
        <tr>
            <td>
                Loại sản phẩm:
            </td>
            <td colspan="2">
                <dx:ASPxComboBox ID="cmbCate" runat="server" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    LoadingPanelImagePosition="Top" ShowShadow="False" 
                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" ValueType="System.String">
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
                </dx:ASPxComboBox>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Tên sản phẩm(*):
            </td>
            <td colspan="2">
                <dx:ASPxTextBox ID="txtProName" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="250px">
                    <ValidationSettings SetFocusOnError="True">
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                        <RequiredField ErrorText="Vui lòng nhập tên sản phẩm!" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Mô tả(*):
            </td>
            <td colspan="2">
                <asp:RequiredFieldValidator ID="rf" runat="server" ControlToValidate="txtDescription"
                    ErrorMessage="Vui lòng nhập mô tả sản phẩm!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <dx:ASPxHtmlEditor ID="txtDescription" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                    CssPostfix="Aqua" Height="250px">
                    <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                        <ViewArea>
                            <Border BorderColor="#A3C0E8" />
                        </ViewArea>
                    </Styles>
                    <Settings AllowHtmlView="False" AllowPreview="False" />
                    <SettingsImageUpload>
                        <ValidationSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png">
                        </ValidationSettings>
                    </SettingsImageUpload>
                    <SettingsImageSelector>
                        <CommonSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png"></CommonSettings>
                    </SettingsImageSelector>
                    <SettingsDocumentSelector>
                        <CommonSettings AllowedFileExtensions=".rtf, .pdf, .doc, .docx, .odt, .txt, .xls, .xlsx, .ods, .ppt, .pptx, .odp">
                        </CommonSettings>
                    </SettingsDocumentSelector>
                    <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                        <LoadingPanel Url="~/App_Themes/Aqua/HtmlEditor/Loading.gif">
                        </LoadingPanel>
                    </Images>
                    <ImagesFileManager>
                        <FolderContainerNodeLoadingPanel Url="~/App_Themes/Aqua/Web/tvNodeLoading.gif">
                        </FolderContainerNodeLoadingPanel>
                        <LoadingPanel Url="~/App_Themes/Aqua/Web/Loading.gif">
                        </LoadingPanel>
                    </ImagesFileManager>
                </dx:ASPxHtmlEditor>
            </td>
        </tr>
        <tr id="rowImage" runat="server">
            <td>
                Hình ảnh(*):<br />
                &nbsp;</td>
            <td colspan="2">
                <div><asp:FileUpload ID="FileUpload2" runat="server" Visible="False" /></div>
                <div> <asp:FileUpload ID="FileUpload3" runat="server" Visible="False" /></div>
                <div><asp:FileUpload ID="FileUpload4" runat="server" Visible="False" /></div>
                <div><asp:FileUpload ID="FileUpload5" runat="server" Visible="False" /></div>
                <dx:ASPxLabel ID="lblAllowebMimeType" runat="server" 
                    Text="Loại ảnh: .jpg, .jpe, .jpeg">
                </dx:ASPxLabel>
                <br />
                <dx:ASPxLabel ID="lblMaxFileSize" runat="server" Text="Kích thước tối đa: 1Mb">
                </dx:ASPxLabel>
                <br />
                <asp:Label ID="lblImage" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Giá khởi điểm VNĐ(*):
            </td>
            <td colspan="2">
                <dx:ASPxTextBox ID="txtStartPrice" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                    Width="200px">
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                        <RegularExpression ErrorText="Giá phải là số!" ValidationExpression="\d+" />
                        <RequiredField ErrorText="Vui lòng nhập giá !" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Số lượng(*):
            </td>
            <td colspan="2">
                <dx:ASPxTextBox ID="txtAmount" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                    Width="100px">
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                        <RegularExpression ErrorText="Số lượng phải là số!" 
                            ValidationExpression="\d+" />
                        <RequiredField ErrorText="Vui lòng nhập số lượng!" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td width="120px">
                <dx:ASPxButton ID="btnBack" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                    Text="Trở Lại" Width="100px" 
                    CausesValidation="False" PostBackUrl="~/YourProduct.aspx">
                </dx:ASPxButton>
            </td>
            <td>
                <dx:ASPxButton ID="btnUpdate" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                    Text="Cập Nhật" onclick="btnCreate_Click" Width="100px">
                </dx:ASPxButton>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</div>
