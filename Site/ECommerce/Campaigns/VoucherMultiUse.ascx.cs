#region Imports

using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using Litium.Studio.UI.ECommerce;
using Litium.Foundation.Modules.ECommerce;
using Litium.Foundation.Modules.ECommerce.Campaigns;
using Litium.Foundation.Modules.ECommerce.Carriers;
using Litium.Studio.Plugins.ECommerce.PricingRulesPlugin.Campaigns;
using Litium.Studio.UI.ECommerce.Common.Constants;
using Litium.Foundation.GUI;
using Litium.Studio.UI.ECommerce.Common;

#endregion Imports

public partial class LitiumStudio_ECommerce_WebUserControls_Campaigns_VoucherMultiUse : CampaignBaseControl, ICampaignWebUserControl
{
	#region Constants

	private string VIEW_STATE_CAMPAIGN_ID = "ViewStateCampaignID";
	private string VIEW_STATE_VOUCHER_CODES = "ViewStateVoucherCodes";

	#endregion Constants

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
        UpdateCampaignTypeInfo(CampaignVoucherMultiUse.EXCEED_AMOUNT, c_textBoxExceedAmount.Text.Trim(), campaign);

		if (c_radioButtonAmountDiscount.Checked)
		{
			UpdateCampaignTypeInfo(CampaignVoucherMultiUse.AMOUNT_DISCOUNT, c_textBoxAmountDiscount.Text.Trim(), campaign);
            UpdateCampaignTypeInfo(CampaignVoucherMultiUse.PERCENTAGE_DISCOUNT, string.Empty, campaign);

		}
		else
		{
            UpdateCampaignTypeInfo(CampaignVoucherMultiUse.PERCENTAGE_DISCOUNT, c_textBoxPercentageDiscount.Text.Trim(), campaign);
            UpdateCampaignTypeInfo(CampaignVoucherMultiUse.AMOUNT_DISCOUNT, string.Empty, campaign);
		}
        UpdateCampaignTypeInfo(CampaignVoucherMultiUse.NO_OF_VOUCHER_CODES, c_textBoxVoucherCode.Text.Trim(), campaign);

