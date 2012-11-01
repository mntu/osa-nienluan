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
    public partial class ChangeProfile : System.Web.UI.Page
    {
        UsersDAL _dal = new UsersDAL();
        Users user;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null) Response.Redirect("Default.aspx");
            Master.FindControl("ctrlCategories1").Visible = false;
            Master.FindControl("ctrlPersonalMenu1").Visible = true;
            user = (Users)_dal.Select(Session["user"].ToString());
            if (!IsPostBack)
            {
                txtFullname.Text = user.Fullname;
                txtEmail.Text = user.Email;
                txtPhone.Text = user.Phone;
                txtAddress1.Text = user.Address;
                txtAddress2.Text = user.SubAddress;
                foreach (DevExpress.Web.ASPxEditors.ListEditItem item in cmbQuestion.Items)
                {
                    if (item.Value.ToString() == user.Question) cmbQuestion.Items[item.Index].Selected = true;
                }
                txtAnswer.Text = user.Answer;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Personal.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            user.Fullname = txtFullname.Text;
            user.Email = txtEmail.Text;
            user.Phone = txtPhone.Text;
            user.Address=txtAddress1.Text;
            user.SubAddress=txtAddress2.Text;
            user.Question = cmbQuestion.SelectedItem.Value.ToString();
            user.Answer = txtAnswer.Text;
            if (_dal.Update(user) > 0) Response.Redirect("Personal.aspx");
        }
    }
}