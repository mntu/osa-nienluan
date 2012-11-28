<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="OnlineAuctionSystem.Admin.Default" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 50%; float: left">
        <dx:ASPxRoundPanel ID="panel1" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
            CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
            HeaderText="Công cụ quản trị" Width="100%">
            <ContentPaddings Padding="14px" />
            <HeaderStyle Font-Bold="True" />
            <PanelCollection>
                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                    <table width="100%">
                        <tr>
                            <td style="height:86px">
                                <a href="ViewCategories.aspx" class="link">
                                    <div style="width: 75px; text-align: center;">
                                        <img src="images/icon-catetogories.png" width="50" />
                                        <div>
                                            Loại Hàng</div>
                                    </div>
                                </a>
                            </td>
                            <td>
                                <a href="ViewProducts.aspx" class="link">
                                    <div style="width: 75px; text-align: center;">
                                        <img src="images/icon-product.png" width="50" />
                                        <div>
                                           Sản Phẩm</div>
                                    </div>
                                </a>
                            </td>
                            <td>
                                <a href="ViewFeedbacks.aspx" class="link">
                                    <div style="width: 75px; text-align: center;">
                                        <img src="images/icon-feedback.png" width="50" />
                                        <div>
                                            Góp Ý</div>
                                    </div>
                                </a>
                            </td>
                            <td>
                                <a href="ViewCustomers.aspx" class="link">
                                    <div style="width: 75px; text-align: center;">
                                        <img src="images/icon-customer.png" width="50" />
                                        <div>
                                           Khách Hàng</div>
                                    </div>
                                </a>
                            </td>
                        </tr>
                    </table>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
        Width="50%" HeaderText="Thông tin chung">
        <ContentPaddings Padding="14px" />
        <HeaderStyle Font-Bold="True" />
        <PanelCollection>
            <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                <p>
                    <asp:Label ID="lblTotalUser" runat="server" Font-Size="14pt"></asp:Label>
                    <br />
                </p>
                <p>
                    <asp:Label ID="lblActivePro" runat="server" Font-Size="14pt"></asp:Label>
                    <br />
                </p>
                <p>
                    <asp:Label ID="lblDeactivePro" runat="server" Font-Size="14pt"></asp:Label>
                    <br />
                </p>
                <p>
                    <asp:Label ID="lblTotalPro" runat="server" Font-Size="14pt"></asp:Label></p>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
