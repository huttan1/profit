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
using Litium.Studio.Plugins.ECommerce.PaymentProviders.Kreditor;
using Litium.Foundation.Modules.ECommerce.Plugins.Interfaces;
using System.Web.Services;
using System.Web.Script.Services;
using System.Text;
using Litium.Foundation.Modules.ECommerce.Plugins;
using Litium.Foundation;
using Litium.Studio.UI.ECommerce;
using Litium.Foundation.Modules.ECommerce.Payments;
using Litium.Foundation.Modules.ECommerce.Plugins.Utilities;

public partial class LitiumStudio_ECommerce_Panels_KreditorDialog :
	Litium.Studio.UI.ECommerce.Common.UserBaseControl,
	Litium.Studio.UI.ECommerce.IPaymentProviderPanel
{
	Litium.Foundation.Modules.ViewStateProperty<Guid> m_orderID;
	Litium.Foundation.Modules.ViewStateProperty<Guid> m_paymentInfoID;
	Litium.Foundation.Modules.ViewStateProperty<ExecutePaymentMode> m_paymentMode;

	public LitiumStudio_ECommerce_Panels_KreditorDialog()
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
				this.FoundationContext.LanguageID, true);
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
				this.FoundationContext.LanguageID, true);
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
		FillCountriesDropdown();
		InitializeErrorMessage();
		DynamicHolderUpdater.Update();
	}

	/// <summary>
	/// Handles the Click event of the c_buttonGetAddressFromPersonNumber control.
	/// </summary>
	/// <param name="sender">The source of the event.</param>
	/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
	protected void c_buttonGetAddressFromPersonNumber_Click(object sender, EventArgs e)
	{
		if (Request[ParameterConstants.ECOM_ORDER_ID] != null)
		{
			string orderIdValue = Request[ParameterConstants.ECOM_ORDER_ID].ToString();
			Guid orderId = new Guid(orderIdValue);

			try
			{
				IPaymentProvider iPaymentProvider = ModuleECommerce.Instance.Orders.GetOrder(
					orderId, FoundationContext.Token).PaymentInfo[0].PaymentProvider;

				KreditorProvider kreditorProvider = (KreditorProvider)iPaymentProvider;

				Litium.Foundation.Modules.ECommerce.Carriers.AddressCarrier[] addressCarrier
					= kreditorProvider.GetAddresses(this.c_textboxSSN.Text, this.c_dropDownListCountries.SelectedValue);

				if (addressCarrier.Length > 0)
				{
					c_labelBillingFirstName.Text = addressCarrier[0].FirstName;
					c_labelBillingLastName.Text = addressCarrier[0].LastName;
					c_labelBillingAddressRow1.Text = addressCarrier[0].Address1;
					c_labelBillingAddressRow2.Text = addressCarrier[0].Address2;
					c_labelBillingZip.Text = addressCarrier[0].Zip;
					c_labelBillingCity.Text = addressCarrier[0].City;
					c_labelBillingCountry.Text = Litium.Studio.UI.ECommerce.Common.Countries.GetCountryNameByKey(addressCarrier[0].Country);
                    c_hiddenFieldBillingCountryTwoLetterISORegionName.Value = addressCarrier[0].Country;
					c_labelBillingPhone.Text = addressCarrier[0].Phone;
				}
			}
			catch (PaymentProviderException ex)
			{
				Solution.Instance.Log.CreateLogEntry(ex.ProviderName + "_Error", ex, Litium.Foundation.Log.LogLevels.FATAL);
			}
		}
		else if (m_orderID != null && m_paymentInfoID != null)
		{
			Order order = ModuleECommerce.Instance.Orders.GetOrder(m_orderID.Value, FoundationContext.Token);
			PaymentInfo paymentInfo = order.PaymentInfo[m_paymentInfoID.Value];

			IPaymentProvider iPaymentProvider = paymentInfo.PaymentProvider;
			KreditorProvider kreditorProvider = (KreditorProvider)iPaymentProvider;

			Litium.Foundation.Modules.ECommerce.Carriers.AddressCarrier[] addressCarrier
				= kreditorProvider.GetAddresses(this.c_textboxSSN.Text, this.c_dropDownListCountries.SelectedValue);

			if (addressCarrier.Length > 0)
			{
				c_labelBillingAddressRow1.Text = addressCarrier[0].Address1;
				c_labelBillingAddressRow2.Text = addressCarrier[0].Address2;
				c_labelBillingZip.Text = addressCarrier[0].Zip;
				c_labelBillingCity.Text = addressCarrier[0].City;
				c_labelBillingCountry.Text = Litium.Studio.UI.ECommerce.Common.Countries.GetCountryNameByKey(addressCarrier[0].Country);
                c_hiddenFieldBillingCountryTwoLetterISORegionName.Value = addressCarrier[0].Country;
				c_labelBillingPhone.Text = addressCarrier[0].Phone;
			}
		}
		KreditorDialog.Visible = true;
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
					InitAddress(order, order.PaymentInfo[0]);
			}
		}
	}

	#endregion Public Methods

	#region Private Methods

	/// <summary>
	/// Initializes the error messages for missing required fields. 
	/// SSN and mobile number are required fields for Kreditor.
	/// </summary>
	private void InitializeErrorMessage()
	{
		string requiredMessage =
			"<br /><img src=\"Images/transparent.gif\" style=\"vertical-align:middle;\" " +
			"alt=\"\" class=\"litIconError\"/>" +
			SystemStrings.GetValue(SystemStringConstants.VALIDATION_MESSAGE_REQUIRED_FIELD,
			FoundationContext.LanguageID, true);
		c_requiredFieldValidatorSSN.Text = requiredMessage;
		c_requiredFieldValidatorBillingMobile.Text = requiredMessage;
	}


	/// <summary>
	/// Inits the controls.
	/// </summary>
	private void InitControls()
	{
		c_informationGroupBilling.HeaderText = ModuleECommerce.Instance.Strings.GetValue(
			Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.BILLING_ADDRESS,
			this.FoundationContext.LanguageID, true);
		c_informationGroupDelivery.HeaderText = ModuleECommerce.Instance.Strings.GetValue(
			Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.DELIVERY_ADDRESS,
			this.FoundationContext.LanguageID, true);
		c_informationGroupKreditorInformation.HeaderText = ModuleECommerce.Instance.Strings.GetValue(
			Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.KREDITOR_INFORMATION,
			this.FoundationContext.LanguageID, true);
		c_informationGroupPayment.HeaderText = ModuleECommerce.Instance.Strings.GetValue(
			Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.PAYMENT_INFO,
			this.FoundationContext.LanguageID, true);

		c_buttonGetAddressFromPersonNumber.Text = ModuleECommerce.Instance.Strings.GetValue(
			Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.GET_ADDRESS_FROM_PERSON_NUMBER,
			this.FoundationContext.LanguageID, true);
		c_buttonCancel.Text = ModuleECommerce.Instance.Strings.GetValue(
			Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.CANCEL,
			this.FoundationContext.LanguageID, true);

		c_commit.Text = (m_paymentMode.HasValue && m_paymentMode.Value == ExecutePaymentMode.Reserve) ? ReserveTranslation : ChargeTranslation;
	}

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
			c_labelDeliveryMobile.Text = order.Deliveries[0].Address.MobilePhone;
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
            c_hiddenFieldBillingCountryTwoLetterISORegionName.Value = order.PaymentInfo[0].BillingAddress.Country;

			c_labelBillingPhone.Text = paymentInfo.BillingAddress.Phone;
			c_textboxBillingMobile.Text = paymentInfo.BillingAddress.MobilePhone;

			// Fill Payment Data
			c_labelAmount.Text = paymentInfo.TotalAmountWithVAT.ToString(ParameterConstants.DECIMAL_FORMAT_STRING);

            if (paymentInfo.TotalAmountWithVAT <= 6000)
				tableRowAnnualSalary.Style.Add("display", "none");
			else
				tableRowAnnualSalary.Style.Add("display", "inline");
		}
	}

	/// <summary>
	/// Fills the countries dropdown.
	/// </summary>
	private void FillCountriesDropdown()
	{
		c_dropDownListCountries.Items.Clear();
		c_dropDownListCountries.Items.Add(new ListItem("Sweden", "SE"));
		c_dropDownListCountries.Items.Add(new ListItem("Denmark", "DK"));
		c_dropDownListCountries.Items.Add(new ListItem("Norway", "NO"));
	}

	#endregion Private Methods

	protected void Close(object sender, EventArgs e)
	{
		KreditorDialog.Visible = false;
	}

	protected void Commit(object sender, EventArgs e)
	{
		if (m_orderID != null && m_paymentInfoID != null)
		{
			Order order = ModuleECommerce.Instance.Orders.GetOrder(m_orderID.Value, FoundationContext.Token);
			PaymentInfo paymentInfo = order.PaymentInfo[m_paymentInfoID.Value];
			IPaymentProvider iPaymentProvider = paymentInfo.PaymentProvider;

			paymentInfo.BillingAddress.SetValues(c_labelBillingAddressRow1.Text,
				c_labelBillingAddressRow2.Text,
				c_labelBillingCity.Text,
                c_hiddenFieldBillingCountryTwoLetterISORegionName.Value.ToString(),
				paymentInfo.BillingAddress.State,
				c_labelBillingZip.Text,
				FoundationContext.Token);
			paymentInfo.BillingAddress.SetMobilePhone(c_textboxBillingMobile.Text, FoundationContext.Token);

			int campaignCode = -1;
            if(!string.IsNullOrEmpty(c_textboxCampeignCode.Text))
			    int.TryParse(c_textboxCampeignCode.Text, out campaignCode);
			double annualIncome = 0;

			KreditorPaymentArgs args = new KreditorPaymentArgs(c_textboxSSN.Text, annualIncome, campaignCode);
			args.PaymentMode = m_paymentMode.HasValue ? m_paymentMode.Value : ExecutePaymentMode.Charge;
            args.UserHostAddress = Request.UserHostAddress;

			try
			{
				KreditorPaymentResult result = (KreditorPaymentResult)iPaymentProvider.ExecutePayment(args, FoundationContext.Token);
			}
			catch (PaymentProviderException) 
            {   
                //do nothing, as message is shown to user.
            }

			Response.Redirect(UrlConstants.VIEW_PAYMENT + "?" + ParameterConstants.ECOM_SELECTED_NAVBAR_PAGE + "="
				+ ((int)Litium.Studio.UI.ECommerce.Common.Enums.FilterType.Payments).ToString() + "&"
				+ ParameterConstants.FROM_PAYMENT + "=true&"
				+ ParameterConstants.ECOM_ORDER_ID + "=" + m_orderID.Value + "&"
                + ParameterConstants.ECOM_PAYMENT_INFO_ID + "=" + paymentInfo.ID + "&"
				+ ParameterConstants.QUERY_STRING_NAVIGATE_FROM + "=2");
		}
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
            m_orderID.Value = paymentInfo.OrderID;
            m_paymentInfoID.Value = paymentInfo.ID;
            m_paymentMode.Value = ExecutePaymentMode.Charge;

            c_commit.Text = ChargeTranslation;

            InitAddress(paymentInfo.Order, paymentInfo);
            c_textboxSSN.Text = string.Empty;

            if (paymentInfo.PaymentProvider.CanCompleteCurrentTransaction)
            {
                KreditorProvider kreditorProvider = (KreditorProvider)paymentInfo.PaymentProvider;
                kreditorProvider.CompleteTransaction(FoundationContext.Token);
                Response.Redirect(UrlConstants.VIEW_PAYMENT + "?" + ParameterConstants.ECOM_SELECTED_NAVBAR_PAGE + "="
                + ((int)Litium.Studio.UI.ECommerce.Common.Enums.FilterType.Payments).ToString() + "&"
                + ParameterConstants.FROM_PAYMENT + "=true&"
                + ParameterConstants.ECOM_ORDER_ID + "=" + m_orderID.Value + "&"
                + ParameterConstants.ECOM_PAYMENT_INFO_ID + "=" + paymentInfo.ID + "&"
                + ParameterConstants.QUERY_STRING_NAVIGATE_FROM + "=2");

            }
            else
                KreditorDialog.Visible = true;
        }
        catch (PaymentProviderException)
        {
            Response.Redirect(UrlConstants.VIEW_PAYMENT + "?" + ParameterConstants.ECOM_SELECTED_NAVBAR_PAGE + "="
               + ((int)Litium.Studio.UI.ECommerce.Common.Enums.FilterType.Payments).ToString() + "&"
               + ParameterConstants.FROM_PAYMENT + "=true&"
               + ParameterConstants.ECOM_ORDER_ID + "=" + m_orderID.Value + "&"
               + ParameterConstants.ECOM_PAYMENT_INFO_ID + "=" + paymentInfo.ID + "&"
               + ParameterConstants.QUERY_STRING_NAVIGATE_FROM + "=2");
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
		KreditorDialog.Visible = true;
	}

	#endregion 
}
