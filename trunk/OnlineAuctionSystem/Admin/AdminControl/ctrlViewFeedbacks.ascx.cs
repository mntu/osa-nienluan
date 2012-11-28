using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineAuctionSystem.DAL;
using System.Data;
namespace OnlineAuctionSystem.Admin.AdminControl
{
    public partial class ctrlViewFeedbacks : System.Web.UI.UserControl
    {
        FeedbacksDAL _dal = new FeedbacksDAL();
        DataTable dtFeedback;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null) Response.Redirect("../Default.aspx");

            dtFeedback = _dal.Select();
            if (!IsPostBack)
            {
                RefreshData();
            }
        }

        private void RefreshData()
        {
            gvFeedback.DataSource = dtFeedback;
            gvFeedback.DataBind();
            if (dtFeedback.Rows.Count > 0 && dtFeedback != null)
            {
                int index = gvFeedback.Rows[0].DataItemIndex;
                lblContent.Text = dtFeedback.Rows[index]["Content"] + "";
            }
            else
            {
                panelContent.Visible = false;
            }
        }

        protected void gvFeedback_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int index = gvFeedback.Rows[e.NewSelectedIndex].DataItemIndex;
            lblContent.Text = dtFeedback.Rows[index]["Content"] + "";
        }

        protected void gvFeedback_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvFeedback.PageIndex = e.NewPageIndex;
            RefreshData();
        }

        protected void gvFeedback_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = gvFeedback.Rows[e.RowIndex].DataItemIndex;
            int id = Convert.ToInt32(dtFeedback.Rows[index]["FeedBackId"]);
            if (_dal.Delete(id) > 0)
            {
                Response.Redirect("ViewFeedbacks.aspx");
            }
        }
    }
}