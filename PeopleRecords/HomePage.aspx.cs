using Newtonsoft.Json;
using PeopleRecords.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PeopleRecords
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [System.Web.Services.WebMethod]
        public static string GetStates()
        {

            DB db = new DB();

            try
            {
                DataTable dtbl;
                //gets the table containing the states and state codes
               // db.GetStates(out dtbl);
                //string StatesJson = JsonConvert.SerializeObject(dtbl);
              //  return JsonConvert.SerializeObject(dtbl);
                return "Json String comes here";
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

    }
}