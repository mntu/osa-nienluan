using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineAuctionSystem.Entities
{
    public class CreditCards
    {
        public string CardNum { get; set; }
        public DateTime ExpireDate { get; set; }
        public int CardType { get; set; }
        public string Username { get; set; }
    }
}