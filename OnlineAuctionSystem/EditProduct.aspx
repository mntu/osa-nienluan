<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="OnlineAuctionSystem.EditProduct" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRoundPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register src="UserControl/ctrlEditProduct.ascx" tagname="ctrlEditProduct" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="panel" runat="server" 
        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
        GroupBoxCaptionOffsetY="-28px" HeaderText="Cập nhật thông tin sản phẩm" 
        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100%">
        <contentpaddings padding="14px" />
        <HeaderStyle Font-Bold="True" />
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <uc1:ctrlEditProduct ID="ctrlEditProduct1" runat="server" />
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
