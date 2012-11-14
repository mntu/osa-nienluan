using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using OnlineAuctionSystem.Entities;
namespace OnlineAuctionSystem.DAL
{
    public class ProductsDAL : BaseDAL, IBaseDAL
    {

        public int Count()
        {
            return Select().Rows.Count;
        }

        public DataTable Select()
        {
            return ExecuteQuery("select * from Products");
        }
        public DataTable SelectByUsername(string username)
        {
            string sql = "select * from Products where Username='{0}'";
            sql = String.Format(sql,username);
            return ExecuteQuery(sql);
        }
        public object Select(int id)
        {
            try
            {
                string sql = "select * from Products where ProId={0}";
                sql = String.Format(sql, id);
                DataTable tmp = ExecuteQuery(sql);
                if (tmp != null && tmp.Rows.Count > 0)
                {
                    Products obj = new Products();
                    obj.ProId = Convert.ToInt32(tmp.Rows[0]["ProId"]);
                    obj.ProName = tmp.Rows[0]["ProName"] + "";
                    obj.Description = tmp.Rows[0]["Description"] + "";
                    obj.StarPrice = Convert.ToDecimal(tmp.Rows[0]["StartPrice"]);
                    obj.Amount = Convert.ToInt32(tmp.Rows[0]["Amount"]);
                    obj.Duration = Convert.ToInt32(tmp.Rows[0]["Duration"]);
                    obj.DatePosted = Convert.ToDateTime(tmp.Rows[0]["DatePosted"]);
                    obj.NumView = Convert.ToInt64(tmp.Rows[0]["NumView"]);
                    obj.Status = Convert.ToBoolean(tmp.Rows[0]["Status"]);
                    obj.CateId = Convert.ToInt32(tmp.Rows[0]["CateId"]);
                    obj.Username = tmp.Rows[0]["Username"] + "";
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
                Products o = (Products)obj;
                string sql = "INSERT INTO Products(ProName,[Description],StartPrice,Amount,Duration,DatePosted,NumView,[Status],CateId,Username) ";
                sql += "VALUES(N'{0}',N'{1}',{2},'{3}',{4},DEFAULT,{5},{6},{7},'{8}')";
                sql = String.Format(sql,o.ProName,o.Description,o.StarPrice,o.Amount,o.Duration,o.NumView,o.Status,o.CateId,o.Username);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }

        public int Update(object obj)
        {
            try
            {
                Products o = (Products)obj;
                string sql = "UPDATE Products SET ProName=N'{0}',[Description]=N'{1}',StartPrice={2},Amount={3},Duration={4},DatePosted=getDate(),NumView={5},[Status]={6},CateId={7},Username='{8}' ";
                sql += "WHERE ProId={9}";
                sql = String.Format(sql, o.ProName, o.Description, o.StarPrice, o.Amount, o.Duration, o.NumView, o.Status, o.CateId, o.Username,o.ProId);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }

        public int Delete(int id)
        {
            try
            {
                string sql = "DELETE FROM Products WHERE ProId={0}";
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
        public int NewProId()
        {
            try
            {
                string sql = "select Max(ProId) from Products";
                DataTable tmp = ExecuteQuery(sql);
                if (tmp != null && tmp.Rows.Count > 0) return Convert.ToInt32(tmp.Rows[0][0]) + 1;
                else return 0;
            }
            catch { return -1; }
        }
    }
}