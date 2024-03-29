﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlYourProduct.ascx.cs"
    Inherits="OnlineAuctionSystem.UserControl.ctrlYourProduct" %>
<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Src="ctrlGallery.ascx" TagName="ctrlGallery" TagPrefix="uc1" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<div align="center">
    <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" Width="100%"
        OnPageIndexChanging="gvProducts_PageIndexChanging" OnRowDeleting="gvProducts_RowDeleting"
        OnSelectedIndexChanging="gvProducts_SelectedIndexChanging" AllowPaging="True"
        EmptyDataText="Xin lỗi, hiện tại bạn chưa bán sản phẩm nào!" PageSize="5" 
        SelectedIndex="0">
        <Columns>
            <asp:BoundField DataField="ProId" HeaderText="Mã Sản Phẩm">
                <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="ProName" HeaderText="Tên Sản Phẩm" />
            <asp:BoundField DataField="DatePosted" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}"
                HeaderText="Ngày Đăng" />
            <asp:BoundField DataField="Status1" HeaderText="Trạng Thái" />
            <asp:CommandField ButtonType="Image" HeaderText="Chi Tiết" SelectImageUrl="~/images/Details.png"
                ShowSelectButton="True">
                <ControlStyle Height="18px" Width="18px" />
                <ItemStyle HorizontalAlign="Center" Width="65px" />
            </asp:CommandField>
            <asp:TemplateField HeaderText="Xóa" ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Delete"
                        ImageUrl="~/images/Delete.png" Text="Delete" OnClientClick="return confirm('Bạn có chắc muốn xóa sản phẩm này không?')" />
                </ItemTemplate>
                <ControlStyle Height="16px" Width="16px" />
                <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:TemplateField>
        </Columns>
        <EmptyDataRowStyle Font-Bold="False" HorizontalAlign="Center" />
    </asp:GridView>
</div>
<div style="float: left; width: 50%">
    <dx:ASPxRoundPanel ID="panelDetail" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
        Width="100%" HeaderText="Chi tiết sản phẩm">
        <ContentPaddings Padding="14px" PaddingBottom="10px" PaddingLeft="10px" PaddingRight="10px"
            PaddingTop="10px"></ContentPaddings>
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <div style="text-align: center; padding-left: 10px;">
                    <uc1:ctrlGallery ID="ctrlGallery1" runat="server" />
                </div>
                <div>
                    <table width="100%">
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
                                Thuộc Loại:
                            </td>
                            <td>
                                <asp:Label ID="lblCateName" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Mức Phí:
                            </td>
                            <td>
                                <asp:Label ID="lblFee" runat="server"></asp:Label>
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
                                Thời Gian:
                            </td>
                            <td>
                                <div>
                                    <span id="timelable"></span>
                                </div>
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
                        <tr>
                            <td colspan="2">
                                <dx:ASPxButton ID="btnEdit" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                    CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" Text="Thay đổi thông tin"
                                    Width="150px">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</div>
<div style="width: 50%">
    <dx:ASPxRoundPanel ID="panelListing" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
        CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
        Width="100%" HeaderText="Thông tin đấu giá">
        <ContentPaddings PaddingBottom="2px" PaddingLeft="2px" PaddingRight="2px" PaddingTop="5px" />
        <ContentPaddings Padding="14px"></ContentPaddings>
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <asp:GridView ID="gvListing" runat="server" AutoGenerateColumns="False" Width="100%"
                    PageSize="20" OnPageIndexChanging="gvListing_PageIndexChanging" AllowPaging="True"
                    EmptyDataText="Chưa có người trả giá cho sản phẩm này">
                    <Columns>
                        <asp:BoundField DataField="CurrentPrice1" HeaderText="Giá Đấu"></asp:BoundField>
                        <asp:BoundField DataField="TimePosted" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}"
                            HeaderText="Thời Gian"></asp:BoundField>
                        <asp:BoundField DataField="Username" HeaderText="Đăng Bởi"></asp:BoundField>
                    </Columns>
                </asp:GridView>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
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
                        if(day<=0) remain= hour + " giờ "+minute+" phút "+second+" giây";
                        leave=leave-1;
                        if(leave<=0) 
                        {
                        document.getElementById("timelable").innerHTML="Hết giờ đấu giá";
                        }
                        else
                        {
                        document.getElementById("timelable").innerHTML=remain;
                        }
                    }
</script>
