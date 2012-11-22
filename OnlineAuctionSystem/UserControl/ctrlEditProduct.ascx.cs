using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using OnlineAuctionSystem.DAL;
using OnlineAuctionSystem.Entities;
using System.IO;
namespace OnlineAuctionSystem.UserControl
{
    public partial class ctrlEditProduct : System.Web.UI.UserControl
    {
        CategoriesDAL _cate = new CategoriesDAL();
        ProductsDAL _pro = new ProductsDAL();
        Products product=new Products();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["proId"] != null)
            {
                if (!IsPostBack)
                {
                    product = (Products)_pro.Select(Convert.ToInt32(Request.QueryString["proId"]));
                    DataTable tmp = _cate.Select();
                    cmbCate.DataSource = tmp;
                    cmbCate.TextField = "CateName";
                    cmbCate.ValueField = "CateId";
                    cmbCate.DataBind();
                    cmbCate.Items.FindByValue(product.CateId+"").Selected=true;

                    txtProName.Text = product.ProName;
                    txtDescription.Html = product.Description;
                    txtStartPrice.Text = Convert.ToInt64(product.StarPrice)+"";
                    txtAmount.Text = product.Amount + "";
                    //Show fileupload
                    rowImage.Visible = false;
                    for (int i = 2; i <= 5; i++)
                    {
                        string path = MapPath(@"..\ProductImg") + @"\" + product.Username + @"\" + product.ProId + @"\" + i+".jpg";
                        if (!System.IO.File.Exists(path))
                        {
                            switch (i)
                            {
                                case 2:
                                    rowImage.Visible = true;
                                    FileUpload2.Visible = true;
                                    break;
                                case 3:
                                    rowImage.Visible = true;
                                    FileUpload3.Visible = true;
                                    break;
                                case 4:
                                    rowImage.Visible = true;
                                    FileUpload4.Visible = true;
                                    break;
                                case 5:
                                    rowImage.Visible = true;
                                    FileUpload5.Visible = true;
                                    break;
                                default:
                                    break;
                            }
                        }
                    }
                }
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (CheckImage())
            {
                product = (Products)_pro.Select(Convert.ToInt32(Request.QueryString["proId"]));
                product.ProName = txtProName.Text;
                product.CateId = Convert.ToInt32(cmbCate.SelectedItem.Value);
                product.StarPrice = Convert.ToDecimal(txtStartPrice.Text);
                product.Amount = Convert.ToInt32(txtAmount.Text);
                product.Description = txtDescription.Html;
                if (_pro.Update(product) > 0)
                {
                    UploadImages();
                    Response.Write("<script language='javascript'>alert('Thông tin sản phẩm đã được lưu thành công!')</script>");
                    Response.Write("<meta http-equiv='refresh' content='0; URL=YourProduct.aspx' />");
                }
            }
        }
        protected void UploadImages()
        {
            string path = MapPath(@"..\ProductImg") + @"\" + Session["user"].ToString() + @"\" + product.ProId;
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            if (FileUpload2.FileName != "")
                FileUpload2.SaveAs(path + @"\" + "2.jpg");
            if (FileUpload3.FileName != "")
                FileUpload3.SaveAs(path + @"\" + "3.jpg");
            if (FileUpload4.FileName != "")
                FileUpload4.SaveAs(path + @"\" + "4.jpg");
            if (FileUpload5.FileName != "")
                FileUpload5.SaveAs(path + @"\" + "5.jpg");
        }
        protected bool CheckImage()
        {
            if (FileUpload2.FileContent.Length > (1024 * 1024)
                || FileUpload3.FileContent.Length > (1024 * 1024)
                || FileUpload4.FileContent.Length > (1024 * 1024)
                || FileUpload5.FileContent.Length > (1024 * 1024))
            {
                lblImage.Text = "Kích thước tập tin lớn hơn 1MB";
                return false;
            }
            return true;
        }
    }
}