<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlViewCategories.ascx.cs"
    Inherits="OnlineAuctionSystem.Admin.AdminControl.ctrlViewCategories" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<dx:ASPxButton ID="btnAddCate" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Text="Thêm Loại Mới"
    Width="120px" onclick="btnAddCate_Click">
</dx:ASPxButton>
<br />
<asp:GridView ID="gvCate" runat="server" AllowPaging="True" AutoGenerateColumns="False"
    EmptyDataText="Xin lỗi, hiện tại chưa có loại sản phẩm nào!" Width="100%" onpageindexchanging="gvCate_PageIndexChanging" 
    onrowdeleting="gvCate_RowDeleting" 
    onselectedindexchanging="gvCate_SelectedIndexChanging">
    <Columns>
        <asp:BoundField DataField="CateID" HeaderText="ID" Visible="False" />
        <asp:BoundField DataField="CateName" HeaderText="Tên loại" >
        <ItemStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="Fee" HeaderText="Mức Phí (%)" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:CommandField ButtonType="Image" HeaderText="Sửa"
            ShowSelectButton="True" SelectImageUrl="~/Admin/images/edit.png">
            <ControlStyle Width="18px" />
            <ItemStyle HorizontalAlign="Center" Width="50px" />
        </asp:CommandField>
        <asp:TemplateField HeaderText="Xóa" ShowHeader="False">
            <ItemTemplate>
                <asp:ImageButton ID="imgDeleteCate" runat="server" CausesValidation="False" CommandName="Delete"
                    Height="16px" ImageUrl="~/Admin/images/Delete.png" OnClientClick="return confirm('Bạn có chắc muốn xóa loại này?')"
                    Width="16px" />
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" Width="50px" />
        </asp:TemplateField>
    </Columns>
</asp:GridView>
