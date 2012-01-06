using System;
using System.Text.RegularExpressions;
using System.Web.UI.HtmlControls;
using Litium.Foundation.Modules.CMS.Pages;
using Litium.Foundation.Modules.CMS.PageTypes;
using Litium.Foundation.Modules;

namespace App_Code.Site.CMS.Templates
{
    /// <summary>
    /// Base class for template frameworks.
    /// </summary>
    public abstract class BaseFramework : Litium.Foundation.Modules.CMS.GUI.Templates.BaseMasterPage
    {
        #region Members

        private string m_currentBodyClassNames;
        private string m_currentHostName;

        #endregion

        #region Properties

        /// <summary>
        /// Gets the current set of body class names in the format "w-{WebSiteName} p-{PageTypeName} t-{TemplateFileNameWithoutFileExtension}".
        /// Space characters in each class name are replaced by dashes.
        /// </summary>
        /// <value>The current set of body class names.</value>
        protected virtual string CurrentBodyClassNames
        {
            get
            {
                if (m_currentBodyClassNames == null)
                {
                    BasePage page = GetCurrentPage();
                    string templateFileName = GetTemplateFileName(page);
                    m_currentBodyClassNames = String.Format("w-{0} p-{1} t-{2}",
                        EncodeHtmlAttribute(CurrentPage.WebSite.Name),
                        EncodeHtmlAttribute(CurrentPage.PageType.Name),
                        EncodeHtmlAttribute(templateFileName));
                }

                return m_currentBodyClassNames;
            }
        }

        /// <summary>
        /// Gets the host name, either the domain name of the current web site in the CMS module, or if no domain name
        /// is supplied the host name from the current request.
        /// </summary>
        /// <value>The name of the current host.</value>
        protected virtual string CurrentHostName
        {
            get
            {
                if (m_currentHostName == null)
                {
                    string host = CurrentState.WebSite.DomainName;
                    m_currentHostName = String.IsNullOrEmpty(host) ? System.Web.HttpContext.Current.Request.Url.Host : host;
                }

                return m_currentHostName;
            }
        }

        #endregion

        #region Events

        /// <summary>
        /// The PreRender event for the html element. Adds the xml:lang and the lang attributes to the html elements and sets its values
        /// to the two-letter primary language code of the current web site.
        /// </summary>
        /// <param name="sender">A HtmlGenericControl with TagName 'html' (i.e. a 'html' element).</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected virtual void HtmlHtmlOnPreRender(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                return;
            }

            HtmlGenericControl htmlElement = ((HtmlGenericControl)sender);
            string twoLetterIsoLanguageName = CurrentState.WebSite.Culture.TwoLetterISOLanguageName;
            htmlElement.Attributes["xml:lang"] = twoLetterIsoLanguageName;
            htmlElement.Attributes["lang"] = twoLetterIsoLanguageName;
        }

        /// <summary>
        /// PreRender event for the body element. Adds the class attribute to the element and sets its
        /// value to a string formatted like 'w-{WebSiteName} p-{PageTypeName} t-{TemplateName}'.
        /// </summary>
        /// <param name="sender">A HtmlGenericControl with TagName 'body' (i.e. a 'body' element).</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected virtual void HtmlBodyOnPreRender(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                return;
            }

            HtmlGenericControl body = ((HtmlGenericControl)sender);
            string classNames = body.Attributes["class"];

            if (String.IsNullOrEmpty(classNames))
            {
                body.Attributes["class"] = CurrentBodyClassNames;
            }
            else
            {
                body.Attributes["class"] = String.Concat(classNames, " ", CurrentBodyClassNames);
            }
        }

        #endregion

        #region Methods

        /// <summary>
        /// Gets the filename of the page template.
        /// </summary>
        /// <remarks>
        /// If the PageTypeCategory of the specified <see cref="Page"/> />
        /// </remarks>
        /// <param name="page">The page.</param>
        /// <returns></returns>
        private string GetTemplateFileName(BasePage page)
        {
            string templateFileName;

            if (CurrentPage.PageType.PageTypeCategory == PageTypeCategories.PRODUCT_CATALOG)
            {
                var state = new WebControlState(this);
                var product = state.ProductCatalog.CurrentProduct;
                templateFileName = product == null ? System.IO.Path.GetFileNameWithoutExtension(state.ProductCatalog.CurrentProductGroup.Template.DisplayTemplate.FileName)
                : System.IO.Path.GetFileNameWithoutExtension(state.ProductCatalog.GetCurrentProductArticle(product).Template.DisplayTemplate.FileName);
            }
            else
            {
                templateFileName = System.IO.Path.GetFileNameWithoutExtension(page.Template.FileName);
            }

            return templateFileName;
        }

        /// <summary>
        /// Gets either the current <see cref="Page"/>, the current <see cref="VersionCopy"/> or the current <see cref="WorkingCopy"/>
        /// depending of the context.
        /// </summary>
        /// <returns></returns>
        private BasePage GetCurrentPage()
        {
            BasePage page;

            if (CurrentState.IsWorkCopy)
            {
                page = CurrentState.WorkingCopy;
            }
            else if (CurrentState.IsVersionCopy)
            {
                page = CurrentState.VersionCopy;
            }
            else
            {
                page = CurrentPage;
            }

            return page;
        }

        /// <summary>
        /// Cleans a string and makes it usable as a value for a class or an id attribute of an html element.
        /// Invalid characters are removed from the supplied string. White space and dots (periods) are replaced with dashes.
        /// The string is also converted to lower case.
        /// </summary>
        /// <param name="attribute">The original string.</param>
        /// <returns></returns>
        protected virtual string EncodeHtmlAttribute(string attribute)
        {
            const string REPLACEMENT = "-";
            const string REPLACE_PATTERN = @"[\s\.]+"; // Pattern to replace with REPLACEMENT string.
            const string REMOVE_PATTERN = @"(^[^a-zA-Z]+)|([^\w\-\:\.])"; // Pattern to remove.
            string encoded = attribute.ToLowerInvariant();
            encoded = encoded.Replace('å', 'a').Replace('ä', 'a').Replace('ö', 'o'); // Replace specific (Swedish) characters with ascii characters.
            encoded = Regex.Replace(encoded, REMOVE_PATTERN, String.Empty, RegexOptions.Compiled);
            encoded = Regex.Replace(encoded, REPLACE_PATTERN, REPLACEMENT, RegexOptions.Compiled);

            return encoded;
        }

        #endregion
    }
}