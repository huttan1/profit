using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using Litium.Studio.UI.ECommerce.Common;
using Litium.Foundation.Modules.CMS.GUI.Templates;
using Litium.Foundation.Modules.ECommerce;
using Litium.Foundation.Modules.ECommerce.Carriers;
using Litium.Foundation.Modules.ECommerce.Orders;
using Litium.Foundation.Modules.ECommerce.Search;
using Litium.Foundation.Modules.ECommerce.WebControls;
using Litium.Foundation.Modules.Relations;
using Litium.Foundation.Modules.CMS;
using Litium.Studio.UI.ECommerce.GridServices;
using Litium.Foundation.Modules;
using Litium.Foundation.Modules.ProductCatalog.Products;
using Litium.Foundation.Modules.ProductCatalog.Variants;

namespace Site.ProductCatalog.Templates
{
    /// <summary>
    /// Class for handling product 1
    /// </summary>
    public partial class Product1 : App_Code.Site.CMS.Templates.BaseTemplate
    {
        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }

    }
}