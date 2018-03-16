using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class DBHelper
    {
        /// <summary>
        /// Yeni bir SqlConnection instance'ý döndürür.
        /// </summary>
        /// <returns>SqlConnection nesnesi.</returns>
        public static SqlConnection getConnection()
        {
            string DefaultConnectionStringConfig = System.Configuration.ConfigurationManager.AppSettings["ConnStr"];
            return new SqlConnection(DefaultConnectionStringConfig);
        }

        /// <summary>
        /// Ýstenen stored procedure'un ismi ile, ilgili stored procedure'un, yeni bir instance'ýný yaratýp döndürür.
        /// </summary>
        /// <param name="strSprocName">Nesnesi istenen stored procedure'un ismi.</param>
        /// <param name="conn">Veritabaný baðlantýsý nesnesi.</param>
        /// <returns>Yeni yaratýlan SQLCommand nesnesi.</returns>
        public static SqlCommand getSprocCmd(string strSprocName, SqlConnection conn)
        {
            SqlCommand cmd = new SqlCommand(strSprocName, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            return cmd;
        }
    }
}
