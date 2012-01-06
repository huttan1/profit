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
using Litium.Studio.Plugins.ECommerce.PricingRulesPlugin.Campaigns;

public partial class LitiumStudio_ECommerce_WebUserControls_Campaigns_FreeFeesView : System.Web.UI.UserControl, ICampaignWebUserControlView
{
    #region Constants


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
                campaignTypeInfos.Find(delegate(CampaignTypeInfoCarrier c) { return c.Key == CampaignFreeFees.EXCEED_AMOUNT; }).Value;
        }
    }

    #endregion
}
