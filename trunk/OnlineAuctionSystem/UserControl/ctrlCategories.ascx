<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlCategories.ascx.cs"
    Inherits="OnlineAuctionSystem.UserControl.ctrlCategories" %>
<div class="art-box art-vmenublock">
    <div class="art-box-body art-vmenublock-body">
        <div class="art-bar art-vmenublockheader">
            <h3 class="t">
                Nhóm Sản Phẩm</h3>
        </div>
        <div class="art-box art-vmenublockcontent">
            <div class="art-box-body art-vmenublockcontent-body">
                <ul class="art-vmenu">
                    <% OnlineAuctionSystem.DAL.CategoriesDAL dal = new OnlineAuctionSystem.DAL.CategoriesDAL();
                       System.Data.DataTable tmp = dal.Select();
                       for (int i = 0; i < tmp.Rows.Count; i++)
                       {
                           if (Request.QueryString["CateId"] == tmp.Rows[i]["CateId"].ToString())
                           {
                    %>
                    <li><a href="Default.aspx?CateId=<%=tmp.Rows[i]["CateId"] %>" class="active">
                        <%=tmp.Rows[i]["CateName"]%></a> </li>
                    <% }
                           else
                           {
                    %>
                    <li><a href="Default.aspx?CateId=<%=tmp.Rows[i]["CateId"] %>">
                        <%=tmp.Rows[i]["CateName"]%></a> </li>
                    <%
                           }
                       }
                    %>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="art-box art-block">
    <div class="art-box-body art-block-body">
        <div class="art-box art-blockcontent">
            <div class="art-box-body art-blockcontent-body">
                <div>
                    <input type="text" value="" name="email" id="s" style="width: 95%;" />
                    <input type="button" name="search" class="art-button" value="Tìm Kiếm" />
                </div>
            </div>
        </div>
    </div>
</div>
