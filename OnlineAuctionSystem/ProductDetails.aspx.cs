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
    public partial class ProductDetails : System.Web.UI.Page
    {
        ProductsDAL _dal = new ProductsDAL();
        ListingsDAL _dalList = new ListingsDAL();
        Products product = new Products();
        public double seconds;
        decimal currentPrice;
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("ctrlCategories1").Visible = false;
            Master.FindControl("ctrlPersonalMenu1").Visible = true;
            if (Session["user"] == null) Response.Redirect("Login.aspx");

            if (Request.QueryString["ProId"] == null) Response.Redirect("Default.aspx");

            int proId = Convert.ToInt32(Request.QueryString["ProId"]);
            product=(Products)_dal.Select(proId);

            if (product == null) Response.Redirect("Default.aspx");

            if (Session["user"].ToString() == product.Username)
            {
                btnSubmit.Enabled = false;
                txtNewPrice.Enabled = false;
            }

            product.NumView += 1;
            _dal.UpdateNumView(product);

            lblProId.Text = product.ProId + "";
            lblProName.Text = product.ProName;
            lblStartPrice.Text = _dal.ConvertPrice(product.StarPrice);
            lblAmount.Text = product.Amount + "";
            lblDatePosted.Text = product.DatePosted.ToString("dd-MM-yyyy hh:mm:ss");
            lblNumview.Text = product.NumView + "";
            lblUsername.Text = (Session["user"].ToString()==product.Username) ? "chính bạn" : product.Username;
            lblDescription.Text = product.Description;
            
            this.ctrlGallery1.CheckImageUrl = MapPath("ProductImg") + @"\" + product.Username + @"\" + product.ProId;
            this.ctrlGallery1.ImageUrl = product.Username + "/" + product.ProId + "/";

            seconds = (_dal.GetEndTime(product.ProId) - _dal.GetStartTime()).TotalSeconds;
            currentPrice = _dalList.GetMaxPrice(product.ProId);
            if (currentPrice == 0)
            {
                currentPrice = product.StarPrice;
                lblCurrentPrice.Text = lblStartPrice.Text;
            }
            lblCurrentPrice.Text = _dal.ConvertPrice(currentPrice);
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            decimal newPrice=Convert.ToDecimal(txtNewPrice.Text);
            if (newPrice <= currentPrice)
            {
                lblError.Visible = true;
                lblError.Text = "Giá của bạn phải lớn hơn giá hiện tại!";
                txtNewPrice.Focus();
            }
            else
            {
                lblError.Visible = false;
                Listings listing = new Listings();
                listing.ProId = product.ProId;
                listing.Username = Session["user"].ToString();
                listing.CurrentPrice = newPrice;
                if (_dalList.Insert(listing) > 0)
                {
                    Response.Redirect(Request.RawUrl);
                }
            }
        }
    }
}