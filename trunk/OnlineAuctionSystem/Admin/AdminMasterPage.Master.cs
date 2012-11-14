using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAuctionSystem.Admin
{
    public partial class AdminMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../Default.aspx");
                ctrlLogin1.Visible = true;
                ctrlLoginSuccess1.Visible = false;
            }
            else
            {
                ctrlLogin1.Visible = false;
                ctrlLoginSuccess1.Visible = true;
            }
        }
    }
}