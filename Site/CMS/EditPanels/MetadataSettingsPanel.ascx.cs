using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using Litium.Extensions;
using Litium.Extensions.Constants;
using Litium.Extensions.Data;
using Litium.Extensions.Metadata;
using Litium.Extensions.Metadata.Comparers;
using Litium.Foundation.Log;
using Litium.Foundation.Modules.CMS;
using Litium.Foundation.Modules.CMS.GUI.Panels;
using Litium.Foundation.Modules.CMS.Pages;
using Litium.Plus.Utilities;

/// <summary>
///	MetadataFilteredList settings panel
/// </summary>
public partial class Modules_CMS_Panels_MetadataSettingsPanel : BasePanel
{
    // Instance members
	protected ModuleCMS m_currentModule;
	protected Litium.Foundation.Modules.CMS.Pages.WorkingCopy m_workingCopy;
	
	
	/// <summary>
	/// Page_Load
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	protected void Page_Load(object sender, EventArgs e)
	{
		ScriptManager scriptMan = ScriptManager.GetCurrent(Page);
		if (scriptMan != null)
		{
			ServiceReference service = new ServiceReference("~/Extensions/WebServices/MetadataSelector.asmx");
			service.InlineScript = true;
			if (scriptMan.Services.IndexOf(service) == -1)
				scriptMan.Services.Add(service);
		}
		
		m_currentModule = ModuleCMS.Instance;
		if (m_parentPage.WorkingCopy != null)
		{
			m_workingCopy = m_parentPage.WorkingCopy;
			c_metadataSelector.PageID = m_workingCopy.Page.ID;
		}
		
		ShowConnectedMetadata();
	}

	/// <summary>
	/// Saves changes to the working copy upon postback
	/// </summary>
	/// <returns>True if the canges saved correctly otherwise false</returns>
	protected override bool Save()
	{
		if(Page.IsValid)
		{
			if (m_workingCopy != null)
			{
				try
				{
					return true;
				}
				catch (Exception exc)
				{
					FoundationContext.Solution.Log.CreateLogEntry(GetType().FullName + ".Save", exc, LogLevels.MINOR_ERROR);
					return false;
				}
			}
			return false;
		}
		return false;
	}
	
		/// <summary>
	/// gets metadatatranslations and binds them to datalist
	/// </summary>
	protected void ShowConnectedMetadata()
	{
		List<Metadata> metaDataList = Extensions.Instance.Metadata.GetMetadataByPage(m_workingCopy.PageID);

		if (metaDataList.Count == 0)
			return;

		m_placeHolderConnectedMetadata.Visible = true;

		metaDataList.Sort(new GenericListMetadataTranslationComparer(SortOrder.Ascending));

		List<String> listMetaDataTranslations = new List<string>();


		foreach (Metadata metaData in metaDataList)
		{
			string metaDataName = metaData.Translations.GetMetadataTranslation(CurrentState.Current.WebSite.Culture).Translation;

			listMetaDataTranslations.Add(metaDataName);
		}

		m_dataListConnectedMetadata.DataSource = listMetaDataTranslations;
		m_dataListConnectedMetadata.DataBind();
	}
}
