using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Litium.Studio.Plugins.ECommerce.PaymentProviders.DirectPay;
using CMS.PageTypes.CheckOut.Constants;
using Litium.Studio.UI.ECommerce.Common.Constants;
using Litium.Foundation.Modules.ECommerce.Plugins;
using Litium.Foundation.Modules.ECommerce.Plugins.Utilities;
using Litium.Foundation.Modules.ECommerce.Payments;

public partial class LitiumStudio_ECommerce_Panels_DirectPayDialog : 
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
		bool isRedirected = false;
		try
		{
			// If the order is already reserved, CanCompleteTransaction will be true. 
			// Call complete transaction on the already reserved order, else call direct charge customer account.
			if (paymentInfo.PaymentProvider.CanCompleteCurrentTransaction)
				paymentInfo.PaymentProvider.CompletePayment(new DirectPayCompletePaymentArgs(), FoundationContext.Token);
			else
			{
				DirectPayPaymentArgs args = new DirectPayPaymentArgs();
				args.PaymentMode = ExecutePaymentMode.Charge;
                args.UserHostAddress = Request.UserHostAddress;
				paymentInfo.PaymentProvider.ExecutePayment(args, FoundationContext.Token);
			}
		}
		catch (PaymentProviderException) { }

		if (!isRedirected)
		{
			Response.Redirect(UrlConstants.VIEW_PAYMENT + "?" + ParameterConstants.ECOM_SELECTED_NAVBAR_PAGE + "="
			+ ((int)Litium.Studio.UI.ECommerce.Common.Enums.FilterType.Payments).ToString() + "&"
			+ ParameterConstants.FROM_PAYMENT + "=true&"
			+ ParameterConstants.ECOM_ORDER_ID + "=" + paymentInfo.OrderID + "&"
            + ParameterConstants.ECOM_PAYMENT_INFO_ID + "=" + paymentInfo.ID + "&"
			+ ParameterConstants.QUERY_STRING_NAVIGATE_FROM + "=2");
		}
	}

	/// <summary>
	/// Executes the reserve operation.
	/// </summary>
	/// <param name="paymentInfo">The payment info.</param>
	public void ExecuteReserve(Litium.Foundation.Modules.ECommerce.Payments.PaymentInfo paymentInfo)
	{
		bool isRedirected = false;
		try
		{
			DirectPayPaymentArgs args = new DirectPayPaymentArgs();
			args.PaymentMode = ExecutePaymentMode.Reserve;
            args.UserHostAddress = Request.UserHostAddress;
			paymentInfo.PaymentProvider.ExecutePayment(args, FoundationContext.Token);
		}
		catch (PaymentProviderException) { }

		if (!isRedirected)
		{
			Response.Redirect(UrlConstants.VIEW_PAYMENT + "?" + ParameterConstants.ECOM_SELECTED_NAVBAR_PAGE + "="
			+ ((int)Litium.Studio.UI.ECommerce.Common.Enums.FilterType.Payments).ToString() + "&"
			+ ParameterConstants.FROM_PAYMENT + "=true&"
			+ ParameterConstants.ECOM_ORDER_ID + "=" + paymentInfo.OrderID + "&"
            + ParameterConstants.ECOM_PAYMENT_INFO_ID + "=" + paymentInfo.ID + "&"
			+ ParameterConstants.QUERY_STRING_NAVIGATE_FROM + "=2");
		}
	}

	#endregion
}
