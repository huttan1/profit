using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using ComponentArt.Web.UI;
using Litium.Extensions;
using Litium.Extensions.WebSiteSettings;
using Litium.Foundation;
using Litium.Foundation.GUI;
using Litium.Foundation.Modules.CMS;
using Litium.Foundation.Modules.CMS.WebSites;
using Litium.Studio.UI.Common.WebControls;
using Telerik.Web.UI;

public partial class Site_CMS_AddOns_WebSiteSettings : System.Web.UI.UserControl
{
	/// <summary>
	/// Page_Load
	/// </summary>
	protected void Page_Load(object sender, EventArgs e)
	{
		Authenticate();

		if (!IsPostBack)
			InitControls();

		InitButtons();
		m_labelSettingAlreadyExist.Text = string.Empty;
	}

	private void Authenticate()
	{
		if (!ModuleCMS.Instance.PermissionManager.UserHasAccessGUIPermission(FoundationContext.Current.User.ID, true, true))
			throw new Exception("Please login as system user.");
	}

	protected void InitControls()
	{
		InitDropDownListWebSites();
		InitSelectedWebSitesSettings();
		InitToolbar();
	}

	private void InitToolbar()
	{
		m_radioButtonListType.Items.Add(new ListItem(Solution.Instance.SystemStrings["Extensions_WS_AddNewShortStringValueButton", FoundationContext.Current.Culture], "ShortStringValue"));
		m_radioButtonListType.Items.Add(new ListItem(Solution.Instance.SystemStrings["Extensions_WS_AddNewLongStringValueButton", FoundationContext.Current.Culture], "LongStringValue"));
		m_radioButtonListType.Items.Add(new ListItem(Solution.Instance.SystemStrings["Extensions_WS_AddNewDateTimeValueButton", FoundationContext.Current.Culture], "DateTimeValue"));
		m_radioButtonListType.Items.Add(new ListItem(Solution.Instance.SystemStrings["Extensions_WS_AddNewNumberValueButton", FoundationContext.Current.Culture], "NumberValue"));
		m_radioButtonListType.Items.Add(new ListItem(Solution.Instance.SystemStrings["Extensions_WS_AddNewBooleanValueButton", FoundationContext.Current.Culture], "BooleanValue"));
	}

	private void InitButtons()
	{
		m_buttonCopyToWebSite.Text = Solution.Instance.SystemStrings["Extensions_WS_ButtonCopy", FoundationContext.Current.Culture];
		m_buttonCreate.Text = Solution.Instance.SystemStrings["Extensions_WS_AddNewSettingButton", FoundationContext.Current.Culture];
		m_buttonSaveValues.Text = Solution.Instance.SystemStrings["Extensions_WS_ButtonSave", FoundationContext.Current.Culture];
	}

	private void InitDropDownListWebSites()
	{
		m_dropDownListWebSites.Items.Clear();
		m_dropDownListWebSitesCopyTo.Items.Clear();
		SortedList<string, WebSite> websites = GetWebSiteList();
		m_panelCopyTo.Visible = websites.Values.Count > 1;
		if (m_panelCopyTo.Visible)
		{
			AddFirstItemToCopyDDL();
		}

		ListItem globalItem = new ListItem();
		globalItem.Value = Guid.Empty.ToString();
		globalItem.Text = Solution.Instance.SystemStrings["Extensions_WS_GlobalSettings", FoundationContext.Current.Culture];
		m_dropDownListWebSites.Items.Add(globalItem);

		foreach (WebSite site in websites.Values)
		{
			m_dropDownListWebSites.Items.Add(new ListItem(site.Name, site.ID.ToString()));

			if (m_panelCopyTo.Visible)
			{
				//Don't add selected site
				if (m_dropDownListWebSites.SelectedValue == site.ID.ToString())
					continue;
				m_dropDownListWebSitesCopyTo.Items.Add(new ListItem(site.Name, site.ID.ToString()));
			}
		}
	}

