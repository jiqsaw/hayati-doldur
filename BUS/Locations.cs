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
    public class Locations
    {

        public static DataTable GetCities()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetCities").Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable GetLocations()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetLocations").Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}
