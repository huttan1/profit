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
using System.Text;

public partial class LitiumStudio_ECommerce_WebUserControls_Campaigns_VoucherSingleUseView : System.Web.UI.UserControl, ICampaignWebUserControlView
{
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
                campaignTypeInfos.Find(delegate(CampaignTypeInfoCarrier c) { return c.Key == CampaignVoucherSingleUse.EXCEED_AMOUNT; }).Value;
            CampaignTypeInfoCarrier amountInfo =
                campaignTypeInfos.Find(delegate(CampaignTypeInfoCarrier c) { return c.Key == CampaignVoucherSingleUse.AMOUNT_DISCOUNT; });
            if (amountInfo != null)
            {
                c_labelAmountDiscount.Text = amountInfo.Value;
            }
            else
            {
                c_divAmountDiscount.Visible = false;
            }
            CampaignTypeInfoCarrier percentageInfo
                = campaignTypeInfos.Find(delegate(CampaignTypeInfoCarrier c) { return c.Key == CampaignVoucherSingleUse.PERCENTAGE_DISCOUNT; });
            if (percentageInfo != null)
            {
                c_labelPercentageDiscount.Text = percentageInfo.Value;
            }
            else
            {
                c_divPercentageDiscount.Visible =false ;
            }
            CampaignTypeInfoCarrier noOfVoucherCodes
                = campaignTypeInfos.Find(delegate(CampaignTypeInfoCarrier c) { return c.Key == CampaignVoucherSingleUse.NO_OF_VOUCHER_CODES; });
            if (noOfVoucherCodes != null)
            {
                c_labelNoOfVoucherCodes.Text = noOfVoucherCodes.Value;
            }
            else
            {
                c_divNoOfVoucherCodes.Visible = false;
            }
            c_dataListVoucherCodes.DataSource = campaignCarrier.VoucherCodes;
            c_dataListVoucherCodes.DataBind();
            if (campaignCarrier.VoucherCodes.Count == 0)
            {
                c_divVoucherCodes.Visible = false;  
            }
        }
    }

    #endregion
}
