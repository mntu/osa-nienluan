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
    public partial class CreditCard : System.Web.UI.Page
    {
        CreditCardsDAL _dal = new CreditCardsDAL();
        DataTable tmp;
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("ctrlCategories1").Visible = false;
            Master.FindControl("ctrlPersonalMenu1").Visible = true;
            if(Session["user"]==null) Response.Redirect("Default.aspx");
            LoadCreditCard();
            if(!IsPostBack)
            {
                gvCreditCard.DataSource=tmp;
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
        protected void gvCreditCard_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Response.Write("Delete "+tmp.Rows[e.RowIndex]["CardNum"].ToString());
            if (_dal.Delete(tmp.Rows[e.RowIndex]["CardNum"].ToString()) > 0)
            {
                LoadCreditCard();
                gvCreditCard.DataSource = tmp;
                gvCreditCard.DataBind();
            }
        }

        protected void gvCreditCard_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Response.Redirect("EditCreditCard.aspx?CardNum=" + tmp.Rows[e.NewSelectedIndex]["CardNum"].ToString());
        }

        protected void gvCreditCard_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCreditCard.PageIndex = e.NewPageIndex;
            gvCreditCard.DataSource = tmp;
            gvCreditCard.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCreditcard.aspx");
        }
    }
}