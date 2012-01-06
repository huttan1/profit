using System;

namespace CMS.PageTypes.CheckOut.Constants
{
	/// <summary>
	/// Check Out String Constants.
	/// </summary>
	public class CheckOutStringConstants
	{
		// Web site strings
		public const string STRING_BACK = "CheckOutBack";
		public const string STRING_NEXT = "CheckOutNext";
		public const string STRING_CANCEL = "CheckOutCancel";
		public const string STRING_CONFIRM = "CheckOutConfirm";
		public const string STRING_PAYMENT_UNSUCCESSFUL = "CheckOutPayUnsuccessful";
		public const string STRING_PAYMENT_REDIRECTING = "CheckOutRedirecting";
        public const string STRING_EXTERNAL_MESSAGE = "CheckOutExternalMessage";
        // Properties
		public const string CONSUMER_POLICY_TEXT = "Text2";
		public const string CONSUMER_POLICY_URL = "ConsumerPolicyURL";
		public const string PAYMENT_PROVIDER = "PaymentProvider";
		public const string PAYMENT_STYLE = "PaymentStyle";

		// General Constants
		public const string QUERY_STRING_STEP = "CheckOutStep";
		public const string QUERY_STRING_TOKEN = "CheckOutToken";
		public const string SESSION_SUCCESS_TOKEN = "CheckOutSuccessToken";
		public const string GATEWAY_PUBLIC_IP = "GatewayPublicIP";
        public const string FROM_PROVIDER_CALLBACK = "FromProviderCallback";
	}
}
