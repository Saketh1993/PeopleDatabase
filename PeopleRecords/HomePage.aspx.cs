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
        public static string GetPersonDetails()
        {
            //var stringArr = dataTable.Rows[0].ItemArray.Select(x => x.ToString()).ToArray();
            return "";
        }

        #region WebMethods
        /// <summary>
        /// This method is used to save the person detils , this method is called using ajax from the client side 
        /// </summary>
        /// <param name="Data"></param>
        [System.Web.Services.WebMethod]
        public static void SavePerson(string Data)
        {
            string[] Person = Data.Split(',');
            DB db = new DB();
            try
            {
                char Gender = Person[0].ToString().Trim() == "Male" ? 'M' : 'F';
                db.SavePersonDetails(Person[0].ToString().Trim(), Person[0].ToString().Trim(), Person[0].ToString().Trim(), Gender, Person[0].ToString().Trim());
            }
            catch (Exception ex)
            {

            }


        }

        /// <summary>
        /// This methods gets all the states and parses into JSON to send to client side 
        /// </summary>
        /// <returns></returns>
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
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

    }
}