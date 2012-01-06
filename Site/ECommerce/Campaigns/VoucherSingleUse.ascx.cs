#region Imports

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
/// Class to handle voucher single use campaign type.
/// </summary>
public partial class LitiumStudio_ECommerce_WebUserControls_Campaigns_VoucherSingleUse : CampaignBaseControl, ICampaignWebUserControl
{
	#region Members

	/// <summary>
	/// Saves the campaign type infos.
	/// </summary>
	/// <param name="campaign">The campaign.</param>
	public void SaveCampaignTypeInfos(CampaignCarrier campaign)
	{
        foreach (CampaignTypeInfoCarrier campaignTypeInfoCarrier in campaign.CampaignTypeInfos)
        {
            if ((campaignTypeInfoCarrier.Key != CampaignVoucherSingleUse.EXCEED_AMOUNT) &&
                (campaignTypeInfoCarrier.Key != CampaignVoucherSingleUse.AMOUNT_DISCOUNT) &&
                (campaignTypeInfoCarrier.Key != CampaignVoucherSingleUse.PERCENTAGE_DISCOUNT) &&
                (campaignTypeInfoCarrier.Key != CampaignVoucherSingleUse.NO_OF_VOUCHER_CODES) &&
                (campaignTypeInfoCarrier.Key != BaseCampaign.CURRENCY_CODE))
            {
                campaignTypeInfoCarrier.CarrierState.IsMarkedForDeleting = true;
            }
        }
        UpdateCampaignTypeInfo(CampaignVoucherSingleUse.EXCEED_AMOUNT, c_textBoxExceedAmount.Text.Trim(), campaign);

		if (c_radioButtonAmountDiscount.Checked)
		{
            UpdateCampaignTypeInfo(CampaignVoucherSingleUse.AMOUNT_DISCOUNT, c_textBoxAmountDiscount.Text.Trim(), campaign);
            UpdateCampaignTypeInfo(CampaignVoucherSingleUse.PERCENTAGE_DISCOUNT, string.Empty, campaign);
        }
		else
		{
            UpdateCampaignTypeInfo(CampaignVoucherSingleUse.PERCENTAGE_DISCOUNT, c_textBoxPercentageDiscount.Text.Trim(), campaign);
            UpdateCampaignTypeInfo(CampaignVoucherSingleUse.AMOUNT_DISCOUNT, string.Empty, campaign);
		}
        UpdateCampaignTypeInfo(CampaignVoucherSingleUse.NO_OF_VOUCHER_CODES, c_textBoxNoOfVoucherCodes.Text.Trim(), campaign);
	}

	/// <summary>
	/// Loads the campaign type infos.
	/// </summary>
	/// <param name="campaign">The campaign.</param>
	public void LoadCampaignTypeInfos(CampaignCarrier campaign)
	{
		if (!IsPostBack)
		{
			// Default setup
			c_radioButtonAmountDiscount.Checked = true;
			c_textBoxPercentageDiscount.Enabled = false;
			c_requiredFieldValidatorPercentageDiscount.Enabled = false;

			foreach (CampaignTypeInfoCarrier campaignTypeInfo in campaign.CampaignTypeInfos)
			{
                if (campaignTypeInfo.Key == CampaignVoucherSingleUse.EXCEED_AMOUNT)
				{
					c_textBoxExceedAmount.Text = campaignTypeInfo.Value;
				}
                else if (campaignTypeInfo.Key == CampaignVoucherSingleUse.AMOUNT_DISCOUNT)
				{
					c_textBoxAmountDiscount.Text = campaignTypeInfo.Value;
					c_textBoxAmountDiscount.Enabled = true;
					c_radioButtonAmountDiscount.Checked = true;
					c_requiredFieldValidatorAmountDiscount.Enabled = true;
					c_textBoxPercentageDiscount.Text = string.Empty;
					c_textBoxPercentageDiscount.Enabled = false;
					c_radioButtonPercentageDiscount.Checked = false;
					c_requiredFieldValidatorPercentageDiscount.Enabled = false;
				}
                else if (campaignTypeInfo.Key == CampaignVoucherSingleUse.PERCENTAGE_DISCOUNT)
				{
					c_textBoxPercentageDiscount.Text = campaignTypeInfo.Value;
					c_textBoxPercentageDiscount.Enabled = true;
					c_radioButtonPercentageDiscount.Checked = true;
					c_requiredFieldValidatorPercentageDiscount.Enabled = true;
					c_textBoxAmountDiscount.Text = string.Empty;
					c_textBoxAmountDiscount.Enabled = false;
					c_radioButtonAmountDiscount.Checked = false;
					c_requiredFieldValidatorAmountDiscount.Enabled = false;
				}
                else if (campaignTypeInfo.Key == CampaignVoucherSingleUse.NO_OF_VOUCHER_CODES)
                {
                    c_textBoxNoOfVoucherCodes.Text = campaignTypeInfo.Value;
                }
			}
		}
	}

	/// <summary>
	/// Handles the Clicked event of the RadioButtonAmountDiscount control.
	/// </summary>
	/// <param name="sender">
	/// The source of the event.
	/// </param>
	/// <param name="e">
	/// The <see cref="System.EventArgs"/> instance containing the event data.
	/// </param>
	protected void RadioButtonAmountDiscount_Clicked(object sender, EventArgs e)
	{
		c_radioButtonAmountDiscount.Checked = true;
		c_textBoxAmountDiscount.Enabled = true;
		c_textBoxAmountDiscount.Focus();
		c_requiredFieldValidatorAmountDiscount.Enabled = true;
		c_radioButtonPercentageDiscount.Checked = false;
		c_textBoxPercentageDiscount.Enabled = false;
		c_textBoxPercentageDiscount.Text = string.Empty;
		c_requiredFieldValidatorPercentageDiscount.Enabled = false;
		
	}
	/// <summary>
	/// Handles the Clicked event of the RadioButtonPercentageDiscount control.
	/// </summary>
	/// <param name="sender">
	/// The source of the event.
	/// </param>
	/// <param name="e">
	/// The <see cref="System.EventArgs"/> instance containing the event data.
	/// </param>
	protected void RadioButtonPercentageDiscount_Clicked(object sender, EventArgs e)
	{
		c_radioButtonPercentageDiscount.Checked = true;
		c_textBoxPercentageDiscount.Enabled = true;
		c_textBoxPercentageDiscount.Focus();
		c_requiredFieldValidatorPercentageDiscount.Enabled = true;
		c_radioButtonAmountDiscount.Checked = false;
		c_textBoxAmountDiscount.Enabled = false;
		c_textBoxAmountDiscount.Text = string.Empty;
		c_requiredFieldValidatorAmountDiscount.Enabled = false;
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

        c_requiredFieldValidatorAmountDiscount.Text = requiredMessage;
        c_rangeValidatorAmountDiscount.Text = outOfRangeMessage;

        c_requiredFieldValidatorPercentageDiscount.Text = requiredMessage;
        c_rangeValidatorPercentageDiscount.Text = outOfRangeMessage;

        c_requiredFieldValidatorNoOfVoucherCodes.Text = requiredMessage;
        c_rangeValidatorNoOfVoucherCodes.Text = outOfRangeMessage;
    }


	#endregion Members

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
