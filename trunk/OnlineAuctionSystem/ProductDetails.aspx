<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true"
    CodeBehind="ProductDetails.aspx.cs" Inherits="OnlineAuctionSystem.ProductDetails" %>

<%@ Register Src="UserControl/ctrlGallery.ascx" TagName="ctrlGallery" TagPrefix="uc1" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="panel" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" HeaderText="Đấu giá sản phẩm"
        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100%">
        <ContentPaddings Padding="10px" PaddingBottom="5px" />
        <HeaderStyle Font-Bold="True" />
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <div style="width: 100%">
                    <div style="float: right; width: 40%">
                        <i style="font-size: 13px"><b>Lưu ý: </b>
                            <br />
                            <p>
                                - Giả của bạn đưa ra phải lớn hơn giá hiện tại.</p>
                            <p>
                                - Nếu bạn chiến thắng sản phẩm này sẽ được thêm vào mục "<b>Sản phẩm đấu giá thắng</b>"
                                trong menu "<b>Cá Nhân</b>" của bạn
                            </p>
                        </i>
                    </div>
                    <table cellpadding="0px" cellspacing="5px" width="60%">
                        <tr>
                            <td>
                                Thời gian còn lại:
                            </td>
                            <td>
                                <div id="timelable">
                                </div>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Giá hiện tại:</b>
                            </td>
                            <td>
                                <asp:Label ID="lblCurrentPrice" runat="server" Font-Bold="True" ForeColor="Green"></asp:Label>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr id="rowPrice">
                            <td>
                                Giá của bạn (VNĐ):
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtNewPrice" runat="server" Width="180px" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                    <ValidationSettings>
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <dx:ASPxButton ID="btnSubmit" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Text="Trả Giá"
                                    Width="100px" OnClick="btnSubmit_Click">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td colspan="2">
                                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPrice"
                                    Display="Dynamic" ErrorMessage="Bạn chưa nhập giá!" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNewPrice"
                                    Display="Dynamic" ErrorMessage="Giá phải là số!" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <dx:ASPxRoundPanel ID="panel1" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" HeaderText="Thông tin sản phẩm"
        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Width="100%">
        <ContentPaddings Padding="14px" />
        <HeaderStyle Font-Bold="True" />
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <div style="width: 50%; float: left;">
                    <uc1:ctrlGallery ID="ctrlGallery1" runat="server" />
                </div>
                <div>
                    <table>
                        <tr>
                            <td>
                                Mã sản phẩm:
                            </td>
                            <td>
                                <asp:Label ID="lblProId" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Tên sản phẩm:
                            </td>
                            <td>
                                <asp:Label ID="lblProName" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Giá khởi điểm:
                            </td>
                            <td>
                                <asp:Label ID="lblStartPrice" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Số lương:
                            </td>
                            <td>
                                <asp:Label ID="lblAmount" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Ngày đăng:
                            </td>
                            <td>
                                <asp:Label ID="lblDatePosted" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Người bán:
                            </td>
                            <td>
                                <asp:Label ID="lblUsername" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Lượt xem:
                            </td>
                            <td>
                                <asp:Label ID="lblNumview" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Mô tả chi tiết:
                            </td>
                            <td>
                                <asp:Label ID="lblDescription" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <script type="text/javascript">
                    var leave =<%=seconds %>;
                    CounterTimer();
                    var interv=setInterval(CounterTimer,1000);
                    function CounterTimer()
                    {
                        var day = Math.floor(leave / ( 60 * 60 * 24))
                        var hour = Math.floor(leave / 3600) - (day * 24)
                        var minute = Math.floor(leave / 60) - (day * 24 *60) - (hour * 60)
                        var second = Math.floor(leave) - (day * 24 *60*60) - (hour * 60 * 60) - (minute*60)
                        hour=hour<10 ? "0" + hour : hour;
                        minute=minute<10 ? "0" + minute : minute;
                        second=second<10 ? "0" + second : second;
                        var remain=day + " ngày   "+hour + ":"+minute+":"+second;
                        leave=leave-1;
                        if(leave<=0) 
                        {
                        document.getElementById("rowPrice").style.visibility="hidden";
                        document.getElementById("timelable").innerHTML="Đã hết giờ đấu giá"
                        }
                        else
                        {
                        document.getElementById("rowPrice").style.visibility="visible";
                        document.getElementById("timelable").innerHTML=remain;
                        }
                    }
                </script>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
