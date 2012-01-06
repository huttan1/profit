using System;

namespace ECommerce.PageTypes.CheckOut.Utilities
{
	/// <summary>
	/// Interface for providing Kreditor related functionality.
	/// </summary>
	[Obsolete("Is not used any more.", false)] // 44SP3
	public interface ICheckOutKreditor
	{
		/// <summary>
		/// Gets the person number.
		/// </summary>
		/// <value>
		/// The person number.
		/// </value>
		string PersonNumber { get; }

		/// <summary>
		/// Gets the campaign code.
		/// </summary>
		/// <value>
		/// The campaign code.
		/// </value>
		int CampaignCode { get; }		
	}
}
