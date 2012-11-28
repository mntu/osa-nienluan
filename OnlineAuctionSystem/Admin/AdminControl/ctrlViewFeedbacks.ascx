<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlViewFeedbacks.ascx.cs" Inherits="OnlineAuctionSystem.Admin.AdminControl.ctrlViewFeedbacks" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRoundPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<div style="width:100%;">
    <asp:GridView ID="gvFeedback" runat="server" AutoGenerateColumns="False" 
        Width="100%" AllowPaging="True" 
        EmptyDataText="Xin lỗi, hiện tại chưa có góp ý nào!" 
        onpageindexchanging="gvFeedback_PageIndexChanging" 
        onrowdeleting="gvFeedback_RowDeleting" 
        onselectedindexchanging="gvFeedback_SelectedIndexChanging">
        <Columns>
            <asp:BoundField DataField="FeedBackId" HeaderText="ID" Visible="False" />
            <asp:BoundField DataField="Title" HeaderText="Tiêu Đề" />
            <asp:BoundField DataField="DatePosted" DataFormatString="{0:dd/MM/yyyy}" 
                HeaderText="Ngày Gửi">
            <ItemStyle HorizontalAlign="Center" Width="125px" />
            </asp:BoundField>
            <asp:BoundField DataField="Username" HeaderText="Người Gửi">
            <ItemStyle HorizontalAlign="Center" Width="125px" />
            </asp:BoundField>
            <asp:CommandField ButtonType="Image" HeaderText="Xem" 
                SelectImageUrl="~/images/Details.png" ShowSelectButton="True">
            <ControlStyle Width="18px" />
            <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:CommandField>
            <asp:TemplateField AccessibleHeaderText="Xóa" HeaderText="Xóa" 
                ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                        CommandName="Delete" ImageUrl="~/images/Delete.png" Text="Delete" OnClientClick="return confirm('Bạn có chắc muốn xóa góp ý này?')" />
                </ItemTemplate>
                <ControlStyle Width="16px" />
                <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
<dx:ASPxRoundPanel ID="panelContent" runat="server" 
    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
    GroupBoxCaptionOffsetY="-28px" HeaderText="Nội Dung:" 
    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100%">
    <ContentPaddings Padding="14px" />
    <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    <asp:Label ID="lblContent" runat="server" Text="Label"></asp:Label>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>
