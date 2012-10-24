using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace OnlineAuctionSystem.DAL
{
    public interface IBaseDAL
    {
        int Count();
        DataTable Select();
        object Select(string id);
        int Insert(object obj);
        int Update(object obj);
        int Delete(string id);
    }
}