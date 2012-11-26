<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlViewProducts.ascx.cs"
    Inherits="OnlineAuctionSystem.UserControl.ctrlViewProducts" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%
    imgImage.ImageUrl = this.imgUrl;
    lblProName.Text = proName;
    lblPrice.Text = price;
%>
<div style="float: left; width: 170px; margin: 2px; padding: 5px; border: 0.5px dashed #99CCFF;
    display: block; text-align: center;">
    <div style="width: 100%; margin-bottom: 5px;">
        <dx:ASPxLabel ID="lblProName" runat="server" Font-Bold="True" Font-Size="14px" Width="150px"
            Text="" Wrap="True">
        </dx:ASPxLabel>
    </div>
    <asp:Image ID="imgImage" runat="server" Height="150px" Width="150px" />
    <div style="width: 100%; margin-top: 5px;">
        <asp:Label ID="lblPrice" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    </div>
    <div id="<%=proId %>" style="width: 100%; margin-bottom: 5px;">
    </div>
    <div id="Div<%=proId %>" style="text-align:center">
    <a href="ProductDetails.aspx?ProId=<%=proId %>"><button type="button">Đấu Giá</button></a>
    </div>
    <div id="timeOut<%=proId %>" style="color:red;font-weight:bold;">
    Đã Hết Giờ Đấu Giá
    </div>
</div>
<script type="text/javascript">
var leave<%=proId %> =<%=seconds %>;
CounterTimer();
var interv=setInterval(CounterTimer,1000);
function CounterTimer()
{
    var day = Math.floor(leave<%=proId %> / ( 60 * 60 * 24))
    var hour = Math.floor(leave<%=proId %> / 3600) - (day * 24)
    var minute = Math.floor(leave<%=proId %> / 60) - (day * 24 *60) - (hour * 60)
    var second = Math.floor(leave<%=proId %>) - (day * 24 *60*60) - (hour * 60 * 60) - (minute*60)
    hour=hour<10 ? "0" + hour : hour;
    minute=minute<10 ? "0" + minute : minute;
    second=second<10 ? "0" + second : second;
    var remain=day + " ngày   "+hour + ":"+minute+":"+second;
    if(day<=0) remain= hour + " giờ "+minute+" phút "+second+" giây";
    leave<%=proId %>=leave<%=proId %>-1;
    document.getElementById("<%=proId %>").innerHTML=remain;
    if(leave<%=proId %><=0) 
    {
    document.getElementById("Div<%=proId %>").style.display="none";
    document.getElementById("timeOut<%=proId %>").style.display="block";
    document.getElementById("<%=proId %>").style.display="none";
    }
    else
    {
    document.getElementById("Div<%=proId %>").style.display="block";
    document.getElementById("timeOut<%=proId %>").style.display="none";
    document.getElementById("<%=proId %>").style.display="block";
    }
}
</script>