	private void InitSelectedWebSitesSettings()
	{
		m_repeaterWebSiteSettings.DataSource = Extensions.Instance.WebSiteSettings.GetWebSiteSettingsByWebSite(new Guid(m_dropDownListWebSites.SelectedValue));
		m_repeaterWebSiteSettings.DataBind();
	}

	protected void ToolBar_ItemCommand(object sender, ToolBarItemEventArgs e)
	{

	}

	protected void RepeaterWebSiteSettings_OnItemCommand(object source, RepeaterCommandEventArgs e)
	{
		if (e.CommandName == "Delete")
		{
			HiddenField settingIdField = (HiddenField)e.Item.FindControl("settingId");
			Guid settingId = new Guid(settingIdField.Value);
			WebSiteSetting setting = Extensions.Instance.WebSiteSettings.GetWebSiteSetting(settingId);
			setting.Delete();
			InitSelectedWebSitesSettings();
		}
	}

	protected void RepeaterWebSiteSettings_OnItemDataBound(object sender, RepeaterItemEventArgs e)
	{
		if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
		{
			WebSiteSetting setting = (WebSiteSetting)e.Item.DataItem;
			HiddenField settingId = (HiddenField)e.Item.FindControl("settingId");
			Label labelSettingName = (Label)e.Item.FindControl("labelSettingName");
			PlaceHolder panelShortStringValue = (PlaceHolder)e.Item.FindControl("panelShortStringValue");
			PlaceHolder panelLongStringValue = (PlaceHolder)e.Item.FindControl("panelLongStringValue");
			PlaceHolder panelDateTimeValue = (PlaceHolder)e.Item.FindControl("panelDateTimeValue");
			PlaceHolder panelNumberValue = (PlaceHolder)e.Item.FindControl("panelNumberValue");
			PlaceHolder panelBooleanValue = (PlaceHolder)e.Item.FindControl("panelBooleanValue");
			ImageButton imageButtonDelete = (ImageButton)e.Item.FindControl("imageButtonDelete");
			CheckBox checkBoxCopy = (CheckBox)e.Item.FindControl("checkBoxCopy");

			if (imageButtonDelete != null)
			{
				if (m_buttonSaveValues.Visible)
				{
					imageButtonDelete.Visible = true;
					imageButtonDelete.OnClientClick = string.Format("if(!confirm('{0}')) return false;", Solution.Instance.SystemStrings["Extensions_WS_ButtonDeleteSettinConfirmation", FoundationContext.Current.Culture]);
				}
			}

			if (checkBoxCopy != null && m_buttonCopyToWebSite.Visible)
			{
				checkBoxCopy.Visible = true;
			}

			if (settingId != null && labelSettingName != null)
			{
				settingId.Value = setting.ID.ToString();
				labelSettingName.Text = setting.Name;
			}

			switch (setting.Type)
			{
				case WebSiteSettingTypes.ShortString:
					panelShortStringValue.Visible = true;
					TextBox textBoxShortStringValue = (TextBox)e.Item.FindControl("textBoxStringValue");
					textBoxShortStringValue.Text = ((ShortStringWebSiteSetting)setting).Value;
					break;
				case WebSiteSettingTypes.LongString:
					panelLongStringValue.Visible = true;
					HtmlEditor htmlEditor = (HtmlEditor)e.Item.FindControl("htmlEditorLongString");
					htmlEditor.Text = ((LongStringWebSiteSetting)setting).Value;
					break;
				case WebSiteSettingTypes.DateTime:
					panelDateTimeValue.Visible = true;
					RadDatePicker radDatePickerOriginal = (RadDatePicker)e.Item.FindControl("radDatePickerOriginal");
					radDatePickerOriginal.SelectedDate = ((DateTimeWebSiteSetting)setting).Value;
					break;
				case WebSiteSettingTypes.Number:
					panelNumberValue.Visible = true;
					RadNumericTextBox radNumericTextBoxNumberValue = (RadNumericTextBox)e.Item.FindControl("radNumericTextBoxNumberValue");
					radNumericTextBoxNumberValue.Value = ((NumberWebSiteSetting)setting).Value != null ? (double)((NumberWebSiteSetting)setting).Value.Value : 0;
					break;
				case WebSiteSettingTypes.Boolean:
					panelBooleanValue.Visible = true;
					CheckBox checkBoxBooleanValue = (CheckBox)e.Item.FindControl("checkBoxBooleanValue");
					checkBoxBooleanValue.Checked = ((BooleanWebSiteSetting)setting).Value != null ? ((BooleanWebSiteSetting)setting).Value.Value : true;
					break;
			}
		}
	}

