#region Imports

using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Litium.Studio.Plugins.ECommerce.PaymentProviders.PayPal;
using CMS.PageTypes.CheckOut.Constants;
using Litium.Studio.UI.ECommerce.Common.Constants;
using Litium.Foundation.Modules.ECommerce.Plugins;
using Litium.Foundation.Modules.ECommerce.Payments;
using Litium.Studio.UI.ECommerce.Common;
using Litium.Studio.UI.ECommerce;

#endregion Imports

/// <summary>
/// modules_ E commerce_ panels_ pay pal dialog
/// </summary>
public partial class LitiumStudio_ECommerce_Panels_PayPalDialog :
    UserBaseControl,
    IPaymentProviderPanel
{

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
                PayPalCompletePaymentArgs completePaymentArgs = 
                    new PayPalCompletePaymentArgs(
                        CompleteType.Complete,
                        paymentInfo.TotalAmountWithVAT,
                        paymentInfo.Order.Currency.CurrencyCode,
                        paymentInfo.Order.ExternalOrderID,
                        string.Empty);
                paymentInfo.PaymentProvider.CompletePayment(completePaymentArgs, FoundationContext.Token);
                //redirect to view payment.
                Response.Redirect(UrlConstants.VIEW_PAYMENT + "?" + ParameterConstants.ECOM_SELECTED_NAVBAR_PAGE + "="
                + ((int)Enums.FilterType.Payments).ToString() + "&"
                + ParameterConstants.FROM_PAYMENT + "=true&"
                + ParameterConstants.ECOM_ORDER_ID + "=" + paymentInfo.OrderID + "&"
                + ParameterConstants.ECOM_PAYMENT_INFO_ID + "=" + paymentInfo.ID + "&"
                + ParameterConstants.QUERY_STRING_NAVIGATE_FROM + "=2");
            }
            else
            {
                PayPalExecutePaymentArgs args = new PayPalExecutePaymentArgs(UrlConstants.PAYMENT_SUCCESS, UrlConstants.PAYMENT_CANCEL, FoundationContext.Culture.Name);
                args.PaymentMode = ExecutePaymentMode.Charge;
                args.UserHostAddress = Request.UserHostAddress;
                //add redirect script on success.
                args.ExecuteScript = new PayPalExecutePaymentArgs.ExecuteScriptHandler(delegate(string scriptArgs, bool redirect) { if (redirect) Response.Redirect(scriptArgs, true); });
                PayPalExecutePaymentResult result = (PayPalExecutePaymentResult)paymentInfo.PaymentProvider.ExecutePayment(args, FoundationContext.Token);
                if (!result.Success)
                {
                    Response.Redirect(UrlConstants.VIEW_PAYMENT + "?" + ParameterConstants.ECOM_SELECTED_NAVBAR_PAGE + "="
                    + ((int)Litium.Studio.UI.ECommerce.Common.Enums.FilterType.Payments).ToString() + "&"
                    + ParameterConstants.FROM_PAYMENT + "=true&"
                    + ParameterConstants.ECOM_ORDER_ID + "=" + paymentInfo.OrderID + "&"
                    + ParameterConstants.ECOM_PAYMENT_INFO_ID + "=" + paymentInfo.ID + "&"
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
    public void ExecuteReserve(PaymentInfo paymentInfo)
    {
        try
        {
            PayPalExecutePaymentArgs args = new PayPalExecutePaymentArgs(UrlConstants.PAYMENT_SUCCESS, UrlConstants.PAYMENT_CANCEL, FoundationContext.Culture.Name);
            args.PaymentMode = ExecutePaymentMode.Reserve;
            args.UserHostAddress = Request.UserHostAddress;
            args.ExecuteScript = new PayPalExecutePaymentArgs.ExecuteScriptHandler(delegate(string scriptArgs, bool redirect) { if (redirect) Response.Redirect(scriptArgs, true);});
            PayPalExecutePaymentResult result = (PayPalExecutePaymentResult)paymentInfo.PaymentProvider.ExecutePayment(args, FoundationContext.Token);
            if (!result.Success)
            {
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

}
