using Litium.Foundation;
using Litium.Foundation.GUI;
using Litium.Foundation.Modules;
using Litium.Foundation.Modules.CMS.GUI.Constants;
using Litium.Foundation.Modules.CMS.WebSites;
using Litium.Foundation.Security;
using System;

namespace Site.CMS.Templates
{
    /// <summary>
    /// PageNotFound.aspx does one of the following:
    ///	- Displays a message if the requested page does not exist and prints the Url supplied in ParameterConstants.PAGE_NOT_FOUND_URL
    /// - Redirects to the requested page if an Url alias is used
    /// - Redirects to the Litium Foundation login page if the Url alias equals UrlConstants.LOGIN_ALIAS
    /// </summary>
    public partial class PageNotFound : System.Web.UI.Page
    {
        // Constants
        public const string PAGE_NOT_FOUND_TITLE = "PageNotFoundTitle";
        public const string PAGE_NOT_FOUND_MESSAGE = "PageNotFoundMessage";
        public const string PAGE_NOT_FOUND_LINK = "PageNotFoundLink";
        
        private const string SIGN_PREVIOUS_PAGE = " « ";
        //public const string BUTTON_BACK = "ButtonBack";
        public const string LOGIN_ALIAS = "LitiumStudio";
        public const string PAGE_LOGIN = "/LitiumStudio/Default.aspx";

		private Litium.Foundation.Modules.CMS.Routing.RoutePath m_routePath;
		private Litium.Foundation.Modules.CMS.Routing.RoutePath RoutePath
		{
			get
			{
				return m_routePath ?? (m_routePath = Litium.Foundation.Modules.CMS.Routing.RouteUtilities.Parse(Context));
			}
		}

        /// <summary>
        /// Page load.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            // Add random sleep due to Microsoft Security Advisory (2416728), obfuscate error time
            byte[] delay = new byte[1];
            System.Security.Cryptography.RandomNumberGenerator prng = new System.Security.Cryptography.RNGCryptoServiceProvider();
            prng.GetBytes(delay);
            System.Threading.Thread.Sleep((int)delay[0]);

         

