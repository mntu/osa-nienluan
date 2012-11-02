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
    public partial class Feedback : System.Web.UI.Page
    {
        FeedbacksDAL _dal = new FeedbacksDAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("ctrlCategories1").Visible = true;
            Master.FindControl("ctrlPersonalMenu1").Visible = false;
            if (Session["user"] == null) Response.Redirect("Default.aspx");
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtTitle.Text = "";
            txtContent.Value = "";
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            Feedbacks feedback = new Feedbacks();
            feedback.Title = txtTitle.Text;
            feedback.Content = txtContent.Value;
            feedback.Username = Session["user"].ToString();
            if (_dal.Insert(feedback) > 0)
            {
                lblError.Text = "Góp ý đã được gửi thành công!";
                txtTitle.Text = "";
                txtContent.Value = "";
            }
        }
    }
}