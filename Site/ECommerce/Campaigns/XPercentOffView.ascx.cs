#region Imports

using System;
using System.Collections.Generic;
using System.Web.UI;
using Litium.Studio.UI.ECommerce;
using Litium.Foundation.Modules.ECommerce.Carriers;
using Litium.Studio.Plugins.ECommerce.PricingRulesPlugin.Campaigns;

#endregion Imports

/// <summary>
/// 
/// </summary>
public partial class LitiumStudio_ECommerce_WebUserControls_Campaigns_XPercentOffView : UserControl, ICampaignWebUserControlView
{
	#region Constants

    /// <summary>
    /// X percentage
    /// </summary>
    private const string X_PERCENTAGE = "XPercentage";

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
            c_labelExceedAmount.Text =
               campaignTypeInfos.Find(delegate(CampaignTypeInfoCarrier c) { return c.Key == CampaignXPercentOff.EXCEED_AMOUNT; }).Value;
            c_labelXPercentage.Text = campaignTypeInfos.Find(delegate(CampaignTypeInfoCarrier c) { return c.Key == X_PERCENTAGE; }).Value;
        }
    }

    #endregion
}
