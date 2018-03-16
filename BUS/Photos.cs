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
    public class Photos
    {
        public static DataTable GetPendingPhotos()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetPendingPhotos").Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool Delete(ArrayList arrPhotooIDs, int ModifiedBy)
        {
            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "PhotosDelTran");
            try
            {
                for (int i = 0; i < arrPhotooIDs.Count; i++)
                {
                    if (LIB.Util.IsNumeric(arrPhotooIDs[i]))
                    {
                        SqlHelper.ExecuteNonQuery(tran, "PhotosDel",
                            new SqlParameter("@PhotoID", arrPhotooIDs[i]),
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

        public static bool ApprovePhoto(ArrayList arrPhotooIDs, int ModifiedBy)
        {
            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "PhotosApproveTran");
            try
            {
                for (int i = 0; i < arrPhotooIDs.Count; i++)
                {
                    if (LIB.Util.IsNumeric(arrPhotooIDs[i]))
                    {
                        SqlHelper.ExecuteNonQuery(tran, "ApprovePhoto",
                                new SqlParameter("@PhotoID", arrPhotooIDs[i]),
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

        public static DataTable GetActivityPhotos(int ActivityID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetActivityPhotos",
                    new SqlParameter("@ActivityID", ActivityID)
                    ).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable GetActivityLastPhotos(int ActivityID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetActivityLastPhotos",
                    new SqlParameter("@ActivityID", ActivityID)
                    ).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable GetPhotosByUserID(int UserID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetPhotosByUserID",
                    new SqlParameter("@UserID", UserID)
                    ).Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static DataTable GetLastPhotos()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetLastPhotos").Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool PhotosIn(int ActivityID, string Photo, string Keywords, int CreatedByUserID)
        {
            if (Photo.Trim() == "") return false;

            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "PhotosInTran");
            try
            {
                SqlParameter[] pParms = new SqlParameter[3];
                pParms[0] = new SqlParameter("@Photo", Photo);
                pParms[1] = new SqlParameter("@Keywords", Util.r(Keywords));
                pParms[2] = new SqlParameter("@CreatedByUserID", CreatedByUserID);

                int PhotoID = Convert.ToInt32(SqlHelper.ExecuteScalar(tran, "PhotosIn", pParms));
                
                pParms = new SqlParameter[2];
                pParms[0] = new SqlParameter("@ActivityID", ActivityID);
                pParms[1] = new SqlParameter("@PhotoID", PhotoID);

                SqlHelper.ExecuteNonQuery(tran, "ActivityPhotosIn", pParms);
                
                tran.Commit();
                return true;
            }
            catch (Exception)
            {
                tran.Rollback();
                return false;
            }
        }

        public static DataTable GetPhotoDetail(int PhotoID, int ActivityID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetPhotoDetail",
                    new SqlParameter("@PhotoID", PhotoID), new SqlParameter("@ActivityID", ActivityID)
                    ).Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static DataTable GetDeletedPhotos() {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlParameter[] pParms = new SqlParameter[2];
                pParms[0] = new SqlParameter("@IsActive", DBNull.Value);
                pParms[1] = new SqlParameter("@IsDeleted", true);

                return SqlHelper.ExecuteDataset(conn, "GetPhotosforAdmin", pParms).Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static DataTable GetPhotosforAdmin(bool IsActive, bool IsDeleted)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlParameter[] pParms = new SqlParameter[2];
                pParms[0] = new SqlParameter("@IsActive", IsActive);
                pParms[1] = new SqlParameter("@IsDeleted", IsDeleted);

                return SqlHelper.ExecuteDataset(conn, "GetPhotosforAdmin", pParms).Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static bool BackApprovePhoto(ArrayList arrPhotoIDs, int ModifiedBy)
        {
            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "BackApprovePhotoTran");
            try
            {
                for (int i = 0; i < arrPhotoIDs.Count; i++)
                {
                    if (LIB.Util.IsNumeric(arrPhotoIDs[i]))
                    {
                        SqlHelper.ExecuteNonQuery(tran, "BackApprovePhoto",
                            new SqlParameter("@PhotoID", arrPhotoIDs[i]),
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
    }
}