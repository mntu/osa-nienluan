using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineAuctionSystem.DAL;
namespace OnlineAuctionSystem.UserControl
{
    public partial class ctrlLogin : System.Web.UI.UserControl
    {
        UsersDAL _dal=new UsersDAL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if(_dal.CheckLogin(txtUsername.Text,txtPassword.Text)==0)
            {
                Response.Redirect("Login.aspx");
            }
            else if (_dal.CheckLogin(txtUsername.Text, txtPassword.Text) == 1)
            {
                Session["user"] = txtUsername.Text;
                Response.Redirect("Admin/Default.aspx");
            }
            else
            {
                Session["user"] = txtUsername.Text;
                Response.Redirect(Request.RawUrl);
            }
        }

    }
}