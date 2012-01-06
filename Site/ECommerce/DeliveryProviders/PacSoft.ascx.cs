using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Xml;

using Litium.Foundation.GUI;
using Litium.Foundation.Modules.ECommerce;
using Litium.Foundation.Modules.ECommerce.Orders;
using Litium.Foundation.Modules.ECommerce.Payments;

public partial class LitiumStudio_ECommerce_Panels_PacSoft : UserControl, Litium.Studio.UI.ECommerce.IDeliveryProviderControl
{
	private static readonly string[] PacSoftMethods = new string[] { "P13", "P14", "P15", "P19", "P24", "P25", "P26", "P31", "P32", "P42", "P44", "P50", "P51", "P52", "P52S", "P53", "P54", "P55", "P57", "P59", "P91", "DPD", "EMSD", "EMSP", "BAGR", "PAF", "BEXPD", "BEXPI", "BREV", "BREKD", "BREKI", "PAH", "PAG", "BVAL" };
	private static readonly string[] PacSoftCODMethods = new string[] { "P13", "P14", "P15", "P19", "P25", "P31", "P32", "P52", "P53", "P54", "P55", "P57", "BAGR", "PAF", "BREKD", "BVAL" };
	private static readonly string[] PacSoftSmsMethods = new string[] { "P13", "P19", "P25", "PAF", "BREKD" };

	/// <summary>
	/// Handles the Load event of the Page control.
	/// </summary>
	/// <param name="sender">The source of the event.</param>
	/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
	protected void Page_Load(object sender, EventArgs e)
	{
	}

	/// <summary>
	/// Gets a value indicating whether this control needs interactivity.
	/// </summary>
	/// <value>
	/// 	<c>true</c> if this control needs interactivity; otherwise, <c>false</c>.
	/// </value>
	public bool IsInteractiveMode
	{
		get { return false; }
	}
	/// <summary>
	/// Processes the delivery.
	/// </summary>
	/// <param name="delivery">The delivery.</param>
	public void ProcessDelivery(Litium.Foundation.Modules.ECommerce.Deliveries.Delivery delivery)
	{
		try
		{
			ECommerce.Web.PacSoft.IntegrationService service = new ECommerce.Web.PacSoft.IntegrationService();
			string senderid = System.Web.Configuration.WebConfigurationManager.AppSettings["PacSoftSenderID"];
			string username = System.Web.Configuration.WebConfigurationManager.AppSettings["PacSoftWebUsername"];
			string password = System.Web.Configuration.WebConfigurationManager.AppSettings["PacSoftWebPassword"];
			service.TransferXml(username, password, CreateXml(delivery, senderid));
		}
		catch (System.Net.Sockets.SocketException ex)
		{
			throw new Exception(string.Format(ModuleECommerce.Instance.Strings.GetValue("DeliveryProviderSocketException", FoundationContext.Current.LanguageID, true), delivery.ExternalReferenceID), ex);
		}
		catch (Exception ex)
		{
			if (ex.Message.IndexOf("NotAuthorizedException", StringComparison.InvariantCultureIgnoreCase) != -1)
				throw new Exception(string.Format(ModuleECommerce.Instance.Strings.GetValue("DeliveryProviderNotAuthorizedException", FoundationContext.Current.LanguageID, true), delivery.ExternalReferenceID), ex);

			throw new Exception(string.Format(ModuleECommerce.Instance.Strings.GetValue("DeliveryProviderException", FoundationContext.Current.LanguageID, true), delivery.ExternalReferenceID, ex.Message), ex);
		}
	}
	/// <summary>
	/// Initiate the delivery.
	/// </summary>
	/// <param name="delivery">The delivery.</param>
	public void InitDelivery(Litium.Foundation.Modules.ECommerce.Deliveries.Delivery delivery)
	{
		try
		{
			c_test.Text = Server.HtmlEncode(CreateXml(delivery, string.Empty).OuterXml).Replace("&gt;&lt;", "&gt;<br />&lt;");
		}
		catch (Exception ex)
		{
			c_test.Text = ex.Message + " " + ex.StackTrace;
		}
	}

