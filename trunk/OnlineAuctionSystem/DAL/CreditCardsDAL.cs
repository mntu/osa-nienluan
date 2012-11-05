using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using OnlineAuctionSystem.Entities;
namespace OnlineAuctionSystem.DAL
{
    public class CreditCardsDAL:BaseDAL,IBaseDAL
    {
        public int Count()
        {
            return Select().Rows.Count;
        }

        public DataTable Select()
        {
            return ExecuteQuery("select * from CreditCards");
        }

        public object Select(string id)
        {
            try
            {
                string sql = "select * from CreditCards where CardNum='{0}'";
                sql=String.Format(sql,id);
                DataTable tmp = ExecuteQuery(sql);
                if (tmp != null && tmp.Rows.Count > 0)
                {
                    CreditCards obj = new CreditCards();
                    obj.CardNum = tmp.Rows[0]["CardNum"] + "";
                    obj.CardType = Convert.ToInt32(tmp.Rows[0]["CardType"]);
                    obj.ExpireDate = Convert.ToDateTime(tmp.Rows[0]["ExpireDate"]);
                    obj.Username = tmp.Rows[0]["Username"] + "";
                    return obj;
                }
                return null;
            }
            catch { return null; }
        }
        public DataTable SelectByUsername(string username)
        {
            try
            {
                string sql = "select CardNum,ExpireDate,TypeId,TypeName,Username from CreditCards a,CardTypes b where CardType=TypeId and Username='{0}'";
                sql = String.Format(sql, username);
                return ExecuteQuery(sql);
            }
            catch { return null; }
        }
        public int Insert(object obj)
        {
            try
            {
                CreditCards o = (CreditCards)obj;
                string sql="INSERT INTO CreditCards(CardNum,CardType,ExpireDate,Username) ";
                sql += "VALUES('{0}',{1},'{2}','{3}')";
                sql = String.Format(sql,o.CardNum,o.CardType,o.ExpireDate.ToString("dd-MMM-yyyy"),o.Username);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }

        public int Update(object obj)
        {
            try
            {
                CreditCards o = (CreditCards)obj;
                string sql = "UPDATE CreditCards SET CardType={0},ExpireDate='{1}',Username='{2}' ";
                sql += "WHERE CardNum = '{3}'";
                sql = String.Format(sql, o.CardType, o.ExpireDate, o.Username, o.CardNum);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }

        public int Delete(string id)
        {
            try
            {
                string sql = "DELETE FROM CreditCards WHERE CardNum='{0}' ";
                sql = String.Format(sql, id);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }
    }
}