using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineAuctionSystem.DAL;
namespace OnlineAuctionSystem
{
    public partial class Login : System.Web.UI.Page
    {
        UsersDAL _dal = new UsersDAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null) Response.Redirect("Default.aspx");
            lblError.Text = "Vui lòng nhập Tài Khoản và Mật Khẩu của bạn!";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text == "")
            {
                lblError.Text = "Bạn chưa nhập nhập Tài Khoàn!";
                txtUsername.Focus();
            }
            else if(txtPassword.Text=="")
            {
                lblError.Text = "Bạn chưa nhập Mật Khẩu!";
                txtPassword.Focus();
            }
            else if (_dal.CheckLogin(txtUsername.Text, txtPassword.Text)==0)
            {
                lblError.Text = "Sai Tài Khoản hoặc Mật Khẩu, Vui lòng kiểm tra lại!";
                txtPassword.Focus();
            }
            else if (_dal.CheckLogin(txtUsername.Text, txtPassword.Text) == 1)
            {
                Session["user"] = txtUsername.Text;
                Response.Redirect("Admin/Default.aspx");
            }
            else
            {
                Session["user"] = txtUsername.Text;
                Response.Redirect("Default.aspx");
            }
        }
    }
}