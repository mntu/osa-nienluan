using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineAuctionSystem.DAL;
using OnlineAuctionSystem.Entities;
namespace OnlineAuctionSystem.Admin
{
    public partial class EditAccount : System.Web.UI.Page
    {
        UsersDAL _dal = new UsersDAL();
        Users user;
        string username;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null) Response.Redirect("../Default.aspx");
            if (Request.QueryString["id"] == null) Response.Redirect("../Default.aspx");
            username = Request.QueryString["id"];
            user = (Users)_dal.Select(username);
            if (!IsPostBack)
            {
                panel.HeaderText += username;
                txtFullname.Text = user.Fullname;
                txtEmail.Text = user.Email;
                txtPhone.Text = user.Phone;
                txtAddress.Text = user.Address;
            }
        }

        protected void btnResetPass_Click(object sender, EventArgs e)
        {
            user.Password = "user";
            if (_dal.Update(user) > 0)
            {
                lblError.Text = "Mật khẩu đã được đặt lại là: <b>user</b>";
                lblError.ForeColor = System.Drawing.Color.Green;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            user.Fullname=txtFullname.Text;
            user.Email=txtEmail.Text;
            user.Phone= txtPhone.Text;
            user.Address=txtAddress.Text;
            if (_dal.Update(user) > 0)
            {
                lblError.Text = "Thông tin đã được cập nhật thành công!";
                lblError.ForeColor = System.Drawing.Color.Green;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewAccount.aspx");
        }
    }
}