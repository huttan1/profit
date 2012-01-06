using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using App_Code.Site.CMS.Templates;
using Litium.Foundation.Accounts;
using Litium.Foundation.Modules.CMS;
using Litium.Foundation.Modules.CMS.Content;
using Litium.Foundation.Modules.CMS.Pages;

namespace Site.CMS.Templates
{
	/// <summary>
	/// Class for CheckOut page type
	/// </summary>
    public partial class Item : BaseTemplate
	{
		
		/// <summary>
		/// Handles the Load event of the Page control.
		/// </summary>
		/// <param name="sender">
		/// The source of the event.
		/// </param>
		/// <param name="e">
		/// The <see cref="System.EventArgs"/> instance containing the event data.
		/// </param>
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{

                IntegerProperty truevotesProperty = CurrentPage.Settings.GetProperty("TrueVotes") as IntegerProperty;
                IntegerProperty falsevotesProperty = CurrentPage.Settings.GetProperty("FalseVotes") as IntegerProperty;

                if (truevotesProperty != null && falsevotesProperty != null)
                {
                
                int totaltvotes = truevotesProperty.GetValue() + falsevotesProperty.GetValue();
			    int truevotes = truevotesProperty.GetValue();
			    int falsevotes = falsevotesProperty.GetValue();


                decimal percentage = totaltvotes / truevotes;

                }




			}
		}
		
	}
}