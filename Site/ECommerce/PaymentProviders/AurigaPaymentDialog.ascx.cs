#region Imports

using System;
using System.Collections;

using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Litium.Foundation.Modules.ECommerce;
using Litium.Foundation.Modules.ECommerce.Orders;
using Litium.Studio.UI.ECommerce.Common.Constants;
using Litium.Foundation.Modules.ECommerce.Plugins.Interfaces;
using System.Web.Services;
using System.Web.Script.Services;
using System.Text;
using Litium.Foundation.Modules.ECommerce.Plugins;
using Litium.Foundation;
using Litium.Studio.UI.ECommerce;
using Litium.Foundation.Modules.ECommerce.Payments;
using Litium.Studio.Plugins.ECommerce.PaymentProviders.Auriga;
using Litium.Foundation.Modules.ECommerce.Plugins.Utilities;

#endregion Imports

public partial class LitiumStudio_ECommerce_Panels_AurigaDialog :
	Litium.Studio.UI.ECommerce.Common.UserBaseControl,
	Litium.Studio.UI.ECommerce.IPaymentProviderPanel
{
	Litium.Foundation.Modules.ViewStateProperty<Guid> m_orderID;
	Litium.Foundation.Modules.ViewStateProperty<Guid> m_paymentInfoID;
	Litium.Foundation.Modules.ViewStateProperty<ExecutePaymentMode> m_paymentMode;

	#region Constants

	private const string OUTPUT_STRING_SEPERATOR = "|";

	#endregion Constants

	public LitiumStudio_ECommerce_Panels_AurigaDialog()
	{
		m_orderID = new Litium.Foundation.Modules.ViewStateProperty<Guid>("OrderID", ViewState);
		m_paymentInfoID = new Litium.Foundation.Modules.ViewStateProperty<Guid>("PaymentInfoID", ViewState);
		m_paymentMode = new Litium.Foundation.Modules.ViewStateProperty<ExecutePaymentMode>("PaymentMode", ViewState);
	}


	#region Properties

	/// <summary>
	/// Gets the ttranslation for charge.
	/// </summary>
	/// <value>The charge translation.</value>
	public string ChargeTranslation
	{
		get
		{
			return ModuleECommerce.Instance.Strings.GetValue(
				Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.CHARGE,
				this.FoundationContext.Language.ID, true);
		}
	}

	/// <summary>
	/// Gets the translation for reserve.
	/// </summary>
	/// <value>The reserve translation.</value>
	public string ReserveTranslation
	{
		get
		{
			return ModuleECommerce.Instance.Strings.GetValue(
				Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.RESERVE,
				this.FoundationContext.Language.ID, true);
		}
	}

	#endregion Properties

	#region Event Handlers

	/// <summary>
	/// Page load.
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	protected override void Page_Load(object sender, EventArgs e)
	{
		base.Page_Load(sender, e);
		DataBindPage();
		InitControls();
		DynamicHolderUpdater.Update();
	}

	#endregion Event Handlers

	#region Public Methods

	/// <summary>
	/// Data binds the page.
	/// </summary>
	public void DataBindPage()
	{
		if (Request[ParameterConstants.ECOM_ORDER_ID] != null)
		{
			string orderIdValue = Request[ParameterConstants.ECOM_ORDER_ID].ToString();

			if (!string.IsNullOrEmpty(orderIdValue))
			{
				Guid orderId = new Guid(orderIdValue);
				Order order = ModuleECommerce.Instance.Orders.GetOrder(orderId, FoundationContext.Token);
				if (order != null)
				{
					InitAddress(order, order.PaymentInfo[0]);
				}
			}
		}
	}

	#endregion Public Methods

	#region Private Methods

	private void InitAddress(Order order, PaymentInfo paymentInfo)
	{
		// Fill Delivery Data
		if (order.Deliveries[0] != null)
		{
			c_labelDeliveryFirstName.Text = order.Deliveries[0].Address.FirstName;
			c_labelDeliveryLastName.Text = order.Deliveries[0].Address.LastName;
			c_labelDeliveryAddressRow1.Text = order.Deliveries[0].Address.Address1;
			c_labelDeliveryAddressRow2.Text = order.Deliveries[0].Address.Address2;
			c_labelDeliveryZip.Text = order.Deliveries[0].Address.Zip;
			c_labelDeliveryCity.Text = order.Deliveries[0].Address.City;
			c_labelDeliveryCountry.Text = Litium.Studio.UI.ECommerce.Common.Countries.
				GetCountryNameByKey(order.Deliveries[0].Address.Country);
			c_labelDeliveryPhone.Text = order.Deliveries[0].Address.Phone;
		}
		if (paymentInfo != null)
		{
			c_labelBillingFirstName.Text = paymentInfo.BillingAddress.FirstName;
			c_labelBillingLastName.Text = paymentInfo.BillingAddress.LastName;
			c_labelBillingAddressRow1.Text = paymentInfo.BillingAddress.Address1;
			c_labelBillingAddressRow2.Text = paymentInfo.BillingAddress.Address2;
			c_labelBillingZip.Text = paymentInfo.BillingAddress.Zip;
			c_labelBillingCity.Text = paymentInfo.BillingAddress.City;
			c_labelBillingCountry.Text = Litium.Studio.UI.ECommerce.Common.Countries.GetCountryNameByKey(order.PaymentInfo[0].BillingAddress.Country);
			c_labelBillingPhone.Text = paymentInfo.BillingAddress.Phone;

			// Fill Payment Data
            c_labelAmount.Text = paymentInfo.TotalAmountWithVAT.ToString(ParameterConstants.DECIMAL_FORMAT_STRING);
			c_commit.Text = (m_paymentMode.HasValue && m_paymentMode.Value == ExecutePaymentMode.Reserve) ? ReserveTranslation : ChargeTranslation;
		}
	}


	/// <summary>
	/// Inits the controls.
	/// </summary>
	private void InitControls()
	{
		c_informationGroupBilling.HeaderText = ModuleECommerce.Instance.Strings.GetValue(
			Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.BILLING_ADDRESS,
			this.FoundationContext.Language.ID, true);
		c_informationGroupDelivery.HeaderText = ModuleECommerce.Instance.Strings.GetValue(
			Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.DELIVERY_ADDRESS,
			this.FoundationContext.Language.ID, true);
		c_informationGroupAurigaInformation.HeaderText = ModuleECommerce.Instance.Strings.GetValue(
			Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.AURIGA_INFORMATION,
			this.FoundationContext.Language.ID, true);
		c_informationGroupPayment.HeaderText = ModuleECommerce.Instance.Strings.GetValue(
			Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.PAYMENT_INFO,
			this.FoundationContext.Language.ID, true);

		c_buttonCancel.Text = ModuleECommerce.Instance.Strings.GetValue(
			Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.CANCEL,
			this.FoundationContext.Language.ID, true);
	}

	#endregion Private Methods

	protected void Close(object sender, EventArgs e)
	{
		AurigaDialog.Visible = false;
	}

	protected void Complete(object sender, EventArgs e)
	{
		if (m_orderID != null && m_paymentInfoID != null)
		{
			Order order = ModuleECommerce.Instance.Orders.GetOrder(m_orderID.Value, FoundationContext.Token);
			PaymentInfo paymentInfo = order.PaymentInfo[m_paymentInfoID.Value];
			IPaymentProvider iPaymentProvider = paymentInfo.PaymentProvider;

            AurigaPaymentArgs args = new AurigaPaymentArgs(c_textboxSSN.Text, UrlConstants.PAYMENT_SUCCESS, UrlConstants.PAYMENT_CANCEL, FoundationContext.Culture.Name);
			args.PaymentMode = m_paymentMode.HasValue ? m_paymentMode.Value : ExecutePaymentMode.Charge;
            args.UserHostAddress = Request.UserHostAddress;
            args.ExecuteScript = new AurigaPaymentArgs.ExecuteScriptHandler(ExecuteScript);

			AurigaPaymentResult result = (AurigaPaymentResult)iPaymentProvider.ExecutePayment(args, FoundationContext.Token);
            if (!result.Success)
            {
                Response.Redirect(UrlConstants.VIEW_PAYMENT + "?" + ParameterConstants.ECOM_SELECTED_NAVBAR_PAGE + "="
                    + ((int)Litium.Studio.UI.ECommerce.Common.Enums.FilterType.Payments).ToString() + "&"
                    + ParameterConstants.FROM_PAYMENT + "=true&"
                    + ParameterConstants.ECOM_ORDER_ID + "=" + m_orderID.Value + "&"
                    + ParameterConstants.ECOM_PAYMENT_INFO_ID + "=" + paymentInfo.ID + "&"
                    + ParameterConstants.QUERY_STRING_NAVIGATE_FROM + "=2");
            }
		}
	}
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


	#region IPaymentProviderPanel Members

	/// <summary>
	/// Executes the charge operation.
	/// </summary>
	/// <param name="paymentInfo">The payment info.</param>
	public void ExecuteCharge(PaymentInfo paymentInfo)
	{
		m_orderID.Value = paymentInfo.OrderID;
		m_paymentInfoID.Value = paymentInfo.ID;
		m_paymentMode.Value = ExecutePaymentMode.Charge;

		c_commit.Text = ChargeTranslation;

		InitAddress(paymentInfo.Order, paymentInfo);
		c_textboxSSN.Text = string.Empty;

		if (paymentInfo.PaymentProvider.CanCompleteCurrentTransaction)
		{
			AurigaCompletePaymentResult result = (AurigaCompletePaymentResult)paymentInfo.PaymentProvider.CompletePayment(new AurigaCompletePaymentArgs(), FoundationContext.Token);
			Response.Redirect(UrlConstants.VIEW_PAYMENT + "?" + ParameterConstants.ECOM_SELECTED_NAVBAR_PAGE + "="
				+ ((int)Litium.Studio.UI.ECommerce.Common.Enums.FilterType.Payments).ToString() + "&"
				+ ParameterConstants.FROM_PAYMENT + "=true&"
				+ ParameterConstants.ECOM_ORDER_ID + "=" + m_orderID.Value + "&"
                + ParameterConstants.ECOM_PAYMENT_INFO_ID + "=" + paymentInfo.ID + "&"
				+ ParameterConstants.QUERY_STRING_NAVIGATE_FROM + "=2");

		}
		else
		{
            PaymentMethod paymentMethod = (PaymentMethod) Enum.Parse(typeof (PaymentMethod), paymentInfo.PaymentMethod);
            if (paymentMethod == PaymentMethod.KLARNASE || paymentMethod == PaymentMethod.SVEAWPSE || paymentMethod == PaymentMethod.SHBPFINFA)
            {
                AurigaDialog.Visible = true;
            }
            else
            {
                Complete(this, null);
            }
		}
	}



	/// <summary>
	/// Executes the reserve operation.
	/// </summary>
	/// <param name="paymentInfo">The payment info.</param>
	public void ExecuteReserve(PaymentInfo paymentInfo)
	{
		m_orderID.Value = paymentInfo.OrderID;
		m_paymentInfoID.Value = paymentInfo.ID;
		m_paymentMode.Value = ExecutePaymentMode.Reserve;

		c_commit.Text = ReserveTranslation;

		InitAddress(paymentInfo.Order, paymentInfo);
		c_textboxSSN.Text = string.Empty;

        PaymentMethod paymentMethod = (PaymentMethod)Enum.Parse(typeof(PaymentMethod), paymentInfo.PaymentMethod); ;

        if (paymentMethod == PaymentMethod.KLARNASE || paymentMethod == PaymentMethod.SVEAWPSE || paymentMethod == PaymentMethod.SHBPFINFA)
        {
            AurigaDialog.Visible = true;
        }
        else
        {
            Complete(this, null);
        }
	}

	#endregion 
}
