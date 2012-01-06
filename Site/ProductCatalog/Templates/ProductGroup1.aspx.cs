using System;
using System.Collections.Generic;
using Litium.Foundation.Modules;
using Litium.Foundation.Modules.ProductCatalog;
using Litium.Foundation.Modules.ProductCatalog.Search;
using Litium.Framework.Search;
namespace Site.ProductCatalog.Templates
{
    /// <summary>
    /// Class for handling product group 1
    /// </summary>
    public partial class ProductGroup1 : App_Code.Site.CMS.Templates.BaseTemplate
    {
        private WebControlState m_state;

        /// <summary>
        /// Constructor
        /// </summary>
        public ProductGroup1()
        { 
            m_state = new WebControlState(this);
        }

        /// <summary>
        /// Handles the on load event of the Page control.
        /// </summary>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            InitProductRepeater();
        }

        /// <summary>
        /// Initializes the <see cref="T:System.Web.UI.HtmlTextWriter"/> object and calls on the child controls of the <see cref="T:System.Web.UI.Page"/> to render.
        /// </summary>
        /// <param name="writer">The <see cref="T:System.Web.UI.HtmlTextWriter"/> that receives the page content.</param>
        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {
            base.Render(writer);
            //everything is loaded now. safe to say this is a good place to return, in case of an error.
            Session[Litium.Foundation.GUI.Constants.SessionConstants.ERROR_RETURN_URL] = Request.Url.PathAndQuery;
        }      

        /// <summary>
        /// Create datasource for product repeater with paging information
        /// </summary>
        /// <param name="pageNumber">Current page number</param>
        /// <param name="pageSize">Number of items per page</param>
        /// <param name="totalHits">Total hits</param>
        /// <returns>Collection of product IDs</returns>
        private ICollection<Guid> ProductDataSource(int pageNumber, int pageSize, out int totalHits)
        {
            return ModuleProductCatalog.Instance.SearchService.FindProductIds(
                new ProductQuery() { ProductGroupID = m_state.ProductCatalog.CurrentProductGroup.ID },
                new Paging(pageNumber, pageSize),
                out totalHits);
        }

        /// <summary>
        /// Init product repeater with product inforamtion based on paged data
        /// </summary>
        private void InitProductRepeater()
        {
            int totalHits;
            m_productRepeater.DataSource = ProductDataSource(Paging.CurrentPageNumber, Paging.PageSize, out totalHits);
            m_productRepeater.DataBind();
            Paging.TotalHits = totalHits;

            if (totalHits == 0)
                Paging.Visible = false;
        }
    }
}