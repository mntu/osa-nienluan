<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="Personal.aspx.cs" Inherits="OnlineAuctionSystem.Personal" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRoundPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" 
        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
        GroupBoxCaptionOffsetY="-28px" 
        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="200px">
        <ContentPaddings Padding="14px" />
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
             <asp:GridView ID="gvCreditCard" runat="server" AutoGenerateColumns="True">
                </asp:GridView>         
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
