using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineAuctionSystem.DAL;
using OnlineAuctionSystem.Entities;
using System.Data;
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxClasses.Internal;
using System.IO;
namespace OnlineAuctionSystem.UserControl
{
    public partial class ctrlSellProduct : System.Web.UI.UserControl
    {
        CategoriesDAL _dalCate = new CategoriesDAL();
        ProductsDAL _dalPro = new ProductsDAL();
        int cateId;
        string UploadDirectory = "~/ProductImg";
        protected void Page_Load(object sender, EventArgs e)
        {
            divCateId.Visible = true;
            divProduct.Visible = false;
            if (!IsPostBack)
            {
                DataTable tmp = _dalCate.Select();
                if(tmp!=null&& tmp.Rows.Count>0)
                {
                    for(int i=0;i<tmp.Rows.Count;i++)
                    {
                        ListItem item=new ListItem();
                        item.Text= tmp.Rows[i]["CateName"].ToString()+" - "+tmp.Rows[i]["Fee"]+"%";
                        item.Value=tmp.Rows[i]["CateID"]+"";
                        listCate.Items.Add(item);
                        listCate.SelectedIndex = 0;
                    }
                }
                listCate.DataBind();
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            divCateId.Visible = false;
            divProduct.Visible = true;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            divCateId.Visible = true;
            divProduct.Visible = false;
        }
        protected void uploadImage_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
        {
            try
            {
                e.CallbackData = SavePostedFiles(e.UploadedFile);
            }
            catch (Exception ex)
            {
                e.IsValid = false;
                e.ErrorText = ex.Message;
            }
        }
        string SavePostedFiles(UploadedFile uploadedFile)
        {
            UploadDirectory += "/" + Session["user"].ToString() + "/" + _dalPro.NewProId() + "/";
            if (!uploadedFile.IsValid)
                return string.Empty;

            FileInfo fileInfo = new FileInfo(uploadedFile.FileName);
            string resFileName = MapPath(UploadDirectory) + fileInfo.Name;
            uploadedFile.SaveAs(resFileName);

            string fileLabel = fileInfo.Name;
            string fileLength = uploadedFile.ContentLength / 1024 + "K";
            return string.Format("{0} ({1})|{2}", fileLabel, fileLength, fileInfo.Name);
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            Products obj = new Products();
            obj.ProName = txtProName.Text;
            obj.Description = txtDescription.Html;
            obj.StarPrice = Convert.ToDecimal(txtStartPrice.Text);
            obj.Amount = Convert.ToInt32(txtAmount.Text);
            obj.NumView = 1;
            obj.Duration = (int)cmbDuration.SelectedItem.Value;
            obj.Status = true;
            obj.CateId = cateId;
            obj.Username = Session["user"].ToString();
            if (_dalPro.Insert(obj) > 0) Response.Redirect("YourProduct.aspx");
        }

        protected void listCate_SelectedIndexChanged(object sender, EventArgs e)
        {
            cateId = Convert.ToInt32(listCate.SelectedItem.Value);
            lblCateName.Text = listCate.SelectedItem.Text.Split('-')[0];
        }
    }
}