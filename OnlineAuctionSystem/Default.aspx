<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="OnlineAuctionSystem.ViewProducts" %>

<%@ Register Src="UserControl/ctrlViewProducts.ascx" TagName="ctrlViewProducts" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        OnlineAuctionSystem.DAL.ProductsDAL _dal = new OnlineAuctionSystem.DAL.ProductsDAL();
        System.Data.DataTable tmp;
        if (Request.QueryString["key"] != null)
        {
            if (Request.QueryString["key"] == "") tmp = _dal.Select();
            else tmp = _dal.FindProduct(Request.QueryString["key"]);

        }
        else if (Request.QueryString["CateId"] == null)
        {
            tmp = _dal.Select();
        }
        else
        {
            int cateId = Convert.ToInt32(Request.QueryString["CateId"]);
            tmp = _dal.SelectByCate(cateId);
        }
        if (tmp != null && tmp.Rows.Count > 0)
        {
            if (tmp.Rows.Count <= 12)
            {
                for (int i = 0; i < tmp.Rows.Count; i++)
                {
                    ctrlViewProducts1.ID = "ctrlViewProduct" + i;
                    ctrlViewProducts1.proId = Convert.ToInt32(tmp.Rows[i]["ProId"]);
                    ctrlViewProducts1.proName = tmp.Rows[i]["ProName"] + "";
                    ctrlViewProducts1.price = _dal.ConvertPrice(Convert.ToDecimal(tmp.Rows[i]["StartPrice"]));
                    ctrlViewProducts1.imgUrl = @"~/ProductImg/" + tmp.Rows[i]["Username"] + @"/" + ctrlViewProducts1.proId + @"/1.jpg";
                    ctrlViewProducts1.seconds = (_dal.GetEndTime(ctrlViewProducts1.proId) - _dal.GetStartTime()).TotalSeconds;
    %>
    <uc1:ctrlViewProducts ID="ctrlViewProducts1" runat="server" />
    <%
                }
            }
            else
            {
                int numPage = (tmp.Rows.Count / 12)+1;
                if (Request.QueryString["page"] == null)
                {
                    for (int i = 0; i < 12; i++)
                    {
                        ctrlViewProducts2.ID = "ctrlViewProduct" + i;
                        ctrlViewProducts2.proId = Convert.ToInt32(tmp.Rows[i]["ProId"]);
                        ctrlViewProducts2.proName = tmp.Rows[i]["ProName"] + "";
                        ctrlViewProducts2.price = _dal.ConvertPrice(Convert.ToDecimal(tmp.Rows[i]["StartPrice"]));
                        ctrlViewProducts2.imgUrl = @"~/ProductImg/" + tmp.Rows[i]["Username"] + @"/" + ctrlViewProducts2.proId + @"/1.jpg";
                        ctrlViewProducts2.seconds = (_dal.GetEndTime(ctrlViewProducts2.proId) - _dal.GetStartTime()).TotalSeconds;
    %>
    <uc1:ctrlViewProducts ID="ctrlViewProducts2" runat="server" />
    <%
                    }
    %>
    <div style="text-align:right;font-size:14px;padding:10px">
        <b>Trang: [1]
            <%
                    for (int i = 2; i <= numPage; i++)
                    {
            %>
            <a href="Default.aspx?page=<%=i %>" class="lkPage">
                [<%=i%>]</a>
            <%
                    }
            %>
        </b>
    </div>
    <%
                }
                else
                {
                    int page = Convert.ToInt32(Request.QueryString["page"]);
                    int start = (page - 1) * 12;
                    int end = ((page * 12) <= tmp.Rows.Count) ? (page * 12) : tmp.Rows.Count;
                    for (int i = start; i < end; i++)
                    {
                        ctrlViewProducts3.ID = "ctrlViewProduct" + i;
                        ctrlViewProducts3.proId = Convert.ToInt32(tmp.Rows[i]["ProId"]);
                        ctrlViewProducts3.proName = tmp.Rows[i]["ProName"] + "";
                        ctrlViewProducts3.price = _dal.ConvertPrice(Convert.ToDecimal(tmp.Rows[i]["StartPrice"]));
                        ctrlViewProducts3.imgUrl = @"~/ProductImg/" + tmp.Rows[i]["Username"] + @"/" + ctrlViewProducts3.proId + @"/1.jpg";
                        ctrlViewProducts3.seconds = (_dal.GetEndTime(ctrlViewProducts3.proId) - _dal.GetStartTime()).TotalSeconds;
    %>
    <uc1:ctrlViewProducts ID="ctrlViewProducts3" runat="server" />
    <%
                    }
    %>
    <div style="text-align:right;font-size:14px;padding:10px">
        <b>Trang: 
            <%
                    for (int i = 1; i <= numPage; i++)
                    {
                        if (i == page)
                        {
                            %>
                        <span>[<%=i%>]</span>
            <%
                        }
                        else
                        {
            %>
            <a href="Default.aspx?page=<%=i %>" class="lkPage">
                [<%=i%>]</a>
            <%
                        }
                    }
            %>
        </b>
    </div>
    <%
                }
            }
        }
        else
        {
            if (Request.QueryString["key"] != null)
            {
    %>
    <div style="text-align: center;">
        Xin lỗi, không tìm thấy kết quả cho từ khóa <b>
            <%=Request.QueryString["key"]%></b></div>
    <%
            }
            else
            {
    %>
    <div style="text-align: center;">
        Xin lỗi, Hiện tại không có sản phẩm cho loại này!</div>
    <%
            }
        }
    %>
</asp:Content>