	/// <summary>
	/// Creates the value.
	/// </summary>
	/// <param name="xDoc">The x doc.</param>
	/// <param name="type">The type.</param>
	/// <param name="value">The value.</param>
	/// <returns></returns>
	private static XmlNode CreateValue(XmlDocument xDoc, string type, string value)
	{
		XmlNode valNode = xDoc.CreateElement("val");
		if (!string.IsNullOrEmpty(value))
			valNode.AppendChild(xDoc.CreateTextNode(value));
		valNode.Attributes.Append(CreateAttribute(xDoc, "n", type));
		return valNode;
	}
	/// <summary>
	/// Creates the attribute.
	/// </summary>
	/// <param name="xDoc">The x doc.</param>
	/// <param name="name">The name.</param>
	/// <param name="value">The value.</param>
	/// <returns></returns>
	private static XmlAttribute CreateAttribute(XmlDocument xDoc, string name, string value)
	{
		XmlAttribute attribute = xDoc.CreateAttribute(name);
		attribute.Value = value;
		return attribute;
	}
	/// <summary>
	/// Creates the XML.
	/// </summary>
	/// <param name="delivery">The delivery.</param>
	/// <param name="sender">Sender shortname in pacsoft web-interface</param>
	/// <returns></returns>
	private static XmlDocument CreateXml(Litium.Foundation.Modules.ECommerce.Deliveries.Delivery delivery, string sender)
	{
		if (!IsPacSoftSupported(delivery.DeliveryMethod.Description, PacSoftMethods))
		{
			throw new NotSupportedException(string.Format("Delivery method {0} not supported by PacSoft.", delivery.DeliveryMethod.Description));
		}

		Order currentOrder = ModuleECommerce.Instance.Orders[delivery.OrderID, FoundationContext.Current.Token];

		XmlDocument xDoc = new XmlDocument();
		xDoc.PreserveWhitespace = true;
		//xml header
		xDoc.AppendChild(xDoc.CreateXmlDeclaration("1.0", "UTF-8", null));

		// pacsoftonline root node
		XmlNode rootNode = xDoc.AppendChild(xDoc.CreateElement("pacsoftonline"));

		// **** meta node
		XmlNode metaNode = rootNode.AppendChild(xDoc.CreateElement("meta"));
		metaNode.AppendChild(CreateValue(xDoc, "printer", "..."));

		// **** receiver node
		Litium.Foundation.Modules.ECommerce.Addresses.Address address = delivery.Address;
		XmlNode receiverNode = rootNode.AppendChild(xDoc.CreateElement("receiver"));
		receiverNode.Attributes.Append(CreateAttribute(xDoc, "rcvid", "R" + delivery.ExternalReferenceID));

		if (string.IsNullOrEmpty(address.OrganizationName))
			receiverNode.AppendChild(CreateValue(xDoc, "name", string.Format("{0} {1}", address.FirstName, address.LastName)));
		else
			receiverNode.AppendChild(CreateValue(xDoc, "name", address.OrganizationName));
		receiverNode.AppendChild(CreateValue(xDoc, "address1", address.Address1));
		if (!string.IsNullOrEmpty(address.Address2))
			receiverNode.AppendChild(CreateValue(xDoc, "address2", address.Address2));
		receiverNode.AppendChild(CreateValue(xDoc, "zipcode", address.Zip));
		receiverNode.AppendChild(CreateValue(xDoc, "city", address.City));
		receiverNode.AppendChild(CreateValue(xDoc, "country", address.Country));
		receiverNode.AppendChild(CreateValue(xDoc, "contact", string.Format("{0} {1}", address.FirstName, address.LastName)));
		if (!string.IsNullOrEmpty(address.Phone))
			receiverNode.AppendChild(CreateValue(xDoc, "phone", address.Phone));
		if (!string.IsNullOrEmpty(address.Fax))
			receiverNode.AppendChild(CreateValue(xDoc, "fax", address.Fax));
		if (!string.IsNullOrEmpty(address.Email))
			receiverNode.AppendChild(CreateValue(xDoc, "email", address.Email));
		if (!string.IsNullOrEmpty(address.MobilePhone))
			receiverNode.AppendChild(CreateValue(xDoc, "sms", address.MobilePhone));

		// **** shipment
		XmlNode shipmentNode = rootNode.AppendChild(xDoc.CreateElement("shipment"));
		shipmentNode.Attributes.Append(CreateAttribute(xDoc, "orderno", delivery.ExternalReferenceID));
		shipmentNode.AppendChild(CreateValue(xDoc, "from", sender));
		shipmentNode.AppendChild(CreateValue(xDoc, "to", "R" + delivery.ExternalReferenceID));
		shipmentNode.AppendChild(CreateValue(xDoc, "reference", delivery.ExternalReferenceID));
		shipmentNode.AppendChild(CreateValue(xDoc, "referencebarcode", delivery.ExternalReferenceID));

		// **** **** service
		XmlElement serviceNode = shipmentNode.AppendChild(xDoc.CreateElement("service")) as XmlElement;
		serviceNode.IsEmpty = false; //to prevent self-closing tag like <service srvid="P45"/>, pacsoft ignore xmlnode in this case
		serviceNode.Attributes.Append(CreateAttribute(xDoc, "srvid", delivery.DeliveryMethod.Description));

		// **** **** **** addon cod
		if (IsPacSoftSupported(delivery.DeliveryMethod.Description, PacSoftCODMethods))
		{
			if (IsCodPayment(currentOrder))
			{
				string codAccount = System.Web.Configuration.WebConfigurationManager.AppSettings["PacSoftCodAccount"];
				string codCustno = System.Web.Configuration.WebConfigurationManager.AppSettings["PacSoftCodCustno"];

				XmlNode addonCodNode = serviceNode.AppendChild(xDoc.CreateElement("addon"));
				addonCodNode.Attributes.Append(CreateAttribute(xDoc, "adnid", "cod"));
				addonCodNode.AppendChild(CreateValue(xDoc, "amount", currentOrder.GrandTotal.ToString("0.00")));
				addonCodNode.AppendChild(CreateValue(xDoc, "account", codAccount));
				addonCodNode.AppendChild(CreateValue(xDoc, "custno", codCustno));
				addonCodNode.AppendChild(CreateValue(xDoc, "reference", delivery.ExternalReferenceID));

				// <addon adnid="cod">
				//		<val n="amount">1200.00</val>
				//		<val n="account">488817-8</val>  TODO: What need to sent there?
				//		<val n="custno">122343500</val>  TODO: What need to sent there?
				//		<val n="reference">Betalreferens</val>
				// </addon>
			}
		}

		// **** **** **** addon notsms
		if (IsPacSoftSupported(delivery.DeliveryMethod.Description, PacSoftSmsMethods) && !string.IsNullOrEmpty(address.MobilePhone))
		{
			XmlNode addonSmsNode = serviceNode.AppendChild(xDoc.CreateElement("addon"));
			addonSmsNode.Attributes.Append(CreateAttribute(xDoc, "adnid", "notsms"));
			addonSmsNode.AppendChild(CreateValue(xDoc, "misc", address.MobilePhone));
		}

		// **** **** uf online
		string enotMessage = ModuleECommerce.Instance.Strings.GetValue("PacSoftMessage", FoundationContext.Current.LanguageID, true);
		if (!string.IsNullOrEmpty(enotMessage) && !string.IsNullOrEmpty(address.Email))
		{
			XmlNode ufoNode = shipmentNode.AppendChild(xDoc.CreateElement("ufonline"));
			XmlNode optionNode = ufoNode.AppendChild(xDoc.CreateElement("option"));
			optionNode.Attributes.Append(CreateAttribute(xDoc, "optid", "enot"));
			optionNode.AppendChild(CreateValue(xDoc, "message", enotMessage.Replace("\n", "&#x0A")));
			optionNode.AppendChild(CreateValue(xDoc, "to", address.Email));
		}

		// **** **** container
		XmlNode containerNode = shipmentNode.AppendChild(xDoc.CreateElement("container"));
		containerNode.Attributes.Append(CreateAttribute(xDoc, "type", "parcel"));
		containerNode.AppendChild(CreateValue(xDoc, "copies", "1"));

		return xDoc;
	}
	/// <summary>
	/// Check if delivery method supported by PacSoft
	/// </summary>
	/// <param name="order">The delivery name (description)</param>
	/// <returns></returns>
	private static bool IsCodPayment(Order order)
	{
		foreach (PaymentInfo paymentInfo in order.PaymentInfo)
		{
			if (paymentInfo.PaymentProviderName.Equals("DirectPay", StringComparison.InvariantCultureIgnoreCase))
				if (paymentInfo.PaymentMethod.Equals("1", StringComparison.InvariantCultureIgnoreCase))
					return true;
		}
		return false;
	}
	/// <summary>
	/// Check if delivery method is in list of supported by PacSoft
	/// </summary>
	/// <param name="deliveryMethodName">The delivery name (description)</param>
	/// <param name="pacSoftSupported">List of supported methods</param>
	/// <returns></returns>
	private static bool IsPacSoftSupported(string deliveryMethodName, ICollection<string> pacSoftSupported)
	{
		foreach (string item in pacSoftSupported)
		{
			if (deliveryMethodName.Equals(item, StringComparison.InvariantCultureIgnoreCase)) return true;
		}
		return false;
	}
}