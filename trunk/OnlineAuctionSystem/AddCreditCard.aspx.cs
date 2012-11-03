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
    public partial class AddCreditCard : System.Web.UI.Page
    {
        CardTypesDAL _dalType = new CardTypesDAL();
        CreditCardsDAL _dalCreditCard = new CreditCardsDAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("ctrlCategories1").Visible = false;
            Master.FindControl("ctrlPersonalMenu1").Visible = true;
            if (Session["user"] == null) Response.Redirect("Default.aspx");
            if (!IsPostBack)
            {
                DataTable dtType = _dalType.Select();
                cmbType.DataSource = dtType;
                cmbType.TextField = "TypeName";
                cmbType.ValueField = "TypeId";
                cmbType.DataBind();
                cmbType.Items.Add("-Chọn Loại Thẻ-", null);
                cmbType.Items[cmbType.Items.Count-1].Selected = true;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int month=Convert.ToInt32(cmbMonth.SelectedItem.Value.ToString());
            int year=Convert.ToInt32(txtYear.Text);
            Response.Write(DateTime.Today.Year + "-" + DateTime.Today.Month);
            if (year <= DateTime.Today.Year)
            {
                if (month < DateTime.Today.Month)
                {
                    lblError.Text = "Thẻ đã hết hạn, Vui lòng kiểm tra lại!";
                    return;
                }
            }
            if (_dalCreditCard.Select(txtCardNum.Text) == null)
            {
                CreditCards obj = new CreditCards();
                obj.CardNum = txtCardNum.Text;
                DateTime date = new DateTime(year, month, DateTime.Today.Day);
                obj.ExpireDate = date;
                obj.Username = Session["user"].ToString();
                obj.CardType = Convert.ToInt32(cmbType.SelectedItem.Value.ToString());
                if (_dalCreditCard.Insert(obj) > 0)
                {
                    lblError.Text = "";
                    Response.Redirect("CreditCard.aspx");
                }
            }
            else
            {
                lblError.Text = "Thẻ thanh toán đã được dùng, Vui lòng kiểm tra lại!";
            }
        }
    }
}