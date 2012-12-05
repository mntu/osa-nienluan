<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true"
    CodeBehind="AddCategory.aspx.cs" Inherits="OnlineAuctionSystem.Admin.AddCategory" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="rpAddCate" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
        Width="100%">
        <ContentPaddings Padding="14px" />
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <table align="center">
                    <tr>
                        <td style="width: 56px; height: 20px;">
                            &nbsp;
                        </td>
                        <td colspan="2" style="height: 20px">
                            <asp:Label ID="lblError" runat="server" ForeColor="Red" Text="lblError"></asp:Label>
                        </td>
                        <td style="width: 251px; height: 20px;">
                            &nbsp;
                        </td>
                        <td style="height: 20px">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 56px">
                            Tên loại:
                        </td>
                        <td colspan="2">
                            <dx:ASPxTextBox ID="txtCateName" runat="server" MaxLength="20" Width="210px">
                            </dx:ASPxTextBox>
                        </td>
                        <td style="width: 251px">
                            &nbsp;
                            <asp:RequiredFieldValidator ID="rfvCateName" runat="server" Display="Dynamic"
                                ErrorMessage="Vui lòng nhập tên loại!" ForeColor="Red" 
                                ControlToValidate="txtCateName"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 56px">
                            Phí:
                        </td>
                        <td colspan="2">
                            <dx:ASPxTextBox ID="txtFee" runat="server" Width="210px">
                            </dx:ASPxTextBox>
                        </td>
                        <td style="width: 251px">
                            &nbsp;
                            <asp:RequiredFieldValidator ID="rfvFee" runat="server" Display="Dynamic"
                                ErrorMessage="Vui lòng nhập phí!" ForeColor="Red" 
                                ControlToValidate="txtFee"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revFee" runat="server" Display="Dynamic"
                                ErrorMessage="Vui lòng nhập phí là số!" ForeColor="Red" 
                                ValidationExpression="\d+" ControlToValidate="txtFee"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 56px">
                            &nbsp;
                        </td>
                        <td>
                            <dx:ASPxButton ID="btnCancel" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Text="Hủy bỏ"
                                OnClick="btnCancel_Click" Width="100px">
                            </dx:ASPxButton>
                        </td>
                        <td style="width: 100px">
                            <dx:ASPxButton ID="btnAddCate" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Text="Thêm loại"
                                OnClick="btnAddCate_Click" Width="100px">
                            </dx:ASPxButton>
                        </td>
                        <td style="width: 251px">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
