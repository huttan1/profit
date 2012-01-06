using System;
using System.Web.UI.WebControls;
using App_Code.Site.CMS.Templates;
using Litium.Extensions.Metadata.WebControls;
using Litium.Extensions.PageTypes.MetadataFilteredList;

namespace Site.CMS.Templates
{
	/// <summary>
	/// Class for CheckOut page type
	/// </summary>
	public partial class Category : BaseTemplate
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

            MetadataFilteredListUtilities.InitializeRepeater(c_metadataPageRepeater, Request, CurrentPage, FoundationContext.Token);

			if (!IsPostBack)
			{
                
			}
		}

     

        protected void OnInit_MetadataPageRepeater(object sender, EventArgs e)
        {
            MetadataPageRepeater metadataPageRepeater = (MetadataPageRepeater)sender;
            if (c_pagerMetadataPageRepeater.PageSize != 0)
                metadataPageRepeater.PageSize = c_pagerMetadataPageRepeater.PageSize;


            ListItemCollection collection = Session["Taggs"] as ListItemCollection;
            string metaselected = "";
            string metafilter = "";
            if (collection != null && collection.Count > 0)
            {
                for (int i = 0; i < collection.Count; i++)
                {
                    if (collection[i].Selected)
                    {
                        metaselected += collection[i].Value + ",";
                    }

                }
            }

            if (metaselected.EndsWith(","))
            {
                metafilter = metaselected.Remove(metaselected.Length - 1);
            }
            else
            {
                metafilter = metaselected;
            }

            if (metafilter != "" && collection != null)
            {
                metadataPageRepeater.Metadata = metafilter;
            }

            metadataPageRepeater.StartNode = CurrentPage.ID.ToString();
            metadataPageRepeater.PageTypeID = "168e4e3d-e73c-411d-84de-d80ee9e65889";

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
}