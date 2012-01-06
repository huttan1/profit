using System;
using System.Collections.Generic;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Litium.Extensions.Metadata;
using Litium.Foundation;
using Litium.Foundation.Languages;
using Litium.Foundation.Modules.CMS;
using Litium.Foundation.Modules.CMS.WebSites;
using Litium.Plus.Utilities;
using SystemStringConstants = Litium.Foundation.GUI.Constants.SystemStringConstants;

namespace Extensions.Pages
{
	/// <summary>
	///	Redirect1. Used to redirect the request to another page via login page
	/// </summary>
	public partial class MetadataAdministration : Litium.Foundation.GUI.Pages.BasePage
	{
		private const string METADATA_CHOOSE_LANGUAGETEXT = "Extensions_MD_Settings_ChooseLanguage";
		private const string METADATA_CHOOSE_METADATATYPETEXT = "Extensions_MD_Settings_ChooseMetadataType";
		private const string METADATA_CHOOSE_WEBSITETEXT = "Extensions_MD_Settings_ChooseWebSite";
		private const string METADATA_VALIDATOR_TYPE = "Extensions_MD_Settings_ErrorMessageType";
		private const string METADATA_VALIDATOR_METADATA_TRANSLATION = "Extensions_MD_Settings_ErrorMessageMetadataTranslation";
		private const string METADATA_CONFIRM_DELETE_METADATALINKS = "Extensions_MD_Settings_ConfirmDeleteMetaDataLinks";
		private const string METADATA_CONFIRM_DELETE_METADATA = "Extensions_MD_Settings_ConfirmDeleteMetaData";
		private const string METADATA_USAGE = "Extensions_MD_MetadataAdminUsage";
		private const string METADATA_ALL_WEBSITES = "Extensions_MD_Settings_AllWebSites";
		private const string METADATA_ERROR_DELETE_CONNECTED_TYPE = "Extensions_MD_Settings_ErrorDeleteConnectedType";
		/// <summary>
		/// Authorizes the user for the current page
		/// </summary>
		/// <returns>True if authorization succedded, otherwise false.</returns>
		public override bool AuthorizeUser()
		{
			return FoundationContext.Token.HasSolutionPermission(Litium.Foundation.Security.BuiltInSolutionPermissionTypes.PERMISSION_ID_ALL, true, true);
		}

		/// <summary>
		/// Handles the Load event of the Page control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
		protected void Page_Load(object sender, EventArgs e)
		{
			// Create new metadatatype
			// MetadataType metadataType = Extensions.Instance.Metadata.Types.CreateMetadataType(1, "Ansvarsområde");

			// Delete metadatatype
			// List<MetadataType> metadataTypes = MetadataType.GetMetadataType(1);
			// foreach (MetadataType metadataType in metadataTypes){ metadataType.Delete(); }

			// Clear error messages
			m_labelTypeErrorMsg.Text = string.Empty;

			if (!IsPostBack)
			{
				InitValidators();

				// Text for field legends
				m_literalMetadataWebSite.Text = Solution.Instance.SystemStrings[METADATA_CHOOSE_WEBSITETEXT, FoundationContext.Culture];
				m_literalMetadataMetadataType.Text = Solution.Instance.SystemStrings[METADATA_CHOOSE_METADATATYPETEXT, FoundationContext.Culture];
				m_literaMetadataLanguage.Text = Solution.Instance.SystemStrings[METADATA_CHOOSE_LANGUAGETEXT, FoundationContext.Culture];

				// Init dropdownlists and preselect the first item
				InitWebSiteDropDownList();
				InitMetadataTypeDropDownList(null);
				InitMetadataLanguageDropDownList();

				if (m_dropDownListMetadataTypes.Items.Count > 0)
				{
					// Init repeater 
					InitMetadataRepeaterAndHeader(m_repeaterMetadata, Convert.ToInt16(m_dropDownListMetadataTypes.SelectedValue));
				}
			}

			m_panelMetadata.Visible = (m_dropDownListMetadataTypes.Items.Count > 0);
		}

