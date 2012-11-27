using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineAuctionSystem.DAL;
using OnlineAuctionSystem.Entities;
using System.Data;
namespace OnlineAuctionSystem
{
    public partial class WinProduct : System.Web.UI.Page
    {
        ProductsDAL _dalPro = new ProductsDAL();
        ListingsDAL _dalList = new ListingsDAL();
        DataTable dtProduct;
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("ctrlCategories1").Visible = false;
            Master.FindControl("ctrlPersonalMenu1").Visible = true;
            if (Session["user"] == null) Response.Redirect("Login.aspx");

            dtProduct = _dalList.SelectWinByUsername(Session["user"].ToString());
            if (!IsPostBack)
            {
                RefreshProduct();
            }
        }

        private void RefreshProduct()
        {
            gvProduct.DataSource = dtProduct;
            gvProduct.DataBind();

            if (dtProduct != null && dtProduct.Rows.Count > 0)
            {
                panelDetail.Visible = true;
                int index=gvProduct.Rows[0].DataItemIndex;
                lblProId.Text = dtProduct.Rows[index]["ProId"] + "";
                lblProName.Text = dtProduct.Rows[index]["ProName"] + "";
                lblStartPrice.Text = _dalPro.ConvertPrice(Convert.ToDecimal(dtProduct.Rows[index]["StartPrice"]));
                lblAmount.Text = dtProduct.Rows[index]["Amount"] + "";
                lblDatePosted.Text = Convert.ToDateTime(dtProduct.Rows[index]["DatePosted"]).ToString("dd/MM/yyyy HH:mm:ss");
                lblUsername.Text = dtProduct.Rows[index]["Username"] + "";
                lblDescription.Text = dtProduct.Rows[index]["Description"] + "";

                this.ctrlGallery1.CheckImageUrl = MapPath(@"ProductImg") + @"\" + lblUsername.Text + @"\" + lblProId.Text;
                this.ctrlGallery1.ImageUrl = lblUsername.Text + "/" + lblProId.Text + "/";
            }
        }

        protected void gvProduct_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int index = gvProduct.Rows[e.NewSelectedIndex].DataItemIndex;
            lblProId.Text = dtProduct.Rows[index]["ProId"] + "";
            lblProName.Text = dtProduct.Rows[index]["ProName"] + "";
            lblStartPrice.Text = _dalPro.ConvertPrice(Convert.ToDecimal(dtProduct.Rows[index]["StartPrice"]));
            lblAmount.Text = dtProduct.Rows[index]["Amount"] + "";
            lblDatePosted.Text = Convert.ToDateTime(dtProduct.Rows[index]["DatePosted"]).ToString("dd/MM/yyyy HH:mm:ss");
            lblUsername.Text = dtProduct.Rows[index]["Username"] + "";
            lblDescription.Text = dtProduct.Rows[index]["Description"] + "";

            this.ctrlGallery1.CheckImageUrl = MapPath(@"ProductImg") + @"\" + lblUsername.Text + @"\" + lblProId.Text;
            this.ctrlGallery1.ImageUrl = lblUsername.Text + "/" + lblProId.Text + "/";
        }

        protected void gvProduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProduct.PageIndex = e.NewPageIndex;
            RefreshProduct();
        }
    }
}