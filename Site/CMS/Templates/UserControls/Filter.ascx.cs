using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using App_Code.Site.CMS.MetaData;
using App_Code.Site.Comparers;
using Litium.Foundation.GUI;
using Litium.Foundation.Modules;
using Litium.Foundation.Modules.CMS;
using Litium.Foundation.Modules.CMS.Content;
using Litium.Foundation.Modules.CMS.Pages;
using Litium.Foundation.Modules.CMS.Search;
using Litium.Foundation.Modules.CMS.WebControls;
using Litium.Foundation.Modules.MediaArchive;
using Litium.Foundation.Modules.Relations;
using Litium.Foundation.Modules.Relations.Fields;
using Litium.Foundation.Search;
using Litium.Plus.Utilities;
using Metadata = Litium.Extensions.Metadata.Metadata;
using MetadataType = Litium.Extensions.Metadata.MetadataType;

namespace Site.CMS.Templates.UserControls
{
	/// <summary>
	///	SearchResult1.
	/// </summary>
	public partial class Filter : App_Code.Site.CMS.UserControls.BaseUserControl
	{

		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected override void OnPreRender(EventArgs e)
		{
			InitMetadataList();
			

			base.OnPreRender(e);
		}


		public void UpdateFilter(object sender, EventArgs e)
		{

			//Session.Add("Taggs", c_repeaterMetadataQualifications.Items);
			Response.Redirect(WebControlState.CMS.CurrentPage.GetUrlToPage(CurrentState.Current.WebSiteID, CurrentState.Current.IsInAdministrationMode), false);
		}

		/// <summary>
		/// Handles the Click event of the LinkButtonMetadata control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
		protected void LinkButtonMetadata_Click(Object sender, EventArgs e)
		{
			LinkButton linkButton = (LinkButton)sender;

			if (!StringUtilities.IsGuid(linkButton.CommandArgument))
				return;

			Guid metadataId = new Guid(linkButton.CommandArgument);

			Metadata metadata = Litium.Extensions.Extensions.Instance.Metadata.GetMetadata(metadataId);

			if (metadata == null)
				return;

			SearchListUtilities.AddOrRemoveMetadataFromSelectedMetadata(metadata.ID);

			// NOTE: this is done to reset page count in url
			Response.Redirect(Page.ResolveUrl(WebControlState.CMS.CurrentPage.Url), true);
		}


		/// <summary>
		/// Handles the ItemDataBound event of the RepeaterMetadata control.
		/// </summary>
		/// <param name="Sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.Web.UI.WebControls.RepeaterItemEventArgs"/> instance containing the event data.</param>
		protected void RepeaterMetadata_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
		{
			if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)
				return;

            var repeater = e.Item.FindControl("subitems") as CheckBoxList;

		    var headerlabel = e.Item.FindControl("HeaderLabel") as Literal;

            var metadatahead = e.Item.DataItem as App_Code.Site.CMS.MetaData.Metadata;


		    headerlabel.Text = metadatahead.Name;

		    var submetadata = metadatahead.GetSubMetadatas(MetadataService.Instance, FoundationContext.Current.Token);

            List<ListItem> list = new List<ListItem>();

            if (submetadata != null)
            {
		        foreach (var metadata1 in submetadata)
		        {
		            ListItem item = new ListItem(metadata1.Name, metadata1.ID.ToString());

                    list.Add(item);

		        }
            }
		    repeater.DataSource = list;
            repeater.DataBind();
            

			LinkButton linkButton = e.Item.FindControl("c_linkbuttonMetadata") as LinkButton;

			if (linkButton == null)
				return;

			Metadata metadata = (e.Item.DataItem as Metadata);

			linkButton.CommandArgument = metadata.ID.ToString();
			linkButton.Text = metadata.Translations.GetMetadataTranslation(CurrentState.Current.WebSite.Culture).Translation;

