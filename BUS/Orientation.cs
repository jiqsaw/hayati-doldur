using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using DAL;
using LIB;
using System.Collections;

namespace BUS
{
    public class Orientation
    {

        public static DataTable GetOrientationParameters()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetOrientationParameters").Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable GetOrientationDetail(int OrientationUniversityID)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetOrientationDetail", new SqlParameter("@OrientationUniversityID", OrientationUniversityID)).Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable GetOrientationUniversities()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetOrientationUniversities").Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool Save(int OrientationUniversityID, int UniversityID, string Address, string Web, string Ulasim, DataTable dtValues)
        {
            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "OrientationTran");
            try
            {

                int Identity = Convert.ToInt32(SaveOrientationUniversites(tran, OrientationUniversityID, UniversityID, Address, Web, Ulasim));
                if (DelValues(tran, Identity))

                foreach (DataRow dr in dtValues.Rows)
                    SaveOrientationParameterValues(tran, Identity, Convert.ToInt32(dr["OrientationParameterID"]), dr["OrientationParameterValue"].ToString(), dr["OrientationParameterDesc"].ToString());

                tran.Commit();
                return true;
            }
            catch (Exception)
            {
                tran.Rollback();
                return false;
            }
        }

        public static int SaveOrientationUniversites(SqlTransaction tran, int OrientationUniversityID, int UniversityID, string Address, string Web, string Ulasim)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {

                if (OrientationUniversityID == 0)
                {

                    SqlParameter[] pParms = new SqlParameter[4];
                    pParms[0] = new SqlParameter("@UniversityID", UniversityID);
                    pParms[1] = new SqlParameter("@Address", Address);
                    pParms[2] = new SqlParameter("@Web", Web);
                    pParms[3] = new SqlParameter("@Ulasim", Ulasim);

                    return Convert.ToInt32(SqlHelper.ExecuteScalar(tran, "OrientationUniversitiesIn", pParms));
                }
                else
                {
                    SqlParameter[] pParms = new SqlParameter[5];
                    pParms[0] = new SqlParameter("@OrientationUniversityID", OrientationUniversityID);
                    pParms[1] = new SqlParameter("@UniversityID", UniversityID);
                    pParms[2] = new SqlParameter("@Address", Address);
                    pParms[3] = new SqlParameter("@Web", Web);
                    pParms[4] = new SqlParameter("@Ulasim", Ulasim);

                    SqlHelper.ExecuteNonQuery(tran, "OrientationUniversitiesUp", pParms);

                    return OrientationUniversityID;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public static bool SaveOrientationParameterValues(SqlTransaction tran, int OrientationUniversityID, int OrientationParameterID, string OrientationParameterValue, string OrientationParameterDesc)
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                SqlParameter[] pParms = new SqlParameter[4];
                pParms[0] = new SqlParameter("@OrientationUniversityID", OrientationUniversityID);
                pParms[1] = new SqlParameter("@OrientationParameterID", OrientationParameterID);
                pParms[2] = new SqlParameter("@OrientationParameterValue", OrientationParameterValue);
                pParms[3] = new SqlParameter("@OrientationParameterDesc", OrientationParameterDesc);

                SqlHelper.ExecuteNonQuery(tran, "OrientationParameterValuesIn", pParms);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool Delete(ArrayList arrOrientationUniversityID)
        {
            SqlConnection conn = DBHelper.getConnection();
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction(IsolationLevel.ReadCommitted, "OrientationUniversityDelTran");
            try
            {
                for (int i = 0; i < arrOrientationUniversityID.Count; i++)
                {
                    if (LIB.Util.IsNumeric(arrOrientationUniversityID[i]))
                    {
                        SqlHelper.ExecuteNonQuery(tran, "OrientationUniversitiesDel",
                        new SqlParameter("@OrientationUniversityID", arrOrientationUniversityID[i])
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

        public static bool DelValues(SqlTransaction tran, int OrientationUniversityID)
        {
            SqlConnection conn = DBHelper.getConnection();

            try
            {
                SqlParameter[] pParms = new SqlParameter[1];
                pParms[0] = new SqlParameter("@OrientationUniversityID", OrientationUniversityID);

                SqlHelper.ExecuteNonQuery(tran, "OrientationParameterValuesDel", pParms);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
