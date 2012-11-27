<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true"
    CodeBehind="ListProduct.aspx.cs" Inherits="OnlineAuctionSystem.ListProduct" %>

<%@ Register Src="UserControl/ctrlViewProducts.ascx" TagName="ctrlViewProducts" TagPrefix="uc1" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
                                        <%
                                            OnlineAuctionSystem.DAL.ListingsDAL _dalList = new OnlineAuctionSystem.DAL.ListingsDAL();
                                            OnlineAuctionSystem.DAL.ProductsDAL _dalPro = new OnlineAuctionSystem.DAL.ProductsDAL();
                                            System.Data.DataTable dtList = _dalList.SelectByUsername(Session["user"].ToString());
                                            if (dtList != null && dtList.Rows.Count > 0)
                                            {
                                                for (int i = 0; i < dtList.Rows.Count; i++)
                                                {
                                                    OnlineAuctionSystem.Entities.Products product = new OnlineAuctionSystem.Entities.Products();
                                                    product = (OnlineAuctionSystem.Entities.Products)_dalPro.Select(Convert.ToInt32(dtList.Rows[i]["ProId"]));
                                                    ctrlViewProducts1.ID = "ctrlViewProduct" + i;
                                                    ctrlViewProducts1.proId = product.ProId;
                                                    ctrlViewProducts1.proName = product.ProName;
                                                    ctrlViewProducts1.price = _dalPro.ConvertPrice(product.StarPrice);
                                                    ctrlViewProducts1.imgUrl = @"~/ProductImg/" + product.Username + @"/" + product.ProId + @"/1.jpg";
                                                    ctrlViewProducts1.seconds = (_dalPro.GetEndTime(product.ProId) - _dalPro.GetStartTime()).TotalSeconds;
                                        %>
                                    <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" Width="100%" 
        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
        GroupBoxCaptionOffsetY="-28px" 
        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" HeaderText="Sản phẩm đang theo dõi">
        <ContentPaddings Padding="5px" />
                                        <HeaderStyle Font-Bold="True" />
        <PanelCollection>
<dx:PanelContent ID="PanelContent2" runat="server" SupportsDisabledAttribute="True">
                                    <div>
                                        <uc1:ctrlViewProducts ID="ctrlViewProducts1" runat="server" />
                                         </div>
                                                                                 </dx:PanelContent>
</PanelCollection>
    </dx:ASPxRoundPanel>

                                        <%
            }
        }
        %>
                                           
        <%
        else
        { 
                                        %>
                                        
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" 
        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
        GroupBoxCaptionOffsetY="-28px" 
        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" HeaderText="Sản phẩm đang theo dõi">
        <ContentPaddings Padding="14px" />
        <HeaderStyle Font-Bold="True" />
        <PanelCollection>
<dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                                        <div style="text-align: center;">
                                            Xin lỗi, hiện tại bạn chưa theo dõi sản phẩm nào!
                                        </div>
                                        </dx:PanelContent>
</PanelCollection>
    </dx:ASPxRoundPanel>
                                        <%
                                            }
        
                                        %>

</asp:Content>
