using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using OnlineAuctionSystem.Entities;
namespace OnlineAuctionSystem.DAL
{
    public class UsersDAL : BaseDAL,IBaseDAL
    {
        public int Count()
        {
            return SelectCustomer().Rows.Count;
        }

        public DataTable SelectCustomer()
        {
            return ExecuteQuery("select * from Users where RoleId=2");
        }
        public DataTable Select()
        {
            return ExecuteQuery("select * from Users");
        }

        public object Select(string id)
        {
            try
            {
                string sql = "select * from Users where Username='{0}'";
                sql = String.Format(sql, id);
                DataTable tmp = ExecuteQuery(sql);
                if (tmp != null && tmp.Rows.Count > 0)
                {
                    Users obj = new Users();
                    obj.Username = tmp.Rows[0]["Username"] + "";
                    obj.Password = tmp.Rows[0]["Password"] + "";
                    obj.Fullname = tmp.Rows[0]["Fullname"] + "";
                    obj.Phone = tmp.Rows[0]["Phone"] + "";
                    obj.Email = tmp.Rows[0]["Email"] + "";
                    obj.Address = tmp.Rows[0]["Address"] + "";
                    obj.SubAddress = tmp.Rows[0]["SubAddress"] + "";
                    obj.Question = tmp.Rows[0]["Question"] + "";
                    obj.Answer = tmp.Rows[0]["Answer"] + "";
                    obj.Online = Convert.ToBoolean(tmp.Rows[0]["Online"]);
                    obj.RoleId = Convert.ToInt32(tmp.Rows[0]["RoleId"]);
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
                Users o = (Users)obj;
                string sql = "INSERT INTO Users(Username,[Password],Fullname,Email,Phone,[Address],SubAddress,Question,Answer,[Online],RoleId) ";
                sql += "VALUES('{0}','{1}',N'{2}','{3}','{4}',N'{5}',N'{6}',N'{7}',N'{8}','{9}',{10})";
                sql = String.Format(sql, o.Username,o.Password,o.Fullname,o.Email,o.Phone,o.Address,o.SubAddress,o.Question,o.Answer,o.Online,o.RoleId);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }

        public int Update(object obj)
        {
            try
            {
                Users o = (Users)obj;
                string sql = "UPDATE Users SET [Password]='{0}',FullName=N'{1}',Email='{2}',Phone='{3}',";
                sql+="[Address]=N'{4}',SubAddress=N'{5}',Question=N'{6}',Answer=N'{7}',[Online]='{8}',RoleId={9} ";
                sql += "WHERE Username='{10}'";
                sql = String.Format(sql, o.Password, o.Fullname, o.Email, o.Phone, o.Address, o.SubAddress, o.Question, o.Answer, o.Online, o.RoleId, o.Username);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }

        public int Delete(string id)
        {
            try
            {
                string sql = "DELETE FROM Users WHERE Username='{0}'";
                sql = String.Format(sql, id);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }

        public int CheckLogin(string username,string password)
        {
            try
            {
                string sql = "select RoleId from Users where Username='{0}' and Password='{1}'";
                sql = String.Format(sql, username, password);
                DataTable tmp = ExecuteQuery(sql);
                if (tmp.Rows.Count > 0)
                {
                    return Convert.ToInt32(tmp.Rows[0]["RoleId"]);
                }
                return 0;
            }
            catch { return 0; }
        }
        public void ChangeStatus(string username,bool online)
        {
            try
            {
                string sql = "update Users set [Online]='{0}' where Username='{1}'";
                sql = String.Format(sql, online, username);
                ExecuteNonQuery(sql);
            }
            catch { return; }
        }
    }
}