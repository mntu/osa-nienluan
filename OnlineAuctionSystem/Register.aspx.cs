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
    public partial class Register : System.Web.UI.Page
    {
        UsersDAL _dal = new UsersDAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("ctrlCategories1").Visible = true;
            Master.FindControl("ctrlPersonalMenu1").Visible = false;
            if (Session["user"] != null) Response.Redirect("Default.aspx");
            if (!IsPostBack)
            {
                divTerm.Visible = true;
                divPersonInfo.Visible = false;
                btnNext1.Enabled = false;
            }
        }

        protected void btnNext1_Click(object sender, EventArgs e)
        {
            divTerm.Visible = false;
            divPersonInfo.Visible = true;
            panel.DefaultButton = "btnRegister";
        }

        protected void chkAccept_CheckedChanged(object sender, EventArgs e)
        {
            if (chkAccept.Checked == true)
            {
                btnNext1.Enabled = true;
            }
            else
            {
                btnNext1.Enabled = false;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            divTerm.Visible = false;
            divPersonInfo.Visible = true;
            if (!captcha.IsValid)
            {
                lblError.Text = "Lỗi: Sai mã xác thực!";
                return;
            }
            else if (_dal.Select(txtUsername.Text) == null)
            {
                if (_dal.CheckEmail(txtEmail1.Text))
                {
                    lblError.Text = "Lỗi: Email đã được sử dụng!";
                    txtEmail1.Focus();
                    return;
                }
                Users newuser = new Users();
                newuser.Username = txtUsername.Text;
                newuser.Password = txtPassword1.Text;
                newuser.Fullname = txtFullname.Text;
                newuser.Email = txtEmail1.Text;
                newuser.Phone = txtPhone.Text;
                newuser.Address = txtAddress1.Text;
                newuser.SubAddress = txtAddress2.Text;
                newuser.Question = cmbQuestion.SelectedItem.Value.ToString();
                newuser.Answer = txtAnswer.Text;
                newuser.Online = true;
                newuser.RoleId = 2;
                if (_dal.Insert(newuser) > 0)
                {
                    Session["user"] = newuser.Username;
                    Response.Redirect("Default.aspx");               
                }
                else lblError.Text = "Thêm thất bại!";
            }
            else
            {
                lblError.Text = "Lỗi: Tài khoản đã được sử dụng, vui lòng chọn tài khoản khác!";
                txtUsername.Focus();
            }
        }
    }
}