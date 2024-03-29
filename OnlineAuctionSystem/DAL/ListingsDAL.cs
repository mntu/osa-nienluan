﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using OnlineAuctionSystem.Entities;
namespace OnlineAuctionSystem.DAL
{
    public class ListingsDAL : BaseDAL, IBaseDAL
    {

        public int Count()
        {
            return Select().Rows.Count;
        }

        public DataTable Select()
        {
            return ExecuteQuery("select * from Listings");
        }
        public DataTable SelectByUsername(string username)
        {
            string sql = "select distinct ProId from Listings where Username='{0}'";
            sql = String.Format(sql, username);
            return ExecuteQuery(sql);
        }
        public DataTable SelectWinByUsername(string username)
        {
            string sql = "select a.ProId,ProName,StartPrice,Amount,DatePosted,a.Username,[Description],TimePosted,CurrentPrice from Products a,Listings b where a.ProId=b.ProId and b.Username='{0}' and b.Status=1";
            sql = String.Format(sql, username);
            return ExecuteQuery(sql);
        }
        public DataTable Select(int proid)
        {
            try
            {
                string sql = "select * from Listings where ProId={0}";
                sql = String.Format(sql, proid);
                return ExecuteQuery(sql);
            }
            catch { return null; }
        }
        public decimal GetMaxPrice(int proid)
        {
            try
            {
                string sql = "select Max(CurrentPrice) from Listings where ProId={0}";
                sql = String.Format(sql, proid);
                DataTable tmp = ExecuteQuery(sql);
                string value = tmp.Rows[0][0].ToString();
                if (value == "") return 0;
                else return Convert.ToDecimal(tmp.Rows[0][0]);
            }
            catch { return 0; }
        }
        public int Insert(object obj)
        {
            try
            {
                Listings o = (Listings)obj;
                string sql = "INSERT INTO Listings(ProId,Username,TimePosted,CurrentPrice,[Status]) ";
                sql += "VALUES({0},'{1}',DEFAULT,{2},0)";
                sql=String.Format(sql,o.ProId,o.Username,o.CurrentPrice,o.Status);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }

        public int Update(object obj)
        {
            throw new NotImplementedException();
        }

        public int Delete(string id)
        {
            throw new NotImplementedException();
        }

        public object Select(string id)
        {
            throw new NotImplementedException();
        }
    }
}