		/// <summary>
		/// Handles the Click event of the ImageButtonEditType control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.Web.UI.ImageClickEventArgs"/> instance containing the event data.</param>
		protected void ImageButtonEditType_Click(object sender, ImageClickEventArgs e)
		{
			short type;
			if (short.TryParse(m_dropDownListMetadataTypes.SelectedValue, out type))
			{
				m_placeHoderTypeButtons.Visible = false;
				m_placeHoderEditingTypeButtons.Visible = true;
				MetadataType metadataType = Litium.Extensions.Extensions.Instance.Metadata.Types.GetMetadataType(type);
				if (metadataType != null)
				{
					m_textBoxTypeDescription.Text = metadataType.Description;
				}
			}

		}

		/// <summary>
		/// Handles the Click event of the ImageButtonCancelEditType control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.Web.UI.ImageClickEventArgs"/> instance containing the event data.</param>
		protected void ImageButtonCancelEditType_Click(object sender, ImageClickEventArgs e)
		{
			m_placeHoderTypeButtons.Visible = true;
			m_placeHoderEditingTypeButtons.Visible = false;
			m_textBoxTypeDescription.Text = "";
		}

		/// <summary>
		/// Handles the Click event of the ImageButtonDeleteType control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.Web.UI.ImageClickEventArgs"/> instance containing the event data.</param>
		protected void ImageButtonDeleteType_Click(object sender, ImageClickEventArgs e)
		{
			if (StringUtilities.IsNumeric(m_dropDownListMetadataTypes.SelectedValue, NumberStyles.Integer))
			{
				short type = short.Parse(m_dropDownListMetadataTypes.SelectedValue);

				// Check that the metadatatype is not connected to any metadata
				if (Litium.Extensions.Extensions.Instance.Metadata.GetMetadata(type).Count > 0)
				{
					// Show error message
					m_labelTypeErrorMsg.Text = "<br />" + Solution.Instance.SystemStrings[METADATA_ERROR_DELETE_CONNECTED_TYPE, FoundationContext.Culture];
				}
				else
				{
					// Delete the metadata
					MetadataType metadataType = Litium.Extensions.Extensions.Instance.Metadata.Types.GetMetadataType(type);

					if (metadataType != null)
					{
						metadataType.Delete();
						InitMetadataTypeDropDownList(null);

						// Init repeater and header again
						if (!string.IsNullOrEmpty(m_dropDownListMetadataTypes.SelectedValue))
							InitMetadataRepeaterAndHeader(m_repeaterMetadata, Convert.ToInt16(m_dropDownListMetadataTypes.SelectedValue));
						else
							m_panelMetadata.Visible = false;
					}
				}
			}
		}

		/// <summary>
		/// Handles the Click event of the ImageButtonCreateType control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.Web.UI.ImageClickEventArgs"/> instance containing the event data.</param>
		protected void ImageButtonCreateType_Click(object sender, ImageClickEventArgs e)
		{
			m_placeHoderCreateTypeButtons.Visible = true;
			m_placeHoderEditingTypeButtons.Visible = false;
			m_placeHoderTypeButtons.Visible = false;

			// get the highest metadata type number
			short highest = 0;
			foreach (MetadataType metadataType in Litium.Extensions.Extensions.Instance.Metadata.Types.All)
			{
				if (metadataType.Type > highest)
					highest = metadataType.Type;
			}

			m_textBoxCreateTypeType.Text = (highest + 1).ToString();
		}

