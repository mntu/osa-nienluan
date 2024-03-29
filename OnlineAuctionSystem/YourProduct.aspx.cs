﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineAuctionSystem.DAL;
namespace OnlineAuctionSystem
{
    public partial class YourProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["username"] != null)
            {
                Session["user"] = Request.QueryString["username"];
                UsersDAL _dal = new UsersDAL();
                _dal.ChangeStatus(Session["user"].ToString(), true);
                Response.Redirect("YourProduct.aspx");
            }
            Master.FindControl("ctrlCategories1").Visible = false;
            Master.FindControl("ctrlPersonalMenu1").Visible = true;
            if (Session["user"] == null) Response.Redirect("Default.aspx");
        }
    }
}