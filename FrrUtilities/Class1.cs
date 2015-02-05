using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Web;
using System.Text.RegularExpressions;

namespace FrrUtilities
{
    public class frr
    {
        public static string CleanTags(string inputString)
        {
            string pattern = @"\<([A-Za-z]+)\>\<\/([A-Za-z]+)\>|\<[A-Za-z]+\s?\/\>";
            string str2 = inputString;
            string input = Regex.Replace(inputString, pattern, "");
            while (str2 != input)
            {
                str2 = input;
                input = Regex.Replace(input, pattern, "");
            }
            return input;
        }

        public static string DayOfWeek(string date)
        {
            return DateTime.Parse(date).DayOfWeek.ToString();
        }

        public static DateTime StartDate(string curdate)
        {
            DateTime date = Convert.ToDateTime(curdate);
            return new DateTime(date.Year, date.Month, 1);
        }
        public static DateTime EndDate(string curdate)
        {
            DateTime date = Convert.ToDateTime(curdate);
            int days = DateTime.DaysInMonth(date.Year, date.Month);
            return new DateTime(date.Year, date.Month, days);
        }

        public static string lcase(string inputString)
        {
            return inputString.ToLower();
        }

        public static bool ListInList(string list1, string list2)
        {
            if ((list1 == string.Empty) || (list2 == string.Empty))
            {
                return false;
            }
            bool flag = false;
            foreach (string str in list2.Split(new char[] { ',' }))
            {
                foreach (string str2 in list1.Split(new char[] { ',' }))
                {
                    if (str2 == str)
                    {
                        flag = true;
                    }
                }
            }
            return flag;
        }

        public static int MonthDiff(string date1, string date2)
        {
            DateTime time = DateTime.Parse(date1);
            DateTime time2 = DateTime.Parse(date2);
            return (((time2.Year - time.Year) * 12) + (time2.Month - time.Month));
        }

        public static string param(string val, string def)
        {
            return ((val == string.Empty) ? def : val);
        }

        public static string sanitize(string inputString)
        {
            string pattern = @"[^A-Za-z0-9\s]";
            return Regex.Replace(Regex.Replace(inputString, pattern, ""), @"\s+", " ").Trim();
        }

        public static string shorten(string inputString, int len, string trailtext)
        {
            bool flag = false;
            int num = 0;
            StringBuilder builder = new StringBuilder();
            bool flag2 = false;
            for (int i = 0; i < inputString.Length; i++)
            {
                string str = inputString.Substring(i, 1);
                if (str == "<")
                {
                    flag = true;
                    if (!((num < len) || flag2))
                    {
                        builder.Append(trailtext);
                        flag2 = true;
                    }
                    builder.Append(str);
                }
                else if (str == ">")
                {
                    flag = false;
                    builder.Append(str);
                }
                else
                {
                    if (!((!(str == " ") || (num < len)) || flag2))
                    {
                        builder.Append(trailtext);
                        flag2 = true;
                    }
                    if (!flag2 || flag)
                    {
                        builder.Append(str);
                        if (!flag)
                        {
                            num++;
                        }
                    }
                }
            }
            return CleanTags(builder.ToString());
        }

        public static string toTokenList(string inputString)
        {
            return sanitize(inputString.Replace(",", " ")).Replace(" ", ",").ToLower();
        }

        public static bool startsWith(string bigString, string smlString)
        {
            return bigString.StartsWith(smlString);
        }

        public static bool endsWith(string bigString, string smlString)
        {
            return bigString.EndsWith(smlString);
        }
    }
}
