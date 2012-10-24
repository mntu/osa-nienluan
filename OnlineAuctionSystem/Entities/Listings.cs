using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineAuctionSystem.Entities
{
    public class Listings
    {
        public int ProId { get; set; }
        public string Username { get; set; }
        public DateTime TimePosted { get; set; }
        public decimal CurrentPrice { get; set; }
        public bool Status { get; set; }
    }
}