		/// <summary>
		/// Handles the Click event of the ImageButtonSaveNewType control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.Web.UI.ImageClickEventArgs"/> instance containing the event data.</param>
		protected void ImageButtonSaveNewType_Click(object sender, ImageClickEventArgs e)
		{
			if (StringUtilities.IsNumeric(m_textBoxCreateTypeType.Text, NumberStyles.Integer))
			{
				short type = short.Parse(m_textBoxCreateTypeType.Text);
				MetadataType metadataType = Litium.Extensions.Extensions.Instance.Metadata.Types.CreateMetadataType(type, m_textBoxCreateTypeDescription.Text);
				if (metadataType != null)
				{
					InitMetadataTypeDropDownList(type);

					m_placeHoderCreateTypeButtons.Visible = false;
					m_placeHoderEditingTypeButtons.Visible = false;
					m_placeHoderTypeButtons.Visible = true;

					m_textBoxCreateTypeType.Text = "";

					// Init repeater 
					InitMetadataRepeaterAndHeader(m_repeaterMetadata, type);

					m_panelMetadata.Visible = true;
				}
			}
		}

		/// <summary>
		/// Handles the Click event of the ImageButtonCancelCreateType control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.Web.UI.ImageClickEventArgs"/> instance containing the event data.</param>
		protected void ImageButtonCancelCreateType_Click(object sender, ImageClickEventArgs e)
		{
			m_placeHoderCreateTypeButtons.Visible = false;
			m_placeHoderEditingTypeButtons.Visible = false;
			m_placeHoderTypeButtons.Visible = true;
			m_textBoxCreateTypeDescription.Text = "";
			m_textBoxCreateTypeType.Text = "";
		}

		/// <summary>
		/// Handles the Click event of the ImageButtonSaveType control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.Web.UI.ImageClickEventArgs"/> instance containing the event data.</param>
		protected void ImageButtonSaveType_Click(object sender, ImageClickEventArgs e)
		{
			if (!string.IsNullOrEmpty(m_textBoxTypeDescription.Text))
			{
				short type = short.Parse(m_dropDownListMetadataTypes.SelectedValue);
				MetadataType metadataType = Litium.Extensions.Extensions.Instance.Metadata.Types.GetMetadataType(type);
				if (metadataType != null)
				{
					metadataType.SetDescription(m_textBoxTypeDescription.Text);
					InitMetadataTypeDropDownList(type);
					m_placeHoderTypeButtons.Visible = true;
					m_placeHoderEditingTypeButtons.Visible = false;
					m_textBoxTypeDescription.Text = "";

					// Init repeater and header again
					InitMetadataRepeaterAndHeader(m_repeaterMetadata, Convert.ToInt16(m_dropDownListMetadataTypes.SelectedValue));
				}
			}
		}

		protected void ImageButtonEditMetadataSave_Click(object sender, ImageClickEventArgs e)
		{
			if (Session["EditedMetadataID"] != null)
			{
				Guid id = new Guid(Session["EditedMetadataID"].ToString());

				Metadata metadata = Litium.Extensions.Extensions.Instance.Metadata.GetMetadata(id);
				if (metadata != null)
				{
					// Get selected language from dropdown
					Language currentLanguage = FoundationContext.Solution.Languages.GetLanguage(new Guid(m_dropDownListMetadataLanguages.SelectedValue));

					MetadataTranslation translation = metadata.Translations.GetMetadataTranslation(currentLanguage.Culture);
					if (translation != null)
					{
						translation.Update(m_textBoxEditMetadataTranslation.Text);

						m_dropDownListMetadataLanguages.Enabled = true;
						m_textBoxEditMetadataTranslation.Text = "";
						m_placeHolderEditMetadata.Visible = false;
						m_placeHolderAddMetadata.Visible = true;
						Session["EditedMetadataID"] = null;

						// Reload repeater with new values
						InitMetadataRepeaterAndHeader(m_repeaterMetadata, Convert.ToInt16(m_dropDownListMetadataTypes.SelectedValue));
					}
				}
			}
		}

		protected void ImageButtonEditMetadataCancel_Click(object sender, ImageClickEventArgs e)
		{
			m_dropDownListMetadataLanguages.Enabled = true;
			m_textBoxEditMetadataTranslation.Text = "";
			m_placeHolderEditMetadata.Visible = false;
			m_placeHolderAddMetadata.Visible = true;
			Session["EditedMetadataID"] = null;
		}

