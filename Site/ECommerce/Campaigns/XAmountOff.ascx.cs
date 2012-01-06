﻿#region Imports

using System;
using System.Collections.Generic;
using System.Web.UI;
using Litium.Studio.UI.ECommerce;
using Litium.Foundation.Modules.ECommerce.Carriers;
using Litium.Studio.Plugins.ECommerce.PricingRulesPlugin.Campaigns;
using Litium.Studio.UI.ECommerce.Common.Constants;
using Litium.Foundation.GUI;
using Litium.Studio.UI.ECommerce.Common;

#endregion Imports

/// <summary>
/// Class to handle x percent off campaign type.
/// </summary>
public partial class LitiumStudio_ECommerce_WebUserControls_Campaigns_XAmountOff : CampaignBaseControl, ICampaignWebUserControl
{
	#region Methods

	/// <summary>
	/// Saves the campaign type infos.
	/// </summary>
	/// <param name="campaign">The campaign.</param>
	public void SaveCampaignTypeInfos(CampaignCarrier campaign)
	{
        foreach (CampaignTypeInfoCarrier campaignTypeInfoCarrier in campaign.CampaignTypeInfos)
        {
            if ((campaignTypeInfoCarrier.Key != CampaignXAmountOff.EXCEED_AMOUNT) &&
                (campaignTypeInfoCarrier.Key != CampaignXAmountOff.X_AMOUNT) &&
                (campaignTypeInfoCarrier.Key != BaseCampaign.CURRENCY_CODE))
            {
                campaignTypeInfoCarrier.CarrierState.IsMarkedForDeleting = true;
            }
        }
        UpdateCampaignTypeInfo(CampaignXAmountOff.EXCEED_AMOUNT, c_textBoxExceedAmount.Text.Trim(), campaign);
        UpdateCampaignTypeInfo(CampaignXAmountOff.X_AMOUNT, c_textBoxXAmount.Text.Trim(), campaign);
	}

	/// <summary>
	/// Loads the campaign type infos.
	/// </summary>
	/// <param name="campaign">The campaign.</param>
	public void LoadCampaignTypeInfos(CampaignCarrier campaign)
	{
		foreach (CampaignTypeInfoCarrier campaignTypeInfo in campaign.CampaignTypeInfos)
		{
            if (campaignTypeInfo.Key == CampaignXAmountOff.X_AMOUNT)
			{
				c_textBoxXAmount.Text = campaignTypeInfo.Value;
			}
            if (campaignTypeInfo.Key == CampaignXAmountOff.EXCEED_AMOUNT)
            {
                c_textBoxExceedAmount.Text = campaignTypeInfo.Value;
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

        string outOfRangeMessage =
            "<br /><img src=\"Images/transparent.gif\" style=\"vertical-align:middle;\" " +
            "alt=\"\" class=\"litIconError\"/>" +
            FoundationContext.Current.SystemStrings.GetValue(SystemStringConstants.VALIDATION_MESSAGE_VALUE_OUT_OF_RANGE,
            FoundationContext.Current.Language.ID, true);

        c_requiredFieldValidatorExceedAmount.Text = requiredMessage;
        c_rangeValidatorExceedAmount.Text = outOfRangeMessage;

        c_requiredFieldValidatorXAmount.Text = requiredMessage;
        c_rangeValidatorXAmount.Text = outOfRangeMessage;
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