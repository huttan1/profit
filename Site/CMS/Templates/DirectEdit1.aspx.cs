using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using ComponentArt.Web.UI;
using Litium.Extensions.DirectEdit.Constants;
using Litium.Extensions.DirectEdit.Utilities;
using Litium.Extensions.DirectEdit.WebControls;
using Litium.Foundation.Modules;
using Litium.Foundation.Modules.CMS;
using Litium.Foundation.Modules.CMS.Content;
using Litium.Foundation.Modules.CMS.GUI.EditPages.Carriers;
using Litium.Foundation.Modules.CMS.Pages;
using System.Web.UI.WebControls;
using System;

public partial class Templates_DirectEdit1 : Litium.Foundation.Modules.CMS.GUI.Templates.ContentPageTemplate
{
	internal Guid m_editPageID = Guid.Empty;
	protected Page m_editedPage;
	protected Page m_topPage;
	protected WorkingCopy m_workingCopy;
	protected bool m_isNewPage;
	protected Guid m_parentPageId = Guid.Empty;

	protected bool m_hasPreviewPermission = false;
	protected bool m_hasSaveWorkingCopyPermission = false;
	protected bool m_hasSaveForPublishPermission = false;
	protected bool m_hasPublishPermission = false;
	protected bool m_hasCancelPermission = false;
	protected bool m_hasCancelAndDeleteWorkingCopyPermission = false;

	protected override void OnInit(EventArgs e)
	{
		base.OnInit(e);

		if (!CurrentState.IsInAdministrationMode)
		{
			Guid editPageID = Guid.Empty;
			if (!string.IsNullOrEmpty(Request.QueryString["EditPageID"]))
				editPageID = new Guid(Request.QueryString["EditPageID"]);

			if (editPageID != Guid.Empty && CurrentState.ModuleCMS.PermissionManager.UserHasPageReadPermission(CurrentState.User.ID, editPageID, true, true))
			{
				m_editedPage = CurrentState.WebSite.GetPage(editPageID, FoundationContext.Token);
			}

			if (m_editedPage != null)
			{
				// Set the PageType of property repeater
				m_editPropertyRepeater.PageType = m_editedPage.PageType;
				m_parentPageId = m_editedPage.ParentPageID;
			}
		}
	}

	/// <summary>
	/// Handles the Load event of the Page control.
	/// </summary>
	/// <param name="sender">The source of the event.</param>
	/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
	public void Page_Load(object sender, EventArgs e)
	{
		if (m_editedPage == null)
		{
			m_placeHolderNoEditPage.Visible = true;
			m_placeHolderContent.Visible = false;
			return;
		}
		
		m_editedPage.Refresh();
		try
		{
			// If page has workingcopy, get it, else create a workingcopy
			if (m_editedPage.HasWorkingCopy)
				m_workingCopy = m_editedPage.GetWorkingCopy(FoundationContext.Token);

			if (m_workingCopy == null)
				m_workingCopy = m_editedPage.CreateWorkingCopy(FoundationContext.Token);
		}
		catch (Exception)
		{
			Response.Redirect(m_editedPage.GetUrlToPage(CurrentState.WebSiteID, CurrentState.IsInAdministrationMode));
		}

		InitPermissions();
		m_isNewPage = Request.QueryString["NewPage"] != null;
		m_panelNewPageFields.Visible = m_isNewPage;

		if (!IsPostBack)
		{
			// Get all content propertys from the page
			AddContentProperties();
			m_editPropertyRepeater.ParentID = m_editedPage.ID;
			m_editPropertyRepeater.WorkingCopy = m_workingCopy;

			// If editing a new page, show page name field
			if (!string.IsNullOrEmpty(Request.QueryString["NewPage"]))
				m_panelNewPageFields.Visible = true;

			InitToolBars();
		}
		
	}

