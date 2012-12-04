using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAuctionSystem
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("ctrlCategories1").Visible = true;
            Master.FindControl("ctrlPersonalMenu1").Visible = false;
        }
    }
}