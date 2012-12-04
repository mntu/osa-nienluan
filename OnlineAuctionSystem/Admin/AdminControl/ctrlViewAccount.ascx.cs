using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineAuctionSystem.DAL;
using OnlineAuctionSystem.Entities;
using System.Data;
namespace OnlineAuctionSystem.Admin.AdminControl
{
    public partial class ctrlViewAccount : System.Web.UI.UserControl
    {
        UsersDAL _dal = new UsersDAL();
        DataTable dtAccount;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null) Response.Redirect("../Default.aspx");
            dtAccount = _dal.SelectAccount();
            if (!IsPostBack)
            {
                RefreshData();
            }
        }

        private void RefreshData()
        {
            gvAccount.DataSource = dtAccount;
            gvAccount.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddAccount.aspx");
        }

        protected void gvAccount_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int index = gvAccount.Rows[e.NewSelectedIndex].DataItemIndex;
            Response.Redirect("EditAccount.aspx?id="+dtAccount.Rows[index]["Username"]);
        }

        protected void gvAccount_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = gvAccount.Rows[e.RowIndex].DataItemIndex;
            string username = dtAccount.Rows[index]["Username"] + "";
            if (_dal.Delete(username) > 0) Response.Redirect("ViewAccount.aspx");
        }

        protected void gvAccount_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAccount.PageIndex = e.NewPageIndex;
            RefreshData();
        }
    }
}