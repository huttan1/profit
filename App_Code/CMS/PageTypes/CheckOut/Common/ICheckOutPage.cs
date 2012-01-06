using System;
using CMS.PageTypes.CheckOut.Utilities;
using System.Web.UI.WebControls;

namespace CMS.PageTypes.CheckOut.Common
{
	/// <summary>
	/// Interface for providing check out page related functionality.
	/// </summary>
	public interface ICheckOutPage
	{
		/// <summary>
		/// Gets or sets the current step.
		/// </summary>
		/// <value>
		/// The current step.
		/// </value>
		CheckOutStep CurrentStep { get; set; }

		/// <summary>
		/// Gets the back button.
		/// </summary>
		/// <value>The back button.</value>
		Button BackButton { get; }

		/// <summary>
		/// Gets the next button.
		/// </summary>
		/// <value>The next button.</value>
		Button NextButton { get; }
	}
}