			if (SearchListUtilities.IsMetadataSelected(metadata.ID))
			{
				linkButton.CssClass = "metadataselected";
			}
			else
			{
				linkButton.CssClass = "metadataunselected";
			}

		}

		/// <summary>
		/// Inits the metadata list.
		/// </summary>
		private void InitMetadataList()
		{

			if (!Page.IsPostBack)
			{

				List<Metadata> metadata = Litium.Extensions.Extensions.Instance.Metadata.GetMetadata(1);
				

				metadata.Sort(GenericListMetadataComparer.TranslationAscendingComparison);
				if (metadata != null && metadata.Count > 0)
				{
					InitMetadataRepeater(metadata, "Taggar", headeritems);
					
				}
			}
		}

		/// <summary>
		/// Inits the metadata repeater.
		/// </summary>
		/// <param name="pageMetadata">The page metadata.</param>
		/// <param name="metadataTypeName">Name of the metadata type.</param>
		/// <param name="repeater">The repeater.</param>
		protected void InitMetadataRepeater(List<Metadata> pageMetadata, string metadataTypeName, Repeater repeater)
		{

		   QueryRequest queryRequestFactory =  QueryRequestFactory.Instance.GetMetadataSubjectInstancesQueryRequest(ModuleCMS.Instance.PageTypes, FoundationContext.Current.LanguageID, FoundationContext.Current.Token);

		    List<App_Code.Site.CMS.MetaData.Metadata> metadatas =   MetadataService.Instance.GetMetadatas(queryRequestFactory, ModuleCMS.Instance.PermissionManager,FoundationContext.Current.Token);
            
		    repeater.DataSource = metadatas;
            repeater.DataBind();

		}

		protected List<Page> SortResultsByPartnerTypeAndName(List<Page> pages)
		{
			List<Page> sortedPages = new List<Page>();

			List<Page> partnerPages = new List<Page>();
			List<Page> certifiedPartnerPages = new List<Page>();
			List<Page> premiumCertifiedPartnerPages = new List<Page>();
			List<Page> noPartnerPages = new List<Page>();

			foreach (Page page in pages)
			{
				if (IsTypeOfPartner("ImagePartner", page))
				{
					partnerPages.Add(page);
				}
				else if (IsTypeOfPartner("ImageCertifiedPartner", page))
				{
					certifiedPartnerPages.Add(page);
				}
				else if (IsTypeOfPartner("ImagePremiumCertifiedPartner", page))
				{
					premiumCertifiedPartnerPages.Add(page);
				}
				else
				{
					noPartnerPages.Add(page);
				}
			}

			sortedPages = GetSortedPages(partnerPages, certifiedPartnerPages, premiumCertifiedPartnerPages, noPartnerPages);

			return sortedPages;
		}

		protected List<Page> GetSortedPages(List<Page> partnerPages, List<Page> certifiedPartnerPages, List<Page> premiumCertifiedPartnerPages, List<Page> noPartnerPages)
		{
			List<Page> sortedPages = new List<Page>();
			partnerPages.Sort(new Litium.Foundation.Modules.CMS.Pages.Comparers.PageShortNameComparer(true));
			certifiedPartnerPages.Sort(new Litium.Foundation.Modules.CMS.Pages.Comparers.PageShortNameComparer(true));
			premiumCertifiedPartnerPages.Sort(new Litium.Foundation.Modules.CMS.Pages.Comparers.PageShortNameComparer(true));
			noPartnerPages.Sort(new Litium.Foundation.Modules.CMS.Pages.Comparers.PageShortNameComparer(true));

			sortedPages.AddRange(premiumCertifiedPartnerPages);
			sortedPages.AddRange(certifiedPartnerPages);
			sortedPages.AddRange(partnerPages);
			sortedPages.AddRange(noPartnerPages);

			return sortedPages;
		}

		protected bool IsTypeOfPartner(string propertyName, Page page)
		{
			return Litium.Plus.Utilities.PropertyUtilities.GetBooleanPropertyValue(page.Content, propertyName);
		}
	}

}