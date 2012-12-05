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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divCateId.Visible = true;
                divProduct.Visible = false;
                DataTable tmp = _dalCate.Select();
                if (tmp != null && tmp.Rows.Count > 0)
                {
                    for (int i = 0; i < tmp.Rows.Count; i++)
                    {
                        ListItem item = new ListItem();
                        item.Text = tmp.Rows[i]["CateName"].ToString() + " - " + tmp.Rows[i]["Fee"] + "%";
                        item.Value = tmp.Rows[i]["CateID"] + "";
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
            lblCateName.Text = listCate.SelectedItem.Text.Split('-')[0];
            panel.DefaultButton = "btnCreate";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            divCateId.Visible = true;
            divProduct.Visible = false;
        }

        protected bool CheckImage()
        {
            if (FileUpload1.FileName == "")
            {
                lblImage.Text = "Bạn phải upload ảnh chính (ảnh 1) cho sản phẩm!";
                return false;
            }
            if (FileUpload1.FileName != "")
            {
                if (!(FileUpload1.FileName.EndsWith(".jpg") || FileUpload1.FileName.EndsWith(".jpeg") || FileUpload1.FileName.EndsWith(".jpe")))
                {
                    lblImage.Text = "Tập tin ảnh thứ 1 không hợp lệ!";
                    return false;
                }
            }
            if (FileUpload2.FileName != "")
            {
                if (!(FileUpload2.FileName.EndsWith(".jpg") || FileUpload2.FileName.EndsWith(".jpeg") || FileUpload2.FileName.EndsWith(".jpe")))
                {
                    lblImage.Text = "Tập tin ảnh thứ 2 không hợp lệ!";
                    return false;
                }
            }
            if (FileUpload3.FileName != "")
            {
                if (!(FileUpload3.FileName.EndsWith(".jpg") || FileUpload3.FileName.EndsWith(".jpeg") || FileUpload3.FileName.EndsWith(".jpe")))
                {
                    lblImage.Text = "Tập tin ảnh thứ 3 không hợp lệ!";
                    return false;
                }
            }
            if (FileUpload4.FileName != "")
            {
                if (!(FileUpload4.FileName.EndsWith(".jpg") || FileUpload4.FileName.EndsWith(".jpeg") || FileUpload4.FileName.EndsWith(".jpe")))
                {
                    lblImage.Text = "Tập tin ảnh thứ 4 không hợp lệ!";
                    return false;
                }
            }
            if (FileUpload5.FileName != "")
            {
                if (!(FileUpload5.FileName.EndsWith(".jpg") || FileUpload5.FileName.EndsWith(".jpeg") || FileUpload5.FileName.EndsWith(".jpe")))
                {
                    lblImage.Text = "Tập tin ảnh thứ 5 không hợp lệ!";
                    return false;
                }
            }
            else if (FileUpload1.FileContent.Length > (1024 * 1024)
                || FileUpload2.FileContent.Length > (1024 * 1024)
                || FileUpload3.FileContent.Length > (1024 * 1024)
                || FileUpload4.FileContent.Length > (1024 * 1024)
                || FileUpload5.FileContent.Length > (1024 * 1024))
            {
                lblImage.Text = "Kích thước tập tin lớn hơn 1MB";
                return false;
            }
            return true;
        }
        protected void UploadImages()
        {
            string path = MapPath(@"..\ProductImg") + @"\" + Session["user"].ToString() + @"\" + _dalPro.NewProId();
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            if (FileUpload1.FileName != "")
                FileUpload1.SaveAs(path + @"\" + "1.jpg");
            if (FileUpload2.FileName != "")
                FileUpload2.SaveAs(path + @"\" + "2.jpg");
            if (FileUpload3.FileName != "")
                FileUpload3.SaveAs(path + @"\" + "3.jpg");
            if (FileUpload4.FileName != "")
                FileUpload4.SaveAs(path + @"\" + "4.jpg");
            if (FileUpload5.FileName != "")
                FileUpload5.SaveAs(path + @"\" + "5.jpg");
        }
        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (CheckImage())
            {
                Products obj = new Products();
                obj.ProName = txtProName.Text;
                obj.Description = txtDescription.Html;
                obj.StarPrice = Convert.ToDecimal(txtStartPrice.Text);
                obj.Amount = Convert.ToInt32(txtAmount.Text);
                obj.NumView = 1;
                obj.Duration = Convert.ToInt32(cmbDuration.SelectedItem.Value);
                obj.Status = true;
                obj.CateId = Convert.ToInt32(listCate.Items[listCate.SelectedIndex].Value);
                obj.Username = Session["user"].ToString();
                double cateFee = ((Categories)_dalCate.Select(obj.CateId)).Fee;
                switch (obj.Duration)
                {
                    case 1:
                        obj.Fee = cateFee + 1;
                        break;
                    case 3:
                        obj.Fee = cateFee + 2.5;
                        break;
                    case 5:
                        obj.Fee = cateFee + 4;
                        break;
                    case 7:
                        obj.Fee = cateFee + 5;
                        break;
                    default:
                        obj.Fee = cateFee + 7;
                        break;
                }

                if (_dalPro.Insert(obj) > 0)
                {
                    UploadImages();
                    Response.Redirect("YourProduct.aspx");
                }
            }
        }
    }
}