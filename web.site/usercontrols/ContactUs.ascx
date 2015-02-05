<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.ascx.cs" Inherits="web.site.usercontrols.ContactUs" %>
<form runat="server">
    <asp:Panel ID="pnlContactForm" runat="server">
        <asp:ValidationSummary ID="validationSummaryLogin" runat="server" CssClass="form-error-container" />
           
        <asp:CustomValidator id="customValidatorLogin" runat="server" Display="None" EnableClientScript="False" CssClass="form-error-container"></asp:CustomValidator>
                
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter your first name." 
            ControlToValidate="tbFirstName" Display="None"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter your last name." 
            ControlToValidate="tbLastName" Display="None"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your email address." 
            ControlToValidate="tbEmail" Display="None"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter your street address." 
            ControlToValidate="tbStreetAddress" Display="None"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter your city." 
            ControlToValidate="tbCity" Display="None"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please select a state." 
            ControlToValidate="ddlState" Display="None"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please enter your zip or postal code." 
            ControlToValidate="tbZip" Display="None"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please enter your phone number." 
            ControlToValidate="tbPhone" Display="None"></asp:RequiredFieldValidator>

        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid email address." 
            ControlToValidate="tbEmail" Display="None" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
	
	<div id="how-can-we">
		<p>How can we help you?</p>
		<asp:TextBox  ID="tbComments" CssClass="textArea" runat="server" TextMode="MultiLine" cols="25" rows="12"></asp:TextBox>
	</div>

        <table border="0"  class="formHolder contactForm">
            <tr>
                <td class="contactLabel"><asp:Label ID="lblFirstName" runat="server"><strong>First Name:*</strong></asp:Label></td>
		<td><asp:TextBox ID="tbFirstName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblLastName" runat="server"><strong>Last Name:*</strong></asp:Label></td>
			    <td><asp:TextBox ID="tbLastName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblEmail" runat="server"><strong>Email:*</strong></asp:Label></td>
			    <td><asp:TextBox ID="tbEmail" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblStreetAddress" runat="server"><strong>Street Address:*</strong></asp:Label></td>
			    <td><asp:TextBox ID="tbStreetAddress" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblCity" runat="server"><strong>City:*</strong></asp:Label></td>
			    <td><asp:TextBox ID="tbCity" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblState" runat="server"><strong>State:*</strong></asp:Label></td>
			    <td>
                    <asp:DropDownList ID="ddlState" runat="server" CssClass="dropdown" AppendDataBoundItems="true">
                        <asp:ListItem Value="">-- Please Choose --</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lblZip" runat="server"><strong>Zip or Postal Code:*</strong></asp:Label></td>
			    <td><asp:TextBox ID="tbZip" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblTitle" runat="server">Title:</asp:Label></td>
			    <td><asp:TextBox ID="tbTitle" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblCompany" runat="server">Company:</asp:Label></td>
			    <td><asp:TextBox ID="tbCompany" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblPhone" runat="server"><strong>Phone Number:*</strong></asp:Label></td>
			    <td><asp:TextBox ID="tbPhone" runat="server"></asp:TextBox></td>
            </tr>
            
            <tr>
                <td>&nbsp;</td>
                <td><asp:Button ID="btnSubmit" CssClass="submitBtn" runat="server" onclick="btnSubmit_Click" Text="Submit" /></td>
            </tr>
          
        </table>
    </asp:Panel>
        
    <asp:Panel ID="pnlContactThanks" runat="server" Visible="false">
        Thank you for contacting us, we'll be in touch shortly.
    </asp:Panel>
</form>