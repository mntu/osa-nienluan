﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using OnlineAuctionSystem.Entities;
namespace OnlineAuctionSystem.DAL
{
    public class CategoriesDAL : BaseDAL, IBaseDAL
    {
        public int Count()
        {
            return Select().Rows.Count;
        }

        public DataTable Select()
        {
            return ExecuteQuery("select * from Categories");
        }

        public object Select(int id)
        {
            try
            {
                string sql = "select * from Categories where CateId={0}";
                sql = String.Format(sql, id);
                DataTable tmp = ExecuteQuery(sql);
                if (tmp != null && tmp.Rows.Count > 0)
                {
                    Categories obj = new Categories();
                    obj.CateId = Convert.ToInt32(tmp.Rows[0]["CateId"]);
                    obj.CateName = tmp.Rows[0]["CateName"] + "";
                    obj.Fee = (float)Convert.ToDouble(tmp.Rows[0]["Fee"]);
                    return obj;
                }
                return null;
            }
            catch { return null; }
        }

        public bool CheckCateName(string cateName)
        {
            try
            {
                string sql = "select * from Categories where CateName=N'{0}'";
                sql = String.Format(sql, cateName);
                DataTable tmp = ExecuteQuery(sql);
                if (tmp != null && tmp.Rows.Count > 0)
                    return true;
                return false;
            }
            catch { return false; }
        }
        public bool CheckEditCateName(string oldName,string newName)
        {
            try
            {
                string sql = "select * from Categories where CateName=N'{0}' and CateId not in (select CateId from Categories where CateName=N'{1}')";
                sql = String.Format(sql, newName,oldName);
                DataTable tmp = ExecuteQuery(sql);
                if (tmp != null && tmp.Rows.Count > 0)
                    return true;
                return false;
            }
            catch { return false; }
        }
        public int Insert(object obj)
        {
            try
            {
                Categories o = (Categories)obj;
                string sql = "INSERT INTO Categories(CateName,Fee) VALUES(N'{0}',{1})";
                sql = String.Format(sql, o.CateName, o.Fee);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }

        public int Update(object obj)
        {
            try
            {
                Categories o = (Categories)obj;
                string sql = "UPDATE Categories SET CateName=N'{0}',Fee={1} WHERE CateId={2}";
                sql = String.Format(sql, o.CateName, o.Fee, o.CateId);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }

        public int Delete(int id)
        {
            try
            {
                if (!new ProductsDAL().CheckProOfCate(id))
                {
                    string sql = "DELETE FROM Categories WHERE CateId={0}";
                    sql = String.Format(sql, id);
                    return ExecuteNonQuery(sql);
                }
                else
                {
                    return -1;
                }
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