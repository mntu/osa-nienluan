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
    public partial class ViewCustomer : System.Web.UI.UserControl
    {
        UsersDAL _dal = new UsersDAL();
        ProductsDAL _dalPro = new ProductsDAL();
        DataTable dtUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null) Response.Redirect("../Default.aspx");
            dtUser = _dal.SelectCustomer();
            if (!IsPostBack)
            {
                RefreshData();
            }
        }

        private void RefreshData()
        {
            gvCustomer.DataSource = dtUser;
            gvCustomer.DataBind();
            if (dtUser != null && dtUser.Rows.Count > 0)
            {
                int index = gvCustomer.Rows[0].DataItemIndex;
                lblUsername.Text = dtUser.Rows[index]["Username"] + "";
                lblFullname.Text = dtUser.Rows[index]["Fullname"] + "";
                lblEmail.Text = dtUser.Rows[index]["Email"] + "";
                lblPhone.Text = dtUser.Rows[index]["Phone"] + "";
                lblAddress.Text = dtUser.Rows[index]["Address"] + "";
                lblSubAddress.Text = (dtUser.Rows[index]["Subaddress"].ToString() == "") ? "Không có" : dtUser.Rows[index]["SubAddress"] + "";
                lblNumPro.Text = _dalPro.SelectByUsername(lblUsername.Text).Rows.Count + " sản phẩm";
            }
        }

        protected void gvCustomer_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int index = gvCustomer.Rows[e.NewSelectedIndex].DataItemIndex;
            lblUsername.Text = dtUser.Rows[index]["Username"] + "";
            lblFullname.Text = dtUser.Rows[index]["Fullname"] + "";
            lblEmail.Text = dtUser.Rows[index]["Email"] + "";
            lblPhone.Text = dtUser.Rows[index]["Phone"] + "";
            lblAddress.Text = dtUser.Rows[index]["Address"] + "";
            lblSubAddress.Text = (dtUser.Rows[index]["Subaddress"].ToString() == "") ? "Không có" : dtUser.Rows[index]["SubAddress"] + "";
            lblNumPro.Text = _dalPro.SelectByUsername(lblUsername.Text).Rows.Count + " sản phẩm";
        }

        protected void gvCustomer_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCustomer.PageIndex = e.NewPageIndex;
            RefreshData();
        }

        protected void gvCustomer_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = gvCustomer.Rows[e.RowIndex].DataItemIndex;
            string username = dtUser.Rows[index]["Username"] + "";
            if (_dalPro.SelectByUsername(username).Rows.Count > 0)
            {
                Response.Write("<script language='javascript'>alert('Lỗi, Không thể xóa vì khách hàng này có bán sản phẩm!')</script>");
                return;
            }
            if (_dal.Delete(username) > 0)
            {
                dtUser = _dal.SelectCustomer();
                RefreshData();
            }
        }
    }
}