using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace PeopleRecords.Models
{
    public class DB
    {
        /// <summary>
        /// Method to get the states and state codes 
        /// </summary>
        /// <param name="dtbl"></param>
        /// <returns></returns>
        public void GetStates(out DataTable dtbl)
        {
            using (var conn = new SqlConnection(WebConfigurationManager.AppSettings["ConnectionString"]))
            {
                dtbl = new DataTable("uspStateList");
                SqlCommand cmd = new SqlCommand("uspStatesList", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 500;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dtbl);
                //return (Int32)cmd.Parameters["Return_Value"].Value;
            }
        }
    }
}