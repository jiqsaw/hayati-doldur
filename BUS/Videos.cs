using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using Microsoft.ApplicationBlocks.Data;
using LIB;
using DAL;

namespace BUS
{
    public class Videos
    {
        public static bool ApproveVideo(ArrayList arrVideoIDs, int ModifiedBy)
        {
            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "VideosApproveTran");
            try
            {
                for (int i = 0; i < arrVideoIDs.Count; i++)
                {
                    if (LIB.Util.IsNumeric(arrVideoIDs[i]))
                    {
                        SqlHelper.ExecuteNonQuery(tran, "ApproveVideo",
                                new SqlParameter("@VideoID", arrVideoIDs[i]),
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

        public static bool Delete(ArrayList arrVideoIDs, int ModifiedBy)
        {
            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "VideosDelTran");
            try
            {
                for (int i = 0; i < arrVideoIDs.Count; i++)
                {
                    if (LIB.Util.IsNumeric(arrVideoIDs[i]))
                    {
                        SqlHelper.ExecuteNonQuery(tran, "VideosDel",
                            new SqlParameter("@VideoID", arrVideoIDs[i]),
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

        public static DataTable GetPendingVideos()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetPendingVideos").Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable GetActivityVideos(int ActivityID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetActivityVideos",
                    new SqlParameter("@ActivityID", ActivityID)
                    ).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }     
    }
}
