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
    public class Categories
    {

        public static DataTable GetCategories()
        {
            SqlConnection conn = DBHelper.getConnection();
            try
            {
                return SqlHelper.ExecuteDataset(conn, "GetCategories").Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}
