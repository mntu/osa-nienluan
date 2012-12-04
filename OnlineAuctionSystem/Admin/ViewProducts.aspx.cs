using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineAuctionSystem.DAL;

namespace OnlineAuctionSystem.Admin
{
    public partial class ViewProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["admin"] != null)
            {
                Session["admin"] = Request.QueryString["admin"];
                UsersDAL _dal = new UsersDAL();
                _dal.ChangeStatus(Session["admin"].ToString(), true);
                Response.Redirect("ViewProducts.aspx");
            }
            if (Session["admin"] == null) Response.Redirect("../Default.aspx");
        }
    }
}