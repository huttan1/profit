#region Imports

using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using Litium.Foundation.Modules.ECommerce.Carriers;
using Litium.Studio.UI.ECommerce;
using Litium.Studio.Plugins.ECommerce.PricingRulesPlugin.Campaigns;
using Litium.Studio.UI.ECommerce.Common.Constants;
using Litium.Foundation.GUI;
using Litium.Studio.UI.ECommerce.Common;

#endregion Imports

/// <summary>
/// Class to handle buy x pay for y campaign type.
/// </summary>
public partial class LitiumStudio_ECommerce_WebUserControls_Campaigns_BuyXPayY : CampaignBaseControl, ICampaignWebUserControl
{
	#region Methods

	/// <summary>
	/// Saves the get campaign type infos.
	/// </summary>
	/// <param name="campaign">
	/// The campaign.
	/// </param>
	public void SaveCampaignTypeInfos(CampaignCarrier campaign)
	{
        foreach (CampaignTypeInfoCarrier campaignTypeInfoCarrier in campaign.CampaignTypeInfos)
        {
            if ((campaignTypeInfoCarrier.Key != CampaignBuyXPayY.BUY_QUANTITY) &&
                (campaignTypeInfoCarrier.Key != CampaignBuyXPayY.PAY_FOR_QUANTITY) && 
                (campaignTypeInfoCarrier.Key != BaseCampaign.CURRENCY_CODE))
            {
                campaignTypeInfoCarrier.CarrierState.IsMarkedForDeleting = true;
            }
        }
        UpdateCampaignTypeInfo(CampaignBuyXPayY.BUY_QUANTITY, c_textBoxBuyQuantity.Text.Trim(), campaign);
        UpdateCampaignTypeInfo(CampaignBuyXPayY.PAY_FOR_QUANTITY, c_textBoxPayForQuantity.Text.Trim(), campaign);
	}

	/// <summary>
	/// Loads the campaign type infos.
	/// </summary>
	/// <param name="campaign">The campaign.</param>
	public void LoadCampaignTypeInfos(CampaignCarrier campaign)
	{
		foreach(CampaignTypeInfoCarrier campaignTypeInfo in campaign.CampaignTypeInfos)
		{
			if (campaignTypeInfo.Key == CampaignBuyXPayY.BUY_QUANTITY)
			{
				c_textBoxBuyQuantity.Text = campaignTypeInfo.Value;
			}
			else if (campaignTypeInfo.Key == CampaignBuyXPayY.PAY_FOR_QUANTITY)
			{
				c_textBoxPayForQuantity.Text = campaignTypeInfo.Value;
			}
		}
	}

	/// <summary>
	/// Handles the ServerValidate event of the PayForQuantity control.
	/// </summary>
	/// <param name="source">
	/// The source of the event.
	/// </param>
	/// <param name="args">
	/// The <see cref="System.Web.UI.WebControls.ServerValidateEventArgs"/> instance containing the event data.
	/// </param>
	protected void PayForQuantity_ServerValidate(object source, ServerValidateEventArgs args)
	{
		string buyQuantityText = c_textBoxBuyQuantity.Text;
		double buyQuantity;
		if(double.TryParse(buyQuantityText, out buyQuantity))
		{
			double payForQuantity;
			if (double.TryParse(args.Value, out payForQuantity))
			{
				args.IsValid = (buyQuantity > payForQuantity);
			}
			else
			{
				args.IsValid = true;
			}
		}
		else
		{
			args.IsValid = true;
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

        string outOfRangeMessage =
            "<br /><img src=\"Images/transparent.gif\" style=\"vertical-align:middle;\" " +
            "alt=\"\" class=\"litIconError\"/>" +
            FoundationContext.Current.SystemStrings.GetValue(SystemStringConstants.VALIDATION_MESSAGE_VALUE_OUT_OF_RANGE,
            FoundationContext.Current.Language.ID, true);

        string invalidInputMessage =
             "<br /><img src=\"Images/transparent.gif\" style=\"vertical-align:middle;\" " +
            "alt=\"\" class=\"litIconError\"/>" +
            FoundationContext.Current.SystemStrings.GetValue(SystemStringConstants.VALIDATION_MESSAGE_INVALID_INPUT,
            FoundationContext.Current.Language.ID, true);

        c_requiredFieldValidatorBuyQuantity.Text = requiredMessage;
        c_rangeValidatorBuyQuantity.Text = outOfRangeMessage;

        c_requiredFieldValidatorPayForQuantity.Text = requiredMessage;
        c_rangeValidatorPayForQuantity.Text = outOfRangeMessage;
        c_customValidatorPayForQuantity.Text = invalidInputMessage;
    }

	#endregion Methods

    #region EventHandlers

    protected override void Page_Load(object sender, EventArgs e)
    {
		base.Page_Load(sender, e);
        if (!IsPostBack)
        {
            InitializeValidators();
        }
    }

    #endregion EventHandlers
}
