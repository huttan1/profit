using System;

namespace ECommerce.PageTypes.CheckOut.Utilities
{
	/// <summary>
	/// Interface for providing check out page related functionality.
	/// </summary>
	[Obsolete("Use CMS.PageTypes.CheckOut.Common.ICheckOutPage instead.", false)] // 44SP3
	public interface ICheckOutPage : CMS.PageTypes.CheckOut.Common.ICheckOutPage
	{
		/// <summary>
		/// Gets a value indicating whether this instance is payment style reserve.
		/// </summary>
		/// <value>
		/// 	<c>true</c> if this instance is payment style reserve; otherwise, <c>false</c>.
		/// </value>
		[Obsolete("Is not used any more.", false)] //44SP3
		bool IsPaymentStyleReserve { get; }

		/// <summary>
		/// Hides the empty controls.
		/// </summary>
		[Obsolete("Is not used any more.", false)] //44SP3
		void HideEmptyControls();
	}
}
