using System;
using Litium.Studio.UI.Common.WebControls;


/// <summary>
/// Master page for page content editing
/// </summary>
public partial class ObjectPostBase1 : Litium.Studio.UI.CMS.Common.SettingsBaseMasterPage
{
	#region Constants

	public const string SYSTEM_STRING_TAB_REPORTED = "extensions_op_settings_tab_reported";
	public const string SYSTEM_STRING_TAB_NOTIFICATION = "extensions_op_settings_tab_notification";
	public const string SYSTEM_STRING_TAB_ALL = "extensions_op_settings_tab_all";
	public const string PAGE_REPORTED = "ObjectPostReportedAdmin.aspx";
	public const string PAGE_NOTIFICATION = "ObjectPostNotificationAdmin.aspx";
	public const string PAGE_ALL = "ObjectPostAllAdmin.aspx";
	
	#endregion Constants

	/// <summary>
    /// Page_Load
    /// </summary>
    protected void Page_Load(object sender, EventArgs e)
    {
		InitButtons();
    }

	/// <summary>
    /// Trigged when the user clicked on the tab page trees
    /// </summary>
    /// <param name="sender">Tab button page trees</param>
    /// <param name="e">Event arguments</param>
    protected void TabReported_Click(object sender, EventArgs e)
    {
		Response.Redirect(PAGE_REPORTED);
    }

	/// <summary>
	/// Trigged when the user clicked on the tab page trees
	/// </summary>
	/// <param name="sender">Tab button page trees</param>
	/// <param name="e">Event arguments</param>
	protected void TabAll_Click(object sender, EventArgs e)
	{
		Response.Redirect(PAGE_ALL);
	}

    /// <summary>
    /// Trigged when the user clicked on the tab page types
    /// </summary>
    /// <param name="sender">Tab button page types</param>
    /// <param name="e">Event arguments</param>
    protected void TabNotification_Click(object sender, EventArgs e)
    {
		Response.Redirect(PAGE_NOTIFICATION);
    }

    /// <summary>
    /// Inits all the buttons
    /// </summary>
    private void InitButtons()
    {
    	if (c_tabListItemReported != null)
    	{
    		c_tabListItemReported.Selected = m_selectedTab == 1;
			c_tabListItemReported.Text = FoundationContext.Solution.SystemStrings.GetValue(SYSTEM_STRING_TAB_REPORTED, FoundationContext.Language.ID, true);
    	}



		if (c_tabListItemNotification != null)
		{
			c_tabListItemNotification.Selected = m_selectedTab == 2;
			c_tabListItemNotification.Text = FoundationContext.Solution.SystemStrings.GetValue(SYSTEM_STRING_TAB_NOTIFICATION, FoundationContext.Language.ID, true);
		}

		if (c_tabListItemAll != null)
		{
			c_tabListItemAll.Selected = m_selectedTab == 3;
			c_tabListItemAll.Text = FoundationContext.Solution.SystemStrings.GetValue(SYSTEM_STRING_TAB_ALL, FoundationContext.Language.ID, true);
		}
    }
}