		/// <summary>
		/// Inits the web site drop down list.
		/// </summary>
		private void InitWebSiteDropDownList()
		{
			List<ListItem> webSites = new List<ListItem>();

			ListItem websiteItem = new ListItem();
			websiteItem.Text = Solution.Instance.SystemStrings[METADATA_ALL_WEBSITES, FoundationContext.Culture];
			websiteItem.Value = Guid.Empty.ToString();

			webSites.Add(websiteItem);

			foreach (WebSite webSite in ModuleCMS.Instance.WebSites)
			{
				websiteItem = new ListItem();
				websiteItem.Text = webSite.Name;
				websiteItem.Value = webSite.ID.ToString();

				webSites.Add(websiteItem);
			}

			m_dropDownListWebsites.DataSource = webSites;
			m_dropDownListWebsites.SelectedIndex = 0;
			m_dropDownListWebsites.DataTextField = "Text";
			m_dropDownListWebsites.DataValueField = "Value";
			m_dropDownListWebsites.DataBind();
		}

		/// <summary>
		/// Handles the Click event of the ButtonAdd control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
		protected void ButtonAdd_Click(object sender, EventArgs e)
		{
			if (Page.IsValid)
			{
				short selectedMetadata = Convert.ToInt16(m_dropDownListMetadataTypes.SelectedValue);

				AddMetaData(m_textBoxCreateMetadataTranslation.Text, selectedMetadata);
				m_textBoxCreateMetadataTranslation.Text = "";

				// Init repeater 
				InitMetadataRepeaterAndHeader(m_repeaterMetadata, selectedMetadata);
			}
		}

		/// <summary>
		/// Handles the ServerValidate event of the CustomValidatorMetadataTranslation control.
		/// </summary>
		/// <param name="source">The source of the event.</param>
		/// <param name="args">The <see cref="System.Web.UI.WebControls.ServerValidateEventArgs"/> instance containing the event data.</param>
		protected void CustomValidatorMetadataTranslation_ServerValidate(object source, ServerValidateEventArgs args)
		{
			if (string.IsNullOrEmpty(m_dropDownListMetadataTypes.SelectedValue))
			{
				args.IsValid = false;
				return;
			}

			short selectedMetadataType = Convert.ToInt16(m_dropDownListMetadataTypes.SelectedValue);

			List<Metadata> metadatas = Litium.Extensions.Extensions.Instance.Metadata.GetMetadata(selectedMetadataType);
			foreach (Metadata metadata in metadatas)
			{
				foreach (Language language in FoundationContext.Solution.Languages)
				{
					MetadataTranslation t = metadata.Translations.GetMetadataTranslation(language.Culture);
					if (t != null && t.Translation == args.Value)
					{
						args.IsValid = false;
						break;
					}
				}
			}
		}

		/// <summary>
		/// Loads the metadata items.
		/// </summary>
		/// <param name="target">The target.</param>
		/// <param name="metadataType">Type of the meta data.</param>
		private void InitMetadataRepeaterAndHeader(Repeater target, short metadataType)
		{
			#region -- InitMetadataRepeater --

			List<Metadata> metadatas = new List<Metadata>();
			foreach (Metadata metadata in Litium.Extensions.Extensions.Instance.Metadata)
			{
				if (metadata.WebSiteID == Guid.Empty || metadata.WebSiteID == new Guid(m_dropDownListWebsites.SelectedValue))
					if (metadata.Type == metadataType)
						metadatas.Add(metadata);
			}

			Language language = Solution.Instance.Languages.GetLanguage(new Guid(m_dropDownListMetadataLanguages.SelectedValue));
			if (language != null)
				metadatas.Sort(new MetadataTranslationAscendingComparer(language.Culture));

			target.DataSource = metadatas;
			target.DataBind();

			MetadataType type = Litium.Extensions.Extensions.Instance.Metadata.Types.GetMetadataType(metadataType);
			m_literalMetadataName.Text = type != null ? type.Description : string.Empty;

			#endregion (InitMetadataRepeater)
		}

