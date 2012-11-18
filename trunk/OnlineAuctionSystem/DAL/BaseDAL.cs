using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
namespace OnlineAuctionSystem.DAL
{
    public class BaseDAL
    {
        protected SqlConnection _cnn;
        protected SqlCommand _cmd;

        public BaseDAL()
        {
            _cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["OAS"].ConnectionString);
            _cmd = new SqlCommand();
            _cmd.Connection = _cnn;
        }

        public BaseDAL(string connStr)
        {
            _cnn = new SqlConnection(connStr);
            _cmd = new SqlCommand();
            _cmd.Connection = _cnn;
        }

        #region Methods
        public bool Open()
        {
            try
            {
                if (_cnn.State == ConnectionState.Closed)
                    _cnn.Open();
                return true;
            }
            catch { return false; }
        }

        protected void Close()
        {
            if (_cnn.State != ConnectionState.Closed)
                _cnn.Close();
        }

        protected DataTable ExecuteQuery(string sqlCommand, string tableName = "Tmp")
        {
            try
            {
                Open();
                _cmd.CommandText = sqlCommand;
                var tbl = new DataTable(tableName);
                tbl.Load(_cmd.ExecuteReader());
                return tbl;
            }
            catch { return null; }
            finally { Close(); }
        }

        protected int ExecuteNonQuery(string sqlCommand)
        {
            try
            {
                Open();
                _cmd.CommandText = sqlCommand;
                return _cmd.ExecuteNonQuery();
            }
            catch { return -1; }
            finally { Close(); }
        }
        #endregion
    }
}