	private void AddContentProperties()
	{
		ListDictionary contentProperties = new ListDictionary();
		List<Property> propertys = new List<Property>();

		var creator = new PageTypePropertyCreator();
		creator.CreateOnWorkingCopy(m_workingCopy);
		
		foreach (Property contentProperty in m_workingCopy.Content)
		{
			// Dont user ebedded images in the property list (these are created by the editors image upload function)
			if (!contentProperty.Name.StartsWith("EmbeddedImg_"))
				propertys.Add(contentProperty);
		}
			
		propertys.Sort(new PropertySorter());

		foreach (Property contentProperty in propertys)
			contentProperties.Add(contentProperty.Name, contentProperty);

		Session[SessionConstants.PROPERTY_CARRIER_LIST] = new PropertiesCarrier(m_editedPage.ID, contentProperties, null,
		                                                                        m_workingCopy.Content,
		                                                                        m_workingCopy.Settings);
	}

	/// <summary>
	/// Checks users permissions (publish, write, etc) and sets membervariables accordingly
	/// </summary>
	protected void InitPermissions()
	{
		PermissionUtilities permissionUtils = new PermissionUtilities(FoundationContext.Token);

		m_hasPreviewPermission = permissionUtils.HasPreviewPermission(m_editedPage);
		m_hasSaveWorkingCopyPermission = permissionUtils.HasSaveWorkingCopyPermission(m_editedPage);
		m_hasSaveForPublishPermission = permissionUtils.HasSaveForPublishPermission(m_editedPage);
		m_hasPublishPermission = permissionUtils.HasPublishPermission(m_editedPage);
		m_hasCancelPermission = permissionUtils.HasCancelPermission(m_editedPage);
		m_hasCancelAndDeleteWorkingCopyPermission = permissionUtils.HasCancelAndDeleteWorkingCopyPermission(m_editedPage);
	}

