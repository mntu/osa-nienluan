using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineAuctionSystem.DAL;
using OnlineAuctionSystem.Entities;
using System.Data;

namespace OnlineAuctionSystem.UserControl
{
    public partial class ctrlViewProducts : System.Web.UI.UserControl
    {
        public int proId { get; set; }
        public string proName { get; set; }
        public string imgUrl { get; set; }
        public string price { get; set; }
        public double seconds { get; set; }
        OnlineAuctionSystem.DAL.ProductsDAL _dal = new OnlineAuctionSystem.DAL.ProductsDAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

    }
}