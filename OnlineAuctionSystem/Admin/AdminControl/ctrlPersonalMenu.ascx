<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlPersonalMenu.ascx.cs"
    Inherits="OnlineAuctionSystem.Admin.AdminControl.ctrlPersonalMenu" %>
<div class="art-box art-vmenublock">
    <div class="art-box-body art-vmenublock-body">
        <div class="art-bar art-vmenublockheader">
            <h3 class="t">
                Menu Cá Nhân</h3>
        </div>
        <div class="art-box art-vmenublockcontent">
            <div class="art-box-body art-vmenublockcontent-body">
                <ul class="art-vmenu">
                    <li><a href="ChangeProfile.aspx">Thông Tin Tài Khoản</a></li>
                    <li><a href="ChangePassword.aspx">Đổi Mật Khẩu</a></li>
                    <%
                        if (Session["admin"].ToString().Equals("admin", StringComparison.CurrentCultureIgnoreCase))
                        {
                    %>
                    <li><a href="ViewAccount.aspx">Tài Khoản Quản Trị</a></li>
                    <% 
                        } 
                    %>
                </ul>
            </div>
        </div>
    </div>
</div>
