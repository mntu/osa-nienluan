using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using OnlineAuctionSystem.Entities;
namespace OnlineAuctionSystem.DAL
{
    public class FeedbacksDAL:BaseDAL,IBaseDAL
    {

        public int Count()
        {
            return Select().Rows.Count;
        }

        public DataTable Select()
        {
            return ExecuteQuery("select * from Feedbacks");
        }

        public object Select(int id)
        {
            try
            {
                string sql = "select * from Feedbacks where FeedbackId={0}";
                sql=String.Format(sql,id);
                DataTable tmp=ExecuteQuery(sql);
                if (tmp != null && tmp.Rows.Count > 0)
                {
                    Feedbacks obj = new Feedbacks();
                    obj.FeedbackId=Convert.ToInt32(tmp.Rows[0]["FeedbackId"]);
                    obj.Title = tmp.Rows[0]["Title"] + "";
                    obj.Content = tmp.Rows[0]["Content"] + "";
                    obj.DatePosted = Convert.ToDateTime(tmp.Rows[0[]["DatePosted"]);
                    obj.Username=tmp.Rows[0]["Username"]+"";
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
                Feedbacks o = (Feedbacks)obj;
                string sql="INSERT INTO Feedbacks(Title,Content,Username) ";
                sql += "VALUES (N'{0}',N'{1}','{2}')";
                sql = String.Format(sql,o.Title,o.Content,o.Username);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }

        public int Update(object obj)
        {
            try
            {
                Feedbacks o = (Feedbacks)obj;
                string sql = "UPDATE Feedbacks SET Title=N'{0}',Content=N'{1}',Username='{2}' WHERE FeedbackId={3}";
                sql = String.Format(sql, o.Title, o.Content, o.Username,o.FeedbackId);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }

        public int Delete(int id)
        {
            try
            {
                string sql = "DELETE FROM Feedbacks WHERE FeedbackId={0} ";
                sql = String.Format(sql, id);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }
    }
}