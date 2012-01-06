using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Litium.Foundation.GUI.Constants;
using Litium.Foundation.GUI.WebControls;
using Litium.Foundation.Modules;
using Litium.Foundation.Security;


namespace Web.App_Code.CMS.WebControl
{
    /// <summary>
    /// Shows a button if a user may access the administartion ui.
    /// </summary>
    public class AdministrateButton : BaseWebControl, INamingContainer
    {
        // Constants
        private const string KEY_BUTTON_TEXT = "AdministrateButton";

        // Instance members

        /// <summary>
        /// Logout url
        /// </summary>
        protected string m_administrateURL;

        /// <summary>
        /// Image style class
        /// </summary>
        protected string m_imageClass;

        /// <summary>
        /// Administrate system string
        /// </summary>
        protected string m_systemStringAdministrateKey = KEY_BUTTON_TEXT;

        /// <summary>
        /// Gets or sets the Cascading Style Sheet (CSS) class rendered by the Web server control on the client.
        /// </summary>
        /// <value></value>
        /// <returns>The CSS class rendered by the Web server control on the client. The default is <see cref="F:System.String.Empty"/>.</returns>
        [Obsolete("Use CssClass instead.", false)] // 44SP2
            public string Class
        {
            get { return CssClass; }
            set { CssClass = value; }
        }

        /// <summary>
        /// Image css class (leave out for no image)
        /// </summary>
        [Obsolete("Use ImageCssClass instead.", false)] // 44SP2
            public string ImageClass
        {
            get { return ImageCssClass; }
            set { ImageCssClass = value; }
        }

        /// <summary>
        /// Image css class (leave out for no image)
        /// </summary>
        public string ImageCssClass
        {
            get { return m_imageClass; }
            set { m_imageClass = value; }
        }

        /// <summary>
        /// Text key for login text (default: AdministrateButton)
        /// </summary>
        public string LogInText
        {
            get { return m_systemStringAdministrateKey; }
            set { m_systemStringAdministrateKey = value; }
        }


        /// <summary>
        /// URL for administration (default: ~/LitiumStudio/)
        /// </summary>
        public string AdministrateURL
        {
            get { return m_administrateURL; }
            set { m_administrateURL = value; }
        }


        /// <summary>
        /// Log out action
        /// </summary>
        private void On_Click(object sender, EventArgs e)
        {
            if (AdministrateAccess())
            {
                Context.Response.Redirect(m_administrateURL, true);
            }
        }


        /// <summary>
        /// Initiates the button
        /// </summary>
        protected override void CreateChildControls()
        {
            if (AdministrateAccess())
            {
                if (m_administrateURL == null)
                {
                    m_administrateURL = "~" + UrlConstants.LOGIN_PAGE;
                }

                if (m_imageClass != null)
                {
                    Label label = new Label();
                    label.Text = "<img border=\"0\" src=\"" + Page.ResolveUrl("~/LitiumStudio/images/transparent.gif") + "\" width=\"16\" height=\"16\" align=\"absmiddle\" alt=\"\" class=\"" + m_imageClass + "\" />";
                    Controls.Add(label);
                }

                LinkButton linkButton = new LinkButton();
                linkButton.Click += new EventHandler(On_Click);
                linkButton.CausesValidation = false;
                linkButton.Text = SystemStrings.GetValue(m_systemStringAdministrateKey, FoundationContext.LanguageID, true);

                if (!string.IsNullOrEmpty(CssClass))
                {
                    linkButton.CssClass = CssClass;
                }
                Controls.Add(linkButton);
            }
        }

        private bool AdministrateAccess()
        {
            if (FoundationContext != null && FoundationContext.Token != null)
            {
                if (FoundationContext.Solution.PermissionManager.UserHasSystemAllPermission(FoundationContext.Token.UserID, true)
                    || FoundationContext.Solution.PermissionManager.UserHasAccountAllPermission(FoundationContext.Token.UserID, true, true)
                    || FoundationContext.Solution.PermissionManager.UserHasLanguageAllPermission(FoundationContext.Token.UserID, true, true))
                    return true;


                foreach (Module module in FoundationContext.Solution.Modules)
                {
                    if (FoundationContext.Token.HasModulePermission(module.ID, BuiltInModulePermissionTypes.PERMISSION_ID_ACCESS_GUI, true, true))
                    {
                        return true;
                    }
                }
            }


            return false;
        }
    }
}