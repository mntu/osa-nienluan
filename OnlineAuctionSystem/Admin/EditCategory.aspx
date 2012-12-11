<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true"
    CodeBehind="EditCategory.aspx.cs" Inherits="OnlineAuctionSystem.Admin.EditCategory" %>

<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="rpEditCate" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
        Width="100%" HeaderText="Sửa loại sản phẩm" DefaultButton="btnEditCate">
        <ContentPaddings Padding="14px" />
        <HeaderStyle Font-Bold="True" />
        <PanelCollection>
            <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                <table align="center">
                    <tr>
                        <td>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblError" runat="server" ForeColor="Red" Text="lblError"></asp:Label>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Tên loại:
                        </td>
                        <td colspan="2">
                            <dx:ASPxTextBox ID="txtCateName" runat="server" MaxLength="20" Width="210px">
                            </dx:ASPxTextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvCateName" runat="server" ErrorMessage="Vui lòng nhập tên loại!"
                                ForeColor="Red" ControlToValidate="txtCateName"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Mức phí:
                        </td>
                        <td colspan="2">
                            <dx:ASPxTextBox ID="txtFee" runat="server" Width="210px">
                            </dx:ASPxTextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvFee" runat="server" Display="Dynamic" ErrorMessage="Vui lòng nhập mức phí!"
                                ForeColor="Red" ControlToValidate="txtFee"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revFee" runat="server" Display="Dynamic" ErrorMessage="Mức phí phải là số!"
                                ForeColor="Red" ValidationExpression="\d+(.\d+)*" 
                                ControlToValidate="txtFee"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <dx:ASPxButton ID="btnCancel" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Text="Hủy Bỏ"
                                OnClick="btnCancel_Click" Width="100px" CausesValidation="False">
                            </dx:ASPxButton>
                        </td>
                        <td>
                            <dx:ASPxButton ID="btnEditCate" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Text="Cập Nhật"
                                OnClick="btnEditCate_Click" Width="100px">
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
