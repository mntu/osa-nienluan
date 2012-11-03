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
    public partial class Personal : System.Web.UI.Page
    {
        CreditCardsDAL _dal = new CreditCardsDAL();
        UsersDAL _dalUser = new UsersDAL();
        ProductsDAL _dalPro = new ProductsDAL();
        ListingsDAL _dalList = new ListingsDAL();
        DataTable tmp;
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("ctrlCategories1").Visible = false;
            Master.FindControl("ctrlPersonalMenu1").Visible = true;
            if (Session["user"] == null) Response.Redirect("Default.aspx");
            DataTable tmp=_dal.SelectByUsername(Session["user"].ToString());
            Users obj = new Users();
            obj=(Users)_dalUser.Select(Session["user"].ToString());
            lblFullname.Text = "- Họ tên: " + obj.Fullname;
            lblEmail.Text = "- Email: " + obj.Email;
            lblPhone.Text = "- Số điện thoại: " + obj.Phone;
            lblCreditCard.Text = "- Thẻ thanh toán: " + tmp.Rows.Count + " thẻ";
            lblAddress.Text = "- Địa Chỉ: "+obj.Address;

            lblProductSell.Text = "- Đã đăng bán: "+_dalPro.SelectByUsername(Session["user"].ToString()).Rows.Count+" sản phẩm";
            lblProductList.Text = "- Tham gia đấu giá: " + _dalList.SelectByUsername(Session["user"].ToString()).Rows.Count+" sản phẩm";
            lblProductWin.Text = "- Đấu giá thắng: " + _dalList.SelectWinByUsername(Session["user"].ToString()).Rows.Count + " sản phẩm";
        }
    }
}