﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineAuctionSystem.Entities
{
    public class Feedbacks
    {
        public int FeedbackId { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public DateTime DatePosted { get; set; }
        public string Username { get; set; }
    }
}