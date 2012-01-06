using System;
using Litium.Extensions.Metadata.WebControls;
using Litium.Extensions.PageTypes.MetadataFilteredList;

/// <summary>
///	Templates_MetadataFilteredList1
/// </summary>
public partial class Templates_MetadataFilteredList1 : Litium.Foundation.Modules.CMS.GUI.Templates.ContentPageTemplate
{
	/// <summary>
	/// Page_Load.
	/// </summary>
	protected void Page_Load(object sender, EventArgs e)
	{
		// Sätter inställningar på repeatern, prioriterar inställningar skickade via QueryString, annars kör den på inställningar från sidan
		MetadataFilteredListUtilities.InitializeRepeater(c_metadataPageRepeater, Request, CurrentPage, FoundationContext.Token);

		if (!IsPostBack)
		{
			InitButtons();
		}
	}

	/// <summary>
	/// Inits the controls
	/// </summary>
	private void InitButtons()
	{
		if (c_linkUpLink != null)
		{
			c_panelPreviousPage.Visible = true;
			c_linkUpLink.HRef = Request.Url.ToString();
			c_linkUpLink.Attributes.Add("onclick", "javascript:history.back(-1);");
		}
	}

	protected void OnInit_MetadataPageRepeater(object sender, EventArgs e)
	{
		MetadataPageRepeater metadataPageRepeater = (MetadataPageRepeater)sender;
		if (c_pagerMetadataPageRepeater.PageSize != 0)
			metadataPageRepeater.PageSize = c_pagerMetadataPageRepeater.PageSize;

		// Set paging page
		metadataPageRepeater.SelectedPageIndex = c_pagerMetadataPageRepeater.CurrentPage;
	}

	protected void OnPreRender_MetadataPageRepeater(object sender, EventArgs e)
	{
		MetadataPageRepeater metadataPageRepeater = (MetadataPageRepeater)sender;
		c_pagerMetadataPageRepeater.ItemCount = metadataPageRepeater.Count;
	}

	protected void OnPreRender_Pager_MetadataPageRepeater(object sender, EventArgs e)
	{
		// Litium.Extensions.WebControls.Pager test = (Litium.Extensions.WebControls.Pager) sender;
		// test.ItemCount = c_metadataPageRepeater.AllItems
	}
}