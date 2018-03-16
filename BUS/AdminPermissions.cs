using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DAL;
using Microsoft.ApplicationBlocks.Data;
using LIB;
using System.Collections;

namespace BUS
{
    public class AdminPermissions
    {
        public static DataTable AdminPermissionsSel()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "AdminPermissionsSel").Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool AdminUserPermissionDel(int AdminID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlHelper.ExecuteNonQuery(conn, "AdminUserPermissionDel", new SqlParameter("@AdminID", AdminID));
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static DataTable AdminSel()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "AdminSel").Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable GetAdminUserPermission(int AdminID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetAdminUserPermission", new SqlParameter("@AdminID", AdminID)).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }
        
        public static bool HasAdmins(string UserName)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return (Convert.ToInt32((SqlHelper.ExecuteScalar(conn, "HasAdmin", new SqlParameter("@UserName", Util.r(UserName.Trim()))))) > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool AdminUserNew(int AdminID, string UserName, string Password, string Firstname, string SurName, string Description, int ModifiedBy, bool IsActive, ArrayList arrAdminPermission)
        {
            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "AdminUserNewTran");
            
            try
            {

                bool Exec;

                if (AdminID < 1)
                    Exec = int.TryParse(SqlHelper.ExecuteScalar(tran, "AdminsIn",
                                        new SqlParameter("@UserName", Util.r(UserName.Trim())),
                                        new SqlParameter("@Password", Encryption.Encrypt(Util.r(Password.Trim()))),
                                        new SqlParameter("@Firstname", Util.r(Firstname)),
                                        new SqlParameter("@SurName", Util.r(SurName)),
                                        new SqlParameter("@Description", Util.r(Description)),
                                        new SqlParameter("@IsActive", IsActive)
                                        ).ToString(), out AdminID);
                else
                {
                    SqlHelper.ExecuteScalar(tran, "AdminsUp",
                                        new SqlParameter("@AdminID", AdminID),
                                        new SqlParameter("@Password", Encryption.Encrypt(Util.r(Password.Trim()))),
                                        new SqlParameter("@Firstname", Util.r(Firstname)),
                                        new SqlParameter("@SurName", Util.r(SurName)),
                                        new SqlParameter("@Description", Util.r(Description)),
                                        new SqlParameter("@ModifiedBy", ModifiedBy),
                                        new SqlParameter("@IsActive", IsActive)
                                        );
                    Exec = true;
                }

                if (Exec)
                {

                    SqlHelper.ExecuteNonQuery(tran, "AdminUserPermissionDel", new SqlParameter("@AdminID", AdminID));
                    
                    for (int i = 0; i < arrAdminPermission.Count; i++)
		            {
                        if (LIB.Util.IsNumeric(arrAdminPermission[i]))
                        {
                            SqlHelper.ExecuteNonQuery(tran, "AdminUserPermissionsIn",
                            new SqlParameter("@AdminID", AdminID),
                            new SqlParameter("@AdminPermissionID", arrAdminPermission[i])
                            );
                        }
                    }
                    tran.Commit();
                }
                return true;
            }
            catch (Exception)
            {
                tran.Rollback();
                return false;
            }
        }

        public static DataTable GetAdmin(int AdminID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetAdmin", new SqlParameter("@AdminID", AdminID)).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool AdminDel(ArrayList arrAdminID, int ModifiedBy)
        {
            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "AdminUserNewTran");
            try
            {
                for (int i = 0; i < arrAdminID.Count; i++)
                {
                    if (LIB.Util.IsNumeric(arrAdminID[i]))
                    {
                        SqlHelper.ExecuteNonQuery(tran, "AdminsDel",
                        new SqlParameter("@AdminID", arrAdminID[i]),
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