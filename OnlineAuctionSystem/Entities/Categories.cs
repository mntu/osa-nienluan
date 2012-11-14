using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineAuctionSystem.Entities
{
    public class Categories
    {
        public int CateId { get; set; }
        public string CateName { get; set; }
        public float Fee { get; set; }
    }
}