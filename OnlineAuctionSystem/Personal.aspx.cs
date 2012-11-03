using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineAuctionSystem.DAL;
using System.Data;

namespace OnlineAuctionSystem
{
    public partial class Personal : System.Web.UI.Page
    {
        CreditCardsDAL _dal = new CreditCardsDAL();
        DataTable tmp;
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("ctrlCategories1").Visible = false;
            Master.FindControl("ctrlPersonalMenu1").Visible = true;
            if (Session["user"] == null) Response.Redirect("Default.aspx");
            LoadCreditCard();
            if (!IsPostBack)
            {
                gvCreditCard.DataSource = tmp;
                gvCreditCard.DataBind();
            }
        }
        protected void LoadCreditCard()
        {
            tmp = _dal.SelectByUsername(Session["user"].ToString());
            if (tmp == null || tmp.Rows.Count == 0)
            {
                Response.Redirect("AddCreditcard.aspx");
            }
        }
    }
}