using Newtonsoft.Json;
using PeopleRecords.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
        public static string GetPersonDetails(string Name)
        {
            DataTable dtbl;
            DB db = new DB();
            db.GetPeopleData(out dtbl);
            dtbl.Columns.Add("Name");
            StringBuilder sb = new StringBuilder();
            // sb.Append('[');
            DataRow dr;
            foreach (DataRow dr1 in dtbl.Rows)
            {
                dr1["Name"] = dr1["First_Name"].ToString() + " " + dr1["Last_Name"].ToString();
                sb.Append(string.Format("{0},", dr1["Name"].ToString()));
            }
            if(dtbl.Select("Name='"+Name.Trim()).Length>0)
            {
                 dr = dtbl.Select("Name='" + Name.Trim())[0];
               
            }
            return JsonConvert.SerializeObject(dtbl);
            //sb.Remove(sb.Length - 1, 1);
            // sb.Append(']');
            // return sb.ToString();
        }



        #region WebMethods
        /// <summary>
        /// This method is used to save the person detils , this method is called using ajax from the client side 
        /// </summary>
        /// <param name="Data"></param>
        [System.Web.Services.WebMethod]
        public static string SavePerson(string PersonDetail)
        {
            //Regex word = new Regex(@"/([A-Z,a-z,:])+/g");
            //Match m = word.Match(PersonDetail.ToString());
            //PersonDetail = m.Value;
            //Regex reg = new Regex("([A - Z,]) +");
            //PersonDetail = Regex.Match(PersonDetail.ToString(), reg);
            PersonDetail = PersonDetail.Replace('\\',' ').Replace(':',',').Replace('{',' ').Replace('}',' ').Replace('"',' ').Replace('\"',' ');
            string[] array = PersonDetail.Split(',');
            
           
            DB db = new DB();
            try
            {
                char Gender = array[7].ToString().Contains("Male") ? 'M' : 'F';
                db.SavePersonDetails(array[1].ToString().Trim(), array[3].ToString().Trim(), array[5].ToString().Trim(), Gender, array[9].ToString().Trim(),0);
                return "Pass";
            }
            catch (Exception ex)
            {
                return "fail";
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
                db.GetStates(out dtbl);
                string StatesJson = JsonConvert.SerializeObject(dtbl);
                return JsonConvert.SerializeObject(dtbl);
                //return "Json String comes here";
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

    }
}