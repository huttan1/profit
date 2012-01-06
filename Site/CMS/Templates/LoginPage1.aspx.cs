using System;
using System.Collections.Generic;
using System.Web.UI.HtmlControls;
using Litium.Foundation.Accounts;
using Litium.Foundation.Modules.CMS;
using Litium.Foundation.Modules.CMS.Content;
using Litium.Foundation.Security;
using CMSPageTypes = CMS.PageTypes;
namespace Site.CMS.Templates
{
    /// <summary>
    /// Class to display the login page
    /// </summary>
    public partial class LoginPage1 : App_Code.Site.CMS.Templates.BaseTemplate
	{
		#region Constants

		public const string LOGIN_NAME = "LoginName";
		public const string PASSWORD = "Password";
		public const string ALREADY_LOGGED_IN = "LoginUserAlreadyLoggedIn";
		
		// Content property names
		protected const string CONTENT_TITLE = "Title";
		protected const string CONTENT_CHANGE_PASSWORD_TITLE = "ChangePasswordTitle";
		protected const string SETTING_FORGOTTEN_PASSWORD_EMAIL_MESSAGE = "ForgottenPasswordEmailMessage";

		#endregion Constants

        #region Events
        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
		protected override void OnLoad(EventArgs e)
		{
			if (!IsPostBack)
			{
				SetLables();
                
				// Check if login name and password where sent as parameters
				string loginName = Request[LOGIN_NAME];
				string password = Request[PASSWORD];
				bool forgotPassword;
                Boolean.TryParse(Request[CMSPageTypes.LoginPage.Constants.DataConstants.SETTING_SHOW_FORGOTTEN_PASSWORD], out forgotPassword);
                c_panelLogin.DefaultButton = c_buttonLogin.ID;

				if (loginName != null && password != null)
				{
					Execute(loginName, password);
				}

				if (forgotPassword && ShowForgottenPassword())
				{
					InitForgottenPassword();
				}
			}
		}

		/// <summary>
		/// Login button click
		/// </summary>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        /// <param name="sender">The sender of event data</param>
		protected void c_buttonLogin_Click(object sender, EventArgs e)
		{
			string userName = c_textBoxLoginName.Text;
			string password = c_textBoxPassword.Text;
			c_placeHolderForgottenPassword.Visible = false;
			c_literalForgottenPasswordError.Text = "";
			c_textBoxEmail.Text = "";
			c_placeHolderForgottenPasswordLink.Visible = true;

			// Pull credentials from form fields and try to authenticate.
			if (Page.IsValid)
			{
				Execute(userName, password);
			}
		}

		/// <summary>
		/// Send button click
		/// </summary>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        /// <param name="sender">The sender of event data</param>
		protected void c_buttonSend_Click(object sender, EventArgs e)
		{
			User user = null;
			if (c_textBoxEmail.Text != "")
			{
				string userInfo = c_textBoxEmail.Text.ToLower();

				// Check via e-mail
				List<User> users = CurrentState.Solution.Users.GetUsersFromEmail(userInfo);
				if (users.Count > 0)
					user = users[0];


				// Check via login name
				if (user == null)
					user = CurrentState.Solution.Users.GetUserFromLoginName(userInfo);

				if (user != null)
				{
					if (!string.IsNullOrEmpty(user.Email))
					{
						try
						{
							string password = RandomStringGenerator.Generate(4, 4, 0, 2);
							user.SetPassword(password, CurrentState.ModuleCMS.AdminToken);
							SendPassword(user.Email, password, user.LoginName);
							c_fieldsetForgottenPassword.Visible = false;
							c_placeHolderForgottenPasswordMessage.Visible = true;
                            c_literalForgottenPasswordMessage.Text = GetMessage(CMSPageTypes.LoginPage.Constants.DataConstants.CONTENT_PASSWORD_SENT_MESSAGE);
						}
						catch
						{
							c_placeHolderForgottenPasswordError.Visible = true;
                            c_literalForgottenPasswordError.Text = GetMessage(CMSPageTypes.LoginPage.Constants.DataConstants.CONTENT_PASSWORD_NOT_SENT_MESSAGE);
						}
					}
					else
					{
						c_placeHolderForgottenPasswordError.Visible = true;
                        c_literalForgottenPasswordError.Text = GetMessage(CMSPageTypes.LoginPage.Constants.DataConstants.CONTENT_USER_HAS_NO_EMAIL_MESSAGE);
					}
				}
				else
				{
					c_placeHolderForgottenPasswordError.Visible = true;
                    c_literalForgottenPasswordError.Text = GetMessage(CMSPageTypes.LoginPage.Constants.DataConstants.CONTENT_USER_NOT_FOUND_MESSAGE);
				}
			}
			else
			{
				c_placeHolderForgottenPasswordError.Visible = true;
                c_literalForgottenPasswordError.Text = GetMessage(CMSPageTypes.LoginPage.Constants.DataConstants.CONTENT_USER_NOT_FOUND_MESSAGE);
			}
		}
        /// <summary>
        /// Called before the forgotten password link is rendered.
        /// </summary>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        /// <param name="sender">The sender of event data</param>
        protected void ForgottenPasswordLink_PreRender(object sender, EventArgs e)
        {
            ((HtmlAnchor)sender).HRef = String.Concat(CurrentPage.GetUrlToPage(), "?", CMSPageTypes.LoginPage.Constants.DataConstants.SETTING_SHOW_FORGOTTEN_PASSWORD, "=", Boolean.TrueString);
        }

