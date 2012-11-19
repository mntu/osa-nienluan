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
            _dal.Update(product);

            lblProId.Text = product.ProId + "";
            lblProName.Text = product.ProName;
            lblStartPrice.Text = ConvertPrice(product.StarPrice);
            lblAmount.Text = product.Amount + "";
            lblDatePosted.Text = product.DatePosted.ToString("dd-MM-yyyy hh:mm:ss");
            lblNumview.Text = product.NumView + "";
            lblUsername.Text = (Session["user"].ToString()==product.Username) ? "chính bạn" : product.Username;
            lblDescription.Text = product.Description;

            this.ctrlGallery1.CheckImageUrl = MapPath("ProductImg") + @"\" + Session["user"].ToString() + @"\" + product.ProId;
            this.ctrlGallery1.ImageUrl = Session["user"].ToString() + "/" + product.ProId + "/";

            DataTable tmp = _dalList.GetMaxPrice(product.ProId);
            string value = tmp.Rows[0][0].ToString();
            if (value == "") lblCurrentPrice.Text=lblStartPrice.Text;
            else lblCurrentPrice.Text = ConvertPrice(Convert.ToDecimal(tmp.Rows[0][0]));
        }
        protected string ConvertPrice(Decimal price)
        {
            string str = Convert.ToInt64(price).ToString();
            string res="";
            for (int i = 0; i < str.Length; i++)
            {
                if (i % 3 == 0)
                    res += str[i] + " ";
                else
                    res += str[i];
            }
            res += " VNĐ";
            return res;
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }
    }
}