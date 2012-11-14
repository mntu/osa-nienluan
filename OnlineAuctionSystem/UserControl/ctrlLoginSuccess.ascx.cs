using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineAuctionSystem.DAL;
namespace OnlineAuctionSystem.UserControl
{
    public partial class ctrlLoginSuccess : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
                lblUsername.Text = Session["user"].ToString();
            else if (Session["admin"] != null)
                lblUsername.Text = Session["admin"].ToString();
            else
                lblUsername.Text = "Guest";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            UsersDAL _dal = new UsersDAL();
            if (Session["user"] != null)
            {
                _dal.ChangeStatus(Session["user"].ToString(), false);
                Session["user"] = null;
            }
            if (Session["admin"] != null)
            {
                _dal.ChangeStatus(Session["admin"].ToString(), false);
                Session["admin"] = null;
            }
            Response.Redirect("Default.aspx");
        }
    }
}