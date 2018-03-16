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
    public class Users
    {

        public static DataTable GetUsers()
        {
            return GetUsers(2);
        }

        public static DataTable GetUsers(int IsActive)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlParameter[] pParms = new SqlParameter[1];
                if (IsActive < 2)
                    pParms[0] = new SqlParameter("@IsActive", IsActive);
                else
                    pParms[0] = new SqlParameter("@IsActive", DBNull.Value);

                return SqlHelper.ExecuteDataset(conn, "GetUsers", pParms).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool Delete(ArrayList arrUserIDs, int ModifiedBy)
        {
            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "UsersDelTran");
            try
            {
                for (int i = 0; i < arrUserIDs.Count; i++)
                {
                    if (LIB.Util.IsNumeric(arrUserIDs[i]))
                    {
                        SqlHelper.ExecuteNonQuery(tran, "UsersDel",
                            new SqlParameter("@UserID", arrUserIDs[i]),
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

        public static DataTable Search(string txtName, int LocationID, int UniversityID, int EducationLevelID, DateTime CreateDate, DateTime BirthDate, int IsFemale, int IsFacebookUser, int IsActive)
        {
            StringBuilder Sql = new StringBuilder();

            Sql.Append("SELECT U.[UserID] ,U.[IsFacebookUser],U.[FacebookID] ,U.[Email] ,U.[FirstName] ,U.[Surname] ,U.[Password] ,U.[Photo] ,U.[IsFemale] ,U.[BirthDate] ,U.[LocationID] ,L.[LocationName] ,U.[EducationLevelID] ,EdLev.EducationLevel ,U.[EducationStatusID] ,EdSt.EducationStatus ,U.[UniversityID] ,Unv.UniversityName, U.[GSM], U.[CreateDate] ,U.[ModifyDate] ,U.[IsActive] FROM Users U");

            Sql.Append(" LEFT JOIN Locations L ON L.LocationID = U.LocationID");
            Sql.Append(" LEFT JOIN EducationLevels EdLev ON EdLev.EducationLevelID = U.EducationLevelID");
            Sql.Append(" LEFT JOIN EducationStates EdSt ON EdSt.EducationStatusID = U.EducationStatusID");
            Sql.Append(" LEFT JOIN Universities Unv ON Unv.UniversityID = U.UniversityID");

            Sql.Append(" WHERE U.IsDeleted = 0");

            if (txtName != "")
            {
                Sql.Append(" AND (LOWER(U.FirstName) LIKE '%");
                Sql.Append(Util.r(txtName).ToLower());
                Sql.Append("%' OR LOWER(U.Surname) LIKE '%");
                Sql.Append(Util.r(txtName).ToLower());
                Sql.Append("%' OR LOWER(U.Email) LIKE '%");
                Sql.Append(Util.r(txtName).ToLower());
                Sql.Append("%')");
            }

            if (LocationID > 0)
            {
                Sql.Append(" AND U.LocationID = ");
                Sql.Append(LocationID.ToString());
            }

            if (UniversityID > 0)
            {
                Sql.Append(" AND U.UniversityID = ");
                Sql.Append(UniversityID.ToString());
            }

            if (EducationLevelID > 0)
            {
                Sql.Append(" AND U.EducationLevelID = ");
                Sql.Append(EducationLevelID.ToString());
            }

            if (CreateDate != DateTime.MinValue)
            {
                Sql.Append(" AND U.CreateDate >= '");
                Sql.Append(LIB.Util.DateForSql(CreateDate));
                Sql.Append("'");
            }

            if (BirthDate != DateTime.MinValue)
            {
                Sql.Append(" AND U.BirthDate >= '");
                Sql.Append(LIB.Util.DateForSql(BirthDate));
                Sql.Append("'");
            }

            if (IsFemale != -1)
            {
                Sql.Append(" AND IsFemale = ");
                Sql.Append(IsFemale.ToString());
            }

            if (IsFacebookUser != -1)
            {
                Sql.Append(" AND IsFacebookUser = ");
                Sql.Append(IsFacebookUser.ToString());
            }

            if (IsActive != -1)
            {
                Sql.Append(" AND IsActive = ");
                Sql.Append(IsActive.ToString());
            }

            Sql.Append(" ORDER BY UserID DESC");

            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, CommandType.Text, Sql.ToString()).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool UserLogsIn(int UserID, int ActivityID)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[2];
                pParms[0] = new SqlParameter("@UserID", UserID);
                pParms[1] = new SqlParameter("@ActivityID", ActivityID);

                SqlHelper.ExecuteNonQuery(conn, "UserLogsIn", pParms);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static int UserFacebookIn(long FacebookID, string FirstName, string Surname, string IsFemale, DateTime BirthDate)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[5];
                pParms[0] = new SqlParameter("@FacebookID", FacebookID);
                pParms[1] = new SqlParameter("@FirstName", FirstName);
                pParms[2] = new SqlParameter("@Surname", Surname);

                if (IsFemale != "")
                    pParms[3] = new SqlParameter("@IsFemale", bool.Parse(IsFemale));
                else
                    pParms[3] = new SqlParameter("@IsFemale", DBNull.Value);

                if (BirthDate != DateTime.MinValue)
                    pParms[4] = new SqlParameter("@BirthDate", BirthDate);
                else
                    pParms[4] = new SqlParameter("@BirthDate", DBNull.Value);

                return Convert.ToInt32(SqlHelper.ExecuteScalar(conn, "UserFacebookIn", pParms));
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public static int UserIn(string FirstName, string Surname, string Email, string Password, DateTime BirthDate, int EducationLevelID, int EducationStatusID, int UniversityID, string ActivationCode)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[9];
                pParms[0] = new SqlParameter("@FirstName", Util.r(FirstName));
                pParms[1] = new SqlParameter("@Surname", Util.r(Surname));
                pParms[2] = new SqlParameter("@Email", Util.r(Email));
                pParms[3] = new SqlParameter("@Password", LIB.Encryption.Encrypt(Password));
                pParms[4] = new SqlParameter("@BirthDate", BirthDate);
                pParms[5] = new SqlParameter("@EducationLevelID", EducationLevelID);
                pParms[6] = new SqlParameter("@EducationStatusID", EducationStatusID);

                if (UniversityID == 0)
                    pParms[7] = new SqlParameter("@UniversityID", DBNull.Value);
                else
                    pParms[7] = new SqlParameter("@UniversityID", UniversityID);           
                pParms[8] = new SqlParameter("@ActivationCode", ActivationCode);

                return Convert.ToInt32(SqlHelper.ExecuteScalar(conn, "UserIn", pParms));
            }
            catch (Exception)
            {
                return -1;
            }
        }

        public static bool UserDetailUp(int UserID, string Photo, bool IsFemale, int LocationID, int EducationLevelID, int EducationStatusID, int UniversityID, string Friendfeed, string Twitter)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[9];
                pParms[0] = new SqlParameter("@UserID", UserID);
                pParms[1] = new SqlParameter("@Photo", Photo);
                pParms[2] = new SqlParameter("@IsFemale", IsFemale);
                pParms[3] = new SqlParameter("@LocationID", LocationID);
                pParms[4] = new SqlParameter("@EducationLevelID", EducationLevelID);
                pParms[5] = new SqlParameter("@EducationStatusID", EducationStatusID);
                pParms[6] = new SqlParameter("@UniversityID", UniversityID);
                pParms[7] = new SqlParameter("@Friendfeed", Friendfeed);
                pParms[8] = new SqlParameter("@Twitter", Twitter);

                SqlHelper.ExecuteNonQuery(conn, "UserDetailUp", pParms);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool UserActivityJoinUp(int UserID, string FirstName, string Surname, string Gsm, string Email, int EducationLevelID, int EducationStatusID, int UniversityID, int LocationID)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[9];
                pParms[0] = new SqlParameter("@UserID", UserID);
                pParms[1] = new SqlParameter("@FirstName", Util.r(FirstName));
                pParms[2] = new SqlParameter("@Surname", Util.r(Surname));
                pParms[3] = new SqlParameter("@Gsm", Util.r(Gsm));
                pParms[4] = new SqlParameter("@Email", Util.r(Email));
                pParms[5] = new SqlParameter("@EducationLevelID", EducationLevelID);
                pParms[6] = new SqlParameter("@EducationStatusID", EducationStatusID);
                
                if (UniversityID == 0)
                    pParms[7] = new SqlParameter("@UniversityID", DBNull.Value);
                else
                    pParms[7] = new SqlParameter("@UniversityID", UniversityID);

                pParms[8] = new SqlParameter("@LocationID", LocationID);

                SqlHelper.ExecuteNonQuery(conn, "UserActivityJoinUp", pParms);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }        

        public static bool HasUser(string Email)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[1];
                pParms[0] = new SqlParameter("@Email", Util.ClearString(Email));

                return (Convert.ToInt32(SqlHelper.ExecuteScalar(conn, "HasUser", pParms)) > 0) ? true : false;
            }
            catch (Exception)
            {
                return true;
            }
        }

        public static DataTable Login(string Email, string Password)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "UserLogin",
                    new SqlParameter("@Email", Util.ClearString(Email)),
                    new SqlParameter("@Password", LIB.Encryption.Encrypt(Util.r(Password)))
                    ).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable GetUserDetail(int UserID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetUserDetail",
                    new SqlParameter("@UserID", UserID)
                    ).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static int Activate(string ActivationCode)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[1];
                pParms[0] = new SqlParameter("@ActivationCode", Util.r(ActivationCode));

                return Convert.ToInt32(SqlHelper.ExecuteScalar(conn, "UserActivate", pParms));
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public static string GetPassword(string Email)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[1];
                pParms[0] = new SqlParameter("@Email", Util.r(Email));

                return SqlHelper.ExecuteDataset(conn, "GetPassword", pParms).Tables[0].Rows[0]["Password"].ToString();
            }
            catch (Exception)
            {
                return "";
            }
        }

        public static string GetActivationCode(string Email)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[1];
                pParms[0] = new SqlParameter("@Email", Util.r(Email));

                return SqlHelper.ExecuteDataset(conn, "GetActivationCode", pParms).Tables[0].Rows[0]["ActivationCode"].ToString();
            }
            catch (Exception)
            {
                return "";
            }
        }

        public static bool UserEducationUp(int UserID, int EducationLevelID, int EducationStatusID, int UniversityID)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[4];
                pParms[0] = new SqlParameter("@UserID", UserID);
                pParms[1] = new SqlParameter("@EducationLevelID", EducationLevelID);
                pParms[2] = new SqlParameter("@EducationStatusID", EducationStatusID);                

                if (EducationLevelID > 2)
                    pParms[3] = new SqlParameter("@UniversityID", UniversityID);
                else
                    pParms[3] = new SqlParameter("@UniversityID", DBNull.Value);

                SqlHelper.ExecuteNonQuery(conn, "UserEducationUp", pParms);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static DataTable GetUserCategories(int UserID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetUserCategories",
                    new SqlParameter("@UserID", UserID)
                    ).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool UserCategoriesUp(int UserID, ArrayList arrUserCategories) {

            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "UserCategoriesUpTran");

            try
            {
                SqlHelper.ExecuteNonQuery(tran, "UserCategoriesDel", new SqlParameter("@UserID", UserID));

                for (int i = 0; i < arrUserCategories.Count; i++)
                {
                    if (LIB.Util.IsNumeric(arrUserCategories[i]))
                    {
                        SqlHelper.ExecuteNonQuery(tran, "UserCategoriesIn",
                        new SqlParameter("@UserID", UserID),
                        new SqlParameter("@CategoryID", arrUserCategories[i])
                        );
                    }
                }
                tran.Commit();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool UserMemberInfoUp(int UserID, string Email, string Password)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[3];
                pParms[0] = new SqlParameter("@UserID", UserID);
                pParms[1] = new SqlParameter("@Email", Email);
                pParms[2] = new SqlParameter("@Password", LIB.Encryption.Encrypt(Password));

                SqlHelper.ExecuteNonQuery(conn, "UserMemberInfoUp", pParms);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool UserPhotoDel(int UserID)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[1];
                pParms[0] = new SqlParameter("@UserID", UserID);

                SqlHelper.ExecuteNonQuery(conn, "UserPhotoDel", pParms);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool UserPersonelUp(int UserID, string Photo, string FirstName, string Surname, int IsFemale, string BirthDate, int LocationID, string Gsm)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[8];
                pParms[0] = new SqlParameter("@UserID", UserID);
                pParms[1] = new SqlParameter("@Photo", Photo);
                pParms[2] = new SqlParameter("@FirstName", Util.r(FirstName));
                pParms[3] = new SqlParameter("@Surname", Util.r(Surname));

                if (IsFemale < 2)
                    pParms[4] = new SqlParameter("@IsFemale", IsFemale);
                else
                    pParms[4] = new SqlParameter("@IsFemale", DBNull.Value);

                if (LIB.Util.IsDate(BirthDate))
                    pParms[5] = new SqlParameter("@BirthDate", Util.r(BirthDate));
                else
                    pParms[5] = new SqlParameter("@BirthDate", DBNull.Value);

                pParms[6] = new SqlParameter("@LocationID", LocationID);
                pParms[7] = new SqlParameter("@Gsm", Util.r(Gsm));

                SqlHelper.ExecuteNonQuery(conn, "UserPersonelUp", pParms);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static DataTable GetUserActivities(int UserID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlParameter[] pParms = new SqlParameter[1];
                pParms[0] = new SqlParameter("@UserID", UserID);

                return SqlHelper.ExecuteDataset(conn, "GetUserActivities", pParms).Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static bool UserLocationsUp(int UserID, ArrayList arrUserLocations)
        {

            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "UserLocationsUpTran");

            try
            {
                SqlHelper.ExecuteNonQuery(tran, "UserLocationsDel", new SqlParameter("@UserID", UserID));

                for (int i = 0; i < arrUserLocations.Count; i++)
                {
                    if (LIB.Util.IsNumeric(arrUserLocations[i]))
                    {
                        SqlHelper.ExecuteNonQuery(tran, "UserLocationsIn",
                        new SqlParameter("@UserID", UserID),
                        new SqlParameter("@Location", arrUserLocations[i])
                        );
                    }
                }
                tran.Commit();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static DataTable GetUserLocations(int UserID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlParameter[] pParms = new SqlParameter[1];
                pParms[0] = new SqlParameter("@UserID", UserID);

                return SqlHelper.ExecuteDataset(conn, "GetUserLocations", pParms).Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static DataTable GetUpcomingActivitesByUser(int UserID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlParameter[] pParms = new SqlParameter[1];
                pParms[0] = new SqlParameter("@UserID", UserID);

                return SqlHelper.ExecuteDataset(conn, "GetUpcomingActivitesByUser", pParms).Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static bool UserActivitiesDel(int UserID, int ActivityID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlParameter[] pParms = new SqlParameter[2];
                pParms[0] = new SqlParameter("@UserID", UserID);
                pParms[1] = new SqlParameter("@ActivityID", ActivityID);

                SqlHelper.ExecuteNonQuery(conn, "UserActivitiesDel", pParms);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool UserActivityJoin(int UserID, int ActivityID, bool HasService,
            int InvitePeopleInfoID, string Value1, string Value2, string Value3, string Value4, string Value5, string Value6)
        {
            SqlConnection conn = DBHelper.getConnection();

            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "UserActivityJoin");
            try
            {
                SqlParameter[] pParms = new SqlParameter[3];
                pParms[0] = new SqlParameter("@UserID", UserID);
                pParms[1] = new SqlParameter("@ActivityID", ActivityID);
                pParms[2] = new SqlParameter("@HasService", HasService);

                SqlHelper.ExecuteNonQuery(tran, "UserActivityJoin", pParms);

                if (InvitePeopleInfoID > 0)
                {
                    pParms = new SqlParameter[8];
                    pParms[0] = new SqlParameter("@InvitePeopleInfoID", InvitePeopleInfoID);
                    pParms[1] = new SqlParameter("@UserID", UserID);
                    pParms[2] = new SqlParameter("@Value1", Util.r(Value1));
                    pParms[3] = new SqlParameter("@Value2", Util.r(Value2));
                    pParms[4] = new SqlParameter("@Value3", Util.r(Value3));
                    pParms[5] = new SqlParameter("@Value4", Util.r(Value4));
                    pParms[6] = new SqlParameter("@Value5", Util.r(Value5));
                    pParms[7] = new SqlParameter("@Value6", Util.r(Value6));

                    SqlHelper.ExecuteNonQuery(tran, "InvitePeopleValueIn", pParms);
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

        public static int UserCount()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return Convert.ToInt32(SqlHelper.ExecuteScalar(conn, "UserCount"));
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public static bool UserSocailUp(int UserID, string Facebook, string Friendfeed, string Twitter)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlParameter[] pParms = new SqlParameter[4];
                pParms[0] = new SqlParameter("@UserID", UserID);
                if (Facebook != "")
                    pParms[1] = new SqlParameter("@Facebook", Util.r(Facebook));
                else
                    pParms[1] = new SqlParameter("@Facebook", DBNull.Value);


                if (Friendfeed != "")
                    pParms[2] = new SqlParameter("@Friendfeed", Util.r(Friendfeed));
                else
                    pParms[2] = new SqlParameter("@Friendfeed", DBNull.Value);

                if (Twitter != "")
                    pParms[3] = new SqlParameter("@Twitter", Util.r(Twitter));
                else
                    pParms[3] = new SqlParameter("@Twitter", DBNull.Value);

                SqlHelper.ExecuteNonQuery(conn, "UserSocailUp", pParms);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}