<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true"
    CodeBehind="WinProduct.aspx.cs" Inherits="OnlineAuctionSystem.WinProduct" %>

<%@ Register Src="UserControl/ctrlGallery.ascx" TagName="ctrlGallery" TagPrefix="uc1" %>
<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" HeaderText="Sản phẩm đấu giá thắng"
        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100%">
        <ContentPaddings Padding="14px" />
        <HeaderStyle Font-Bold="True" />
        <PanelCollection>
            <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
            <div align="center">
                <asp:GridView ID="gvProduct" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" PageSize="5" Width="100%" 
                    OnPageIndexChanging="gvProduct_PageIndexChanging" 
                    OnSelectedIndexChanging="gvProduct_SelectedIndexChanging" 
                    EmptyDataText="Xin lỗi, hiện tại bạn chưa thắng được sản phẳm nào!">
                    <Columns>
                        <asp:BoundField DataField="ProId" HeaderText="Mã Sản Phẩm" >
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ProName" HeaderText="Tên Sản Phẩm" />
                        <asp:BoundField DataField="TimePosted" 
                            DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" HeaderText="Ngày Thắng" />
                        <asp:BoundField DataField="CurrentPrice" HeaderText="Giá Thắng" />
                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/Details.png" 
                            ShowSelectButton="True" HeaderText="Xem">
                        <ControlStyle Width="18px" />
                        <ItemStyle HorizontalAlign="Center" Width="85px" />
                        </asp:CommandField>
                    </Columns>
                    <EmptyDataRowStyle HorizontalAlign="Center" />
                </asp:GridView>
        </div>
                <dx:ASPxRoundPanel ID="panelDetail" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                    CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" HeaderText="Thông tin sản phẩm"
                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100%">
                    <ContentPaddings Padding="14px" />
                    <HeaderStyle Font-Bold="True" />
                    <PanelCollection>
                        <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                            <div style="width: 50%; float: left;">
                                <uc1:ctrlGallery ID="ctrlGallery1" runat="server" />
                            </div>
                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            Mã sản phẩm:
                                        </td>
                                        <td>
                                            <asp:Label ID="lblProId" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Tên sản phẩm:
                                        </td>
                                        <td>
                                            <asp:Label ID="lblProName" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Giá khởi điểm:
                                        </td>
                                        <td>
                                            <asp:Label ID="lblStartPrice" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Số lương:
                                        </td>
                                        <td>
                                            <asp:Label ID="lblAmount" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Ngày đăng:
                                        </td>
                                        <td>
                                            <asp:Label ID="lblDatePosted" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Người bán:
                                        </td>
                                        <td>
                                            <asp:Label ID="lblUsername" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Mô tả chi tiết:
                                        </td>
                                        <td style="margin-left: 40px">
                                            <asp:Label ID="lblDescription" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <dx:ASPxButton ID="btnPay" runat="server" Text="Thanh toán" 
                                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100px">
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxRoundPanel>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
