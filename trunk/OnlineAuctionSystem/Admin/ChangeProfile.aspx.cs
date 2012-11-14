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
    public partial class ChangeProfile : System.Web.UI.Page
    {
        UsersDAL _dal = new UsersDAL();
        Users user;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null) Response.Redirect("~/Default.aspx");
            user = (Users)_dal.Select(Session["admin"].ToString());
            if (!IsPostBack)
            {
                txtFullname.Text = user.Fullname;
                txtEmail.Text = user.Email;
                txtPhone.Text = user.Phone;
                txtAddress1.Text = user.Address;
                txtAddress2.Text = user.SubAddress;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            user.Fullname = txtFullname.Text;
            user.Email = txtEmail.Text;
            user.Phone = txtPhone.Text;
            user.Address = txtAddress1.Text;
            user.SubAddress = txtAddress2.Text;
            if (_dal.Update(user) > 0)
            {
                lblError.Text = "Thông tin đã được cập nhật!";
                lblError.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblError.Text = "Lỗi, cập nhật thất bại!";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}