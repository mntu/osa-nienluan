using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using OnlineAuctionSystem.Entities;
namespace OnlineAuctionSystem.DAL
{
    public class RolesDAL : BaseDAL, IBaseDAL
    {

        public int Count()
        {
            return Select().Rows.Count;
        }

        public DataTable Select()
        {
            return ExecuteQuery("select * from Roles");
        }

        public object Select(int id)
        {
            try
            {
                string sql = "select * from Roles where RoleId={0}";
                sql = String.Format(sql, id);
                DataTable tmp = ExecuteQuery(sql);
                if (tmp != null && tmp.Rows.Count > 0)
                {
                    Roles obj = new Roles();
                    obj.RoleId = Convert.ToInt32(tmp.Rows[0]["RoleId"] + "");
                    obj.RoleName = tmp.Rows[0]["RoleName"] + "";
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
                Roles o = (Roles)obj;
                string sql = "INSERT INTO Roles(RoleName) VALUES(N'{0}')";
                sql = String.Format(sql, o.RoleName);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }

        public int Update(object obj)
        {
            try
            {
                Roles o = (Roles)obj;
                string sql = "UPDATE Roles SET RoleName=N'{0}' WHERE RoleId={1}";
                sql = String.Format(sql, o.RoleName, o.RoleId);
                return ExecuteNonQuery(sql);
            }
            catch { return -1; }
        }

        public int Delete(int id)
        {
            try
            {
                string sql = "DELETE FROM Roles WHERE RoleId={0}";
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