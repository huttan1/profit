using System;
using System.Web;
using Litium.Extensions.Metadata.WebControls;
using Litium.Extensions.PageTypes.MetadataFilteredList;

/// <summary>
///	Templates_MetadataFilteredList1
/// </summary>
public partial class Templates_MetadataFilteredFeed1 : Litium.Foundation.Modules.CMS.GUI.Templates.BaseTemplate
{
	/// <summary>
	/// Page_Load.
	/// </summary>
	protected void Page_Load(object sender, EventArgs e)
	{
		HttpContext.Current.Response.Clear();

		if (!CurrentState.IsInAdministrationMode)
			Request.ContentType = "text/xml";

		MetadataPageRepeater repeater = null;

		if(Request.QueryString["type"] == null || Request.QueryString["type"] == "rss")
		{
			c_placeHolderRSS.Visible = true;
			repeater = c_placeHolderRSS.FindControl("c_metadataPageRepeaterRSS") as MetadataPageRepeater; ;
		}
		else if(Request.QueryString["type"] == "atom")
		{
			c_placeHolderAtom.Visible = true;
			repeater = c_placeHolderAtom.FindControl("c_metadataPageRepeaterAtom") as MetadataPageRepeater;
		}

		if (repeater != null)
		{
			MetadataFilteredListUtilities.InitializeRepeater(repeater, Request, CurrentPage, FoundationContext.Token);
		}
	}
}