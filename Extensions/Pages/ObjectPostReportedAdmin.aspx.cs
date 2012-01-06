using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;
using Litium.Extensions.ObjectPost;
using Litium.Extensions.WebControls;
using Litium.Foundation;
using Litium.Foundation.Carriers;
using Litium.Foundation.GUI.Pages;
using Litium.Foundation.Log;
using Litium.Foundation.Modules;
using Litium.Foundation.Modules.CMS;
using Litium.Foundation.Modules.CMS.Carriers;
using Litium.Foundation.Modules.CMS.WebSites;
using Litium.Foundation.Security;
using Litium.Plus.Comparers;
using Litium.Studio.UI.CMS.Common;
using Litium.Studio.UI.Foundation.Common.Constants;
using Litium.Studio.UI.Foundation.Common.Utilities;
using SystemStringConstants = Litium.Extensions.Constants.SystemStringConstants;
using App_Code.Extensions.ObjectPost;

namespace Extensions.Pages
{
	public partial class ObjectPostReportedAdmin : BasePage
	{
		private const string CURRENT_PAGE = "ObjectPostReportedAdmin.aspx";

		#region Members

		/// <summary>
		/// Default page size. 
		/// </summary>
		private int m_defaultPageSize = -1;

		/// <summary>
		/// System languages
		/// </summary>
		protected LanguageCarrier[] m_languages;

		/// <summary>
		/// List state
		/// </summary>
		protected ListState m_listState;

		/// <summary>
		/// WebSite ID to display ObjectPosts for
		/// </summary>
		protected Guid WebSiteID
		{
			get
			{
				if (Session["SelectedWebSiteID"] == null)
					Session["SelectedWebSiteID"] = Module<ModuleCMS>.Instance.WebSites.DefaultWebSite.ID;

				return (Guid)Session["SelectedWebSiteID"];
			}
			set { Session["SelectedWebSiteID"] = value; }
		}

		protected short ObjectPostType
		{
			get
			{
				if (Session["SelectedObjectPostType"] == null)
					return short.MinValue;

				return (short) Session["SelectedObjectPostType"];
			}
			set { Session["SelectedObjectPostType"] = value; }
		}

		#endregion Members

		#region Properties

		/// <summary>
		/// Property to enable disable show all button
		/// </summary>
		public bool ShowAll
		{
			get { return ((c_list.PageItemCount > m_listState.PageSize) || (m_listState.PageSize == c_list.SHOW_ALL)); }
		}

		/// <summary>
		/// Property to show start index for the c_list
		/// (Start index at the current page)
		/// </summary>
		public int StartIndex
		{
			get
			{
				if (c_list.Items.Count > 0)
				{
					return c_list.StartIndex;
				}

				return 0;
			}
		}

		#endregion Properties

		#region Events

		/// <summary>
		/// Handles the Load event of the Page control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
		protected void Page_Load(object sender, EventArgs e)
		{
			// Set selected tab
			SettingsBaseMasterPage masterPage = Master as SettingsBaseMasterPage;
			if (masterPage != null)
				masterPage.SelectedTab = 1;

			if (!IsPostBack)
			{
				Guid selectedWebSite = WebSiteID;
				if (selectedWebSite == Guid.Empty)
					selectedWebSite = Module<ModuleCMS>.Instance.WebSites.DefaultWebSite.ID;

				ObjectPostAdministrationUtilities.InitDropDownWebSites(selectedWebSite, m_dropDownListWebSites);

				ObjectPostAdministrationUtilities.InitDropDownObjectPostTypes(ObjectPostType, m_dropDownListObjectPostTypes);

				InitWebSiteIdAndTypeMembers();
			}

			// Set values for instance members
			InitMembers();

			// Initiate toolbar
			InitToolbar();

			// Initiate list
			InitList();
		}

		/// <summary>
		/// OnPreRender
		/// </summary>
		/// <param name="e">.</param>
		protected override void OnPreRender(EventArgs e)
		{
			InitListContent();
			base.OnPreRender(e);

			InitPaging();
		}