		/// <summary>
		/// Handles the SelectedIndexChanged event of the DropDownListMetadataTypes control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
		protected void DropDownListMetadataTypes_SelectedIndexChanged(object sender, EventArgs e)
		{
			InitMetadataRepeaterAndHeader(m_repeaterMetadata, Convert.ToInt16(m_dropDownListMetadataTypes.SelectedValue));
		}

		protected void DropDownListMetadataLanguages_SelectedIndexChanged(object sender, EventArgs e)
		{
			short selectedValue;
			if (!short.TryParse(m_dropDownListMetadataTypes.SelectedValue, out selectedValue))
				selectedValue = 0;

			InitMetadataRepeaterAndHeader(m_repeaterMetadata, selectedValue);
		}

		/// <summary>
		/// Initialises the validators
		/// </summary>
		private void InitValidators()
		{
			m_requiredFieldValidatorType.ErrorMessage = Solution.Instance.SystemStrings[METADATA_VALIDATOR_TYPE, FoundationContext.Culture];
			m_rangeValidatorType.ErrorMessage = Solution.Instance.SystemStrings[METADATA_VALIDATOR_TYPE, FoundationContext.Culture];
			m_customValidatorMetadataTranslation.ErrorMessage = Solution.Instance.SystemStrings[METADATA_VALIDATOR_METADATA_TRANSLATION, FoundationContext.Culture];
		}

		private void InitMetadataLanguageDropDownList()
		{
			// Iterate through languages and create the listitems
			foreach (Language language in FoundationContext.Solution.Languages)
			{
				ListItem languageItem = new ListItem(language.Name, language.ID.ToString());

				// Set default language as selected
				if (language.IsDefaultLanguage)
				{
					languageItem.Selected = true;
				}

				m_dropDownListMetadataLanguages.Items.Add(languageItem);
			}
		}

		/// <summary>
		/// Inits the metadata dropdownlist and preselects the first listitem
		/// </summary>
		private void InitMetadataTypeDropDownList(short? selectedType)
		{
			// get all metadatatypes
			List<MetadataType> metaDataTypes = Litium.Extensions.Extensions.Instance.Metadata.Types.All;

			SortedList<string, short> sortedListItems = new SortedList<string, short>();

			// Iterate through metaDataTypes and create the listitems
			foreach (MetadataType metadataType in metaDataTypes)
			{
				string text = metadataType.Description;
				sortedListItems.Add(text, metadataType.Type);
			}

			// Init list that will hold all listitems
			List<ListItem> listItems = new List<ListItem>();

			foreach (KeyValuePair<string, short> s in sortedListItems)
			{
				ListItem listItem = new ListItem(s.Key, s.Value.ToString());
				if (selectedType != null && s.Value == selectedType.Value)
					listItem.Selected = true;

				listItems.Add(listItem);
			}

			// if we have atleast one listitem then preselect it
			if (listItems.Count > 0)
				listItems[0].Selected = true;

			// Bind the datasource
			m_dropDownListMetadataTypes.DataTextField = "Text";
			m_dropDownListMetadataTypes.DataValueField = "Value";
			m_dropDownListMetadataTypes.DataSource = listItems;
			m_dropDownListMetadataTypes.DataBind();
		}

