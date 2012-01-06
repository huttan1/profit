using System;

namespace ECommerce.PageTypes.CheckOut.Utilities
{
	/// <summary>
	/// Enumeration to handle various steps in check out sequence
	/// </summary>
	[Obsolete ("Moved, use CMS.PageTypes.CheckOut.Utilites.CheckOutStep instead.", false)] //44SP3
	public enum CheckOutStep
	{
		/// <summary>
		/// Step 1
		/// </summary>
		CustomerAccount = 1,
		/// <summary>
		/// Step 2
		/// </summary>
		OrderConfirmation = 2,
		/// <summary>
		/// Step 3
		/// </summary>
		OrderPayment = 3,
		/// <summary>
		/// Step 4
		/// </summary>
		OrderReceipt = 4
	}
}
