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
    public partial class ctrlViewCategories : System.Web.UI.UserControl
    {
        CategoriesDAL _dal = new CategoriesDAL();
        DataTable dtCate;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null) Response.Redirect("../Default.aspx");
            dtCate = _dal.Select();
            if (!IsPostBack)
            {
                RefreshData();
            }
        }

        private void RefreshData()
        {
            gvCate.DataSource = dtCate;
            gvCate.DataBind();
        }

        protected void btnAddCate_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCategory.aspx");
        }

        protected void gvCate_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int index = gvCate.Rows[e.NewSelectedIndex].DataItemIndex;
            Response.Redirect("EditCategory.aspx?id=" + dtCate.Rows[index]["CateId"]);
        }

        protected void gvCate_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCate.PageIndex = e.NewPageIndex;
            RefreshData();
        }

        protected void gvCate_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = gvCate.Rows[e.RowIndex].DataItemIndex;
            int cateID = Convert.ToInt32(dtCate.Rows[index]["CateId"] + "");
            if (_dal.Delete(cateID) > 0) Response.Redirect("ViewCategories.aspx");
            else
            {
                Response.Write("<script language='javascript'>alert('Lỗi, Không thể xóa vì tồn tại sản phẩm thuộc loại này!')</script>");
            }
        }
    }
}