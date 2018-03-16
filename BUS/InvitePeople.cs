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
    public class InvitePeople
    {
        public static bool InvitePeopleInfoIn(int ActivityID, string Label1, string Label2, string Label3, string Label4, string Label5, string Label6)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[7];
                pParms[0] = new SqlParameter("@ActivityID", ActivityID);
                pParms[1] = new SqlParameter("@Label1", Util.r(Label1));
                pParms[2] = new SqlParameter("@Label2", Util.r(Label2));
                pParms[3] = new SqlParameter("@Label3", Util.r(Label3));
                pParms[4] = new SqlParameter("@Label4", Util.r(Label4));
                pParms[5] = new SqlParameter("@Label5", Util.r(Label5));
                pParms[6] = new SqlParameter("@Label6", Util.r(Label6));

                SqlHelper.ExecuteNonQuery(conn, "InvitePeopleInfoIn", pParms);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool InvitePeopleInfoUp(int ActivityID, string Label1, string Label2, string Label3, string Label4, string Label5, string Label6)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[7];
                pParms[0] = new SqlParameter("@ActivityID", ActivityID);
                pParms[1] = new SqlParameter("@Label1", Util.r(Label1));
                pParms[2] = new SqlParameter("@Label2", Util.r(Label2));
                pParms[3] = new SqlParameter("@Label3", Util.r(Label3));
                pParms[4] = new SqlParameter("@Label4", Util.r(Label4));
                pParms[5] = new SqlParameter("@Label5", Util.r(Label5));
                pParms[6] = new SqlParameter("@Label6", Util.r(Label6));

                if ((SqlHelper.ExecuteNonQuery(conn, "InvitePeopleInfoUp", pParms)) == 0)
                    InvitePeopleInfoIn(ActivityID, Label1, Label2, Label3, Label4, Label5, Label6);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static DataTable GetInvitePeopleInfo(int ActivityID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlParameter[] pParms = new SqlParameter[1];
                pParms[0] = new SqlParameter("@ActivityID", ActivityID);

                return SqlHelper.ExecuteDataset(conn, "GetInvitePeopleInfo", pParms).Tables[0];
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }
    }
}
