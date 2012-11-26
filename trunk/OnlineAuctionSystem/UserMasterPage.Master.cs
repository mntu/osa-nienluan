using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineAuctionSystem.DAL;
namespace OnlineAuctionSystem
{
    public partial class UserMasterPage : System.Web.UI.MasterPage
    {
        ProductsDAL _dal = new ProductsDAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                ctrlLogin1.Visible = true;
                ctrlLoginSuccess1.Visible = false;
                lkRegister.Visible = true;
                lkPersonal.Visible = false;
                lkFeedback.Visible = false;
            }
            else
            {
                ctrlLogin1.Visible = false;
                ctrlLoginSuccess1.Visible = true;
                lkRegister.Visible = false;
                lkPersonal.Visible = true;
                lkFeedback.Visible = true;
            }
            _dal.UpdateStatus();
            _dal.UpdateListing();
        }
    }
}