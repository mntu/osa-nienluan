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
        ProductsDAL _product = new ProductsDAL();
        ListingsDAL _list = new ListingsDAL();
        CategoriesDAL _cate = new CategoriesDAL();
        DataTable dtProduct, dtListing;
        public double seconds;
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
            if (dtProduct != null && dtProduct.Rows.Count > 0)
            {
                panelDetail.Visible = true;
                panelListing.Visible = true;
                int index = gvProducts.Rows[0].DataItemIndex; ;
                seconds = (_product.GetEndTime(Convert.ToInt32(dtProduct.Rows[index]["ProId"])) - _product.GetStartTime()).TotalSeconds;
                lblProId.Text = dtProduct.Rows[index]["ProId"] + "";
                lblProName.Text = dtProduct.Rows[index]["ProName"] + "";
                lblStartPrice.Text = _product.ConvertPrice(Convert.ToDecimal(dtProduct.Rows[index]["StartPrice"]));
                lblDatePosted.Text = Convert.ToDateTime(dtProduct.Rows[index]["DatePosted"]).ToString("dd/MM/yyyy HH:mm:ss");
                lblAmount.Text = dtProduct.Rows[index]["Amount"] + "";
                lblNumview.Text = dtProduct.Rows[index]["NumView"] + "";
                lblDescription.Text = dtProduct.Rows[index]["Description"] + "";
                btnEdit.PostBackUrl = "~/EditProduct.aspx?ProId=" + dtProduct.Rows[index]["ProId"] + "";
                Categories cate = (Categories)_cate.Select(Convert.ToInt32(dtProduct.Rows[index]["CateId"]));
                lblCateName.Text = cate.CateName;
                lblFee.Text = dtProduct.Rows[index]["Fee"] + "%";

                this.ctrlGallery1.CheckImageUrl = MapPath(@"..\ProductImg") + @"\" + Session["user"].ToString() + @"\" + lblProId.Text;
                this.ctrlGallery1.ImageUrl = Session["user"].ToString() + "/" + lblProId.Text + "/";

                dtListing = _list.Select(Convert.ToInt32(dtProduct.Rows[index]["ProId"]));
                RefreshListing();
            }
            else
            {
                panelDetail.Visible = false;
                panelListing.Visible = false;
            }
        }

        protected void RefreshListing()
        {
            if (dtListing != null && dtListing.Rows.Count > 0)
            {
                DataColumn col = new DataColumn("CurrentPrice1", dtListing.Columns["Username"].DataType);
                dtListing.Columns.Add(col);
                for (int i = 0; i < dtListing.Rows.Count; i++)
                {
                    dtListing.Rows[i]["CurrentPrice1"] = _product.ConvertPrice(Convert.ToDecimal(dtListing.Rows[0]["CurrentPrice"]));
                }
            }
            gvListing.DataSource = dtListing;
            gvListing.DataBind();
            gvListing.SelectedIndex = -1;
        }

        protected void gvProducts_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int index = gvProducts.Rows[e.NewSelectedIndex].DataItemIndex;
            seconds = (_product.GetEndTime(Convert.ToInt32(dtProduct.Rows[index]["ProId"])) - _product.GetStartTime()).TotalSeconds;
            lblProId.Text = dtProduct.Rows[index]["ProId"] + "";
            lblProName.Text = dtProduct.Rows[index]["ProName"] + "";
            lblStartPrice.Text = _product.ConvertPrice(Convert.ToDecimal(dtProduct.Rows[index]["StartPrice"]));
            lblDatePosted.Text = Convert.ToDateTime(dtProduct.Rows[index]["DatePosted"]).ToString("dd/MM/yyyy HH:mm:ss");
            lblAmount.Text = dtProduct.Rows[index]["Amount"] + "";
            lblNumview.Text = dtProduct.Rows[index]["NumView"] + "";
            lblDescription.Text = dtProduct.Rows[index]["Description"] + "";
            btnEdit.PostBackUrl = "~/EditProduct.aspx?ProId=" + dtProduct.Rows[index]["ProId"] + "";
            Categories cate = (Categories)_cate.Select(Convert.ToInt32(dtProduct.Rows[index]["CateId"]));
            lblCateName.Text = cate.CateName;
            lblFee.Text = dtProduct.Rows[index]["Fee"] + "%";

            this.ctrlGallery1.CheckImageUrl = MapPath(@"..\ProductImg") + @"\" + Session["user"].ToString() + @"\" + lblProId.Text;
            this.ctrlGallery1.ImageUrl = Session["user"].ToString() + "/" + lblProId.Text + "/";

            dtListing = _list.Select(Convert.ToInt32(dtProduct.Rows[index]["ProId"]));
            RefreshListing();
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
                _product.DeleteDirectory(MapPath(@"..\ProductImg") + @"\" + Session["user"].ToString() + @"\" + lblProId.Text);
                Response.Redirect("YourProduct.aspx?username=" + Session["user"].ToString());
            }
        }

        protected void gvListing_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListing.PageIndex = e.NewPageIndex;
            RefreshListing();
        }
    }
}