		/// <summary>
		/// Handles the OnSelectedIndexChanged event of the DropDownListWebSites control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
		protected void DropDownListWebSites_OnSelectedIndexChanged(Object sender, EventArgs e)
		{
			// Get member values from our dropdownlists
			InitWebSiteIdAndTypeMembers();

			// Refresh the type dropdown
			ObjectPostAdministrationUtilities.InitDropDownObjectPostTypes(m_dropDownListObjectPostTypes.SelectedValue, m_dropDownListObjectPostTypes);

			InitListContent();
		}

		/// <summary>
		/// Handles the OnSelectedIndexChanged event of the DropDownListObjectType control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
		protected void DropDownListObjectType_OnSelectedIndexChanged(Object sender, EventArgs e)
		{
			// Get member values from our dropdownlists
			InitWebSiteIdAndTypeMembers();

			InitListContent();
		}

		/// <summary>
		/// Trigged when the user clicked on the toolbar item approve
		/// </summary>
		/// <param name="sender">Toolbar item</param>
		/// <param name="e">Event args</param>
		protected void ToolbarItemApprove_Click(object sender, EventArgs e)
		{
			// Set selected item approved
			if (c_list.SelectedItemIDs.Count > 0)
			{
				bool isApproved = true;
				try
				{
					foreach (Guid itemID in c_list.SelectedItemIDs)
					{
						ObjectPost objectPost = Litium.Extensions.Extensions.Instance.ObjectPosts.GetObjectPost(itemID);
						ObjectPostReportCollection reports = objectPost.Reports;
						foreach (ObjectPostReport report in reports)
						{
							report.Delete();
						}
					}
				}
				catch (Exception exc)
				{
					isApproved = false;
					FoundationContext.Solution.Log.CreateLogEntry(GetType().FullName + "ToolbarItemDelete_Click", exc,
					                                              LogLevels.MINOR_ERROR);
				}
				if (!isApproved)
				{
					// Not approved show error message
					c_labelMajorError.Text = SystemStrings.GetValue(SystemStringConstants.SystemStringConstants.OP_APPROVE_ERROR,
					                                                FoundationContext.Language.ID, true);
					c_panelMajorError.Visible = true;
				}
				else
				{
					// Item approved. Clear selected item from session and set c_list.PageItemSelected to NOT_ITEM_SELECTED
					m_listState.SelectedItemIDs = new List<Guid>();
					Session[ObjectPostConstants.SESSION_LIST_STATE] = m_listState;
					c_list.SelectedItemIDs = new List<Guid>();
				}

				// Refresh the listitems with new numbers of reported comments
				ObjectPostAdministrationUtilities.InitDropDownObjectPostTypes(m_dropDownListObjectPostTypes.SelectedValue, m_dropDownListObjectPostTypes);

				// Get member values from our dropdownlists
				InitWebSiteIdAndTypeMembers();
			}
		}

		/// <summary>
		/// Trigged when the user clicked on the toolbar item edit
		/// </summary>
		/// <param name="sender">Toolbar item</param>
		/// <param name="e">Event args</param>
		protected void ToolbarItemEdit_Click(object sender, EventArgs e)
		{
			// Save selected item to the session and go to edit page
			if (c_list.SelectedItemIDs.Count == 1)
			{
				m_listState.SelectedItemIDs = c_list.SelectedItemIDs;
				Session[ObjectPostConstants.SESSION_PAGE_LIST] = CURRENT_PAGE;
				Session[ObjectPostConstants.SESSION_LIST_STATE] = m_listState;
				Response.Redirect(ObjectPostConstants.PAGE_EDIT);
			}
		}

