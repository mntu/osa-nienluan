<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineAuctionSystem.ViewProducts" %>
<%@ Register src="UserControl/ctrlViewProducts.ascx" tagname="ctrlViewProducts" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        OnlineAuctionSystem.DAL.ProductsDAL _dal = new OnlineAuctionSystem.DAL.ProductsDAL();
        System.Data.DataTable tmp;
        if (Request.QueryString["CateId"] == null)
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
            for (int i = 0; i < tmp.Rows.Count; i++)
            {
                ctrlViewProducts1.ID = "ctrlViewProduct" + i;
                ctrlViewProducts1.proId = Convert.ToInt32(tmp.Rows[i]["ProId"]);
                ctrlViewProducts1.proName = tmp.Rows[i]["ProName"] + "";
                string str = Convert.ToInt64(tmp.Rows[i]["StartPrice"]) + "";
                string price = "";
                for (int j = str.Length - 1, k = 0; j >= 0; j--, k++)
                {
                    if (k % 3 == 0 && k > 0)
                        price = str[j] + "." + price;
                    else
                        price = str[j] + price;
                }
                price += " VNĐ";
                ctrlViewProducts1.price = price;
                ctrlViewProducts1.imgUrl = @"~/ProductImg/" + tmp.Rows[i]["Username"] + @"/" + ctrlViewProducts1.proId + @"/1.jpg";
                ctrlViewProducts1.seconds = (_dal.GetEndTime(ctrlViewProducts1.proId) - _dal.GetStartTime()).TotalSeconds;
                %>
                <uc1:ctrlViewProducts ID="ctrlViewProducts1" runat="server" />
                <%
            }
        }
        else
        { 
            %>
            <div align="center">Xin lỗi, Hiện tại không có sản phẩm cho loại này!</div>
            <%
        }
     %>
    
</asp:Content>
