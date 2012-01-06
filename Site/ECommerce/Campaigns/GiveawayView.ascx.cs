using System;
using System.Collections;

using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Litium.Studio.UI.ECommerce;
using Litium.Foundation.Modules.ECommerce.Carriers;
using System.Collections.Generic;
using Litium.Foundation.Modules.ProductCatalog.Articles;
using Litium.Foundation.Modules.ProductCatalog.Products;
using Litium.Foundation.Modules.ProductCatalog;
using Litium.Foundation.GUI;
using Litium.Foundation.Modules.ProductCatalog.Variants;

public partial class LitiumStudio_ECommerce_WebUserControls_Campaigns_GiveawayView : System.Web.UI.UserControl, ICampaignWebUserControlView
{
    #region Constants

     /// <summary>
    /// Product Y
    /// </summary>
    private const string PRODUCT_Y = "ProductY";

	/// <summary>
	/// Article Y
	/// </summary>
	private const string ARTICLE_Y = "ArticleY";

    /// <summary>
    /// Exceed amount
    /// </summary>
    private const string EXCEED_AMOUNT = "ExceedAmount";

    /// <summary>
    /// Exceed amount
    /// </summary>
    private const string MAX_QUANTITY_PER_SHOPPING_CART = "MaxQuantityPerShoppingCart";

    #endregion Constants

    #region ICampaignWebUserControlView Members

    /// <summary>
    /// Populates the control with campaign type info.
    /// </summary>
    /// <param name="campaignCarrier">An instance of a campaign carrier.</param>
    public void PopulateViewControl(CampaignCarrier campaignCarrier)
    {
        List<CampaignTypeInfoCarrier> campaignTypeInfos = campaignCarrier.CampaignTypeInfos;
        if (campaignTypeInfos != null && campaignTypeInfos.Count > 0)
        {
            CampaignTypeInfoCarrier infoCarrier = null;
            try
            {
                infoCarrier = campaignTypeInfos.Find(delegate(CampaignTypeInfoCarrier c) { return c.Key == PRODUCT_Y; });
				Product productY = Product.GetProduct(new Guid(infoCarrier.Value));
                if (productY != null)
                {
                    Guid languageId = FoundationContext.Current.Language.ID;

					if (productY.IsVariantGroup)
					{
						c_labaleProductY.Text = ((VariantGroup)productY.Item).VariantArticles.Find(delegate(Article article) { return article.ID == new Guid(campaignTypeInfos.Find(delegate(CampaignTypeInfoCarrier c) { return c.Key == ARTICLE_Y; }).Value); }).GetDisplayName(languageId);
					}
					else
					{
						c_labaleProductY.Text = productY.GetDisplayName(languageId);
					}
                }

                infoCarrier = campaignTypeInfos.Find(delegate(CampaignTypeInfoCarrier c) { return c.Key == EXCEED_AMOUNT; });
                if (infoCarrier != null)
                    c_lableBoxExceedAmount.Text = infoCarrier.Value;

                infoCarrier = campaignTypeInfos.Find(delegate(CampaignTypeInfoCarrier c) { return c.Key == MAX_QUANTITY_PER_SHOPPING_CART; });
                if (infoCarrier != null)
                    c_lableMaxQuantity.Text = infoCarrier.Value;

            }
            catch (ProductDoesNotExistException)
            {
                //product does not exist.
                
            }
        }
    }

    #endregion
}