		/// <summary>
		/// Trigged when the user clicked on the toolbar item delete
		/// </summary>
		/// <param name="sender">Toolbar item</param>
		/// <param name="e">Event args</param>
		protected void ToolbarItemDelete_Click(object sender, EventArgs e)
		{
			// Delete selected item
			if (c_list.SelectedItemIDs.Count > 0)
			{
				bool isDeleted = true;
				try
				{
					foreach (Guid itemID in c_list.SelectedItemIDs)
					{
						ObjectPost objectPost = Litium.Extensions.Extensions.Instance.ObjectPosts.GetObjectPost(itemID);
						objectPost.Delete();
					}
				}
				catch (Exception exc)
				{
					isDeleted = false;
					FoundationContext.Solution.Log.CreateLogEntry(GetType().FullName + "ToolbarItemDelete_Click", exc,
					                                              LogLevels.MINOR_ERROR);
				}
				if (!isDeleted)
				{
					// Not deleted show error message
					c_labelMajorError.Text = SystemStrings.GetValue(SystemStringConstants.SystemStringConstants.OP_DELETE_ERROR,
					                                                FoundationContext.Language.ID, true);
					c_panelMajorError.Visible = true;
				}
				else
				{
					// Item deleted. Clear selected item from session and set c_list.PageItemSelected to NOT_ITEM_SELECTED
					m_listState.SelectedItemIDs = new List<Guid>();
					Session[ObjectPostConstants.SESSION_LIST_STATE] = m_listState;
					c_list.SelectedItemIDs = new List<Guid>();
				}

				// Refresh the listitems with new numbers of reported comments
				ObjectPostAdministrationUtilities.InitDropDownObjectPostTypes(m_dropDownListObjectPostTypes.SelectedValue, m_dropDownListObjectPostTypes);

				// Get member values from our dropdownlists
				InitWebSiteIdAndTypeMembers();
			}
		}

		/// <summary>
		/// List_Command
		/// </summary>
		/// <param name="sender">The LinkButton of wich OnCommand-attribute is set to List_Command.</param>
		/// <param name="e">The LinkButton CommandEventArgs sent.</param>
		/// <remarks>
		/// Used to handle paging, sorting, searching and view mode events from the client. 
		/// </remarks>
		protected void List_Command(object sender, CommandEventArgs e)
		{
			int pageRequested = 0;
			switch (e.CommandName.ToLower())
			{
					// Set requested page
				case StringConstants.COMMAND_NAME_GOTO:
					pageRequested = c_list.PageSelected + Int32.Parse(e.CommandArgument.ToString());
					if (pageRequested > 0 && pageRequested <= c_list.PageCount)
						c_list.PageSelected = pageRequested;

					// Do not go to selected item's page
					c_list.GoToSelectedItemsPage = false;
					break;

					// Set requested sort order
				case StringConstants.COMMAND_NAME_ORDER_BY:
					string orderBy = e.CommandArgument.ToString().ToLower();

					// Change sort order direction if the list is ordered by same column 
					if (orderBy == m_listState.OrderBy)
					{
						m_listState.Ascending = !m_listState.Ascending;
					}
					m_listState.OrderBy = orderBy;
					c_list.SetFromState(m_listState);
					Session[ObjectPostConstants.SESSION_LIST_STATE] = m_listState;

					// Do not go to selected item's page
					c_list.GoToSelectedItemsPage = false;
					break;

					// Show all the posts
				case StringConstants.COMMAND_NAME_SHOW_ALL:
					if (m_listState.PageSize == c_list.SHOW_ALL)
					{
						c_list.PageSize = m_defaultPageSize;
					}
					else
					{
						c_list.PageSize = c_list.SHOW_ALL;
					}
					m_listState.PageSize = c_list.PageSize;

					// Save the showing mode in the session
					Session[ObjectPostConstants.SESSION_LIST_STATE] = m_listState;
					c_list.PageSelected = 1;

					// Initiate labels (Show all or Show pages)
					InitLabels();

					// Do not go to selected item's page
					c_list.GoToSelectedItemsPage = false;
					break;
			}

			// Save selected page item to the session
			if (c_list.SelectedItemIDs.Count > 0)
			{
				m_listState.SelectedItemIDs = c_list.SelectedItemIDs;
				Session[ObjectPostConstants.SESSION_LIST_STATE] = m_listState;
			}
		}

