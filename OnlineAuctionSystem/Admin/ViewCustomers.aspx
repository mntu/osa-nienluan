<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ViewCustomers.aspx.cs" Inherits="OnlineAuctionSystem.Admin.ViewCustomers" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRoundPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register src="AdminControl/ctrlViewCustomer.ascx" tagname="ctrlViewCustomer" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="panel" runat="server" 
    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
    GroupBoxCaptionOffsetY="-28px" HeaderText="Khách hàng" 
    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100%">
    <ContentPaddings Padding="14px" />
    <HeaderStyle Font-Bold="True" />
    <PanelCollection>
        <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
            <uc1:ctrlViewCustomer ID="ctrlViewCustomer1" runat="server" />
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxRoundPanel>
</asp:Content>
