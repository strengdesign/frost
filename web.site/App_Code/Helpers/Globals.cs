using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace web.site.App_Code.Helpers
{
    public class Globals
    {
        #region Public Properties
        /// <summary>
        /// The base url of the website.
        /// </summary>
        public static string SiteURL
        {
            get
            {
                string environment = ConfigurationManager.AppSettings["environment"].ToLower();

                switch (environment)
                {
                    case "dev":
                        return "http://www.frrcpas.com.strenghosting.com";
                    case "staging":
                        return "http://www.frrcpas.com.strenghosting.com";
                    case "production":
                        return "http://www.frrcpas.com";
                    default:
                        return String.Empty;
                }
            }
        }

        /// <summary>
        /// The admin email address.
        /// </summary>
        public static string AdminEmailAddress
        {
            get
            {
                string environment = ConfigurationManager.AppSettings["environment"].ToLower();

                switch (environment)
                {
                    case "dev":
                        return "john@strengdesign.com";
                    case "staging":
                        return "john@strengdesign.com";
                    case "production":
                        return "info@frrcpas.com";
                    default:
                        return String.Empty;
                }
            }
        }

        public static string ConnectionString = ConfigurationManager.AppSettings["umbracoDbDSN"];

        public static string FromAddress = "info@frrcpas.com";

        public static string ErrorAddress = "john@strengdesign.com";

        /// <summary>
        /// Populates states.
        /// </summary>
        public static List<ListItem> States
        {
            get
            {
                DataSet dataSet = new DataSet();

                dataSet = SqlHelper.ExecuteDataset(Globals.Database.ConnectionString, CommandType.StoredProcedure, "lqp_getStatesAll");

                if (dataSet.Tables[0].Rows.Count > 0)
                {
                    List<ListItem> states = new List<ListItem>();

                    foreach (DataRow row in dataSet.Tables[0].Rows)
                    {
                        states.Add(new ListItem(Convert.ToString(row["Name"])));
                    }

                    return states;
                }
                else
                    return null;
            }
        }

        #endregion

        #region Static Methods

        /// <summary>
        /// Gets a datetime value from a string
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static DateTime getDatetimeValueFromString(String value)
        {
            DateTime returnvalue = DateTime.MinValue;
            if (value != null && value != "")
            {
                returnvalue = Convert.ToDateTime(value);
            }
            return returnvalue;
        }

        /// <summary>
        /// Gets the value of a column in a database
        /// </summary>
        /// <param name="row"></param>
        /// <param name="col"></param>
        /// <returns></returns>
        public static string GetRowData(DataRow row, string col)
        {
            return row.Table.Columns.Contains(col) ? row[col].ToString() : "";
        }

        /// <summary>
        /// Gets a boolean value from string
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static Boolean getBoolValueFromString(String value)
        {
            Boolean returnvalue = false;
            if (value != null && value != "")
            {
                if (value == "1")
                {
                    return true;
                }
                else if (value == "0")
                {
                    return false;
                }
                else
                {
                    returnvalue = Convert.ToBoolean(value);
                }
            }
            return returnvalue;
        }

        public static String getListString(List<string> strs)
        {
            string returnVal = string.Empty;
            foreach (string n in strs)
            {
                returnVal += n + "|";
            }
            if (returnVal.EndsWith("|"))
            {
                returnVal = returnVal.Substring(0, returnVal.Length - 1);
            }
            return returnVal;
        }

        public static List<String> getStringList(string strs)
        {
            List<string> returnVal = new List<string>();

            foreach (string n in strs.Split('|'))
                returnVal.Add(n);

            return returnVal;
        }

        public static string getInnerAttribute(string innerXml, string searchTerm)
        {
            string returnVal = String.Empty;
            try
            {
                if (innerXml.Contains(searchTerm))
                {
                    returnVal = innerXml.Substring(innerXml.IndexOf(searchTerm + "=\"") + searchTerm.Length + 2);
                    returnVal = returnVal.Substring(0, returnVal.IndexOf("\""));//, innerXml.Substring(innerXml.IndexOf(searchTerm + "\"")+searchTerm.Length+2).IndexOf("\""));
                }
            }
            catch { }

            return returnVal;
        }

        #endregion

        #region Classes
        public static class Database
        {
            public static string ConnectionString = ConfigurationManager.AppSettings["umbracoDbDSN"];
        }
        #endregion
    }
}