		#endregion Events

		#region Methods

		/// <summary>
		/// Authorizes the user for the current page
		/// </summary>
		/// <returns>True if authorization succedded, otherwise false.</returns>
		public override bool AuthorizeUser()
		{
			return FoundationContext.Token.HasSolutionPermission(BuiltInSolutionPermissionTypes.PERMISSION_ID_ALL, true, true);
		}

		/// <summary>
		/// Inits members for WebSite ID and ObjectPostType. Values are taken from selected values from dropdownlists
		/// </summary>
		protected void InitWebSiteIdAndTypeMembers()
		{
			WebSiteID = new Guid(m_dropDownListWebSites.SelectedValue);
			if (!string.IsNullOrEmpty(m_dropDownListObjectPostTypes.SelectedValue))
				ObjectPostType = (short)Convert.ToInt32(m_dropDownListObjectPostTypes.SelectedValue);
		}

		/// <summary>
		/// Set values for instance members
		/// </summary>
		protected void InitMembers()
		{
			// Get the system languages
			m_languages = LanguageUtilities.GetSystemLanguages(FoundationContext.Solution.Languages);

			// Get list state from session or create new if not in session 
			m_listState = Session[ObjectPostConstants.SESSION_LIST_STATE] as ListState;
			if (m_listState == null)
			{
				m_listState = c_list.GetState();
				Session[ObjectPostConstants.SESSION_LIST_STATE] = m_listState;
			}

			// Save deafult page size. It will be used to change view mode (Show all and show pages)
			m_defaultPageSize = c_list.PageSize;
		}

		/// <summary>
		/// Set values for instance members
		/// </summary>
		protected void InitPaging()
		{
			if (!ShowAll)
			{
				c_pageSelectorAll1.CssClass = StringConstants.CSS_CONTENT_PAGER_DISABLED;
				c_pageSelectorAll2.CssClass = StringConstants.CSS_CONTENT_PAGER_DISABLED;
				c_AllButton.CssClass = StringConstants.CSS_ICON_UP_DOWN + " " + StringConstants.CSS_CONTENT_PAGER_DISABLED;
			}
			else
			{
				c_pageSelectorAll1.CssClass = StringConstants.CSS_CONTENT_PAGER_ENABLED;
				c_pageSelectorAll2.CssClass = StringConstants.CSS_CONTENT_PAGER_ENABLED;
				c_AllButton.CssClass = StringConstants.CSS_ICON_UP_DOWN;
			}
			if (!c_list.CheckPagerBoundaries(-1))
			{
				c_pageSelectorPrev1.CssClass = StringConstants.CSS_CONTENT_PAGER_DISABLED;
				c_pageSelectorPrev2.CssClass = StringConstants.CSS_CONTENT_PAGER_DISABLED;
				c_pageSelectorPrev3.CssClass = StringConstants.CSS_CONTENT_PAGER_DISABLED;
				c_pageSelectorPrev4.CssClass = StringConstants.CSS_CONTENT_PAGER_DISABLED;
				c_PreviousButton1.CssClass = StringConstants.CSS_ICON_ARROW_LEFT + " " + StringConstants.CSS_CONTENT_PAGER_DISABLED;
				c_PreviousButton2.CssClass = StringConstants.CSS_ICON_ARROW_LEFT + " " + StringConstants.CSS_CONTENT_PAGER_DISABLED;
			}
			else
			{
				c_pageSelectorPrev1.CssClass = StringConstants.CSS_CONTENT_PAGER_ENABLED;
				c_pageSelectorPrev2.CssClass = StringConstants.CSS_CONTENT_PAGER_ENABLED;
				c_pageSelectorPrev3.CssClass = StringConstants.CSS_CONTENT_PAGER_ENABLED;
				c_pageSelectorPrev4.CssClass = StringConstants.CSS_CONTENT_PAGER_ENABLED;
				c_PreviousButton1.CssClass = StringConstants.CSS_ICON_ARROW_LEFT;
				c_PreviousButton2.CssClass = StringConstants.CSS_ICON_ARROW_LEFT;
			}
			if (!c_list.CheckPagerBoundaries(1))
			{
				c_pageSelectorNext1.CssClass = StringConstants.CSS_CONTENT_PAGER_DISABLED;
				c_pageSelectorNext2.CssClass = StringConstants.CSS_CONTENT_PAGER_DISABLED;
				c_pageSelectorNext3.CssClass = StringConstants.CSS_CONTENT_PAGER_DISABLED;
				c_pageSelectorNext4.CssClass = StringConstants.CSS_CONTENT_PAGER_DISABLED;
				c_NextButton1.CssClass = StringConstants.CSS_ICON_ARROW_RIGHT + " " + StringConstants.CSS_CONTENT_PAGER_DISABLED;
				c_NextButton2.CssClass = StringConstants.CSS_ICON_ARROW_RIGHT + " " + StringConstants.CSS_CONTENT_PAGER_DISABLED;
			}
			else
			{
				c_pageSelectorNext1.CssClass = StringConstants.CSS_CONTENT_PAGER_ENABLED;
				c_pageSelectorNext2.CssClass = StringConstants.CSS_CONTENT_PAGER_ENABLED;
				c_pageSelectorNext3.CssClass = StringConstants.CSS_CONTENT_PAGER_ENABLED;
				c_pageSelectorNext4.CssClass = StringConstants.CSS_CONTENT_PAGER_ENABLED;
				c_NextButton1.CssClass = StringConstants.CSS_ICON_ARROW_RIGHT;
				c_NextButton2.CssClass = StringConstants.CSS_ICON_ARROW_RIGHT;
			}
		}

