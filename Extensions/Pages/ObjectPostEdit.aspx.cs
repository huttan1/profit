using System;
using App_Code.Extensions.ObjectPost;
using Litium.Studio.UI.CMS.Common;
using Litium.Extensions.ObjectPost;
using Litium.Extensions.WebControls;
using Litium.Foundation.GUI.Constants;
using Litium.Foundation.GUI.Pages;
using Litium.Foundation.Log;
using Litium.Foundation.Security;

namespace Extensions.Pages
{
	/// <summary>
	///	Guide to edit a system string: Name, language and value of the system string
	/// </summary>	
	public partial class ObjectPostEdit : BasePage
	{
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
			if (masterPage != null)
				masterPage.SelectedTab = 1;

			// Init controls
			if (!IsPostBack)
			{
				InitButtons();
				InitInputFields();
			}
		}

		/// <summary>
		/// Trigged when the user clicked on the cancel button: redirects to system string list page
		/// </summary>
		/// <param name="sender">Toolbar item cancel.</param>
		/// <param name="e">Event arguments.</param>
		protected void ToolbarItemCancel_Click(object sender, EventArgs e)
		{
			// Clear the administration state in the session and go to system string list page
			Session[ObjectPostConstants.SESSION_LIST_STATE] = null;
			Response.Redirect(Convert.ToString(Session[ObjectPostConstants.SESSION_PAGE_LIST]));
		}

		/// <summary>
		/// Trigged when the user clicked on the save button: saves the changes on the system string and redirects to system string list page
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
					ListState listState = (ListState)Session[ObjectPostConstants.SESSION_LIST_STATE];
					Guid objectPostID = listState.SelectedItemIDs[0];
					ObjectPost objectPost = Litium.Extensions.Extensions.Instance.ObjectPosts.GetObjectPost(objectPostID);
					objectPost.Update(m_textBoxPostText.Text, objectPost.PostNumeric, null, true, objectPost.Type);
				}
				catch (Exception exc)
				{
					isSaved = false;
					FoundationContext.Solution.Log.CreateLogEntry(GetType().FullName + "ButtonSave_Click", exc, LogLevels.ERROR);
				}

				if (isSaved)
				{
					Response.Redirect(Convert.ToString(Session[ObjectPostConstants.SESSION_PAGE_LIST]));
				}
				else
				{
					c_labelMajorError.Text = SystemStrings.GetValue(ObjectPostConstants.SYSTEM_STRING_UPDATE_ERROR, FoundationContext.Language.ID, true);
					c_panelMajorError.Visible = true;
				}
			}
		}

		/// <summary>
		/// Inits all the buttons
		/// </summary>
		private void InitButtons()
		{
			c_toolbarItemCancel.Text = SystemStrings.GetValue(SystemStringConstants.TOOLBAR_CANCEL, FoundationContext.Language.ID, true);
			c_toolbarItemSave.Text = SystemStrings.GetValue(SystemStringConstants.TOOLBAR_SAVE, FoundationContext.Language.ID, true);
		}

		/// <summary>
		/// Inits system string specific information
		/// </summary>
		private void InitInputFields()
		{
			// Get selected item id from list state in session
			ListState listState = (ListState)Session[ObjectPostConstants.SESSION_LIST_STATE];
			Guid objectPostID = listState.SelectedItemIDs[0];
			ObjectPost objectPost = Litium.Extensions.Extensions.Instance.ObjectPosts.GetObjectPost(objectPostID);

			m_textBoxCreatedDate.Text = objectPost.CreatedDate.ToString();
			m_textBoxPostingUserName.Text = objectPost.PostingUserName;
			m_textBoxPostingUserEmail.Text = objectPost.PostingUserEmail;
			m_textBoxPostText.Text = objectPost.PostText;
		}
	}
}