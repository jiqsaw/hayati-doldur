using System;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using LIB;
using DAL;
using System.Collections;

namespace BUS
{
    public class News
    {
        public static DataTable GetLastNews()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetLastNews").Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static bool Save(int NewsID, int ActivityID, string NewsTitle, string NewsDetail, DateTime NewsDate, int CreatedBy, bool IsActive)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {

                if (NewsID == 0)

                    SqlHelper.ExecuteNonQuery(conn, "NewsIn",
                            new SqlParameter("@ActivityID", ActivityID),
                            new SqlParameter("@NewsTitle", Util.r(NewsTitle)),
                            new SqlParameter("@NewsDetail", Util.r(NewsDetail)),
                            new SqlParameter("@NewsDate", NewsDate),
                            new SqlParameter("@CreatedBy", CreatedBy),
                            new SqlParameter("@IsActive", IsActive)
                            );
                else
                    SqlHelper.ExecuteNonQuery(conn, "NewsUp",
                        new SqlParameter("@NewsID", NewsID),
                        new SqlParameter("@ActivityID", ActivityID),
                        new SqlParameter("@NewsTitle", Util.r(NewsTitle)),
                        new SqlParameter("@NewsDetail", Util.r(NewsDetail)),
                        new SqlParameter("@NewsDate", NewsDate),
                        new SqlParameter("@CreatedBy", CreatedBy),
                        new SqlParameter("@IsActive", IsActive)
                        );

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static DataTable GetNewsDetail(int NewsID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetNewsDetail", new SqlParameter("@NewsID", NewsID)).Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static bool Delete(ArrayList arrNewsID, int ModifiedBy)
        {
            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "ActivitesDelTran");
            try
            {
                for (int i = 0; i < arrNewsID.Count; i++)
                {
                    if (LIB.Util.IsNumeric(arrNewsID[i]))
                    {
                        SqlHelper.ExecuteNonQuery(tran, "NewsDel",
                        new SqlParameter("@NewsID", arrNewsID[i]),
                        new SqlParameter("@ModifiedBy", ModifiedBy)
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

        public static DataTable GetNews()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetNews").Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static DataTable GetNewsByActivity(int ActivityID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlParameter[] pParms = new SqlParameter[1];
                pParms[0] = new SqlParameter("@ActivityID", ActivityID);

                return SqlHelper.ExecuteDataset(conn, "GetNewsByActivity", pParms).Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }
    }
}