	protected void DropDownListWebSites_SelectedIndexChanged(object sender, EventArgs e)
	{
		SortedList<string, WebSite> websites = GetWebSiteList();

		m_dropDownListWebSitesCopyTo.Items.Clear();
		m_panelCopyTo.Visible = websites.Values.Count > 1;
		if (m_panelCopyTo.Visible)
		{
			AddFirstItemToCopyDDL();
		}
		foreach (WebSite site in websites.Values)
		{
			if (m_panelCopyTo.Visible)
			{
				//Don't add selected site
				if (m_dropDownListWebSites.SelectedValue == site.ID.ToString())
					continue;
				m_dropDownListWebSitesCopyTo.Items.Add(new ListItem(site.Name, site.ID.ToString()));
			}
		}

		InitSelectedWebSitesSettings();
		DropDownListWebSitesCopyTo_SelectedIndexChanged(null, null);
	}


	protected void DropDownListWebSitesCopyTo_SelectedIndexChanged(object sender, EventArgs e)
	{
		if (!string.IsNullOrEmpty(m_dropDownListWebSitesCopyTo.SelectedValue))
		{
			m_buttonCopyToWebSite.Visible = true;
			m_buttonSaveValues.Visible = false;
		}
		else
		{
			m_buttonCopyToWebSite.Visible = false;
			m_buttonSaveValues.Visible = true;
		}

		InitSelectedWebSitesSettings();
	}

	protected void ButtonSaveValues_Click(object sender, EventArgs e)
	{
		foreach (RepeaterItem item in m_repeaterWebSiteSettings.Items)
		{
			if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
			{
				HiddenField settingId = (HiddenField)item.FindControl("settingId");
				if (settingId != null)
				{
					WebSiteSetting setting = Extensions.Instance.WebSiteSettings.GetWebSiteSetting(new Guid(settingId.Value));
					if (setting != null)
					{
						switch (setting.Type)
						{
							case WebSiteSettingTypes.ShortString:
								TextBox textBoxStringValue = (TextBox)item.FindControl("textBoxStringValue");
								((ShortStringWebSiteSetting)setting).SetValue(textBoxStringValue.Text);
								break;
							case WebSiteSettingTypes.LongString:
								HtmlEditor htmlEditorLongString = (HtmlEditor)item.FindControl("htmlEditorLongString");
								((LongStringWebSiteSetting)setting).SetValue(htmlEditorLongString.Text);
								break;
							case WebSiteSettingTypes.DateTime:
								RadDatePicker radDatePickerOriginal = (RadDatePicker)item.FindControl("radDatePickerOriginal");
								((DateTimeWebSiteSetting)setting).SetValue(radDatePickerOriginal.SelectedDate.GetValueOrDefault());
								break;
							case WebSiteSettingTypes.Number:
								RadNumericTextBox radNumericTextBoxNumberValue = (RadNumericTextBox)item.FindControl("radNumericTextBoxNumberValue");
								((NumberWebSiteSetting)setting).SetValue(radNumericTextBoxNumberValue.Value.GetValueOrDefault());
								break;
							case WebSiteSettingTypes.Boolean:
								CheckBox checkBoxBooleanValue = (CheckBox)item.FindControl("checkBoxBooleanValue");
								((BooleanWebSiteSetting)setting).SetValue(checkBoxBooleanValue.Checked);
								break;
						}
					}
				}
			}
		}

		InitSelectedWebSitesSettings();
	}