		/// <summary>
		/// Handles the ItemDataBound event of the RepeaterMetadata control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.Web.UI.WebControls.RepeaterItemEventArgs"/> instance containing the event data.</param>
		protected void RepeaterMetadata_ItemDataBound(object sender, RepeaterItemEventArgs e)
		{
			#region -- RepeaterMetadata_ItemDataBound --

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				if (e.Item.DataItem is Metadata)
				{
					Metadata meta = (Metadata)e.Item.DataItem;

					// Get selected language from dropdown
					Language currentLanguage = FoundationContext.Solution.Languages.GetLanguage(new Guid(m_dropDownListMetadataLanguages.SelectedValue));

					MetadataTranslation translation = meta.Translations.GetMetadataTranslation(currentLanguage.Culture);

					// if selected language has no translation create one.
					if (translation == null)
					{
						meta.Translations.CreateMetadataTranslation(currentLanguage.Culture, "Not translated to language");
						translation = meta.Translations.GetMetadataTranslation(currentLanguage.Culture);
					}

					int pageCount = meta.PageIDs.Count;

					Label labelText = (Label)e.Item.FindControl("labelText");
					if (labelText != null && translation != null)
					{
						labelText.Text = translation.Translation;
						if (pageCount > 0)
							labelText.Text += " <b>" + FoundationContext.SystemStrings[METADATA_USAGE, FoundationContext.Culture].Replace("##COUNT##", pageCount.ToString()) + "</b>";
					
					}

					ImageButton imageButtonDelete = (ImageButton)e.Item.FindControl("m_imageButtonDelete");
					ImageButton imageButtonEdit = (ImageButton)e.Item.FindControl("m_imageButtonEdit");
					ImageButton imageButtonDeleteLinks = (ImageButton)e.Item.FindControl("m_imageButtonDeleteLinks");

					if (imageButtonDelete != null && imageButtonEdit != null && imageButtonDeleteLinks != null)
					{
						imageButtonEdit.CommandName = "Edit";
						imageButtonEdit.CommandArgument = meta.ID.ToString();

						if (pageCount > 0)
						{
							imageButtonDelete.Enabled = false;
							imageButtonDelete.ImageUrl = "~/Extensions/Common/Images/delete_disabled_16px.png";

							string confirmMessage = Solution.Instance.SystemStrings[METADATA_CONFIRM_DELETE_METADATALINKS, FoundationContext.Culture];
							if (string.IsNullOrEmpty(confirmMessage))
								confirmMessage = "Really delete all connections to pages?";

							imageButtonDeleteLinks.OnClientClick = "return confirm('" + confirmMessage + "');";
							imageButtonDeleteLinks.CommandName = "DeleteLinks";
							imageButtonDeleteLinks.CommandArgument = meta.ID.ToString();
						}
						else
						{
							string confirmMessage = Solution.Instance.SystemStrings[METADATA_CONFIRM_DELETE_METADATA, FoundationContext.Culture];
							if (string.IsNullOrEmpty(confirmMessage))
								confirmMessage = "Really delete this Metadata?";

							imageButtonDelete.OnClientClick = "return confirm('" + confirmMessage + "');";
							imageButtonDelete.CommandName = "Delete";
							imageButtonDelete.CommandArgument = meta.ID.ToString();

							imageButtonDeleteLinks.ImageUrl = "~/Extensions/Common/Images/deletelinks_disabled_16px.png";
							imageButtonDeleteLinks.Enabled = false;
						}
					}
				}
			}

			#endregion (RepeaterMetadata_ItemDataBound)
		}

		/// <summary>
		/// Handles the ItemCommand event of the RepeaterMetadata control.
		/// </summary>
		/// <param name="source">The source of the event.</param>
		/// <param name="e">The <see cref="System.Web.UI.WebControls.RepeaterCommandEventArgs"/> instance containing the event data.</param>
		protected void RepeaterMetadata_ItemCommand(object source, RepeaterCommandEventArgs e)
		{
			#region -- RepeaterMetadata_ItemCommand --

			if (e.CommandName == "Delete")
			{
				DeleteMetadataItem(e);
			}
			else if (e.CommandName == "DeleteLinks")
			{
				DeleteMetadataLinks(e);
			}
			else if (e.CommandName == "Edit")
			{
				EditMetadataItem(e);
			}

			InitMetadataRepeaterAndHeader(m_repeaterMetadata, Convert.ToInt16(m_dropDownListMetadataTypes.SelectedValue));

			#endregion (RepeaterMetadata_ItemCommand)
		}

