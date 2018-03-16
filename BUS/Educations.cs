using System;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using LIB;
using DAL;

namespace BUS
{
    public class Educations
    {

        public static DataTable GetUniversities()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetUniversities").Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable GetEducationLevels()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetEducationLevels").Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable GetEducationStates()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetEducationStates").Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}
