using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DAL;
using System.Data;
using System.Collections;
using Microsoft.ApplicationBlocks.Data;
using LIB;

namespace BUS
{
    public class MarkaElcileri
    {
        public static bool Delete(ArrayList arrMarkaElcileriID)
        {
            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "MarkaElcileriDelTran");
            try
            {
                for (int i = 0; i < arrMarkaElcileriID.Count; i++)
                {
                    if (LIB.Util.IsNumeric(arrMarkaElcileriID[i]))
                    {
                        SqlHelper.ExecuteNonQuery(tran, "MarkaElcileriDel",
                        new SqlParameter("@MarkaElcileriID", arrMarkaElcileriID[i])
                        );
                    }
                }
                tran.Commit();
                return true;
            }
            catch (Exception)
            {
                tran.Rollback();
                return false;
            }
        }

        public static DataTable GetMarkaElcileri()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetMarkaElcileri").Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static DataTable GetMarkaElcileriDetail(int MarkaElcileriID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetMarkaElcileriDetail", new SqlParameter("@MarkaElcileriID", MarkaElcileriID)).Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static bool Save(int MarkaElcileriID, int LocationID, int UniversityID, string FullName, string Email)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                if (MarkaElcileriID == 0)

                    SqlHelper.ExecuteNonQuery(conn, "MarkaElcileriIn",
                            new SqlParameter("@LocationID", LocationID),                           
                            new SqlParameter("@UniversityID", UniversityID),
                            new SqlParameter("@FullName", Util.r(FullName)),
                            new SqlParameter("@Email", Email)
                            );
                else
                    SqlHelper.ExecuteNonQuery(conn, "MarkaElcileriUp",
                            new SqlParameter("@MarkaElcileriID", MarkaElcileriID),
                            new SqlParameter("@LocationID", LocationID),
                            new SqlParameter("@UniversityID", UniversityID),
                            new SqlParameter("@FullName", Util.r(FullName)),
                            new SqlParameter("@Email", Util.r(Email))
                        );

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

    }
}