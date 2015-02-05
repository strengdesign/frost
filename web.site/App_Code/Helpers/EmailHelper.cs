using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace web.site.App_Code.Helpers
{
    public class EmailHelper
    {
        #region Client Emails
        /// <summary>
        /// Sends notification email for Contact Us.
        /// </summary>
        public static void ContactUsNotification(string firstName, string lastName, string email, string address, string state, string zip, string city, string title,
            string company, string phone, string message)
        {
            string filePath = HttpContext.Current.Server.MapPath("~/App_Data/EmailTemplates/Contact.txt");
            string emailBody = File.ReadAllText(filePath);

            emailBody = emailBody.Replace("[[FirstName]]", firstName);
            emailBody = emailBody.Replace("[[LastName]]", lastName);
            emailBody = emailBody.Replace("[[Email]]", email);
            emailBody = emailBody.Replace("[[Phone]]", phone);
            emailBody = emailBody.Replace("[[Message]]", message);
            emailBody = emailBody.Replace("[[Address]]", address);
            emailBody = emailBody.Replace("[[State]]", state);
            emailBody = emailBody.Replace("[[City]]", city);
            emailBody = emailBody.Replace("[[Zip]]", zip);
            emailBody = emailBody.Replace("[[Title]]", title);
            emailBody = emailBody.Replace("[[Company]]", company);

            SendEmail(Globals.AdminEmailAddress, "Contact Us Submission from frronline.com", emailBody);
        }
        #endregion

        #region Private Static Methods
        /// <summary>
        /// Returns the common email header.
        /// </summary>
        /// <returns></returns>
        private static string GetEmailHeader()
        {
            string filePath = HttpContext.Current.Server.MapPath("~/App_Data/EmailTemplates/Header.txt");
            return File.ReadAllText(filePath);
        }

        /// <summary>
        /// Returns the common email footer.
        /// </summary>
        /// <returns></returns>
        private static string GetEmailFooter()
        {
            string filePath = HttpContext.Current.Server.MapPath("~/App_Data/EmailTemplates/Footer.txt");
            return File.ReadAllText(filePath);
        }

        /// <summary>
        /// Sends the given email.
        /// </summary>
        /// <param name="to"></param>
        /// <param name="subject"></param>
        /// <param name="body"></param>
        private static void SendEmail(string to, string subject, string body)
        {
            try
            {
                body = GetEmailHeader() + body + GetEmailFooter();
                body = body.Replace("\r\n", "");

                MailMessage message = new MailMessage();

                message.IsBodyHtml = true;
                message.From = new MailAddress(Globals.FromAddress, "Frost, Ruttenberg & Rothblatt, P.C.");

                if (Globals.SiteURL == "http://frrcpas.com.strenghosting.com")
                    message.To.Add(to);
                else
                    message.To.Add(Globals.AdminEmailAddress);

                message.Subject = subject;
                message.Body = body;

                SmtpClient client = new SmtpClient();
                client.Send(message);
            }
            catch (System.Exception er)
            {
                MailMessage message = new MailMessage();

                message.IsBodyHtml = true;
                message.From = new MailAddress(Globals.FromAddress);
                message.To.Add(Globals.ErrorAddress);
                message.Subject = "Error Sending FRR Online notification email";
                message.Body = er.Message;

                SmtpClient client = new SmtpClient();
                client.Send(message);
            }
        }
        #endregion
    }
}