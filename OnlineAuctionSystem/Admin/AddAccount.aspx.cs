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
    public partial class AddAccount : System.Web.UI.Page
    {
        UsersDAL _dal = new UsersDAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null) Response.Redirect("../Default.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewAccount.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Users newUser = new Users();
            newUser.Username = txtUsername.Text;
            newUser.Password = txtPassword.Text;
            newUser.Fullname = txtFullname.Text;
            newUser.Email = txtEmail.Text;
            newUser.Phone = txtPhone.Text;
            newUser.Address = txtAddress.Text;
            newUser.RoleId = 1;
            if (_dal.CheckUsername(newUser.Username))
            {
                lblError.Text = "Tên đăng nhập đã tồn tại!";
                txtUsername.Focus();
                return;
            }
            if (_dal.CheckEmail(newUser.Email))
            {
                lblError.Text = "Email đã đã được sử dụng!";
                txtEmail.Focus();
                return;
            }
            if (_dal.Insert(newUser) > 0) Response.Redirect("ViewAccount.aspx");
        }
    }
}