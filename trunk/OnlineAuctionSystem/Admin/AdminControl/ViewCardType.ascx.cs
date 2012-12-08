using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using OnlineAuctionSystem.DAL;
using OnlineAuctionSystem.Entities;
namespace OnlineAuctionSystem.Admin.AdminControl
{
    public partial class ViewCardType : System.Web.UI.UserControl
    {
        CardTypesDAL _dal = new CardTypesDAL();
        DataTable dtCardType;
        protected void Page_Load(object sender, EventArgs e)
        {
            dtCardType = _dal.Select();
            if (!IsPostBack)
            {
                RefreshData();
            }
        }
        protected void RefreshData()
        {
            gvCardType.DataSource = dtCardType;
            gvCardType.DataBind();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (_dal.Select(txtTypeName.Text) != null)
            {
                Response.Write("<script language='javascript'>alert('Lỗi, Tên loại thẻ đã tồn tại!')</script>");
                return;
            }
            CardTypes obj=new CardTypes();
            obj.TypeName=txtTypeName.Text;
            if (_dal.Insert(obj) > 0) Response.Redirect("ViewCardType.aspx");
        }

        protected void gvCardType_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = gvCardType.Rows[e.RowIndex].DataItemIndex;
            int id = Convert.ToInt32(dtCardType.Rows[index]["TypeId"]);
            if (_dal.Delete(id) <= 0) Response.Write("<script language='javascript'>alert('Lỗi, Không thể xóa vì tồn tại thẻ tín dụng thuộc loại này!')</script>");
            else Response.Redirect("ViewCardType.aspx");
        }

        protected void gvCardType_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCardType.EditIndex = e.NewEditIndex;
            RefreshData();
        }

        protected void gvCardType_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCardType.EditIndex = -1;
            RefreshData();
        }

        protected void gvCardType_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = gvCardType.Rows[e.RowIndex].DataItemIndex;
            string oldName = dtCardType.Rows[index]["TypeName"]+"";
            string newName=((TextBox)gvCardType.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            if ( newName== "")
            {
                Response.Write("<script language=javascript>alert('Tên loại không được rỗng!');</script>");
                return;
            }
            if (_dal.CheckEditTypeName(oldName, newName))
            {
                Response.Write("<script language=javascript>alert('Tên loại đã tồn tại!');</script>");
                return;
            }
            CardTypes obj=new CardTypes();
            obj.TypeId=Convert.ToInt32(dtCardType.Rows[index]["TypeId"]);
            obj.TypeName=newName;
            if (_dal.Update(obj) > 0)
            {
                gvCardType.EditIndex = -1;
                dtCardType = _dal.Select();
                RefreshData();
            }
        }
    }
}