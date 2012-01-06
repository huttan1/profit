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

public partial class LitiumStudio_ECommerce_WebUserControls_Campaigns_BuyXPayYView : System.Web.UI.UserControl, ICampaignWebUserControlView
{
    #region Constants

    private const string BUY_QUANTITY = "BuyQuantity";
    private const string PAY_FOR_QUANTITY = "PayForQuantity";

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
            c_labelBuyQuantity.Text =
                campaignTypeInfos.Find(delegate(CampaignTypeInfoCarrier c) { return c.Key == BUY_QUANTITY; }).Value;
            c_labelPayForQuantity.Text =
                campaignTypeInfos.Find(delegate(CampaignTypeInfoCarrier c) { return c.Key == PAY_FOR_QUANTITY; }).Value;
        }
    }

    #endregion
}
