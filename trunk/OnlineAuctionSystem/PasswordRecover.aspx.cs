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
    public partial class PasswordRecover : System.Web.UI.Page
    {
        UsersDAL _dal = new UsersDAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("ctrlCategories1").Visible = true;
            Master.FindControl("ctrlPersonalMenu1").Visible = false;
            if (Session["user"] != null) Response.Redirect("Default.aspx");
            divForm.Visible = true;
            divResult.Visible = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            divForm.Visible = false;
            divResult.Visible = true;
            Users user=(Users)_dal.Select(txtUsername.Text);
            if (user != null && user.Question == cmbQuestion.SelectedItem.Value.ToString() && user.Answer.Trim() == txtAnswer.Text.Trim())
            {
                lblUsername.Text = "Tài Khoản: " + user.Username;               
                lblPassword.Text = user.Password;
                lblLablePass.Visible = true;
                lblUsername.Visible = true;
                lblPassword.Visible = true;
                lblError.Visible = false;
            }
            else
            {
                lblError.Visible = true;
                lblLablePass.Visible = false;
                lblUsername.Visible = false;
                lblPassword.Visible = false;
                lblError.Text = "Thông tin bạn cung cấp không đúng, Vui lòng kiểm tra lại!";
            }
        }
    }
}