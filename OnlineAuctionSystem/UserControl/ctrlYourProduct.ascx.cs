using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using OnlineAuctionSystem.DAL;
using OnlineAuctionSystem.Entities;
using System.Data.SqlClient;
using System.Web.Configuration;
namespace OnlineAuctionSystem.UserControl
{
    public partial class ctrlYourProduct : System.Web.UI.UserControl
    {
        SqlConnection con;
        ProductsDAL _product = new ProductsDAL();
        ListingsDAL _list = new ListingsDAL();
        CategoriesDAL _cate = new CategoriesDAL();
        DataTable dtProduct, dtListing;
        protected void Page_Load(object sender, EventArgs e)
        {
            dtProduct = _product.SelectByUsername(Session["user"].ToString());
            if (!IsPostBack)
            {
                RefreshProduct();
            }
        }

        protected void RefreshProduct()
        {
            gvProducts.DataSource = dtProduct;
            gvProducts.DataBind();
            gvListing.SelectedIndex = 0;
            if (dtProduct != null && dtProduct.Rows.Count > 0)
            {

                int index = gvProducts.Rows[0].DataItemIndex; ;
                lblProId.Text = dtProduct.Rows[index]["ProId"] + "";
                lblProName.Text = dtProduct.Rows[index]["ProName"] + "";
                lblStartPrice.Text = ConvertPrice(Convert.ToDecimal(dtProduct.Rows[index]["StartPrice"]));
                lblDatePosted.Text = Convert.ToDateTime(dtProduct.Rows[index]["DatePosted"]).ToString("dd/MM/yyyy hh:mm:ss");
                lblDuration.Text = dtProduct.Rows[index]["Duration"] + " ngày";
                lblAmount.Text = dtProduct.Rows[index]["Amount"] + "";
                lblNumview.Text = dtProduct.Rows[index]["NumView"] + "";
                lblDescription.Text = dtProduct.Rows[index]["Description"] + "";

                Categories cate = (Categories)_cate.Select(Convert.ToInt32(dtProduct.Rows[index]["CateId"]));
                lblCateName.Text = cate.CateName;
                lblFee.Text = cate.Fee + "%";

                this.ctrlGallery1.CheckImageUrl = MapPath(@"..\ProductImg") + @"\" + Session["user"].ToString() + @"\" + lblProId.Text;
                this.ctrlGallery1.ImageUrl = Session["user"].ToString() + "/" + lblProId.Text + "/";

                dtListing = _list.Select(Convert.ToInt32(dtProduct.Rows[index]["ProId"]));
                RefreshListing();
            }
        }
        protected string ConvertPrice(decimal price)
        {
            string str = Convert.ToInt64(price).ToString();
            string res = "";
            for (int i = str.Length - 1, j = 0; i >= 0; i--, j++)
            {
                if (j % 3 == 0 && j > 0)
                    res = str[i] + "." + res;
                else
                    res = str[i] + res;
            }
            res += " VNĐ";
            return res;
        }
        protected void RefreshListing()
        {
            if (dtListing != null && dtListing.Rows.Count > 0)
            {
                gvListing.DataSource = dtListing;
                gvListing.DataBind();
            }
        }

        protected void gvProducts_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int index = gvProducts.Rows[e.NewSelectedIndex].DataItemIndex;
            lblProId.Text = dtProduct.Rows[index]["ProId"] + "";
            lblProName.Text = dtProduct.Rows[index]["ProName"] + "";
            lblStartPrice.Text = ConvertPrice(Convert.ToDecimal(dtProduct.Rows[index]["StartPrice"]));
            lblDatePosted.Text = Convert.ToDateTime(dtProduct.Rows[index]["DatePosted"]).ToString("dd/MM/yyyy hh:mm:ss");
            lblDuration.Text = dtProduct.Rows[index]["Duration"] + " ngày";
            lblAmount.Text = dtProduct.Rows[index]["Amount"] + "";
            lblNumview.Text = dtProduct.Rows[index]["NumView"] + "";
            lblDescription.Text = dtProduct.Rows[index]["Description"] + "";
            btnEdit.PostBackUrl = "~/EditProduct.aspx?ProId=" + dtProduct.Rows[index]["ProId"] + "";

            Categories cate = (Categories)_cate.Select(Convert.ToInt32(dtProduct.Rows[index]["CateId"]));
            lblCateName.Text = cate.CateName;
            lblFee.Text = cate.Fee + "%";

            this.ctrlGallery1.CheckImageUrl = MapPath(@"..\ProductImg") + @"\" + Session["user"].ToString() + @"\" + lblProId.Text;
            this.ctrlGallery1.ImageUrl = Session["user"].ToString() + "/" + lblProId.Text + "/";

            dtListing = _list.Select(Convert.ToInt32(dtProduct.Rows[index]["ProId"]));
            gvListing.DataSource = dtListing;
            gvListing.DataBind();
        }

        protected void gvProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProducts.PageIndex = e.NewPageIndex;
            RefreshProduct();
        }

        protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = gvProducts.Rows[e.RowIndex].DataItemIndex;
            if (_product.Delete(Convert.ToInt32(dtProduct.Rows[index]["ProId"])) > 0)
            {
                Response.Redirect("YourProduct.aspx");
            }
        }

        protected void gvListing_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListing.PageIndex = e.NewPageIndex;
            RefreshListing();
        }
    }
}