	protected void ButtonCopyToWebSite_Click(object sender, EventArgs e)
	{
		foreach (RepeaterItem item in m_repeaterWebSiteSettings.Items)
		{
			if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
			{
				CheckBox checkBoxCopy = (CheckBox)item.FindControl("checkBoxCopy");
				if (checkBoxCopy != null && checkBoxCopy.Checked)
				{
					HiddenField settingId = (HiddenField)item.FindControl("settingId");
					if (settingId != null)
					{
						WebSiteSetting setting = Extensions.Instance.WebSiteSettings.GetWebSiteSetting(new Guid(settingId.Value));
						WebSiteSetting copyToSetting = Extensions.Instance.WebSiteSettings.GetWebSiteSettings(new Guid(m_dropDownListWebSitesCopyTo.SelectedValue), setting.Name);
						if (setting != null)
						{
							if (setting is ShortStringWebSiteSetting)
							{
								if (copyToSetting != null)
								{
									((ShortStringWebSiteSetting)copyToSetting).SetValue(((ShortStringWebSiteSetting)setting).Value);
								}
								else
								{

									Extensions.Instance.WebSiteSettings.CreateShortStringWebSiteSetting(
										new Guid(m_dropDownListWebSitesCopyTo.SelectedValue),
										setting.Name, ((ShortStringWebSiteSetting)setting).Value, setting.SortIndex);
								}
							}
							if (setting is LongStringWebSiteSetting)
							{
								if (copyToSetting != null)
								{
									((LongStringWebSiteSetting)copyToSetting).SetValue(((LongStringWebSiteSetting)setting).Value);
								}
								else
								{

									Extensions.Instance.WebSiteSettings.CreateLongStringWebSiteSetting(
										new Guid(m_dropDownListWebSitesCopyTo.SelectedValue),
										setting.Name, ((LongStringWebSiteSetting)setting).Value, setting.SortIndex);
								}
							}
							else if (setting is DateTimeWebSiteSetting)
							{
								if (copyToSetting != null)
								{
									((DateTimeWebSiteSetting)copyToSetting).SetValue(((DateTimeWebSiteSetting)setting).Value.GetValueOrDefault());
								}
								else
								{
									Extensions.Instance.WebSiteSettings.CreateDateTimeWebSiteSetting(
										new Guid(m_dropDownListWebSitesCopyTo.SelectedValue),
										setting.Name, ((DateTimeWebSiteSetting)setting).Value.GetValueOrDefault(), setting.SortIndex);
								}
							}
							else if (setting is NumberWebSiteSetting)
							{
								if (copyToSetting != null)
								{
									((NumberWebSiteSetting)copyToSetting).SetValue(((NumberWebSiteSetting)setting).Value.GetValueOrDefault());
								}
								else
								{
									Extensions.Instance.WebSiteSettings.CreateNumberWebSiteSetting(
										new Guid(m_dropDownListWebSitesCopyTo.SelectedValue),
										setting.Name, ((NumberWebSiteSetting)setting).Value.GetValueOrDefault(), setting.SortIndex);
								}
							}
							else if (setting is BooleanWebSiteSetting)
							{
								if (copyToSetting != null)
								{
									((BooleanWebSiteSetting)copyToSetting).SetValue(((BooleanWebSiteSetting)setting).Value.GetValueOrDefault());
								}
								else
								{
									Extensions.Instance.WebSiteSettings.CreateBooleanWebSiteSetting(
										new Guid(m_dropDownListWebSitesCopyTo.SelectedValue),
										setting.Name, ((BooleanWebSiteSetting)setting).Value.GetValueOrDefault(), setting.SortIndex);
								}
							}
						}
					}
				}
			}
		}

		m_dropDownListWebSites.SelectedValue = m_dropDownListWebSitesCopyTo.SelectedValue;
		m_dropDownListWebSitesCopyTo.SelectedValue = string.Empty;
		DropDownListWebSites_SelectedIndexChanged(null, null);
	}

