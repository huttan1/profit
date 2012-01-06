using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Litium.Studio.Plugins.ECommerce.PaymentProviders.PayEx;
using CMS.PageTypes.CheckOut.Constants;
using Litium.Studio.UI.ECommerce.Common.Constants;
using Litium.Foundation.Modules.ECommerce.Plugins;
using Litium.Foundation.Modules.ECommerce.Payments;

public partial class LitiumStudio_ECommerce_Panels_PayExDialog :
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
	public void ExecuteCharge(Litium.Foundation.Modules.ECommerce.Payments.PaymentInfo paymentInfo)
	{
		try
		{
			// If the order is already reserved, CanCompleteTransaction will be true. 
			// Call complete transaction on the already reserved order, else call direct charge customer account.
			if (paymentInfo.PaymentProvider.CanCompleteCurrentTransaction)
			{
				paymentInfo.PaymentProvider.CompletePayment(new PayExCompletePaymentArgs(), FoundationContext.Token);
				//redirect to view payment.
				Response.Redirect(UrlConstants.VIEW_PAYMENT + "?" + ParameterConstants.ECOM_SELECTED_NAVBAR_PAGE + "="
				+ ((int)Litium.Studio.UI.ECommerce.Common.Enums.FilterType.Payments).ToString() + "&"
				+ ParameterConstants.FROM_PAYMENT + "=true&"
				+ ParameterConstants.ECOM_ORDER_ID + "=" + paymentInfo.OrderID + "&"
                + ParameterConstants.ECOM_PAYMENT_INFO_ID + "=" + paymentInfo.ID + "&"
				+ ParameterConstants.QUERY_STRING_NAVIGATE_FROM + "=2");
			}
			else
			{
				PayExExecutePaymentArgs args = new PayExExecutePaymentArgs(string.Empty, UrlConstants.PAYMENT_SUCCESS, UrlConstants.PAYMENT_CANCEL, FoundationContext.Culture.Name);
				args.PaymentMode = ExecutePaymentMode.Charge;
				//add redirect script on success.
				args.ExecuteScript = new PayExExecutePaymentArgs.ExecuteScriptHandler(delegate(string scriptArgs, bool redirect)
				{
					if (redirect) Response.Redirect(scriptArgs, true);
				});
                args.UserHostAddress = Request.UserHostAddress;
				PayExExecutePaymentResult result = (PayExExecutePaymentResult)paymentInfo.PaymentProvider.ExecutePayment(args, FoundationContext.Token);
				if (!result.Success)
				{
					Response.Redirect(UrlConstants.VIEW_PAYMENT + "?" + ParameterConstants.ECOM_SELECTED_NAVBAR_PAGE + "="
					+ ((int)Litium.Studio.UI.ECommerce.Common.Enums.FilterType.Payments).ToString() + "&"
					+ ParameterConstants.FROM_PAYMENT + "=true&"
					+ ParameterConstants.ECOM_ORDER_ID + "=" + paymentInfo.OrderID + "&"
                    + ParameterConstants.ECOM_PAYMENT_INFO_ID + "=" + paymentInfo.ID + "&"
					+ ParameterConstants.QUERY_STRING_NAVIGATE_FROM + "=2", true);
				}
			}
		}
		catch (PaymentProviderException) { }
	}

	/// <summary>
	/// Executes the reserve operation.
	/// </summary>
	/// <param name="paymentInfo">The payment info.</param>
	public void ExecuteReserve(PaymentInfo paymentInfo)
	{
		try
		{
			PayExExecutePaymentArgs args = new PayExExecutePaymentArgs(string.Empty, UrlConstants.PAYMENT_SUCCESS, UrlConstants.PAYMENT_CANCEL, FoundationContext.Culture.Name);
			args.PaymentMode = ExecutePaymentMode.Reserve;
			args.ExecuteScript = new PayExExecutePaymentArgs.ExecuteScriptHandler(delegate(string scriptArgs, bool redirect)
			{
				if (redirect)
					Response.Redirect(scriptArgs, true);
			});
            args.UserHostAddress = Request.UserHostAddress;
			PayExExecutePaymentResult result = (PayExExecutePaymentResult)paymentInfo.PaymentProvider.ExecutePayment(args, FoundationContext.Token);
			if (!result.Success)
			{
				Response.Redirect(UrlConstants.VIEW_PAYMENT + "?" + ParameterConstants.ECOM_SELECTED_NAVBAR_PAGE + "="
				+ ((int)Litium.Studio.UI.ECommerce.Common.Enums.FilterType.Payments).ToString() + "&"
				+ ParameterConstants.FROM_PAYMENT + "=true&"
				+ ParameterConstants.ECOM_ORDER_ID + "=" + paymentInfo.OrderID + "&"
                + ParameterConstants.ECOM_PAYMENT_INFO_ID + "=" + paymentInfo.ID + "&"
				+ ParameterConstants.QUERY_STRING_NAVIGATE_FROM + "=2", true);
			}
		}
		catch (PaymentProviderException) { }
	}

	#endregion
}