		/// <summary>
		/// Inits toolbar
		/// </summary>
		private void InitToolbar()
		{
			m_toolbarItemApprove.Text = SystemStrings.GetValue(SystemStringConstants.SystemStringConstants.OP_TOOLBAR_APPROVE,
			                                                   FoundationContext.Language.ID, true);
			m_toolbarItemApprove.ConfirmationText = SystemStrings.GetValue(
				SystemStringConstants.SystemStringConstants.OP_TOOLBAR_APPROVE_CONFIRM_TEXT, FoundationContext.Language.ID, true);
			m_toolbarItemApprove.Enabled = false;

			m_toolbarItemEdit.Text = SystemStrings.GetValue(Litium.Foundation.GUI.Constants.SystemStringConstants.TOOLBAR_EDIT,
			                                                FoundationContext.Language.ID, true);
			m_toolbarItemEdit.Enabled = false;

			m_toolbarItemDelete.Text =
				SystemStrings.GetValue(Litium.Foundation.GUI.Constants.SystemStringConstants.TOOLBAR_DELETE,
				                       FoundationContext.Language.ID, true);
			m_toolbarItemDelete.ConfirmationText = SystemStrings.GetValue(SystemStringConstants.SystemStringConstants.OP_TOOLBAR_DELETE_CONFIRM_TEXT,
			                                                              FoundationContext.Language.ID, true);
			m_toolbarItemDelete.Enabled = false;
		}

		/// <summary>
		/// Inits labels
		/// </summary>
		private void InitLabels()
		{
			// Check if the view mode is show all or not
			if (m_listState.PageSize == c_list.SHOW_ALL)
			{
				c_labelShowAll.Text = SystemStrings.GetValue(Litium.Studio.UI.Foundation.Common.Constants.SystemStringConstants.LABEL_SHOW_PAGES,
				                                             FoundationContext.Language.ID, true);
			}
			else
			{
				c_labelShowAll.Text = SystemStrings.GetValue(Litium.Studio.UI.Foundation.Common.Constants.SystemStringConstants.LABEL_SHOW_ALL,
				                                             FoundationContext.Language.ID, true);
			}
		}

