using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using OnlineAuctionSystem.DAL;

namespace OnlineAuctionSystem
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
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
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}