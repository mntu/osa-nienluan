<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlCategories.ascx.cs"
    Inherits="OnlineAuctionSystem.UserControl.ctrlCategories" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
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
            <table width="100%">
                <tr>
                    <td>
                        <dx:ASPxTextBox ID="txtKey" runat="server" Width="100%" 
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                            NullText="Nhập từ khóa...." 
                            SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            <ValidationSettings>
                                <ErrorFrameStyle ImageSpacing="4px">
                                    <ErrorTextPaddings PaddingLeft="4px" />
                                </ErrorFrameStyle>
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
                    <td><asp:Button
                        ID="btnSearch" runat="server" Text="Tìm Kiếm" CssClass="art-button" 
                            onclick="btnSearch_Click" /></td>
                </tr>
            </table>
                    
            </div>
        </div>
    </div>
</div>
