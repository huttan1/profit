using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Litium.Studio.Plugins.ECommerce.PaymentProviders.Dibs;
using CMS.PageTypes.CheckOut.Constants;
using Litium.Studio.UI.ECommerce.Common.Constants;
using Litium.Foundation.Modules.ECommerce.Plugins;
using Litium.Foundation.Modules.ECommerce.Plugins.Utilities;
using Litium.Foundation.Modules.ECommerce.Payments;

public partial class LitiumStudio_ECommerce_Panels_DibsDialog :
		Litium.Studio.UI.ECommerce.Common.UserBaseControl,
	Litium.Studio.UI.ECommerce.IPaymentProviderPanel
{

	protected override void Page_Load(object sender, EventArgs e)
	{
		base.Page_Load(sender, e);
	}

	#region IPaymentProviderPanel Members

	/// <summary>
	/// Executes the charge operation.
	/// </summary>
	/// <param name="paymentInfo">The payment info.</param>
	public void ExecuteCharge(PaymentInfo paymentInfo)
	{
		try
		{
			// If the order is already reserved, CanCompleteTransaction will be true. 
			// Call complete transaction on the already reserved order, else call direct charge customer account.
            if (paymentInfo.PaymentProvider.CanCompleteCurrentTransaction)
            {
                paymentInfo.PaymentProvider.CompletePayment(new DibsCompletePaymentArgs(), FoundationContext.Token);
                Response.Redirect(UrlConstants.VIEW_PAYMENT + "?" + ParameterConstants.ECOM_SELECTED_NAVBAR_PAGE + "="
                + ((int)Litium.Studio.UI.ECommerce.Common.Enums.FilterType.Payments).ToString() + "&"
                + ParameterConstants.FROM_PAYMENT + "=true&"
                + ParameterConstants.ECOM_ORDER_ID + "=" + paymentInfo.OrderID + "&"
                + ParameterConstants.QUERY_STRING_NAVIGATE_FROM + "=2");
            }
            else
            {
                DibsPaymentArgs args = new DibsPaymentArgs(string.Empty, UrlConstants.PAYMENT_SUCCESS, UrlConstants.PAYMENT_CANCEL, FoundationContext.Culture.Name);
                args.PaymentMode = ExecutePaymentMode.Charge;
                args.UserHostAddress = Request.UserHostAddress;
                args.ExecuteScript = new DibsPaymentArgs.ExecuteScriptHandler(ExecuteScript);
                DibsPaymentResult result = (DibsPaymentResult)paymentInfo.PaymentProvider.ExecutePayment(args, FoundationContext.Token);
                if (!result.Success)
                {
                    Response.Redirect(UrlConstants.VIEW_PAYMENT + "?" + ParameterConstants.ECOM_SELECTED_NAVBAR_PAGE + "="
                    + ((int)Litium.Studio.UI.ECommerce.Common.Enums.FilterType.Payments).ToString() + "&"
                    + ParameterConstants.FROM_PAYMENT + "=true&"
                    + ParameterConstants.ECOM_ORDER_ID + "=" + paymentInfo.OrderID + "&"
                    + ParameterConstants.QUERY_STRING_NAVIGATE_FROM + "=2");
                }
            }
		}
		catch (PaymentProviderException) { }
	}



	/// <summary>
	/// Executes the reserve operation.
	/// </summary>
	/// <param name="paymentInfo">The payment info.</param>
	public void ExecuteReserve(Litium.Foundation.Modules.ECommerce.Payments.PaymentInfo paymentInfo)
	{
		try
		{
            DibsPaymentArgs args = new DibsPaymentArgs(string.Empty, UrlConstants.PAYMENT_SUCCESS, UrlConstants.PAYMENT_CANCEL, FoundationContext.Culture.Name);
			args.PaymentMode = ExecutePaymentMode.Reserve;
            args.UserHostAddress = Request.UserHostAddress;
            args.ExecuteScript = new DibsPaymentArgs.ExecuteScriptHandler(ExecuteScript);
			DibsPaymentResult result = (DibsPaymentResult)paymentInfo.PaymentProvider.ExecutePayment(args, FoundationContext.Token);
			if (!result.Success)
			{
				//Litium.Studio.UI.ECommerce.Common.Helpers.PaymentProviderHelper.CreatePaymentForm(Page, result.FormTargetUrl, result.FormElements);
                Response.Redirect(UrlConstants.VIEW_PAYMENT + "?" + ParameterConstants.ECOM_SELECTED_NAVBAR_PAGE + "="
                + ((int)Litium.Studio.UI.ECommerce.Common.Enums.FilterType.Payments).ToString() + "&"
                + ParameterConstants.FROM_PAYMENT + "=true&"
                + ParameterConstants.ECOM_ORDER_ID + "=" + paymentInfo.OrderID + "&"
                + ParameterConstants.ECOM_PAYMENT_INFO_ID + "=" + paymentInfo.ID + "&"
                + ParameterConstants.QUERY_STRING_NAVIGATE_FROM + "=2");
			}
		}
		catch (PaymentProviderException) { }
	}

	#endregion
  
    /// <summary>
    /// Executes the script in args or redirects to the url in arg.
    /// </summary>
    /// <param name="args">The args.</param>
    /// <param name="redirect">if set to <c>true</c> [redirect].</param>
    private void ExecuteScript(string args, bool redirect)
    {
        if (redirect)
        {
            Response.Redirect(args, true);
        }
        else
        {
            if (ScriptManager.GetCurrent(Page) != null && ScriptManager.GetCurrent(Page).IsInAsyncPostBack)
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "PaymentForm", args, true);
            else
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "PaymentForm", args, true);
        }
    }
}
