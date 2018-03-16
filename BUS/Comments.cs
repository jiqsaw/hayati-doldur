using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using LIB;
using DAL;
using System.Collections;

namespace BUS
{
    public class Comments
    {
        public static DataTable GetPendingComments()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetPendingComments").Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool ApproveComment(int CommentID, string CommentDetail, int ModifiedBy)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlHelper.ExecuteNonQuery(conn, "ApproveComment",
                        new SqlParameter("@CommentID", CommentID),
                        new SqlParameter("@CommentDetail", Util.r(CommentDetail)),
                        new SqlParameter("@ModifiedBy", ModifiedBy)
                        );
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool Delete(int CommentID, int ModifiedBy) {
            ArrayList arr = new ArrayList();
            arr.Add(CommentID);
            return Delete(arr, ModifiedBy);
        }

        public static bool Delete(ArrayList arrCommentIDs, int ModifiedBy)
        {
            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "AdminCommentNewTran");
            try
            {
                for (int i = 0; i < arrCommentIDs.Count; i++)
                {
                    if (LIB.Util.IsNumeric(arrCommentIDs[i]))
                    {
                        SqlHelper.ExecuteNonQuery(tran, "CommentDel",
                            new SqlParameter("@CommentID", arrCommentIDs[i]),
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

        public static DataTable GetComments(int CommentTypeID, COM.Enum.CommentTypeCode CommentTypeCode)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetComments",
                    new SqlParameter("@CommentTypeID", CommentTypeID),
                    new SqlParameter("@CommentTypeCode", (int)CommentTypeCode)
                    ).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool Insert(int UserID, int CommentTypeID, COM.Enum.CommentTypeCode CommentTypeCode, string CommentDetailOriginal, string CommentByName, string CommentByMail, bool IsNotifyMe)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[7];
                if (UserID == 0)
                    pParms[0] = new SqlParameter("@UserID", DBNull.Value);
                else
                    pParms[0] = new SqlParameter("@UserID", UserID);
                pParms[1] = new SqlParameter("@CommentTypeID", CommentTypeID);
                pParms[2] = new SqlParameter("@CommentTypeCode", (int)CommentTypeCode);
                pParms[3] = new SqlParameter("@CommentDetailOriginal", Util.r(CommentDetailOriginal));
                pParms[4] = new SqlParameter("@CommentByName", Util.r(CommentByName));
                pParms[5] = new SqlParameter("@CommentByMail", Util.r(CommentByMail));
                pParms[6] = new SqlParameter("@IsNotifyMe", IsNotifyMe);

                SqlHelper.ExecuteNonQuery(conn, "CommentsIn", pParms);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static DataTable GetCommentNotifyEmails(int CommentTypeID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetCommentNotifyEmails",
                    new SqlParameter("@CommentTypeID", CommentTypeID)
                    ).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable GetLastComments()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetLastComments").Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static DataTable GetCommentsForAdmin(bool IsActive, bool IsDeleted)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlParameter[] pParms = new SqlParameter[2];
                pParms[0] = new SqlParameter("@IsActive", IsActive);
                pParms[1] = new SqlParameter("@IsDeleted", IsDeleted);

                return SqlHelper.ExecuteDataset(conn, "GetCommentsForAdmin", pParms).Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static bool BackApprove(ArrayList arrCommentIDs, int ModifiedBy)
        {
            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "BackApproveTran");
            try
            {
                for (int i = 0; i < arrCommentIDs.Count; i++)
                {
                    if (LIB.Util.IsNumeric(arrCommentIDs[i]))
                    {
                        SqlHelper.ExecuteNonQuery(tran, "BackApprove",
                            new SqlParameter("@CommentID", arrCommentIDs[i]),
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
