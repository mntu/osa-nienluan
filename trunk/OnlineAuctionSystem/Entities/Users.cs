using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineAuctionSystem.Entities
{
    public class Users
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string Fullname { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string SubAddress { get; set; }
        public int RoleId { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
        public bool bit { get; set; }
    }
}