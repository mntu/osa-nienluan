<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="Personal.aspx.cs" Inherits="OnlineAuctionSystem.Personal" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRoundPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" 
        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
        GroupBoxCaptionOffsetY="-28px" 
        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100%" 
        HeaderText="Thông tin chung">
        <ContentPaddings Padding="14px" />
        <HeaderStyle Font-Bold="True" />
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <div style="float:left;width:50%">
                    
                    <p><asp:Label ID="lblFullname" runat="server" Text="Label" Font-Size="14pt"></asp:Label>
                    <br /></p>
                    <p><asp:Label ID="lblEmail" runat="server" Text="Label" Font-Size="14pt"></asp:Label>
                    <br /></p>
                    <p><asp:Label ID="lblPhone" runat="server" Text="Label" Font-Size="14pt"></asp:Label>
                    <br /></p>
                    <p><asp:Label ID="lblCreditCard" runat="server" Text="Label" Font-Size="14pt"></asp:Label>
                    <br /></p>
                    <p><asp:Label ID="lblAddress" runat="server" Text="Label" Font-Size="14pt"></asp:Label>
                    
                </div>
                <div>
                <p><asp:Label ID="lblProductSell" runat="server" Text="Label" Font-Size="14pt"></asp:Label>
                <br /></p>
                <p><asp:Label ID="lblProductList" runat="server" Text="Label" Font-Size="14pt"></asp:Label>
                <br /></p>
                <p><asp:Label ID="lblProductWin" runat="server" Text="Label" Font-Size="14pt"></asp:Label></p>
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
