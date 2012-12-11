<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlViewCustomer.ascx.cs"
    Inherits="OnlineAuctionSystem.Admin.AdminControl.ViewCustomer" %>
<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<div style="width: 100%;">
    <asp:GridView ID="gvCustomer" runat="server" AutoGenerateColumns="False" Width="100%"
        AllowPaging="True" 
        EmptyDataText="Xin lỗi, hiện tại chưa có khách hàng nào!" OnPageIndexChanging="gvCustomer_PageIndexChanging"
        OnRowDeleting="gvCustomer_RowDeleting" 
        OnSelectedIndexChanging="gvCustomer_SelectedIndexChanging" SelectedIndex="0">
        <Columns>
            <asp:BoundField DataField="Username" HeaderText="Tài Khoản" />
            <asp:BoundField DataField="Fullname" HeaderText="Họ Tên" />
            <asp:BoundField DataField="Email" HeaderText="Email">
                <ItemStyle HorizontalAlign="Center" Width="125px" />
            </asp:BoundField>
            <asp:BoundField DataField="Phone" HeaderText="Điện Thoại">
                <ItemStyle HorizontalAlign="Center" Width="125px" />
            </asp:BoundField>
            <asp:CommandField ButtonType="Image" HeaderText="Xem" SelectImageUrl="~/images/Details.png"
                ShowSelectButton="True">
                <ControlStyle Width="18px" />
                <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:CommandField>
            <asp:TemplateField AccessibleHeaderText="Xóa" HeaderText="Xóa" ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Delete"
                        ImageUrl="~/images/Delete.png" Text="Delete" OnClientClick="return confirm('Bạn có chắc muốn xóa khách hàng này?')" />
                </ItemTemplate>
                <ControlStyle Width="16px" />
                <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
<dx:ASPxRoundPanel ID="panelDetail" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
    CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" HeaderText="Thông tin chi tiết:"
    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100%">
    <ContentPaddings Padding="14px" />
    <PanelCollection>
        <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
            <table style="font-size:11pt" cellpadding="3px">
                <tr>
                    <td>Tài khoản:</td>
                    <td>
                        <asp:Label ID="lblUsername" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Họ tên:</td>
                    <td>
                        <asp:Label ID="lblFullname" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <asp:Label ID="lblEmail" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Số điện thoại:</td>
                    <td>
                        <asp:Label ID="lblPhone" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Địa chỉ:</td>
                    <td>
                        <asp:Label ID="lblAddress" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Địa chỉ phụ:</td>
                    <td>
                        <asp:Label ID="lblSubAddress" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Tổng sản phẩm:</td>
                    <td>
                        <asp:Label ID="lblNumPro" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxRoundPanel>
