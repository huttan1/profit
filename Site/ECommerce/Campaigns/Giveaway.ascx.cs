#region Imports

using System;
using System.Collections.Generic;
using System.Web.UI;
using Litium.Studio.UI.ECommerce;
using Litium.Studio.UI.ECommerce.Common.Constants;
using Litium.Foundation.GUI;
using Litium.Foundation.Modules.ECommerce.Carriers;
using Litium.Foundation.Modules.ProductCatalog;
using Litium.Foundation.Modules.ProductCatalog.Articles;
using Litium.Foundation.Modules.ProductCatalog.Products;
using Litium.Foundation.Modules.ProductCatalog.Variants;
using Litium.Studio.Plugins.ECommerce.PricingRulesPlugin.Campaigns;
using Litium.Studio.UI.ECommerce.Common;
using Litium.Foundation.Modules.ECommerce;

#endregion Imports

/// <summary>
/// Class to handle giveaway campaign type.
/// </summary>
public partial class LitiumStudio_ECommerce_WebUserControls_Campaigns_Giveaway : CampaignBaseControl, ICampaignWebUserControl
{
	#region Methods

	/// <summary>
	/// Initialize the popups.
	/// </summary>
	private void InitPopups()
	{
		// ProductY popup
		c_textBoxProductY.Attributes.Add("readonly", "readonly");
		if (ModuleProductCatalog.ExistsInstance)
		{
			c_imageButtonProductY.Attributes.Add(ParameterConstants.JAVASCRIPT_ON_CLICK,
												 "OpenSelectFromProductCatalog(" +
												 "'', " +
												 "'" + c_hiddenFieldArticleY.ClientID + "', " +
												 "'', " +
												 "'1', " +
												 "'0', " +
												 "'1', " +
												 "'" + Guid.NewGuid() + "'," +
												 "'" + c_hiddenFieldProductY.ClientID + "'," +
												 "'" + c_textBoxProductY.ClientID + "'" +
												 ");" +
												 "return false;");
		}
		else
		{
			c_imageButtonProductY.Visible = false;
		}
	}

	/// <summary>
	/// Saves the campaign type infos.
	/// </summary>
	/// <param name="campaign">The campaign.</param>
	public void SaveCampaignTypeInfos(CampaignCarrier campaign)
	{
        foreach (CampaignTypeInfoCarrier campaignTypeInfoCarrier in campaign.CampaignTypeInfos)
        {
            //remove information beloging to other campaign types. 
            //required if campaign changes type after creation.
            switch (campaignTypeInfoCarrier.Key)
            {
                case CampaignGiveaway.PRODUCT_Y:
                case CampaignGiveaway.ARTICLE_Y:
                case CampaignGiveaway.EXCEED_AMOUNT:
                case CampaignGiveaway.MAX_QUANTITY_PER_SHOPPING_CART:
                case CampaignGiveaway.CURRENCY_CODE:
                    break;
                default:
                    campaignTypeInfoCarrier.CarrierState.IsMarkedForDeleting = true;
                    break;
            }           
        }
        UpdateCampaignTypeInfo(CampaignGiveaway.PRODUCT_Y, c_hiddenFieldProductY.Value, campaign);
		UpdateCampaignTypeInfo(CampaignGiveaway.ARTICLE_Y, c_hiddenFieldArticleY.Value, campaign);
        UpdateCampaignTypeInfo(CampaignGiveaway.EXCEED_AMOUNT, c_textBoxExceedAmount.Text, campaign);
        UpdateCampaignTypeInfo(CampaignGiveaway.MAX_QUANTITY_PER_SHOPPING_CART, c_textBoxMaxQuantityPerShoppingCart.Text, campaign);
	}

	/// <summary>
	/// Loads the campaign type infos.
	/// </summary>
	/// <param name="campaign">The campaign.</param>
	public void LoadCampaignTypeInfos(CampaignCarrier campaign)
	{
		foreach (CampaignTypeInfoCarrier campaignTypeInfo in campaign.CampaignTypeInfos)
		{
            switch(campaignTypeInfo.Key)
            {
                case CampaignGiveaway.PRODUCT_Y:
                    c_hiddenFieldProductY.Value = campaignTypeInfo.Value;
                    break;
                case CampaignGiveaway.ARTICLE_Y:
                    c_hiddenFieldArticleY.Value = campaignTypeInfo.Value;
                    break;
                case CampaignGiveaway.EXCEED_AMOUNT:
                    c_textBoxExceedAmount.Text = campaignTypeInfo.Value;
                    break;
                case CampaignGiveaway.MAX_QUANTITY_PER_SHOPPING_CART:
                    c_textBoxMaxQuantityPerShoppingCart.Text = campaignTypeInfo.Value;
                    break;
            }			
		}
		if (!string.IsNullOrEmpty(c_hiddenFieldProductY.Value) && !string.IsNullOrEmpty(c_hiddenFieldArticleY.Value))
		{
			try
			{
				Product productY = Product.GetProduct(new Guid(c_hiddenFieldProductY.Value));
				if (productY != null)
				{
					Guid languageId = FoundationContext.Current.Language.ID;

					if (productY.IsVariantGroup)
					{
						c_textBoxProductY.Text = ((VariantGroup)productY.Item).VariantArticles.Find(delegate(Article article) { return article.ID == new Guid(c_hiddenFieldArticleY.Value); }).GetDisplayName(languageId);
					}
					else
					{
						c_textBoxProductY.Text = productY.GetDisplayName(languageId);
					}
				}
			}
			catch (ProductDoesNotExistException)
			{
				//Product does not exist.
			}
		}
	}

    /// <summary>
    /// Initializes the validators.
    /// </summary>
    private void InitializeValidators()
    {
        string requiredMessage =
            "<br /><img src=\"Images/transparent.gif\" style=\"vertical-align:middle;\" " +
            "alt=\"\" class=\"litIconError\"/>" +
            FoundationContext.Current.SystemStrings.GetValue(SystemStringConstants.VALIDATION_MESSAGE_REQUIRED_FIELD,
            FoundationContext.Current.Language.ID, true);

        c_requiredFieldValidatorProductY.Text = requiredMessage;
    }


    /// <summary>
    /// Inits the controls.
    /// </summary>
    private void InitControls()
    {
        c_imageButtonProductY.ToolTip = ModuleECommerce.Instance.Strings.GetValue(ModuleStringConstants.SELECT_PRODUCT, FoundationContext.LanguageID, true);
    }

	#endregion Methods

    #region EventHandlers

    /// <summary>
    /// Handles the Load event of the Page control.
    /// </summary>
    /// <param name="sender">
    /// The source of the event.
    /// </param>
    /// <param name="e">
    /// The <see cref="System.EventArgs"/> instance containing the event data.
    /// </param>
    protected override void Page_Load(object sender, EventArgs e)
    {
		base.Page_Load(sender, e);
        if (!IsPostBack)
        {
            InitPopups();
            InitControls();
            InitializeValidators();
        }
    }

    #endregion EventHandlers
}
