using System;
using System.Collections.Generic;
using System.Web;
using Litium.Foundation.Modules.ECommerce.Plugins.Interfaces;
using Litium.Studio.Plugins.ECommerce.PaymentProviders.Dibs;
using Litium.Foundation.Modules.ECommerce.Plugins;
using Litium.Studio.Plugins.ECommerce.PricingRulesPlugin.CheckoutFlow;
using Litium.Foundation.Modules.CMS;

namespace CMS.PageTypes.CheckOut
{
    /// <summary>
    /// Summary description for DibsPaymentArgsCreator
    /// </summary>
    public class DibsPaymentArgsCreator : IPaymentArgsCreator
    {

        #region IPaymentArgsCreator Members

        /// <summary>
        /// Gets the name of the payment provider to which this Payment Args factory supports creationg payment args.
        /// </summary>
        /// <value>The name of the payment provider.</value>
        public Type PaymentProviderType
        {
            get { return typeof(DibsProvider); }
        }

        /// <summary>
        /// Creates the payment args.
        /// </summary>
        /// <param name="checkoutFlowInfo">The checkout flow info.</param>
        /// <returns>Instance of <see cref="ExecutePaymentArgs"/> if checkout info can be 
        /// converted to <see cref="ExtendedCheckoutFlowInfo"/> else a null reference.</returns>
        public virtual ExecutePaymentArgs CreatePaymentArgs(CheckoutFlowInfo checkoutFlowInfo)
        {
            DibsPaymentArgs args = new DibsPaymentArgs();
            ExtendedCheckoutFlowInfo info = checkoutFlowInfo as ExtendedCheckoutFlowInfo;
            if (info != null)
            {
                args.CancelUrl = info.CancelUrl;
                args.ResponseUrl = info.ResponseUrl;
                args.PersonNumber = info.CustomerSsn;
                args.ClientLanguage = CurrentState.Current.WebSite.Culture.Name;
                args.ExecuteScript = new DibsPaymentArgs.ExecuteScriptHandler(info.ExecuteScript);

                //store end-users IP address
                HttpContext currentContext = HttpContext.Current;
                if (currentContext != null && currentContext.Request != null)
                    args.UserHostAddress = HttpContext.Current.Request.UserHostAddress;

                //set the payment mode if its being set, otherwise leave it at its default value.
                if (checkoutFlowInfo.ExecutePaymentMode != ExecutePaymentMode.Unset)
                    args.PaymentMode = checkoutFlowInfo.ExecutePaymentMode;
            }
            return args;
        }

        #endregion
    }
}