	private void ValidateDateOrder()
	{
		DateTime? startDate = null;
		DateTime? endDate = null;

		foreach (System.Web.UI.Control control in m_editPropertyRepeater.Controls)
		{
			if(control is PropertyRepeaterItem)
			{
				PropertyRepeaterItem propertyRepeaterItem = (PropertyRepeaterItem)control;
				if(propertyRepeaterItem.Property is DateTimeProperty)
				{
					foreach (System.Web.UI.Control innerControl in propertyRepeaterItem.Controls)
					{
						if(innerControl is DateTimeCalendar)
						{
							foreach(System.Web.UI.Control dateTimeTemplateItem in innerControl.Controls)
							{
								if(dateTimeTemplateItem is DateTimeTemplateItem)
								{
									DateTimeTemplateItem tmpTemplateItem = (DateTimeTemplateItem)dateTimeTemplateItem;
									string[] idArray = tmpTemplateItem.ID.Split(StringConstants.DELIMITER);
									if(idArray.Length == 3)
									{
										ComponentArt.Web.UI.Calendar calendar = tmpTemplateItem.FindControl(WebControlUtilities.GetPropertyCalendarID(idArray[1], Convert.ToInt32(idArray[2]))) as ComponentArt.Web.UI.Calendar;
										TextBox textBox = tmpTemplateItem.FindControl(WebControlUtilities.GetPropertyTextBoxID(idArray[1], Convert.ToInt32(idArray[2]))) as TextBox;
										if(calendar != null && textBox != null)
										{
											if (calendar.SelectedDate > DateTime.MinValue)
											{
												string[] timeArray = textBox.Text.Split(':');
												DateTime selectedDateTime = new DateTime(calendar.SelectedDate.Year, calendar.SelectedDate.Month, calendar.SelectedDate.Day, Convert.ToInt32(timeArray[0]), Convert.ToInt32(timeArray[1]), 0);

												string propertyName = idArray[1];
												if (propertyName == "StartDate")
													startDate = selectedDateTime;
												if (propertyName == "EndDate")
													endDate = selectedDateTime;
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}

		NewsDateContinuityValidator.IsValid = startDate == null || endDate == null || startDate <= endDate;
	}

	/// <summary>
	/// Redirects the user to edited page if it is published, or edited pages parent if it is published, else to current websites startpage.
	/// </summary>
	internal void RedirectUserAfterSave()
	{
		if (m_editedPage != null)
		{
			// Get the page again to get a fresh copy
			m_editedPage = CurrentState.WebSite.GetPage(m_editedPage.ID, FoundationContext.Token);
			
			if (m_editedPage != null && m_editedPage.Status == PageStatus.PUBLISHED)
			{
			 	Response.Redirect(m_editedPage.GetUrlToPage(CurrentState.WebSiteID, CurrentState.IsInAdministrationMode));
			}
			else if (m_parentPageId != Guid.Empty)
			{
				// Get edited pages parent page and redirect
				Page parentPage = CurrentState.WebSite.GetPage(m_parentPageId, FoundationContext.Token);
				if (parentPage != null && parentPage.Status == PageStatus.PUBLISHED)
				{
					Response.Redirect(parentPage.GetUrlToPage(CurrentState.WebSiteID, CurrentState.IsInAdministrationMode));
				}
			}
		}

		// No other redirects were made, redirect to current websites top page
		Response.Redirect(ResolveUrl(CurrentState.WebSite.GetTopPage(FoundationContext.Token).Url));
	}

	/// <summary>
	/// Creates a log entry in the EditorsComment propertys text. Provides name of current user, date when page changed and provided comment.
	/// </summary>
	internal void SaveLogInNotes()
	{
		if (!string.IsNullOrEmpty(m_textBoxEditorNotes.Text))
		{
			StringLongSimpleProperty editorsComment = m_workingCopy.Settings["EditorsComment"] as StringLongSimpleProperty;
			
			// If property doesent exist, create it! :)
			if (editorsComment == null)
				editorsComment = m_workingCopy.Settings.CreateStringLongSimpleProperty("EditorsComment", false, true, false, FoundationContext.SystemToken);

			if ( editorsComment != null )
			{
				string userText = CurrentState.Token.User.DisplayName + " (" + DateTime.Now.ToString( "yyyy-MM-dd HH:mm" ) + ")";
				userText += "\r\n" + m_textBoxEditorNotes.Text;

				string editorText =  (editorsComment.ValueCount > 0) ? editorsComment.GetValue() : "";

				editorText += "\r\n\r\n" + userText;

				editorsComment.SetValue(editorText, FoundationContext.Token);
			}
		}
	}

	/// <summary>
	/// Saves data entered by the page
	/// </summary>
	/// <returns>True if the data saved correctly otherwise false</returns>
	public bool SaveData()
	{
		if(m_workingCopy != null)
		{
			// Save short name on page
			if(m_panelNewPageFields.Visible)
				m_workingCopy.SetShortName(m_textBoxPageName.Text, FoundationContext.Token);

			if(m_isNewPage)
			{
				m_editedPage.SetUrlName(Litium.Foundation.Modules.CMS.Pages.Page.SuggestUrlName(m_editedPage.ParentPageID, m_editedPage.ID, m_textBoxPageName.Text), FoundationContext.Token);

				if (!FoundationContext.User.IsAnonymousUser)
					m_editedPage.SetResponsibleUserID(FoundationContext.User.ID, FoundationContext.Token);
			}

			PropertiesCarrier properties = Session[SessionConstants.PROPERTY_CARRIER_LIST] as PropertiesCarrier;
			bool dataIsSaved;
            if (properties != null)
            {
                dataIsSaved = PagesUtilities.SaveData(m_editPropertyRepeater, properties.ContentProperties, FoundationContext.Token);
                Session[SessionConstants.PROPERTY_CARRIER_LIST] = properties;
            }
            else
            {
                dataIsSaved = PagesUtilities.SaveData(m_editPropertyRepeater, null, FoundationContext.Token);
            }

            return dataIsSaved;
		}

		return false;
	}

    protected void ToolBar_ItemCommand(object sender, ToolBarItemEventArgs e)
    {
		switch (e.Item.ID)
		{
			case "Cancel":
				RedirectUserAfterSave(); 
				break;
			case "Delete":
				if (m_workingCopy.Page.ShortName == "Ny sida")
					m_workingCopy.Page.Delete(FoundationContext.Token);
				else
					m_workingCopy.Delete(FoundationContext.Token);

				RedirectUserAfterSave();
				break;
			case "View":
				ValidateDateOrder();

				if (IsValid && SaveData())
				{
                    string leUrl = m_editedPage.GetUrlToPage(CurrentState.WebSiteID, CurrentState.IsInAdministrationMode) + "?WorkingCopyID=" + m_workingCopy.ID + "&InAdministrationMode=TRUE";
					string script = "window.open('" + leUrl + "','previewWindow','')";
					Page.ClientScript.RegisterStartupScript(GetType(), "NewWindow", script, true);
				}
				break;
			case "Save":
				ValidateDateOrder();

				if (IsValid && SaveData())
				{
					SaveLogInNotes();
					m_editPropertyRepeater.Visible = false;

					RedirectUserAfterSave();
				}
				break;
			case "Publish":
				ValidateDateOrder();

				if (IsValid && SaveData())
				{
					SaveLogInNotes();
					m_editPropertyRepeater.Visible = false;
					m_workingCopy.Publish(false, FoundationContext.Token);

					RedirectUserAfterSave();
				}
				break;
			case "SaveForPublish":
				ValidateDateOrder();

				if (IsValid && SaveData())
				{
					SaveLogInNotes();
					m_editPropertyRepeater.Visible = false;
					m_workingCopy.SetReadyToPublish(FoundationContext.Token);

					RedirectUserAfterSave();
				}
				break;
		}
    }

	protected void InitToolBars()
	{
		ArrayList items = new ArrayList();

		items.AddRange(m_toolBar1.Items);
		items.AddRange(m_toolBar2.Items);

		foreach (ToolBarItem item in items)
		{
			switch (item.ID)
			{
				case "Cancel":
					string cancel = ((StringShortProperty)CurrentPage.Content["ButtonCancel"]).GetValue();
					item.Text = cancel ?? "Cancel";
					item.Visible = !m_isNewPage;
					break;
				case "Delete":
					string delete = ((StringShortProperty)CurrentPage.Content["ButtonCancelAndDelete"]).GetValue();
					item.Text = delete ?? "Delete";
					item.Visible = m_workingCopy != null && m_hasCancelAndDeleteWorkingCopyPermission;
					break;
				case "View":
					string preview = ((StringShortProperty)CurrentPage.Content["ButtonPreview"]).GetValue();
					item.Text = preview ?? "View";
					item.Visible = m_hasPreviewPermission;
					break;
				case "Save":
					string save = ((StringShortProperty)CurrentPage.Content["ButtonSave"]).GetValue();
					item.Text = save ?? "Save";
					item.Visible = m_hasSaveWorkingCopyPermission;
					break;
				case "SaveForPublish":
					string saveForPublish = ((StringShortProperty)CurrentPage.Content["ButtonSaveForPublish"]).GetValue();
					item.Text = saveForPublish ?? "SaveForPublish";
					item.Visible = m_hasSaveForPublishPermission;
					break;
				case "Publish":
					string saveAndPublish = ((StringShortProperty)CurrentPage.Content["ButtonSaveAndPublish"]).GetValue();
					item.Text = saveAndPublish ?? "Publish";
					item.Visible = m_editedPage != null && m_hasPublishPermission && (!m_editedPage.IsSharedPage || (m_editedPage.IsSharedPage && Module<ModuleCMS>.Instance.CacheManager.SiteMapCache.GetPage(m_editedPage.MasterPageID).PageStatus == PageStatus.PUBLISHED));
					break;
			}
		}
	}
}

/// <summary>
/// A comparer to sort an array of Propertys
/// </summary>
public class PropertySorter : IComparer<Property>
{
	#region IComparer<Property> Members

	public int Compare(Property x, Property y)
	{
		if (x.Index < y.Index)
			return -1;
		if (x.Index == y.Index)
			return 0;
		if (x.Index > y.Index)
			return 1;

		return 0;
	}

	#endregion
}