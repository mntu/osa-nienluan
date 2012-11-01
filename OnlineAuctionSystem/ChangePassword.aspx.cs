using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineAuctionSystem.DAL;
using OnlineAuctionSystem.Entities;
namespace OnlineAuctionSystem
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        UsersDAL _dal = new UsersDAL();
        Users user;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null) Response.Redirect("Default.aspx");
            Master.FindControl("ctrlCategories1").Visible = false;
            Master.FindControl("ctrlPersonalMenu1").Visible = true;
            user = (Users)_dal.Select(Session["user"].ToString());
        }

        protected void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("Personal.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (user.Password != txtOldPass.Text)
            {
                lblError.Text = "Mật Khẩu cũ không đúng, Vui lòng kiểm tra lại!";
                return;
            }
            else
            {
                user.Password = txtNewPass.Text;
                if (_dal.Update(user) > 0)
                {
                    lblError.Text = "Mật khẩu đã được thay đổi thành công!";
                    lblError.ForeColor = System.Drawing.Color.Green;
                }
            }
        }
    }
}