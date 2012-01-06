using Litium.Foundation.Modules.CMS.Templates;
using Litium.Foundation.Modules.Licensing;
using System;
using Litium.Foundation.GUI;

namespace Site.CMS.Templates
{
	/// <summary>
	///	Displays an error message.
	///	First checks for an error in the current Context (ContextConstants.CURRENT_ERROR),
	///	then checks Request (ParameterConstants.ERROR_TITLE and ParameterConstants.ERROR_MESSAGE).
	///	
	///	The back-button redirects the user to either the page supplied in 
	///	the Litium.Foundation.GUI.Constants.ContextConstants.ERROR_RETURN_URL parameter (Context value)
	///	or the start page of the CMS administration/start page of the web site
	/// </summary>
	public partial class Error : System.Web.UI.Page
	{
		public const string PAGE_ADMIN_START = "/LitiumStudio/";
		private const string SIGN_PREVIOUS_PAGE = " « ";
		private Litium.Foundation.Modules.CMS.Routing.RoutePath m_routePath;
		private System.Globalization.CultureInfo m_culture;

		private Litium.Foundation.Modules.CMS.Routing.RoutePath RoutePath
		{
			get
			{
				return m_routePath ?? (m_routePath = Litium.Foundation.Modules.CMS.Routing.RouteUtilities.Parse(Context));
			}
		}

		public new System.Globalization.CultureInfo Culture
		{
			get
			{
				if (m_culture == null)
				{
					if (RoutePath.Path.StartsWith("/LitiumStudio", StringComparison.InvariantCultureIgnoreCase))
						m_culture = FoundationContext.Current.Culture;
					else
						m_culture = RoutePath.WebSite.Culture;
				}
				return m_culture;
			}
		}


		/// <summary>
		/// OnLoad
		/// </summary>
		protected override void OnLoad(EventArgs e)
		{
			base.OnLoad(e);

			// Set return url
			if (!IsPostBack)
			{
				ErrorPageTitleHeading.Text = ErrorPageTitle.Text = GetSystemString("ErrorPageTitle");

				if (c_buttonBack != null)
				{
					c_buttonBack.Text = SIGN_PREVIOUS_PAGE + GetSystemString(Litium.Foundation.GUI.Constants.SystemStringConstants.BUTTON_BACK);
				}

				// First try to print error from Context
				Exception exception = Context.Session[Litium.Foundation.GUI.Constants.ContextConstants.CURRENT_ERROR] as Exception;
				if (exception != null)
				{
					if (exception is System.Web.HttpUnhandledException)
					{
						exception = exception.InnerException;
					}

					if (exception is Litium.Foundation.Modules.CMS.Security.PageReadPermissionRequiredException
						|| exception is Litium.Foundation.Security.PermissionRequiredException)
					{
						c_labelErrorTitle.InnerText = GetSystemString(Litium.Foundation.GUI.Constants.SystemStringConstants.LABEL_PERMISSION_REQUIRED_EXCEPTION);
					}
					else if (exception is TemplateFileDoesNotExistException)
					{
						TemplateFileDoesNotExistException templateFileDoesNotExistException = (TemplateFileDoesNotExistException)exception;
						c_labelErrorTitle.InnerText = Server.HtmlEncode(templateFileDoesNotExistException.Title);
						c_labelErrorText.InnerText = Server.HtmlEncode(templateFileDoesNotExistException.Description);
					}
					else if (exception is LicenseExpiredException)
					{
						c_labelErrorTitle.InnerText = exception.Message;
						c_labelErrorText.InnerText = string.Empty;
					}
					else
					{
						c_labelErrorTitle.InnerText = exception.Message;
						c_labelErrorText.InnerText = exception.StackTrace;

						// Write to the log
						log4net.LogManager.GetLogger(GetType()).Info("Error page", exception);
					}
				}
				else
				{
					// Then check Request
					if (Request[Litium.Foundation.Modules.CMS.GUI.Constants.ParameterConstants.ERROR_TITLE] != null)
					{
						c_labelErrorTitle.InnerText = Server.HtmlEncode(Request[Litium.Foundation.Modules.CMS.GUI.Constants.ParameterConstants.ERROR_TITLE]);
						if (Request[Litium.Foundation.GUI.Constants.ParameterConstants.ERROR_MESSAGE] != null)
						{
							c_labelErrorText.InnerText = Server.HtmlEncode(Request[Litium.Foundation.Modules.CMS.GUI.Constants.ParameterConstants.ERROR_MESSAGE]);
						}
					}
				}
				// Add random sleep due to Microsoft Security Advisory (2416728), obfuscate error time
				byte[] delay = new byte[1];
				System.Security.Cryptography.RandomNumberGenerator prng = new System.Security.Cryptography.RNGCryptoServiceProvider();
				prng.GetBytes(delay);
				System.Threading.Thread.Sleep((int)delay[0]);


				string returnURL = Context.Items[Litium.Foundation.GUI.Constants.ContextConstants.ERROR_RETURN_URL] as string ?? Session[Litium.Foundation.GUI.Constants.SessionConstants.ERROR_RETURN_URL] as string;
				if (returnURL != null)
				{
					if (c_buttonBack != null)
					{
						c_buttonBack.CommandName = returnURL;
					}
					// Clear it from session.
					Session[Litium.Foundation.GUI.Constants.SessionConstants.ERROR_RETURN_URL] = null;
				}
				else
				{
					string currentURL = Context.Items[Litium.Foundation.GUI.Constants.ContextConstants.CURRENT_URL] as string ?? Session[Litium.Foundation.GUI.Constants.SessionConstants.CURRENT_URL] as string;
					if (currentURL != null && currentURL.IndexOf("/LitiumStudio/") > -1)
					{
						if (c_buttonBack != null) c_buttonBack.CommandName = "~" + PAGE_ADMIN_START;
					}
					else if (currentURL != null)
					{
						if (c_buttonBack != null)
						{
							var urlParts = currentURL.Split('/');
							if (urlParts.Length > 1)
							{
								var parentURL = new string[urlParts.Length - 1];
								Array.Copy(urlParts, 0, parentURL, 0, parentURL.Length);
								urlParts = parentURL;
							}
							c_buttonBack.CommandName = string.Join("/", urlParts);
						}
					}
				}
			}
		}

		/// <summary>
		/// Triggerd when the user clicked on the back button
		/// </summary>
		/// <param name="sender">Button back</param>
		/// <param name="e">Event arguments</param>
		protected void ButtonBack_Click(object sender, EventArgs e)
		{
			if (!string.IsNullOrEmpty(c_buttonBack.CommandName))
			{
				Response.Redirect(c_buttonBack.CommandName, false);
			}
			else
			{
				Response.Redirect("~" + Litium.Foundation.Modules.CMS.GUI.Constants.UrlConstants.PAGE_DEFAULT, false);
			}
		}

		private string GetSystemString(string key)
		{
			var solution = Litium.Foundation.Solution.Instance;
			if (solution == null)
				return null;

			return solution.SystemStrings.GetValue(key, Culture, true);
		}
	}
}