		/// <summary>
		/// Saves the metadata item.
		/// </summary>
		/// <param name="e">The <see cref="System.Web.UI.WebControls.RepeaterCommandEventArgs"/> instance containing the event data.</param>
		private void EditMetadataItem(RepeaterCommandEventArgs e)
		{
			#region -- EditMetadataItem --

			if (StringUtilities.IsGuid(e.CommandArgument.ToString()))
			{
				Metadata metadata = Litium.Extensions.Extensions.Instance.Metadata.GetMetadata(new Guid(e.CommandArgument.ToString()));
				if (metadata != null)
				{
					// Get selected language from dropdown
					Language currentLanguage = FoundationContext.Solution.Languages.GetLanguage(new Guid(m_dropDownListMetadataLanguages.SelectedValue));

					MetadataTranslation translation = metadata.Translations.GetMetadataTranslation(currentLanguage.Culture);
					if (translation != null)
					{
						m_textBoxEditMetadataTranslation.Text = translation.Translation;
						m_placeHolderEditMetadata.Visible = true;
						m_placeHolderAddMetadata.Visible = false;
						m_dropDownListMetadataLanguages.Enabled = false;
						Session["EditedMetadataID"] = metadata.ID;
					}
				}
			}

			#endregion (EditMetadataItem)
		}

		/// <summary>
		/// Deletes the metadata item.
		/// </summary>
		/// <param name="e">The <see cref="System.Web.UI.WebControls.RepeaterCommandEventArgs"/> instance containing the event data.</param>
		private static void DeleteMetadataItem(RepeaterCommandEventArgs e)
		{
			#region -- DeleteMetadataItem --

			Guid id = new Guid(e.CommandArgument.ToString());

			Metadata metadata = Litium.Extensions.Extensions.Instance.Metadata.GetMetadata(id);
			if (metadata != null)
			{
				if (metadata.PageIDs.Count == 0)
				{
					metadata.Delete();
				}
			}

			#endregion (DeleteMetadataItem)
		}

		/// <summary>
		/// Deletes links to pages for metadata item.
		/// </summary>
		/// <param name="e">The <see cref="System.Web.UI.WebControls.RepeaterCommandEventArgs"/> instance containing the event data.</param>
		private static void DeleteMetadataLinks(RepeaterCommandEventArgs e)
		{
			#region -- DeleteMetadataItem --

			Guid id = new Guid(e.CommandArgument.ToString());

			Metadata metadata = Litium.Extensions.Extensions.Instance.Metadata.GetMetadata(id);

			if (metadata == null)
				return;

			if (metadata.PageIDs.Count == 0)
				return;


			foreach (Guid pageID in metadata.PageIDs)
			{
				metadata.DeleteFromPage(pageID);
			}

			#endregion (DeleteMetadataItem)
		}

		/// <summary>
		/// Adds the meta data.
		/// </summary>
		/// <param name="text">The text.</param>
		/// <param name="metadataType">Type of the metadata.</param>
		private void AddMetaData(string text, short metadataType)
		{
			if (!string.IsNullOrEmpty(text) && text.Length < 200)
			{
				Metadata metaData = Litium.Extensions.Extensions.Instance.Metadata.CreateMetadata(Guid.NewGuid(), metadataType, new Guid(m_dropDownListWebsites.SelectedValue));

				// Create translation for all languages.
				foreach (Language language in FoundationContext.Solution.Languages)
				{
					metaData.Translations.CreateMetadataTranslation(language.Culture, text);
				}
			}
		}

		/// <summary>
		/// Trigged when the user clicked on the toolbarItemBack 
		/// </summary>
		/// <param name="sender">Toolbar item back.</param>
		/// <param name="e">Event args.</param>
		protected void ToolbarItemBackClick(object sender, EventArgs e)
		{
			Response.Redirect("~" + Litium.Foundation.GUI.Constants.UrlConstants.CONTROL_PANEL_PAGE);
		}
	}
}