		/// <summary>
		/// Inits list content
		/// </summary>
		private void InitListContent()
		{
			// DataTable
			DataTable dataTable = new DataTable();
			dataTable.Columns.Add(StringConstants.KEY_ID);
			dataTable.Columns.Add(StringConstants.KEY_COLUMN1);
			dataTable.Columns.Add(StringConstants.KEY_COLUMN2);
			dataTable.Columns.Add(StringConstants.KEY_COLUMN3);
			dataTable.Columns.Add(StringConstants.KEY_COLUMN4);
			dataTable.Columns.Add(StringConstants.KEY_COLUMN5);

			// Get all object posts
			List<ObjectPost> objectPosts = Litium.Extensions.Extensions.Instance.ObjectPosts.GetObjectPostByWebSiteAndType(WebSiteID, ObjectPostType);

			foreach (ObjectPost objectPost in objectPosts)
			{
				// Add reported object post to datatable
				if (objectPost.Reports.All.Count > 0)
				{
					string url = ObjectPostAdministrationUtilities.GetHyperLinkForObjectPostObject(objectPost.ObjectPostID, (ObjectPostTypes)objectPost.Type);
					dataTable.Rows.Add(new object[] { objectPost.ObjectPostID, objectPost.CreatedDate, objectPost.PostingUserName, objectPost.PostingUserEmail, objectPost.PostText, url});
				}
			}

			// Set the key colum for c_list. Unique id of the row
			c_list.DataSourceKeyColumn = StringConstants.KEY_ID;
			c_list.DataSource = dataTable;

			// Bind data and create RepeaterItems
			c_list.DataBind();

			// Initiate labels
			InitLabels();

			// DataBind
			Page.DataBind();
		}

		/// <summary>
		/// Inits list
		/// </summary>
		private void InitList()
		{
			// List. There can be only one order by column
			c_list.AddColumn("c_listColumn1", SystemStrings.GetValue(SystemStringConstants.SystemStringConstants.OP_LABEL_DATE, FoundationContext.Language.ID, true), StringConstants.KEY_COLUMN1, "c_imageDescListColumn1", true);
			
			if (m_listState.OrderBy == null)
			{
				m_listState.OrderBy = StringConstants.KEY_COLUMN1;
				Session[ObjectPostConstants.SESSION_LIST_STATE] = m_listState;
			}

			c_list.AddColumn("c_listColumn2", SystemStrings.GetValue(SystemStringConstants.SystemStringConstants.OP_LABEL_NAME, FoundationContext.Language.ID, true),StringConstants.KEY_COLUMN2, "c_imageDescListColumn2", true);
			c_list.AddColumn("c_listColumn3", SystemStrings.GetValue(SystemStringConstants.SystemStringConstants.OP_LABEL_EMAIL, FoundationContext.Language.ID, true),StringConstants.KEY_COLUMN3, "c_imageDescListColumn3", true);
			c_list.AddColumn("c_listColumn4", SystemStrings.GetValue(SystemStringConstants.SystemStringConstants.OP_LABEL_TEXT, FoundationContext.Language.ID, true),StringConstants.KEY_COLUMN4, "c_imageDescListColumn4", true);
			c_list.AddColumn("c_listColumn5", SystemStrings.GetValue(SystemStringConstants.SystemStringConstants.OP_LABEL_LINK, FoundationContext.Language.ID, true),StringConstants.KEY_COLUMN5, "c_imageDescListColumn5", true);

			// Toggles: one toggle per row
			c_list.EnableMouseRowTracker = true;

			// Toggles
			c_list.Toolbar = c_toolbar; // Enable automatic mapping between column and toolbaritem
			c_list.AddToggle(m_toolbarItemApprove.ID);
			c_list.AddToggle(m_toolbarItemDelete.ID);
			c_list.AddToggle(m_toolbarItemEdit.ID);
			c_list.AddDisableOnMultiselectToggle(m_toolbarItemEdit.ID);
			c_list.SetFromState(m_listState);
		}

		#endregion Methods
	}
}