            bool redirect = false;
            try
            {
				SecurityToken token = FoundationContext.Current.Token;

                string url = this.Request[ParameterConstants.PAGE_NOT_FOUND_URL];
                if (!string.IsNullOrEmpty(url))
                {
                    // Print the url which does not exist
                    if (c_literalURL != null)
                        c_literalURL.Text = Server.HtmlEncode(url);
                }
                else
                {
                    // Search for page ID
                    if (Request.RawUrl.IndexOf("404;") > -1 &&
                        Request.RawUrl.IndexOf(ParameterConstants.PAGE_ID + "=") > -1)
                    {
                        try
                        {
                            string pageIDString = ParameterConstants.PAGE_ID + "=";
                            string IDString = Request.RawUrl.Substring(Request.RawUrl.IndexOf(pageIDString) + pageIDString.Length, 36);
                            Guid pageID = new Guid(IDString);
                            if (pageID != Guid.Empty)
                            {
                                Response.Redirect("~/" + UrlConstants.PAGE_DEFAULT + "?" + ParameterConstants.PAGE_ID + "=" + pageID.ToString(), true);
                                redirect = true;
                            }
                        }
                        catch { }
                    }

                    // Search for working copy ID
                    if (Request.RawUrl.IndexOf("404;") > -1 &&
                        Request.RawUrl.IndexOf(ParameterConstants.WORKING_COPY_ID + "=") > -1)
                    {
                        try
                        {
                            string workingCopyIDString = ParameterConstants.WORKING_COPY_ID + "=";
                            string IDString = Request.RawUrl.Substring(Request.RawUrl.IndexOf(workingCopyIDString) + workingCopyIDString.Length, 36);
                            Guid workingCopyID = new Guid(IDString);
                            if (workingCopyID != Guid.Empty)
                            {
                                Response.Redirect("~/" + UrlConstants.PAGE_DEFAULT + "?" + ParameterConstants.WORKING_COPY_ID + "=" + workingCopyID.ToString(), true);
                                redirect = true;
                            }
                        }
                        catch { }
                    }

                    // Search for version copy ID
                    if (Request.RawUrl.IndexOf("404;") > -1 &&
                        Request.RawUrl.IndexOf(ParameterConstants.VERSION_COPY_ID + "=") > -1)
                    {
                        try
                        {
                            string versionCopyIDString = ParameterConstants.VERSION_COPY_ID + "=";
                            string IDString = Request.RawUrl.Substring(Request.RawUrl.IndexOf(versionCopyIDString) + versionCopyIDString.Length, 36);
                            Guid versionCopyID = new Guid(IDString);
                            if (versionCopyID != Guid.Empty)
                            {
                                Response.Redirect("~/" + UrlConstants.PAGE_DEFAULT + "?" + ParameterConstants.VERSION_COPY_ID + "=" + versionCopyID.ToString(), true);
                                redirect = true;
                            }
                        }
                        catch { }
                    }

                    // Check for alias or login page
                    if (Request.QueryString.Count == 1 && (Request.QueryString[0].StartsWith("404") || Request.QueryString["aspxerrorpath"] != null) && !redirect)
                    {
                        // Search for alias
                        string[] querystring = Request.QueryString[0].Split('/');
                        string alias = querystring[querystring.Length - 1];

                        // Is it the alias for the Litium Foundation login page?
                        if (alias.ToUpper() == LOGIN_ALIAS.ToUpper())
                        {
                            bool hasModulePermission = false;
                            foreach (Module module in Solution.Instance.Modules)
                            {
                                if (token.HasModulePermission(module.ID, BuiltInModulePermissionTypes.PERMISSION_ID_ACCESS_GUI, true, true))
                                {
                                    hasModulePermission = true;
                                    break;
                                }
                            }
							if (token.IsAnonymousUser || !hasModulePermission)
                                Response.Redirect("~" + PAGE_LOGIN, true);
                            else
                                Response.Redirect("~" + Litium.Foundation.GUI.Constants.UrlConstants.SELECT_MODULE_PAGE, true);
                            redirect = true;
                        }
                    }
                }

                if (!redirect)
                {
					WebSite site = RoutePath.WebSite;
					// Write to log if not in templates folder
                    string rawurl = this.Request.RawUrl;
                    if (rawurl != null && rawurl.Contains("404;"))
                    {
                        string requestedUrl = rawurl.Substring(rawurl.LastIndexOf("404;") + 4);
                        if (requestedUrl.Length > 0 && !requestedUrl.Contains("robots.txt"))
                            Solution.Instance.Log.CreateLogEntry("Page not found", "Url: " + requestedUrl, Litium.Foundation.Log.LogLevels.INFO);

						if (site == null)
							c_literalURL.Text = "Url: " + Server.HtmlEncode(Server.UrlDecode(requestedUrl));
                    }

                    // Display message
                    if (site != null)
                    {
                        c_literalTitle.Text = site.Strings[PAGE_NOT_FOUND_TITLE];
                        c_literalHeading.Text = site.Strings[PAGE_NOT_FOUND_TITLE];
                        c_literalMessage.Text = site.Strings[PAGE_NOT_FOUND_MESSAGE];
                        c_buttonBack.Text = site.Strings[PAGE_NOT_FOUND_LINK];
                        c_buttonBack.NavigateUrl = site.GetTopPage(token).GetUrlToPage(site.ID, RoutePath.IsInAdministration);
                    }
                    else
                    {
                        c_literalURL.Text = "Page not found.";
                        c_buttonBack.Text = SIGN_PREVIOUS_PAGE + "Back";
                        c_buttonBack.NavigateUrl = Page.ResolveUrl("~/" + UrlConstants.PAGE_DEFAULT);
                    }
                }
            }
            catch (Exception ex)
            {
                if (!(ex is System.Threading.ThreadAbortException))
                {
                    FoundationContext.Current.Solution.Log.CreateLogEntry(this.GetType().Name + ", url: " + Request.RawUrl, ex, Litium.Foundation.Log.LogLevels.ERROR);
                }
            }
            if (!redirect)
            {
                Response.StatusCode = 404;
                Response.StatusDescription = "Not Found";
            }
        }
    }
}