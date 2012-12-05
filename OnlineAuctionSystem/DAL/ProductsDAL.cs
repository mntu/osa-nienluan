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
            return SelectAll().Rows.Count;
        }
        public DataTable SelectAll()
        {
            UpdateStatus();
            UpdateListing();
            return ExecuteQuery("select *,(CASE [Status] WHEN 1 THEN N'Đang Đấu Giá' ELSE N'Đã Kết Thúc' END) as [Status1] from Products order by ProId desc");
        }
        public DataTable Select()
        {
            UpdateStatus();
            UpdateListing();
            return ExecuteQuery("select * from Products where Status=1 order by ProId desc");
        }
        public DataTable SelectByCate(int cateId)
        {
            UpdateStatus();
            UpdateListing();
            string sql = "select *,(CASE [Status] WHEN 1 THEN N'Đang Đấu Giá' ELSE N'Đã Kết Thúc' END) as [Status1] from Products where CateId={0} and Status=1 order by ProId desc";
            sql = String.Format(sql, cateId);
            return ExecuteQuery(sql);
        }
        public bool CheckProOfCate(int cateId)
        {
            try
            {
                string sql = "SELECT * FROM Products WHERE CateId={0}";
                sql = String.Format(sql, cateId);
                DataTable tmp = ExecuteQuery(sql);
                if (tmp != null && tmp.Rows.Count > 0)
                    return true;
                return false;
            }
            catch { return false; }
        }
        public DataTable FindProduct(string key)
        {
            UpdateStatus();
            UpdateListing();
            string sql = "select *,(CASE [Status] WHEN 1 THEN N'Đang Đấu Giá' ELSE N'Đã Kết Thúc' END) as [Status1] from Products where ProName like N'%{0}%' and Status=1 order by ProId desc ";
            sql = String.Format(sql, key);
            return ExecuteQuery(sql);
        }
        public DataTable SelectByUsername(string username)
        {
            string sql = "select *,(CASE [Status] WHEN 1 THEN N'Đang Đấu Giá' ELSE N'Đã Kết Thúc' END) as [Status1] from Products where Username='{0}' order by ProId desc";
            sql = String.Format(sql, username);
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
                    obj.Fee = Convert.ToDouble(tmp.Rows[0]["Fee"]);
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
                string sql = "INSERT INTO Products(ProName,[Description],StartPrice,Amount,Duration,DatePosted,NumView,[Status],CateId,Username,Fee) ";
                sql += "VALUES(N'{0}',N'{1}',{2},{3},{4},DEFAULT,{5},'{6}',{7},'{8}',{9})";
                sql = String.Format(sql, o.ProName, o.Description, o.StarPrice, o.Amount, o.Duration, o.NumView, o.Status, o.CateId, o.Username, o.Fee);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }

        public int Update(object obj)
        {
            try
            {
                Products o = (Products)obj;
                string sql = "UPDATE Products SET ProName=N'{0}',[Description]=N'{1}',StartPrice={2},Amount={3},Duration={4},NumView={5},[Status]='{6}',CateId={7},Username='{8}',Fee={9} ";
                sql += "WHERE ProId={10}";
                sql = String.Format(sql, o.ProName, o.Description, o.StarPrice, o.Amount, o.Duration, o.NumView, o.Status, o.CateId, o.Username, o.Fee, o.ProId);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }
        public int UpdateNumView(object obj)
        {
            try
            {
                Products o = (Products)obj;
                string sql = "UPDATE Products SET NumView={0} ";
                sql += "WHERE ProId={1}";
                sql = String.Format(sql, o.NumView, o.ProId);
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
                string value = tmp.Rows[0][0].ToString();
                if (value == "") return 1;
                if (tmp != null && tmp.Rows.Count > 0) return Convert.ToInt32(tmp.Rows[0][0]);
                else return 0;
            }
            catch { return -1; }
        }
        public DateTime GetStartTime()
        {
            string sql = "select getdate()";
            DataTable tmp = ExecuteQuery(sql);
            return Convert.ToDateTime(tmp.Rows[0][0]);
        }
        public DateTime GetEndTime(int proId)
        {
            string sql = "select DatePosted,Duration from Products where ProId={0}";
            sql = String.Format(sql, proId);
            DataTable tmp = ExecuteQuery(sql);
            return Convert.ToDateTime(tmp.Rows[0][0]).AddDays(Convert.ToDouble(tmp.Rows[0][1]));
        }

        public void UpdateStatus()
        {
            string sql = "update Products set Status=0 where Status=1 and datediff(ss,GETDATE(),dateadd(dd,Duration,DatePosted))<=0";
            ExecuteNonQuery(sql);
        }

        public void UpdateListing()
        {
            string sql = "select ProId from Products where Status=0";
            DataTable tmp = ExecuteQuery(sql);
            if (tmp != null && tmp.Rows.Count > 0)
            {
                ListingsDAL _dal = new ListingsDAL();
                for (int i = 0; i < tmp.Rows.Count; i++)
                {
                    int proId = Convert.ToInt32(tmp.Rows[i]["ProId"]);
                    decimal maxPrice = _dal.GetMaxPrice(proId);
                    sql = "select Username,TimePosted from Listings where ProId={0} and CurrentPrice={1} Order By TimePosted asc";
                    sql = String.Format(sql, proId, maxPrice);
                    DataTable tmp1 = ExecuteQuery(sql);
                    if (tmp1 != null && tmp1.Rows.Count > 0)
                    {
                        string username = tmp1.Rows[0]["Username"] + "";
                        DateTime timePosted = Convert.ToDateTime(tmp1.Rows[0]["TimePosted"]);
                        sql = "update Listings set [Status]=1 where ProId={0} and Username='{1}' and TimePosted='{2}'";
                        sql = String.Format(sql, proId, username, timePosted.ToString("yyyy/MM/dd HH:mm:ss.fff"));
                        ExecuteNonQuery(sql);
                    }
                }
            }
        }
        public bool DeleteDirectory(string path)
        {
            try
            {
                System.IO.Directory.Delete(path, true);
                return true;
            }
            catch { return false; }
        }
        public string ConvertPrice(decimal price)
        {
            string str = Convert.ToInt64(price).ToString();
            string res = "";
            for (int i = str.Length - 1, j = 0; i >= 0; i--, j++)
            {
                if (j % 3 == 0 && j > 0)
                    res = str[i] + "." + res;
                else
                    res = str[i] + res;
            }
            res += " VNĐ";
            return res;
        }
    }
}