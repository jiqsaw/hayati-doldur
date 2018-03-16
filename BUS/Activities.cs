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
    public class Activities
    {
        public static DataTable GetActivities()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {                
                return SqlHelper.ExecuteDataset(conn, "GetActivities").Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static int ActivityNew(int ActivityID, int CategoryID, int LocationID, string ActivityTitle, string ActivityHeader, string ActivityDetail, 
            string Place, string ActivityDate, DateTime ActivityStartDate, DateTime ActivityEndDate, bool IsShowMainPage, string ShowMainStartDate, 
            int UserCount, int AlternateUserCount, int InvitePeopleCount, bool HasService, bool IsActive, int ModifiedBy,
            string Label1, string Label2, string Label3, string Label4, string Label5, string Label6)
        {
            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "ActivitesNewTran");

            try
            {
                if (ActivityID < 1)
                {
                    SqlParameter[] pParms = new SqlParameter[17];
                    pParms[0] = new SqlParameter("@CategoryID", CategoryID);
                    pParms[1] = new SqlParameter("@LocationID", LocationID);
                    pParms[2] = new SqlParameter("@ActivityTitle", Util.r(ActivityTitle));
                    pParms[3] = new SqlParameter("@ActivityHeader", Util.r(ActivityHeader));
                    pParms[4] = new SqlParameter("@ActivityDetail", Util.CodeRplc(ActivityDetail));
                    pParms[5] = new SqlParameter("@Place", Util.r(Place));                    
                    pParms[6] = new SqlParameter("@ActivityDate", Util.r(ActivityDate));
                    pParms[7] = new SqlParameter("@ActivityStartDate", ActivityStartDate);
                    pParms[8] = new SqlParameter("@ActivityEndDate", ActivityEndDate);                    
                    pParms[9] = new SqlParameter("@IsShowMainPage", IsShowMainPage);

                    if (IsShowMainPage)
                        pParms[10] = new SqlParameter("@ShowMainStartDate", ShowMainStartDate);
                    else
                        pParms[10] = new SqlParameter("@ShowMainStartDate", DBNull.Value);

                    pParms[11] = new SqlParameter("@UserCount", UserCount);
                    pParms[12] = new SqlParameter("@AlternateUserCount", AlternateUserCount);
                    pParms[13] = new SqlParameter("@InvitePeopleCount", InvitePeopleCount);
                    pParms[14] = new SqlParameter("@HasService", HasService);
                    pParms[15] = new SqlParameter("@IsActive", IsActive);
                    pParms[16] = new SqlParameter("@ModifiedBy", ModifiedBy);

                    int rtActivityID = Convert.ToInt32(SqlHelper.ExecuteScalar(tran, "ActivityIn", pParms));

                    if ((Label1.Trim().Length + Label2.Trim().Length + Label3.Trim().Length + Label4.Trim().Length + Label5.Trim().Length + Label6.Trim().Length) > 1)
                        InvitePeople.InvitePeopleInfoIn(rtActivityID, Label1, Label2, Label3, Label4, Label5, Label6);

                    tran.Commit();

                    return rtActivityID;
                }
                else {
                    SqlParameter[] pParms = new SqlParameter[18];
                    pParms[0] = new SqlParameter("@ActivityID", ActivityID);
                    pParms[1] = new SqlParameter("@CategoryID", CategoryID);
                    pParms[2] = new SqlParameter("@LocationID", LocationID);
                    pParms[3] = new SqlParameter("@ActivityTitle", Util.r(ActivityTitle));
                    pParms[4] = new SqlParameter("@ActivityHeader", Util.r(ActivityHeader));
                    pParms[5] = new SqlParameter("@ActivityDetail", Util.CodeRplc(ActivityDetail));
                    pParms[6] = new SqlParameter("@Place", Util.r(Place));
                    pParms[7] = new SqlParameter("@ActivityDate", Util.r(ActivityDate));
                    pParms[8] = new SqlParameter("@ActivityStartDate", ActivityStartDate);
                    pParms[9] = new SqlParameter("@ActivityEndDate", ActivityEndDate);
                    pParms[10] = new SqlParameter("@IsShowMainPage", IsShowMainPage);

                    if (IsShowMainPage)
                        pParms[11] = new SqlParameter("@ShowMainStartDate", ShowMainStartDate);
                    else
                        pParms[11] = new SqlParameter("@ShowMainStartDate", DBNull.Value);

                    pParms[12] = new SqlParameter("@UserCount", UserCount);
                    pParms[13] = new SqlParameter("@AlternateUserCount", AlternateUserCount);
                    pParms[14] = new SqlParameter("@InvitePeopleCount", InvitePeopleCount);
                    pParms[15] = new SqlParameter("@HasService", HasService);
                    pParms[16] = new SqlParameter("@ModifiedBy", ModifiedBy);
                    pParms[17] = new SqlParameter("@IsActive", IsActive);

                    SqlHelper.ExecuteNonQuery(tran, "ActivityUp", pParms);                    

                    InvitePeople.InvitePeopleInfoUp(ActivityID, Label1, Label2, Label3, Label4, Label5, Label6);

                    tran.Commit();

                    return ActivityID;
                }
            }
            catch (Exception)
            {
                tran.Rollback();
                return -1;
            }
        }

        public static bool ActivityPhotoUp(int ActivityID, string ActivityPhoto)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[2];
                pParms[0] = new SqlParameter("@ActivityID", ActivityID);
                pParms[1] = new SqlParameter("@ActivityPhoto", Util.r(ActivityPhoto));

                SqlHelper.ExecuteNonQuery(conn, "ActivityPhotoUp", pParms);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool ActivityVideoEmbedUp(int ActivityID, string DefaultVideoEmbed)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[2];
                pParms[0] = new SqlParameter("@ActivityID", ActivityID);
                pParms[1] = new SqlParameter("@DefaultVideoEmbed", DefaultVideoEmbed);

                SqlHelper.ExecuteNonQuery(conn, "ActivityVideoEmbedUp", pParms);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool ActivityVideoURLUp(int ActivityID, string DefaultVideoURL)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[2];
                pParms[0] = new SqlParameter("@ActivityID", ActivityID);
                pParms[1] = new SqlParameter("@DefaultVideoURL", DefaultVideoURL);

                SqlHelper.ExecuteNonQuery(conn, "ActivityVideoURLUp", pParms);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        
        public static DataTable GetActivityPreviews(int ActivityID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetActivityPreviews",
                    new SqlParameter("@ActivityID", ActivityID)).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }
 
        public static DataTable GetActivitesByCategoryID(int CategoryID) {
            return GetActivitesByCategoryID(CategoryID, 2);
        }

        public static DataTable GetActivitesByCategoryID(int CategoryID, int IsActive)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlParameter[] pParms = new SqlParameter[2];
                pParms[0] = new SqlParameter("@CategoryID", CategoryID);
                if (IsActive < 2)
                    pParms[1] = new SqlParameter("@IsActive", IsActive);
                else
                    pParms[1] = new SqlParameter("@IsActive", DBNull.Value);

                return SqlHelper.ExecuteDataset(conn, "GetActivitesByCategoryID", pParms).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable GetActivityDetail(int ActivityID, int UserID) {
            return GetActivityDetail(ActivityID, UserID, 1);
        }
        
        public static DataTable GetActivityDetail(int ActivityID)
        {
            return GetActivityDetail(ActivityID, 2);
        }

        public static DataTable GetActivityDetail(int ActivityID, int UserID, int IsActive)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlParameter[] pParms = new SqlParameter[3];
                pParms[0] = new SqlParameter("@ActivityID", ActivityID);
                if (UserID != 0)
                    pParms[1] = new SqlParameter("@UserID", UserID);
                else
                    pParms[1] = new SqlParameter("@UserID", DBNull.Value);

                if (IsActive < 2)
                    pParms[2] = new SqlParameter("@IsActive", Convert.ToBoolean(IsActive));
                else
                    pParms[2] = new SqlParameter("@IsActive", DBNull.Value);

                return SqlHelper.ExecuteDataset(conn, "GetActivityDetail", pParms).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool ActivitesDel(ArrayList arrActivityID, int ModifiedBy)
        {
            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "ActivitesDelTran");
            try
            {
                for (int i = 0; i < arrActivityID.Count; i++)
                {
                    if (LIB.Util.IsNumeric(arrActivityID[i]))
                    {
                        SqlHelper.ExecuteNonQuery(tran, "ActivitesDel",
                        new SqlParameter("@ActivityID", arrActivityID[i]),
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

        public static DataTable ActivitySearch(string ActivityTitleDetail)
        {
            return ActivitySearch(0, 0, ActivityTitleDetail, DateTime.MinValue, DateTime.MaxValue, -1);
        }

        public static DataTable ActivitySearch(int CategoryID, int LocationID, string ActivityTitleDetail, DateTime ActivityStartDate, DateTime ActivityEndDate, int IsActive)
        {
            StringBuilder Sql = new StringBuilder();

            Sql.Append("SELECT A.*, C.CategoryName FROM Activities A");
            Sql.Append(" INNER JOIN Categories C ON C.CategoryID = A.CategoryID");
            Sql.Append(" WHERE IsDeleted = 0");

            if (CategoryID > 0)
            {
                Sql.Append(" AND A.CategoryID = ");
                Sql.Append(CategoryID.ToString());
            }

            if (LocationID > 0)
            {
                Sql.Append(" AND A.LocationID = ");
                Sql.Append(LocationID.ToString());
            }

            if (ActivityTitleDetail != "")
            {
                Sql.Append(" AND (LOWER(A.ActivityTitle) LIKE '%");
                Sql.Append(Util.r(ActivityTitleDetail.ToLower()).ToString());
                Sql.Append("%'");

                Sql.Append(" OR LOWER(A.ActivityHeader) LIKE '%");
                Sql.Append(Util.r(ActivityTitleDetail.ToLower()).ToString());
                Sql.Append("%'");

                Sql.Append(" OR A.ActivityDetail LIKE '%");
                Sql.Append(Util.r(ActivityTitleDetail.ToLower()).ToString());
                Sql.Append("%')");
            }

            if (ActivityStartDate != DateTime.MinValue)
            {
                Sql.Append(" AND A.ActivityStartDate >= '");
                Sql.Append(LIB.Util.DateForSql(ActivityStartDate));
                Sql.Append("'");
            }

            if (ActivityEndDate != DateTime.MaxValue)
            {
                Sql.Append(" AND A.ActivityEndDate <= '");
                Sql.Append(LIB.Util.DateForSql(ActivityEndDate));
                Sql.Append("'");
            }

            if (IsActive != -1)
            {
                Sql.Append(" AND A.IsActive = ");
                Sql.Append(IsActive.ToString());
            }

            Sql.Append(" ORDER BY ActivityID DESC");

            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, CommandType.Text, Sql.ToString()).Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static bool ActivitesHitUp(int ActivityID)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[1];
                pParms[0] = new SqlParameter("@ActivityID", ActivityID);

                SqlHelper.ExecuteNonQuery(conn, "ActivitesHitUp", pParms);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static DataTable GetActivityUsers(int ActivityID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetActivityUsers",
                    new SqlParameter("@ActivityID", ActivityID)).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable GetActivityUsersDetails(int ActivityID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetActivityUsersDetails",
                    new SqlParameter("@ActivityID", ActivityID)).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable GetActivitesRand(int CategoryID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetActivitesRand",
                    new SqlParameter("@CategoryID", CategoryID)).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable GetActivitiesOfDay(DateTime StartDate)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetActivitiesOfDay",
                    new SqlParameter("@StartDate", StartDate)).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static int GetUpcomingActivitesCount(int UserID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return Convert.ToInt32(
                    SqlHelper.ExecuteScalar(conn, "GetUpcomingActivitesCount", 
                    new SqlParameter("@UserID", UserID))
                    );
            }
            catch (Exception)
            {
                return 0;
            }
        }       

        public static bool ActivityRelationsIn(int ActivityID, ArrayList arrActivityRelationID)
        {
            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "ActivityRelationsTran");
            try
            {

                SqlParameter[] pParms;

                pParms = new SqlParameter[2];
                for (int i = 0; i < arrActivityRelationID.Count; i++)
                {
                    if (LIB.Util.IsNumeric(arrActivityRelationID[i]))
                    {
                        pParms[0] = new SqlParameter("@ActivityID", ActivityID);
                        pParms[1] = new SqlParameter("@ActivityRelationID", Convert.ToInt32(arrActivityRelationID[i]));

                        SqlHelper.ExecuteNonQuery(tran, "ActivityRelationsIn", pParms);
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

        public static bool ActivityRelationsDel(int ActivityID, ArrayList arrActivityRelationID)
        {
            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "ActivityRelationsDelTran");
            try
            {
                for (int i = 0; i < arrActivityRelationID.Count; i++)
                {
                    if (LIB.Util.IsNumeric(arrActivityRelationID[i]))
                    {
                        SqlHelper.ExecuteNonQuery(tran, "ActivityRelationsDel",
                        new SqlParameter("@ActivityID", ActivityID),
                        new SqlParameter("@ActivityRelationID", arrActivityRelationID[i])                    
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

        public static DataTable GetActivityRelations(int ActivityID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlParameter[] pParms = new SqlParameter[1];
                pParms[0] = new SqlParameter("@ActivityID", ActivityID);

                return SqlHelper.ExecuteDataset(conn, "GetActivityRelations", pParms).Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static DataTable GetUpComingActivites(int UserID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlParameter[] pParms = new SqlParameter[1];
                if (UserID > 0)
                    pParms[0] = new SqlParameter("@UserID", UserID);
                else
                    pParms[0] = new SqlParameter("@UserID", DBNull.Value);

                return SqlHelper.ExecuteDataset(conn, "GetUpComingActivites", pParms).Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static DataTable GetActivityList()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetActivityList").Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static DataTable GetActivityListDetailTitle()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetActivityListDetailTitle").Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }

        public static DataTable GetActivityLabels(int ActivityID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetActivityLabels",
                    new SqlParameter("@ActivityID", ActivityID)).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable GetActivitesByCategory(int CategoryID, int UserID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlParameter[] pParms = new SqlParameter[2];
                pParms[0] = new SqlParameter("@CategoryID", CategoryID);
                if (UserID > 0)
                    pParms[1] = new SqlParameter("@UserID", UserID);
                else
                    pParms[1] = new SqlParameter("@UserID", DBNull.Value);

                return SqlHelper.ExecuteDataset(conn, "GetActivitesByCategory", pParms).Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }
    }   
}
