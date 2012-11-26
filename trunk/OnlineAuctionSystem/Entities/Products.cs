using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineAuctionSystem.Entities
{
    public class Products
    {
        public int ProId { get; set; }
        public string ProName { get; set; }
        public string Description { get; set; }
        public decimal StarPrice { get; set; }
        public int Amount { get; set; }
        public int Duration { get; set; }
        public DateTime DatePosted { get; set; }
        public double Fee { get; set; }
        public long NumView { get; set; }
        public bool Status { get; set; }
        public int CateId { get; set; }
        public string Username { get; set; }
    }
}