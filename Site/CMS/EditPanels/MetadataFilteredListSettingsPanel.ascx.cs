using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using Litium.Extensions;
using Litium.Extensions.Constants;
using Litium.Extensions.Metadata;
using Litium.Foundation.Log;
using Litium.Foundation.Modules.CMS;
using Litium.Foundation.Modules.CMS.Content;
using Litium.Foundation.Modules.CMS.GUI.Panels;
using Litium.Foundation.Modules.CMS.PageTypes;

namespace Modules.CMS.Panels
{
	/// <summary>
	///	MetadataFilteredList settings panel
	/// </summary>
	public partial class Modules_CMS_Panels_MetadataFilteredListSettingsPanel : BasePanel
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
			m_currentModule = FoundationContext.Module as ModuleCMS;
			
			if (m_parentPage.WorkingCopy != null)
			{
				m_workingCopy = m_parentPage.WorkingCopy;
				m_metadataSelector.PageID = m_workingCopy.Page.ID;
			}

			if(!IsPostBack)
			{
				InitDropDownLists();
				InitLabels();
				InitMetadataTypeRepeater();
				InitDateFields();
			}

			// Hide the metadatapanel if no types are added in the administration.
			if (Extensions.Instance.Metadata.Types.All.Count <= 0)
				m_panelMetadata.Visible = false;
		}

		private void InitLabels()
		{
			m_literalType1.Text = m_workingCopy.Page.PageType.Strings["MetadataTypesLabel", FoundationContext.Language.ID];
		
			m_literalPublishDateStart.Text = m_workingCopy.Page.PageType.Strings["PublishedStartDateLabel", FoundationContext.Language.ID];
			m_literalPublishDateEnd.Text = m_workingCopy.Page.PageType.Strings["PublishedEndDateLabel", FoundationContext.Language.ID];

			m_literalPageTypes.Text = m_workingCopy.Page.PageType.Strings["PageTypesLabel", FoundationContext.Language.ID];

			m_customValidatorStartDate.ErrorMessage = m_workingCopy.Page.PageType.Strings["PublishDateFormatErrorMessage", FoundationContext.Language.ID];
			m_customValidatorEndDate.ErrorMessage = m_workingCopy.Page.PageType.Strings["PublishDateFormatErrorMessage", FoundationContext.Language.ID];
			m_customValidatorDates.ErrorMessage = m_workingCopy.Page.PageType.Strings["PublishDateRangeErrorMessage", FoundationContext.Language.ID];
		}

		protected void InitDateFields()
		{
			DateTimeProperty start = GetStartPublishDateProperty();
			DateTimeProperty end = GetEndPublishDateProperty();

			if (start != null && start.ValueCount > 0)
				m_textBoxStartDate.Text = start.GetValue().ToString("yyyy-MM-dd");

			if (end != null && end.ValueCount > 0)
				m_textBoxEndDate.Text = end.GetValue().ToString("yyyy-MM-dd");
		}

		private void InitDropDownLists()
		{
			InitPageTypeCheckBoxList();
			InitMetadataTypeDropDownList();
		}

		protected void InitMetadataTypeDropDownList()
		{
			m_dropDownListMetadataTypes.Items.Clear();

			List<MetadataType> selectedTypes = GetSelectedMetadataTypes();
			foreach (MetadataType metadataType in Extensions.Instance.Metadata.Types.All)
			{
				// Determin if metadata typ is already selected
				bool has = false;
				foreach (MetadataType selectedMetadataType in selectedTypes)
				{
					if(selectedMetadataType.Type != metadataType.Type)
						continue;
				
					has = true;
					break;
				}

				// If this type is not selected, add it to the dropdown
				if (!has)
					m_dropDownListMetadataTypes.Items.Add(new ListItem(metadataType.Description, metadataType.Type.ToString()));
			}
		}

		private void InitPageTypeCheckBoxList()
		{
			List<PageType> selectedPageTypes = GetSelectedPageTypes();

			SortedList<string, ListItem> items = new SortedList<string, ListItem>();
			foreach(PageType pageType in ModuleCMS.Instance.PageTypes)
			{
				bool has = false;
				foreach (PageType selectedPageType in selectedPageTypes)
				{
					if (selectedPageType.ID != pageType.ID) continue;
				
					has = true;
					break;
				}

				string shortName = pageType.GetShortName(FoundationContext.Language.ID);

				if (string.IsNullOrEmpty(shortName))
					shortName = pageType.Name;

				ListItem item = new ListItem(shortName, pageType.ID.ToString());
				item.Selected = has;
				items.Add(shortName, item);
			}

			foreach(KeyValuePair<string, ListItem> list in items)
			{
				m_checkBoxListPageTypes.Items.Add(list.Value);
			}
		}

		protected void InitMetadataTypeRepeater()
		{
			m_repeaterSelectedMetadaTypes.DataSource = GetSelectedMetadataTypes();
			m_repeaterSelectedMetadaTypes.DataBind();
		}

		protected void ButtonAddMetadataType_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			IntegerProperty typeProperty = GetMetadataTypesProperty();
			short type = short.Parse(m_dropDownListMetadataTypes.SelectedValue);
			typeProperty.SetValue(typeProperty.ValueCount, type, FoundationContext.Token);
		
			InitMetadataTypeDropDownList();

			InitMetadataTypeRepeater();
		}

		protected void RepeaterSelectedMetadaTypes_ItemCommand(object source, RepeaterCommandEventArgs e)
		{
			if(e.CommandName == "Delete")
			{
				short id;
				if(short.TryParse(e.CommandArgument.ToString(), out id))
				{
					IntegerProperty property = GetMetadataTypesProperty();
					if(property != null && property.ValueCount > 0)
					{
						for(int i = 0; i < property.ValueCount; i++)
						{
							short value = (short)property.GetValue(i);
							if(value == id)
							{
								property.DeleteValue(i, FoundationContext.Token);
								InitMetadataTypeDropDownList();
								InitMetadataTypeRepeater();
								return;
							}
						}
					}
				}
			}
		}

		protected LinkInternalProperty GetMetadataProperty()
		{
			LinkInternalProperty property = m_workingCopy.Settings[PropertyNameConstants.FILTERED_LIST_SELECTED_METADATA] as LinkInternalProperty;
			if (property == null)
				property = m_workingCopy.Settings.CreateLinkInternalProperty(PropertyNameConstants.FILTERED_LIST_SELECTED_METADATA, false, false, true, FoundationContext.Token);

			return property;
		}

		private List<MetadataType> GetSelectedMetadataTypes()
		{
			List<MetadataType> selectedMetadataIDs = new List<MetadataType>();

			IntegerProperty selectedMetadatas = GetMetadataTypesProperty();
			if (selectedMetadatas != null)
			{
				for (int i = 0; i < selectedMetadatas.ValueCount; i++)
				{
					short type = (short)selectedMetadatas.GetValue(i);
					MetadataType metadata = Extensions.Instance.Metadata.Types.GetMetadataType(type);
					if (metadata != null)
						selectedMetadataIDs.Add(metadata);
				}
			}

			return selectedMetadataIDs;
		}

		protected IntegerProperty GetMetadataTypesProperty()
		{
			IntegerProperty property = m_workingCopy.Settings[PropertyNameConstants.FILTERED_LIST_SELECTED_METADATA_TYPES] as IntegerProperty;
			if (property == null)
				property = m_workingCopy.Settings.CreateIntegerProperty(PropertyNameConstants.FILTERED_LIST_SELECTED_METADATA_TYPES, false, false, true, FoundationContext.Token);

			return property;
		}

		private List<PageType> GetSelectedPageTypes()
		{
			List<PageType> selectedPageTypes = new List<PageType>();

			LinkInternalProperty selectedMetadatas = GetPageTypesProperty();
			if (selectedMetadatas != null)
			{
				for (int i = 0; i < selectedMetadatas.ValueCount; i++)
				{
					PageType pageType = ModuleCMS.ModuleInstance.PageTypes.GetPageType(selectedMetadatas.GetValue(i));
					if(pageType != null)
						selectedPageTypes.Add(pageType);
				}
			}

			return selectedPageTypes;
		}

		protected LinkInternalProperty GetPageTypesProperty()
		{
			LinkInternalProperty property = m_workingCopy.Settings[PropertyNameConstants.FILTERED_LIST_SELECTED_PAGE_TYPES] as LinkInternalProperty;
			if (property == null)
				property = m_workingCopy.Settings.CreateLinkInternalProperty(PropertyNameConstants.FILTERED_LIST_SELECTED_PAGE_TYPES, false, false, true, FoundationContext.Token);

			return property;
		}

		protected DateTimeProperty GetStartPublishDateProperty()
		{
			DateTimeProperty property = m_workingCopy.Settings[PropertyNameConstants.FILTERED_LIST_START_PUBLISH_DATE] as DateTimeProperty;
			if (property == null)
				property = m_workingCopy.Settings.CreateDateTimeProperty(PropertyNameConstants.FILTERED_LIST_START_PUBLISH_DATE, false, false, true, FoundationContext.Token);

			return property;
		}

		protected DateTimeProperty GetEndPublishDateProperty()
		{
			DateTimeProperty property = m_workingCopy.Settings[PropertyNameConstants.FILTERED_LIST_END_PUBLISH_DATE] as DateTimeProperty;
			if (property == null)
				property = m_workingCopy.Settings.CreateDateTimeProperty(PropertyNameConstants.FILTERED_LIST_END_PUBLISH_DATE, false, false, true, FoundationContext.Token);

			return property;
		}

		protected string GetMetadataTranslation(Metadata metadata)
		{
			MetadataTranslation translation = metadata.Translations.GetMetadataTranslation(FoundationContext.Culture);
			string trans = "No translation available for " + FoundationContext.Culture.IetfLanguageTag;
			if (translation != null)
				trans = translation.Translation;

			return trans;
		}

		protected void CustomValidatorDate_ServerValidate(object source, ServerValidateEventArgs args)
		{
			DateTime date;
			args.IsValid = DateTime.TryParse(args.Value, out date);
		}

		protected void CustomValidatorDateRange_ServerValidate(object source, ServerValidateEventArgs args)
		{
			DateTime startDate;
			if(DateTime.TryParse(m_textBoxStartDate.Text, out startDate))
			{
				DateTime endDate;
				if (DateTime.TryParse(m_textBoxEndDate.Text, out endDate))
				{
					args.IsValid = (startDate <= endDate) ;
				}
			}
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
						LinkInternalProperty pageTypes = GetPageTypesProperty();
						// Clear propertys selected values to prevent duplicates
						pageTypes.DeleteAllValues(FoundationContext.Token);
						foreach(ListItem item in m_checkBoxListPageTypes.Items)
						{
							if(item.Selected)
							{
								pageTypes.SetValue(pageTypes.ValueCount, new Guid(item.Value), FoundationContext.Token );
							}
						}

						DateTimeProperty startPublishDateProperty = GetStartPublishDateProperty();
						if (!string.IsNullOrEmpty(m_textBoxStartDate.Text))
						{
							DateTime startDate;
							if(DateTime.TryParse(m_textBoxStartDate.Text, out startDate))
							{
								startPublishDateProperty.SetValue(startDate, FoundationContext.Token);
							}
						}
						else
						{
							startPublishDateProperty.DeleteAllValues(FoundationContext.Token);
						}

						DateTimeProperty endPublishDateProperty = GetEndPublishDateProperty();
						if (!string.IsNullOrEmpty(m_textBoxEndDate.Text))
						{
							DateTime endDate;
							if (DateTime.TryParse(m_textBoxEndDate.Text, out endDate))
							{
								// Add 23:59:59 to our datetime value
								endDate = endDate.AddDays(1).AddSeconds(-1);

								endPublishDateProperty.SetValue(endDate, FoundationContext.Token);
							}
						}
						else
						{
							endPublishDateProperty.DeleteAllValues(FoundationContext.Token);
						}

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
	}
}