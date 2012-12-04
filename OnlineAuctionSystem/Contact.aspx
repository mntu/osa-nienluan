<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true"
    CodeBehind="Contact.aspx.cs" Inherits="OnlineAuctionSystem.Contact" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" HeaderText="Thông tin liên hệ"
        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100%">
        <ContentPaddings Padding="14px" />
        <HeaderStyle Font-Bold="True" />
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <div style="margin: 10px" align="center">
                    <img src="images/abc-logo.png" />
                </div>
                <div style="font-size: 12pt;">
                    <p>
                        - Công ty TNHH ABC tọa lạc tại số 01 Lý Tự Trọng, Q. Ninh Kiều, TP Cần Thơ.</p>
                    <p>
                        - Với hơn 10 năm tổ chức đấu giá sản phẩm chúng tôi cảm kết tạo ra những phiên đấu
                        giá công bằng, chính xác.</p>
                    <p>
                        - Chúng tôi sẽ mang lại lợi ích tốt nhất cho khách hàng với chi phí thất nhất.</p>
                    <p>
                        - Được phục vụ quí khách hàng là niềm vinh hạnh của chúng tôi.</p>
                    <div style="padding-top: 5px;float: left">
                        - Hỗ trợ trực tuyến:</div>
                    <div style="padding: 5px; float: left;text-align:center;">
                        <a href='ymsgr:sendim?kyky_1314925' class="link">
                            <img src="http://opi.yahoo.com/online?u=kyky_1314925&m=g&t=2" border="0">
                            <br />
                            Mai Nhựt Tự</a>
                    &nbsp;&nbsp;</div>
                    <div style="padding: 5px; float: left;text-align:center;">
                        <a href='ymsgr:sendim?kyky_1314925' class="link">
                            <img src="http://opi.yahoo.com/online?u=tranvohoaian_maiyeumainho&m=g&t=2" border="0">
                            <br />
                            Trần Võ Hoài An</a>
                    &nbsp;&nbsp;</div>
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