		// Add voucher codes
		campaign.VoucherCodes = (List<VoucherCodeCarrier>) ViewState[VIEW_STATE_VOUCHER_CODES];
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
					c_textBoxVoucherCode.Text = campaignTypeInfo.Value;
				}
			}

			// Initialize grid
			c_gridVoucherCodes.DataSource = campaign.VoucherCodes.FindAll(delegate(VoucherCodeCarrier voucherCode) { return !voucherCode.CarrierState.IsMarkedForDeleting; });
			c_gridVoucherCodes.DataBind();

			// Add campaign id to the view state
			ViewState[VIEW_STATE_CAMPAIGN_ID] = campaign.ID;
			ViewState[VIEW_STATE_VOUCHER_CODES] = campaign.VoucherCodes;
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
	/// Initializes the controls.
	/// </summary>
	private void InitializeControls()
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
		
		string voucherCodeExistsMessage = 
			"<br /><img src=\"Images/transparent.gif\" style=\"vertical-align:middle;\" " +
			"alt=\"\" class=\"litIconError\"/>" +
			ModuleECommerce.Instance.Strings.GetValue(ModuleStringConstants.CAMPAIGN_VALIDATION_MESSAGE_VOUCHER_CODE_EXISTS, FoundationContext.Current.Language.ID, true);

		c_requiredFieldValidatorExceedAmount.Text = requiredMessage;
		c_rangeValidatorExceedAmount.Text = outOfRangeMessage;

		c_requiredFieldValidatorAmountDiscount.Text = requiredMessage;
		c_rangeValidatorAmountDiscount.Text = outOfRangeMessage;

		c_requiredFieldValidatorPercentageDiscount.Text = requiredMessage;
		c_rangeValidatorPercentageDiscount.Text = outOfRangeMessage;

		c_requiredFieldValidatorVoucherCode.Text = requiredMessage;
		c_requiredFieldValidatorFrequency.Text = requiredMessage;
		c_rangeValidatorFrequency.Text = requiredMessage;
		c_rangeValidatorFrequency.Text = outOfRangeMessage;

		c_customValidatorVoucherCode.Text = voucherCodeExistsMessage;

		c_buttonAdd.Text = ModuleECommerce.Instance.Strings.GetValue(ModuleStringConstants.CAMPAIGN_BUTTON_ADD_TEXT, FoundationContext.Current.LanguageID, true);

		string columnHeading = ModuleECommerce.Instance.Strings.GetValue(ModuleStringConstants.CAMPAIGN_VOUCHER_CODE, FoundationContext.Current.LanguageID, true);
		if (!string.IsNullOrEmpty(columnHeading))
		{
			columnHeading = columnHeading.Replace(" ", "&nbsp;");
			c_gridVoucherCodes.Levels[0].Columns[1].HeadingText = columnHeading;
		}
		columnHeading = ModuleECommerce.Instance.Strings.GetValue(ModuleStringConstants.CAMPAIGN_FREQUENCY, FoundationContext.Current.LanguageID, true);
		if (!string.IsNullOrEmpty(columnHeading))
		{
			columnHeading = columnHeading.Replace(" ", "&nbsp;");
			c_gridVoucherCodes.Levels[0].Columns[2].HeadingText = columnHeading;
		}
	}

	/// <summary>
	/// Handles the Click event of the ButtonAdd control.
	/// </summary>
	/// <param name="sender">
	/// The source of the event.
	/// </param>
	/// <param name="e">
	/// The <see cref="System.EventArgs"/> instance containing the event data.
	/// </param>
	protected void ButtonAdd_Click(object sender, EventArgs e)
	{
		if (string.IsNullOrEmpty(c_textBoxVoucherCode.Text.Trim()))
		{
			c_requiredFieldValidatorVoucherCode.IsValid = false;
		}
		if (string.IsNullOrEmpty(c_textBoxFrequency.Text.Trim()))
		{
			c_requiredFieldValidatorFrequency.IsValid = false;
		}

		if (Page.IsValid)
		{
			VoucherCodeCarrier voucherCode = new VoucherCodeCarrier(Guid.NewGuid(), c_textBoxVoucherCode.Text.Trim(), (Guid) ViewState[VIEW_STATE_CAMPAIGN_ID], int.Parse(c_textBoxFrequency.Text)); 
			((List<VoucherCodeCarrier>) ViewState[VIEW_STATE_VOUCHER_CODES]).Add(voucherCode);
			c_gridVoucherCodes.DataSource = ViewState[VIEW_STATE_VOUCHER_CODES];
			c_gridVoucherCodes.DataBind();

			c_textBoxVoucherCode.Text = string.Empty;
			c_textBoxFrequency.Text = string.Empty;
		}
	}

	/// <summary>
	/// Handles the ServerValidate event of the VoucherCode control.
	/// </summary>
	/// <param name="sender">
	/// The source of the event.
	/// </param>
	/// <param name="e">
	/// The <see cref="System.Web.UI.WebControls.ServerValidateEventArgs"/> instance containing the event data.
	/// </param>
	protected void VoucherCode_ServerValidate(object sender, ServerValidateEventArgs e)
	{
		e.IsValid = true;
		List<VoucherCodeCarrier> voucherCodes = (List<VoucherCodeCarrier>) ViewState[VIEW_STATE_VOUCHER_CODES];
		foreach(VoucherCodeCarrier voucherCode in voucherCodes)
		{
			if(e.Value.Trim() == voucherCode.VoucherCode)
			{
				e.IsValid = false;
				return;
			}
		}
		Campaign campaign = ModuleECommerce.Instance.Campaigns.GetCampaign((Guid) ViewState[VIEW_STATE_CAMPAIGN_ID], FoundationContext.Current.Token);
		if ((campaign != null) && (campaign.VoucherCodes.Exists(e.Value.Trim())))
		{
			e.IsValid = false;
		}
	}

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
			InitializeControls();
		}
	}

	/// <summary>
	/// Raises the <see cref="E:System.Web.UI.Control.Init"/> event.
	/// </summary>
	/// <param name="e">An <see cref="T:System.EventArgs"/> object that contains the event data.</param>
	override protected void OnInit(EventArgs e)
	{
		//
		// CODEGEN: This call is required by the ASP.NET Web Form Designer.
		//
		InitializeComponent();
		base.OnInit(e);
	}

	/// <summary>
	/// Required method for Designer support - do not modify
	/// the contents of this method with the code editor.
	/// </summary>
	private void InitializeComponent()
	{
		Load += Page_Load;
		c_gridVoucherCodes.DeleteCommand += GridVoucherCodes_DeleteCommand;
	}

	/// <summary>
	/// Handles the DeleteCommand event of the GridVoudhcerCodes control.
	/// </summary>
	/// <param name="sender">
	/// The source of the event.
	/// </param>
	/// <param name="e">
	/// The <see cref="ComponentArt.Web.UI.GridItemEventArgs"/> instance containing the event data.
	/// </param>
	private void GridVoucherCodes_DeleteCommand(object sender, ComponentArt.Web.UI.GridItemEventArgs e)
	{
		string deletedVoucherCode = e.Item["VoucherCode"].ToString();
		List<VoucherCodeCarrier> voucherCodes = (List<VoucherCodeCarrier>) ViewState[VIEW_STATE_VOUCHER_CODES];
		for(int index = 0; index < voucherCodes.Count; index++)
		{
			VoucherCodeCarrier voucherCode = voucherCodes[index];
			if(voucherCode.VoucherCode == deletedVoucherCode)
			{
				if (voucherCode.CarrierState.IsMarkedForCreating)
				{
					voucherCodes.RemoveAt(index);
					index--;
				}
				else
				{
					voucherCode.CarrierState.IsMarkedForDeleting = true;
				}
			}
		}
	}

	#endregion Members
}
