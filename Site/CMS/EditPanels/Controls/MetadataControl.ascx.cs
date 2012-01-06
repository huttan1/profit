using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using App_Code.Site.CMS.MetaData;
using Litium.Foundation;
using Litium.Foundation.GUI;
using Litium.Foundation.Log;
using Litium.Foundation.Modules.CMS;
using Litium.Foundation.Modules.CMS.Pages;
using Litium.Foundation.Search;

namespace Site.CMS.EditPanels.Controls
{
	/// <summary>
	/// Panel for page settings
	/// </summary>
	public partial class MetadataControl : UserControl
	{
		protected const string MetadataClassPrefix = "metadata-";

		// Instance members
		public WorkingCopy WorkingCopy;		

		/// <summary>
		/// Handles the Load event of the Page control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
		protected void Page_Load(object sender, EventArgs e)
		{
			InitSelectedMetadata();
			InitMetadataList();
		}

		private void InitSelectedMetadata()
		{
			List<Metadata> metadatas = MetadataService.Instance.GetMetadatasFromPage(WorkingCopy.Content, CurrentState.Current.Token);
			m_hiddenFieldSelected.Value = string.Join(";", (from m in metadatas select m.ID.ToString()).ToArray());
		}

		private void InitMetadataList()
		{
			QueryRequest request = QueryRequestFactory.Instance.GetMetadataSubjectInstancesQueryRequest(ModuleCMS.Instance.PageTypes, CurrentState.Current.User.LanguageID, CurrentState.Current.Token);

			List<Metadata> metadatas = MetadataService.Instance.GetBasicMetadata(request, ModuleCMS.Instance.CacheManager.SiteMapCache);
			
			MetadataTypeContainer subjects = new MetadataTypeContainer();
			subjects.Name = "Huvudämnen";
			subjects.Metadatas = metadatas;

			request = QueryRequestFactory.Instance.GetMetadataTypeInstancesQueryRequest(ModuleCMS.Instance.PageTypes, CurrentState.Current.User.LanguageID, CurrentState.Current.Token);

			metadatas = MetadataService.Instance.GetBasicMetadata(request, ModuleCMS.Instance.CacheManager.SiteMapCache);
			MetadataTypeContainer types = new MetadataTypeContainer();
			types.Name = "Subämnen";
			// Filter out categorys since they should not be selectable
			types.Metadatas = (from md in metadatas where !md.IsCategory select md).ToList();

			m_repeaterTypes.DataSource = new [] {subjects, types};
			m_repeaterTypes.DataBind();
		}

		public bool Save()
		{
			if (Page.IsValid)
			{
				if (WorkingCopy != null)
				{
					try
					{
						List<Metadata> md = GetSelectedMetadata();

						MetadataService.Instance.SetMetadataOnPage(WorkingCopy.Content, md, FoundationContext.Current.Token);

						return true;
					}
					catch (Exception exc)
					{
						FoundationContext.Current.Solution.Log.CreateLogEntry(GetType().FullName + ".Save", exc, LogLevels.ERROR);
						return false;
					}
				}
				return false;
			}
			return false;
		}

		private List<Metadata> GetSelectedMetadata()
		{
			List<Metadata> mds = new List<Metadata>();
			if(!string.IsNullOrEmpty(m_hiddenFieldSelected.Value))
			{
				string[] ids = m_hiddenFieldSelected.Value.Split(';');
				List<Guid> mdIds = (from id in ids select new Guid(id)).ToList();
				mds = MetadataService.Instance.GetMetadataFromIDs(mdIds, FoundationContext.Current.Token);
			}

			return mds;
		}

		protected void RepeaterMetadatas_ItemDataBound(object sender, RepeaterItemEventArgs e)
		{
			if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				Metadata md = (Metadata) e.Item.DataItem;
				HtmlInputCheckBox cb = (HtmlInputCheckBox)e.Item.FindControl("m_checkBox");
				HtmlGenericControl label = (HtmlGenericControl)e.Item.FindControl("m_label");
				cb.Checked = m_hiddenFieldSelected.Value.Contains(md.ID.ToString());
				cb.Attributes["value"] = md.ID.ToString();
				cb.Attributes["class"] = MetadataClassPrefix + md.Type;
				label.InnerText = md.Name;
				label.Attributes["for"] = cb.ClientID;
			}
		}
	}

	public class MetadataTypeContainer
	{
		public string Name { get; set; }
		public List<Metadata> Metadatas { get; set; }
	}
}