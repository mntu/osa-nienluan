<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlSellProduct.ascx.cs"
    Inherits="OnlineAuctionSystem.UserControl.ctrlSellProduct" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<div id="divCateId" runat="server" align="center">
    <div style="width:250px;text-align:left;">Loại Sản Phẩm - Mức phí<br />
    <asp:ListBox ID="listCate" runat="server" Rows="10" Width="250px">
    </asp:ListBox>
    <div align="center"><dx:ASPxButton ID="btnNext" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua" OnClick="btnNext_Click" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
        Text="Tiếp Tục" Width="100px">
    </dx:ASPxButton></div>
    </div>
</div>
<div id="divProduct" runat="server" align="left">
    <table align="center">
        <tr>
            <td>
                Loại sản phẩm:
            </td>
            <td colspan="2">
                <dx:ASPxLabel ID="lblCateName" runat="server">
                </dx:ASPxLabel>
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
        <tr>
            <td>
                Hình ảnh(*):<br />
                <i>(Lưu ý: ảnh 1 là ảnh chính)</i>
            </td>
            <td colspan="2">
                1.<asp:FileUpload ID="FileUpload1" runat="server" /> 
                <br />
                2.<asp:FileUpload ID="FileUpload2" runat="server" />
                <br />
                3.<asp:FileUpload ID="FileUpload3" runat="server" />
                <br />
                4.<asp:FileUpload ID="FileUpload4" runat="server" />
                <br />
                5.<asp:FileUpload ID="FileUpload5" runat="server" />
                <br />
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
                Thời gian bán:
            </td>
            <td colspan="2">
                <dx:ASPxComboBox ID="cmbDuration" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                    CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                    ValueType="System.String" Width="200px" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="1 ngày - 1%" Value="1" Selected="True" />
                        <dx:ListEditItem Text="3 ngày - 2.5%" Value="3" />
                        <dx:ListEditItem Text="5 ngày - 3%" Value="5" />
                        <dx:ListEditItem Text="7 ngày - 5%" Value="7" />
                        <dx:ListEditItem Text="10 ngày - 7%" Value="10" />
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
                &nbsp;
            </td>
            <td width="120px">
                <dx:ASPxButton ID="btnBack" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                    Text="Trở Lại" onclick="btnBack_Click" Width="100px" 
                    CausesValidation="False">
                </dx:ASPxButton>
            </td>
            <td>
                <dx:ASPxButton ID="btnCreate" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                    Text="Hoàn Tất" onclick="btnCreate_Click" Width="100px">
                </dx:ASPxButton>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</div>