        /// <summary>
        /// Change password button click
        /// </summary>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        /// <param name="sender">The sender of event data</param>
		protected void buttonChangePassword_Click(object sender, EventArgs e)
		{
			bool isPasswordChanged = !c_textBoxNewPassword.Text.Equals(ViewState[PASSWORD].ToString());
			bool isPasswordValid = c_textBoxNewPassword.Text.Equals(c_textBoxNewPassword2.Text);
			bool isPasswordComplexityValid = PasswordComplexity.Validate(c_textBoxNewPassword.Text);

			if (isPasswordChanged && isPasswordValid && isPasswordComplexityValid)
			{
				Execute(c_textBoxLoginName.Text, ViewState[PASSWORD].ToString(), c_textBoxNewPassword.Text);
			}
			else
			{
				c_trErrorChangePassword.Visible = true;
				if (!isPasswordChanged)
                    c_labelErrorChangePassword.Text = GetContent(CMSPageTypes.LoginPage.Constants.DataConstants.CONTENT_CHANGE_PASSWORD_NOT_CHANGED);
				else if (!isPasswordValid)
                    c_labelErrorChangePassword.Text = GetContent(CMSPageTypes.LoginPage.Constants.DataConstants.CONTENT_CHANGE_PASSWORD_NOT_CORRECT_RETYPED);
				else if (!isPasswordComplexityValid)
                    c_labelErrorChangePassword.Text = GetContent(CMSPageTypes.LoginPage.Constants.DataConstants.CONTENT_CHANGE_PASSWORD_RULE_ERROR);
			}
        }
        #endregion

        #region Private Methods

        /// <summary>
        /// Init the forgotten password controls
        /// </summary>
		private void InitForgottenPassword()
		{
			c_placeHolderForgottenPassword.Visible = true;
            c_panelLogin.Visible = false;
			c_title.Text = GetContent(CONTENT_CHANGE_PASSWORD_TITLE);
		}

        /// <summary>
        /// Executes login
        /// </summary>
        /// <param name="userName">User name</param>
        /// <param name="password">Password</param>
        private void Execute(string userName, string password)
        {
            Execute(userName, password, null);
        }

