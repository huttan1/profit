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
