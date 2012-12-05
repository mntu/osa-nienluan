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
    public partial class AddCategory : System.Web.UI.Page
    {
        CategoriesDAL _dal = new CategoriesDAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null) Response.Redirect("../Default.aspx");
            lblError.Visible = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewCategories.aspx");
        }

        protected void btnAddCate_Click(object sender, EventArgs e)
        {
            Categories newCate = new Categories();

            newCate.CateName = txtCateName.Text;
            newCate.Fee = Convert.ToDouble(txtFee.Text);

            if (_dal.CheckCateName(txtCateName.Text))
            {
                lblError.Visible = true;
                lblError.Text = "Tên loại đã tồn tại!";
                txtCateName.Focus();
                return;
            }
            if (_dal.Insert(newCate) > 0) Response.Redirect("ViewCategories.aspx");
        }
    }
}