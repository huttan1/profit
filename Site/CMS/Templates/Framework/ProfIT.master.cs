using System.Web.UI.HtmlControls;
using App_Code.Site.CMS.Templates;
using System;
using Litium.Foundation.Modules.CMS;
using Litium.Foundation.Modules.CMS.Pages;
using Litium.Foundation.Modules.CMS.WebControls;

namespace Site.CMS.Templates
{
    /// <summary>
    /// Renders the shopping cart template
    /// </summary>
    public partial class Base : BaseFramework
    {
        #region Events
        /// <summary>
        /// Handles the Pre Render event of the Page control.
        /// </summary>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected override void OnPreRender(EventArgs e)
        {
            
            base.OnPreRender(e);
        }
        #endregion

		#region Methods
 


        /// <summary>
        /// Returns URL to the first page instance of a specific page type
        /// </summary>
        /// <param name="pageTypeName">Name of page type to use</param>
        /// <returns>Page URL if found, otherwise #</returns>
        private string GetUrlToFirstPageInstance(string pageTypeName)
        {
            var pageType = ModuleCMS.Instance.PageTypes.GetPageType(pageTypeName);
            if (pageType == null)
                return null;

            Litium.Foundation.Modules.CMS.Pages.Page page = pageType.Instances.Count > 0 ? pageType.Instances.GetPage(CurrentState.WebSite, CurrentState.Token) : null;
            if (page == null || !page.IsPublished)
                return null;
            
            return page.GetUrlToPage(CurrentState.WebSiteID, CurrentState.IsInAdministrationMode, false);
        }
		#endregion

        protected void InitTopMenuList(object sender, EventArgs e)
        {
            ((PageList)sender).PageFilter = page =>
            {
                //Hide order history
                if (FoundationContext.User.IsAnonymousUser)
                {
                    return !page.PageType.Name.Equals("orderhistory", StringComparison.InvariantCultureIgnoreCase);
                }
                return true;
            };
        }
	}
}
