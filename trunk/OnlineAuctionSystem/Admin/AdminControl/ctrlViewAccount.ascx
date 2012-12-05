<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlViewAccount.ascx.cs"
    Inherits="OnlineAuctionSystem.Admin.AdminControl.ctrlViewAccount" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<dx:ASPxButton ID="btnAdd" runat="server" Text="Thêm Tài Khoản Mới" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="150px"
    OnClick="btnAdd_Click">
</dx:ASPxButton>
<div style="padding-top: 10px">
    <asp:GridView ID="gvAccount" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        Width="100%" EmptyDataText="Xin lỗi, hiện tại không có tài khoản nào khác!" OnPageIndexChanging="gvAccount_PageIndexChanging"
        OnRowDeleting="gvAccount_RowDeleting" OnSelectedIndexChanging="gvAccount_SelectedIndexChanging">
        <Columns>
            <asp:BoundField DataField="Username" HeaderText="Tài Khoản" />
            <asp:BoundField DataField="Fullname" HeaderText="Họ Tên" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="Phone" HeaderText="Điện Thoại" />
            <asp:CommandField ButtonType="Image" HeaderText="Sửa" SelectImageUrl="~/Admin/images/edit.png"
                ShowSelectButton="True">
                <ControlStyle Width="18px" />
                <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:CommandField>
            <asp:TemplateField HeaderText="Xóa" ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Delete"
                        ImageUrl="~/Admin/images/Delete.png" Text="Delete" OnClientClick="return confirm('Bạn có chắc muốn xóa tài khoản này?')" />
                </ItemTemplate>
                <ControlStyle Width="16px" />
                <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:TemplateField>
        </Columns>
        <EmptyDataRowStyle HorizontalAlign="Center" />
    </asp:GridView>
</div>
