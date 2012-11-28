using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineAuctionSystem.DAL;

namespace OnlineAuctionSystem.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        UsersDAL _dalUser = new UsersDAL();
        ProductsDAL _dalPro = new ProductsDAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null) Response.Redirect("../Default.aspx");
            lblTotalUser.Text = _dalUser.Count() + " Khách Hàng Đã Đăng Ký";
            lblTotalPro.Text = _dalPro.Count() + " Sản Phẩm Được Bán";
            lblActivePro.Text = _dalPro.Select().Rows.Count + " Sản Phẩm Đang Đấu Giá";
            lblDeactivePro.Text = _dalPro.Count() - _dalPro.Select().Rows.Count + " Sản Phẩm Kết Thúc Đấu Giá";
        }
    }
}