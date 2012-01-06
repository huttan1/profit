using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using Litium.Foundation.GUI.Constants;
using Litium.Studio.UI.CMS.Common;
using Litium.Foundation.GUI.Pages;
using Litium.Foundation.Log;
using Litium.Foundation.Modules.CMS;
using Litium.Foundation.Modules.CMS.WebSites;
using Litium.Foundation.Security;

namespace Extensions.Pages
{
	public partial class ObjectPostNotificationAdmin : BasePage
	{
		#region Constants

		private const string SYSTEM_STRING_UPDATE_ERROR = "extensions_op_settings_notification_update_error";
		private const string SYSTEM_STRING_UPDATE_OK = "extensions_op_settings_notification_update_ok";
		private const string WEBSITE_STRING_NOTIFICATION_BODY = "Extensions_OP_Notification_Body";
		private const string WEBSITE_STRING_NEWPOST_NOTIFICATION_BODY = "Extensions_OP_NewPost_Notification_Body";
		private const string WEBSITE_STRING_NOTIFICATION_RECEIVER = "Extensions_OP_Notification_Receiver";
		private const string WEBSITE_STRING_NOTIFICATION_SENDER = "Extensions_OP_Notification_Sender";
		private const string WEBSITE_STRING_NOTIFICATION_SUBJECT = "Extensions_OP_Notification_Subject";
		private const string WEBSITE_STRING_NEWPOST_NOTIFICATION_SUBJECT = "Extensions_OP_NewPost_Notification_Subject";

		#endregion Constants

		/// <summary>
		/// Authorizes the user for the current page
		/// </summary>
		/// <returns>True if authorization succedded, otherwise false.</returns>
		public override bool AuthorizeUser()
		{
			return FoundationContext.Token.HasSolutionPermission(BuiltInSolutionPermissionTypes.PERMISSION_ID_ALL, true, true);
		}

		/// <summary>
		/// Page_Load
		/// </summary>
		/// <param name="sender">.</param>
		/// <param name="e">.</param>
		private void Page_Load(object sender, EventArgs e)
		{
			// Set selected tab
			SettingsBaseMasterPage masterPage = Master as SettingsBaseMasterPage;
			if(masterPage != null)
				masterPage.SelectedTab = 2;

			// Init controls
			if (!IsPostBack)
			{
				InitButtons();
				InitWebSiteDropDownList();
				InitInputFields();
			}
		}

		/// <summary>
		/// Inits all the buttons
		/// </summary>
		private void InitButtons()
		{
			c_toolbarItemSave.Text = SystemStrings.GetValue(SystemStringConstants.TOOLBAR_SAVE, FoundationContext.Language.ID, true);
		}

		/// <summary>
		/// Fill input fields with current values
		/// </summary>
		private void InitInputFields()
		{
			Guid webSiteID = new Guid(m_dropDownListWebsites.SelectedValue);
			WebSite webSite = ModuleCMS.Instance.WebSites.GetWebSite(webSiteID);

			m_textBoxNotificationSender.Text = webSite.Strings.GetValue(WEBSITE_STRING_NOTIFICATION_SENDER);
			m_textBoxNotificationReceiver.Text = webSite.Strings.GetValue(WEBSITE_STRING_NOTIFICATION_RECEIVER);
			m_textBoxNotificationSubject.Text = webSite.Strings.GetValue(WEBSITE_STRING_NOTIFICATION_SUBJECT);
			m_textBoxNotificationBody.Text = webSite.Strings.GetValue(WEBSITE_STRING_NOTIFICATION_BODY);
			m_textBoxNewPostNotificationBody.Text = webSite.Strings.GetValue(WEBSITE_STRING_NEWPOST_NOTIFICATION_BODY);
			m_textBoxNewPostNotificationSubject.Text = webSite.Strings.GetValue(WEBSITE_STRING_NEWPOST_NOTIFICATION_SUBJECT);
		}

		/// <summary>
		/// Inits the web site drop down list.
		/// </summary>
		private void InitWebSiteDropDownList()
		{
			List<ListItem> webSites = new List<ListItem>();

			foreach (WebSite webSite in ModuleCMS.Instance.WebSites)
			{
				ListItem websiteItem = new ListItem();
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
		/// Trigged when the user clicked on the save button: saves the changes on the web site strings
		/// </summary>
		/// <param name="sender">Toolbar item save.</param>
		/// <param name="e">Event arguments.</param>
		protected void ToolbarItemSave_Click(object sender, EventArgs e)
		{
			if (Page.IsValid)
			{
				bool isSaved = true;
				try
				{
					Guid webSiteID = new Guid(m_dropDownListWebsites.SelectedValue);
					WebSite webSite = ModuleCMS.Instance.WebSites.GetWebSite(webSiteID);
					webSite.Strings.SetValue(WEBSITE_STRING_NOTIFICATION_SENDER, m_textBoxNotificationSender.Text, FoundationContext.Token);
					webSite.Strings.SetValue(WEBSITE_STRING_NOTIFICATION_RECEIVER, m_textBoxNotificationReceiver.Text, FoundationContext.Token);
					webSite.Strings.SetValue(WEBSITE_STRING_NOTIFICATION_SUBJECT, m_textBoxNotificationSubject.Text, FoundationContext.Token);
					webSite.Strings.SetValue(WEBSITE_STRING_NOTIFICATION_BODY, m_textBoxNotificationBody.Text, FoundationContext.Token);
					webSite.Strings.SetValue(WEBSITE_STRING_NEWPOST_NOTIFICATION_BODY, m_textBoxNewPostNotificationBody.Text, FoundationContext.Token);
					webSite.Strings.SetValue(WEBSITE_STRING_NEWPOST_NOTIFICATION_SUBJECT, m_textBoxNewPostNotificationSubject.Text, FoundationContext.Token);
				}
				catch (Exception exc)
				{
					isSaved = false;
					FoundationContext.Solution.Log.CreateLogEntry(GetType().FullName + "ButtonSave_Click", exc, LogLevels.MINOR_ERROR);
				}

				if (isSaved)
				{
					c_labelOkMessage.Text = SystemStrings.GetValue(SYSTEM_STRING_UPDATE_OK, FoundationContext.Language.ID, true);
					c_panelOkMessage.Visible = true;
					c_panelMajorError.Visible = false;
				}
				else
				{
					c_labelMajorError.Text = SystemStrings.GetValue(SYSTEM_STRING_UPDATE_ERROR, FoundationContext.Language.ID, true);
					c_panelMajorError.Visible = true;
					c_panelOkMessage.Visible = false;
				}
			}
		}


		/// <summary>
		/// Handles the SelectedIndexChanged event of the DropDownListWebSites control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
		protected void DropDownListWebSites_SelectedIndexChanged(object sender, EventArgs e)
		{
			InitInputFields();
			c_panelOkMessage.Visible = false;
			c_panelMajorError.Visible = false;
		}
	}
}