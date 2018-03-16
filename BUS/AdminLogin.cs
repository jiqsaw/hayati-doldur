using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using LIB;
using DAL;

namespace BUS
{
    public class AdminLogin
    {
        public static int Login(string UserName, string Password)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                DataRow dr = SqlHelper.ExecuteDataset(conn, "AdminLogin",
                    new SqlParameter("@UserName", Util.r(UserName)),
                    new SqlParameter("@Password", LIB.Encryption.Encrypt(Util.r(Password)))
                    ).Tables[0].Rows[0];
                if (dr != null)
                    return Convert.ToInt32(dr["AdminID"]);
                else
                    return 0;
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public static DataTable GetUserPermission(int AdminID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetAdminPermissions",
                    new SqlParameter("@AdminID", AdminID)).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }        
    }
}