        /// <summary>
        /// Executes login
        /// </summary>
        /// <param name="userName">User name</param>
        /// <param name="password">Password</param>
        /// <param name="newPassword">New password</param>
        private void Execute(string userName, string password, string newPassword)
        {
            string redirectURL = CurrentState.ModuleCMS.WebSites.DefaultWebSite.GetTopPage(CurrentState.ModuleCMS.AdminToken).GetUrlToPage();
            SecurityToken token;
            try
            {
                if (string.IsNullOrEmpty(newPassword))
                    token = CurrentState.Solution.LoginManager.Login(userName, password, Session);
                else
                    token = CurrentState.Solution.LoginManager.Login(userName, password, newPassword, Session);
            }
            catch (ChangePasswordException)
            {
                ViewState[PASSWORD] = password;
                c_panelLogin.Visible = false;
                c_placeHolderForgottenPassword.Visible = false;
                c_placeholderChangePassword.Visible = true;
                c_title.Text = GetContent(CONTENT_CHANGE_PASSWORD_TITLE);

                return;
            }
            if (token != null)
            {
                // Load logged in user's cart
				Litium.Foundation.Modules.CMS.CurrentState state = CurrentState.Current;

                //load the shopping cart.
                state.ShoppingCart.LoadShoppingCart();

                if (Request[Litium.Foundation.GUI.Constants.ParameterConstants.REDIRECT_URL] != null)
                    redirectURL = Request[Litium.Foundation.GUI.Constants.ParameterConstants.REDIRECT_URL];
                else if (Request[Litium.Foundation.Modules.CMS.GUI.Constants.ParameterConstants.REDIRECT_URL] != null)
                    redirectURL = Request[Litium.Foundation.Modules.CMS.GUI.Constants.ParameterConstants.REDIRECT_URL];
                else
                {
                    LinkInternalProperty redirectPageProperty = CurrentSettings[CMSPageTypes.LoginPage.Constants.DataConstants.SETTING_REDIRECT_PAGE] as LinkInternalProperty;
                    if (redirectPageProperty != null && redirectPageProperty.ValueCount > 0)
                    {
                        Guid pageID = redirectPageProperty.GetValue();
                        if (pageID != Guid.Empty && CurrentState.ModuleCMS.PermissionManager.UserHasPageReadPermission(token.UserID, pageID, true, true))
                        {
                            Litium.Foundation.Modules.CMS.Pages.Page page = Litium.Foundation.Modules.CMS.Pages.Page.GetFromID(CurrentState.ModuleCMS, pageID, token);
                            if (page != null)
                                redirectURL = page.GetUrlToPage(CurrentState.WebSiteID, false);
                        }
                    }
                }
                Response.Redirect(redirectURL);
            }
            else
            {
                // Show logon failed message
                c_placeHolderLoginError.Visible = true;
                c_labelError.Text = GetMessage(CMSPageTypes.LoginPage.Constants.DataConstants.CONTENT_LOGIN_FAILED_MESSAGE);
            }
        }

        /// <summary>
        /// Returns the given message in current language
        /// </summary>
        /// <returns>Given message in current language</returns>
        private string GetMessage(string messageName)
        {
            StringShortProperty message = CurrentContent[messageName] as StringShortProperty;
            if (message != null && message.ValueCount > 0)
            {
                return message.GetValue();
            }
            return "";
        }

        /// <summary>
        /// Gets the content.
        /// </summary>
        /// <param name="settingsName">Name of the settings.</param>
        /// <returns></returns>
        private string GetContent(string settingsName)
        {
            StringShortProperty setting = CurrentContent[settingsName] as StringShortProperty;
            if (setting != null && setting.ValueCount > 0)
            {
                return setting.GetValue();
            }
            return "";
        }

        /// <summary>
        /// Returns the given setting in current language
        /// </summary>
        /// <returns>Given setting in current language</returns>
        private string GetSetting(string settingsName)
        {
            StringProperty setting = CurrentSettings[settingsName] as StringProperty;
            if (setting != null && setting.ValueCount > 0)
            {
                return setting.GetValue();
            }
            return "";
        }