	protected void ButtonCreate_Click(object sender, EventArgs e)
	{
		string settingName = m_textBoxNewSettingName.Text.Trim();
		if (!string.IsNullOrEmpty(settingName) && m_radioButtonListType.SelectedItem != null)
		{
			//Check if setting with same name already exist for chosen website
			WebSiteSetting setting = Extensions.Instance.WebSiteSettings.GetWebSiteSettings(new Guid(m_dropDownListWebSites.SelectedValue), settingName);
			if (setting != null)
			{
				m_labelSettingAlreadyExist.Text = Solution.Instance.SystemStrings["Extensions_WS_SettingAlreadyExist", FoundationContext.Current.Culture];
				return;
			}
			string selectedItem = m_radioButtonListType.SelectedItem.Value;

			foreach (WebSite site in ModuleCMS.Instance.WebSites)
			{
				//Skip chosen website
				if (site.ID.ToString() == m_dropDownListWebSites.SelectedValue)
					continue;

				//Check if setting with same name already exist in another websites with other type
				setting = Extensions.Instance.WebSiteSettings.GetWebSiteSettings(site.ID, settingName);
				if (setting != null && setting.Type + "Value" != selectedItem)
				{
					m_labelSettingAlreadyExist.Text =
						Solution.Instance.SystemStrings["Extensions_WS_SettingAlreadyExistInSite", FoundationContext.Current.Culture] + " " +
						site.Name + ". " +
						Solution.Instance.SystemStrings["Extensions_WS_YouCanCreateOnlyWithType", FoundationContext.Current.Culture] + " '" + setting.Type + "'";
					return;
				}
			}

			if (m_dropDownListWebSites.SelectedValue != Guid.Empty.ToString())
			{
				setting = Extensions.Instance.WebSiteSettings.GetGlobalWebSiteSetting(settingName);
				if (setting != null && setting.Type + "Value" != selectedItem)
				{
					m_labelSettingAlreadyExist.Text = Solution.Instance.SystemStrings["Extensions_WS_SettingAlreadyExistInGlobal", FoundationContext.Current.Culture] + " '" + setting.Type + "'";
					return;
				}
			}

			int settingIndex = m_repeaterWebSiteSettings.Items.Count + 1;

			if (!string.IsNullOrEmpty(selectedItem) && !string.IsNullOrEmpty(m_dropDownListWebSites.SelectedValue))
			{
				Guid webSiteId = new Guid(m_dropDownListWebSites.SelectedValue);
				switch (selectedItem)
				{
					case "ShortStringValue":
						Extensions.Instance.WebSiteSettings.CreateShortStringWebSiteSetting(webSiteId, settingName, "", settingIndex);
						break;
					case "LongStringValue":
						Extensions.Instance.WebSiteSettings.CreateLongStringWebSiteSetting(webSiteId, settingName, "", settingIndex);
						break;
					case "DateTimeValue":
						Extensions.Instance.WebSiteSettings.CreateDateTimeWebSiteSetting(webSiteId, settingName, DateTime.Now, settingIndex);
						break;
					case "NumberValue":
						Extensions.Instance.WebSiteSettings.CreateNumberWebSiteSetting(webSiteId, settingName, 0, settingIndex);
						break;
					case "BooleanValue":
						Extensions.Instance.WebSiteSettings.CreateBooleanWebSiteSetting(webSiteId, settingName, true, settingIndex);
						break;
				}
				m_textBoxNewSettingName.Text = string.Empty;
			}
		}

		InitSelectedWebSitesSettings();
	}
	private void AddFirstItemToCopyDDL()
	{
		ListItem firstItem = new ListItem();
		firstItem.Value = string.Empty;
		firstItem.Text = Solution.Instance.SystemStrings["Extensions_WS_SelectWebSiteCopyTo", FoundationContext.Current.Culture] + "...";
		m_dropDownListWebSitesCopyTo.Items.Add(firstItem);
	}
	private SortedList<string, WebSite> GetWebSiteList()
	{
		SortedList<string, WebSite> websites = new SortedList<string, WebSite>();
		foreach (WebSite site in ModuleCMS.Instance.WebSites)
		{
			websites.Add(site.Name, site);
		}
		return websites;
	}
}
