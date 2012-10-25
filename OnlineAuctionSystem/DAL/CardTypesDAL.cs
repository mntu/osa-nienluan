﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using OnlineAuctionSystem.Entities;
namespace OnlineAuctionSystem.DAL
{
    public class CardTypesDAL : BaseDAL, IBaseDAL
    {
        public int Count()
        {
            return Select().Rows.Count;
        }

        public DataTable Select()
        {
            return ExecuteQuery("select * from CardTypes");
        }

        public object Select(int id)
        {
            try
            {
                string sql = "select * from CardTypes where TypeId={0}";
                sql = String.Format(sql, id);
                DataTable tmp = ExecuteQuery(sql);
                if (tmp != null && tmp.Rows.Count > 0)
                {
                    CardTypes obj = new CardTypes();
                    obj.TypeId = Convert.ToInt32(tmp.Rows[0]["TypeId"]);
                    obj.TypeName = tmp.Rows[0]["TypeName"] + "";
                    return obj;
                }
                return null;
            }
            catch { return null; }
        }

        public int Insert(object obj)
        {
            try
            {
                CardTypes o=(CardTypes)obj;
                string sql = "INSERT INTO CardTypes(TypeName) VALUES(N'{0}')";
                sql = String.Format(sql, o.TypeName);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }

        public int Update(object obj)
        {
            try
            {
                CardTypes o = (CardTypes)obj;
                string sql = "UPDATE CardTypes SET TypeName=N'{0}' WHERE TypeId={1}";
                sql = String.Format(sql, o.TypeName,o.TypeId);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }

        public int Delete(int id)
        {
            try
            {
                string sql = "DELETE FROM CardTypes WHERE TypeId={0}";
                sql = String.Format(sql, id);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }


        public object Select(string id)
        {
            throw new NotImplementedException();
        }

        public int Delete(string id)
        {
            throw new NotImplementedException();
        }
    }
}