<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="OnlineAuctionSystem.Admin.ViewProducts" %>
<%@ Register assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRoundPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register src="AdminControl/ctrlViewProducts.ascx" tagname="ctrlViewProducts" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="panel" runat="server" 
    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
    GroupBoxCaptionOffsetY="-28px" HeaderText="Sản phẩm" 
    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100%">
    <ContentPaddings Padding="14px" />
    <HeaderStyle Font-Bold="True" />
    <PanelCollection>
        <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
            <uc1:ctrlViewProducts ID="ctrlViewProducts1" runat="server" />
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxRoundPanel>
</asp:Content>