        /// <summary>
        /// Sets all labels
        /// </summary>
        private void SetLables()
        {
            c_title.Text = GetContent(CONTENT_TITLE);
            c_placeHolderLoggedIn.Visible = false;
            c_placeHolderForgottenPassword.Visible = false;
            c_placeHolderLoginError.Visible = false;
            c_placeHolderForgottenPasswordError.Visible = false;
            c_labelError.Text = "";
            c_literalForgottenPasswordError.Text = "";

            StringShortProperty loginButtonText = CurrentContent[CMSPageTypes.LoginPage.Constants.DataConstants.CONTENT_LOGIN_BUTTON] as StringShortProperty;
            if (c_buttonLogin != null && loginButtonText != null && loginButtonText.ValueCount > 0)
            {
                c_buttonLogin.Text = loginButtonText.GetValue();
            }

            StringShortProperty sendButtonText = CurrentContent[CMSPageTypes.LoginPage.Constants.DataConstants.CONTENT_SEND_PASSWORD_BUTTON] as StringShortProperty;
            if (c_buttonSend != null && sendButtonText != null && sendButtonText.ValueCount > 0)
            {
                c_buttonSend.Value = sendButtonText.GetValue();
            }

            // Forgotten password link
            StringShortProperty labelForgottenPasswordLink = CurrentContent[CMSPageTypes.LoginPage.Constants.DataConstants.CONTENT_FORGOTTEN_PASSWORD_LINK] as StringShortProperty;
            if (ShowForgottenPassword() && c_forgottenPasswordLink != null && labelForgottenPasswordLink != null && labelForgottenPasswordLink.ValueCount > 0)
            {
                c_placeHolderForgottenPasswordLink.Visible = true;
                c_forgottenPasswordLink.InnerText = labelForgottenPasswordLink.GetValue();
            }
            else
            {
                c_placeHolderForgottenPasswordLink.Visible = false;
            }

            // change password
            c_buttonNewPassword.Value = GetContent(CMSPageTypes.LoginPage.Constants.DataConstants.CONTENT_CHANGE_PASSWORD_BUTTON);

            // Show message when logged in
            if (!FoundationContext.User.IsAnonymousUser)
            {
                string value = CurrentState.Current.WebSite.Strings.GetValue(ALREADY_LOGGED_IN);
                c_labelLoggedIn.InnerText = string.Format(value ?? "'{0}'", FoundationContext.User.LoginName);
                c_panelLogin.Visible = false;
                c_placeHolderLoggedIn.Visible = true;
                c_buttonLogin.Visible = false;
                c_placeHolderForgottenPasswordLink.Visible = false;
                c_valueExistsIntroduction.Visible = false;
            }
        }

        /// <summary>
        /// Sends password to the user
        /// </summary>
        /// <param name="to">E-mail address of the recipient</param>
        /// <param name="password">Password of the user</param>
        /// <param name="loginName">Login name of the user.</param>
        private void SendPassword(string to, string password, string loginName)
        {
            // Create the body of the e-mail message 
            string message = GetSetting(SETTING_FORGOTTEN_PASSWORD_EMAIL_MESSAGE);
            message = message.Replace("{LOGINNAME}", loginName).Replace("{PASSWORD}", password);

            // Create the e-mail message
            System.Net.Mail.MailMessage newMessage = new System.Net.Mail.MailMessage(GetSetting(CMSPageTypes.LoginPage.Constants.DataConstants.SETTING_EMAIL_SENDER), to);

            // Set content type of the body
            newMessage.IsBodyHtml = false;

            // Set the subject of the e-mail message
            newMessage.Subject = GetSetting(CMSPageTypes.LoginPage.Constants.DataConstants.SETTING_EMAIL_TITLE);

            // Set the body of the e-mail message 
            newMessage.Body = message;

            // Create a smtpClient
            System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient(FoundationContext.SMTPServer);

            // Send the mail 
            smtpClient.Send(newMessage);
        }

		/// <summary>
		/// Whether to display the forgotten password view and the link to it.
		/// </summary>
		/// <returns>True if show forgotten password is possible</returns>
        private bool ShowForgottenPassword()
		{
            BooleanProperty showForgottenPassword = CurrentSettings[CMSPageTypes.LoginPage.Constants.DataConstants.SETTING_SHOW_FORGOTTEN_PASSWORD] as BooleanProperty;
			return (showForgottenPassword != null && showForgottenPassword.GetValue());
        }
        #endregion
    }
}