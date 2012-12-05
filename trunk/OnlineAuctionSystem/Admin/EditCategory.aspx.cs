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
    public partial class EditCategory : System.Web.UI.Page
    {
        CategoriesDAL _dal = new CategoriesDAL();
        Categories cate = new Categories();
        int cateID;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false;
            if (Session["admin"] == null) Response.Redirect("../Default.aspx");
            if (Request.QueryString["id"] == null) Response.Redirect("../Default.aspx");
            cateID = Convert.ToInt32(Request.QueryString["id"]);
            cate = (Categories)_dal.Select(cateID);
            if (!IsPostBack)
            {
                txtCateName.Text = cate.CateName;
                txtFee.Text = cate.Fee.ToString();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewCategories.aspx");
        }

        protected void btnEditCate_Click(object sender, EventArgs e)
        {
            cate.CateName = txtCateName.Text;
            cate.Fee = Convert.ToDouble(txtFee.Text);

            if (_dal.CheckCateName(txtCateName.Text))
            {
                lblError.Visible = true;
                lblError.Text = "Tên loại đã tồn tại!";
                txtCateName.Focus();
                return;
            }
            else
                if (_dal.Update(cate) > 0)
                    Response.Redirect("ViewCategories.aspx");
        }
    }
}