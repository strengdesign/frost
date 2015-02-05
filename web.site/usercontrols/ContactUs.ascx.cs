using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using web.site.App_Code.Helpers;

namespace web.site.usercontrols
{
    public partial class ContactUs : System.Web.UI.UserControl
    {
        private string errorMsg = string.Empty;

        #region Page Events
        protected void Page_Load(object sender, EventArgs e)
        {
            ddlState.DataSource = Globals.States;
            ddlState.DataBind();
        }
        #endregion

        #region Action Events
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (errorMsg != "")
            {
                customValidatorLogin.IsValid = false;
                customValidatorLogin.ErrorMessage = errorMsg;
            }
            else
            {
                EmailHelper.ContactUsNotification(tbFirstName.Text, tbLastName.Text, tbEmail.Text, tbStreetAddress.Text, ddlState.SelectedItem.Value.ToString(), tbZip.Text,
                    tbCity.Text, tbTitle.Text, tbCompany.Text, tbPhone.Text, tbComments.Text);

                pnlContactForm.Visible = false;
                pnlContactThanks.Visible = true;
            }
        }
        #endregion
    }
}