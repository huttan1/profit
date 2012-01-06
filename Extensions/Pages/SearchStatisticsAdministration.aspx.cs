using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Litium.Extensions.Data;
using Litium.Extensions.SearchStatistics;
using Litium.Foundation;
using Litium.Foundation.Modules;
using Litium.Foundation.Modules.CMS;
using Litium.Foundation.Modules.CMS.WebSites;
using Litium.Plus.Utilities;
using SystemStringConstants = Litium.Foundation.GUI.Constants.SystemStringConstants;

namespace Extensions.Pages
{
    public partial class SearchStatisticsAdministration : Litium.Foundation.GUI.Pages.BasePage
    {
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
			//Litium.Extensions.Extensions.Instance.SearchStatistics.SearchLogs.CreateSearchLog(Request.UserHostAddress, "harkla", "", new Guid("2fa67779-1810-4fa5-a496-96469993f670"), FoundationContext.User.ID, new Guid("005c5d81-f0fe-4dfe-b95d-b004c16fbcd3"));
			//Litium.Extensions.Extensions.Instance.SearchStatistics.SearchLogs.CreateSearchLog(Request.UserHostAddress, "markant", "", new Guid("2fa67779-1810-4fa5-a496-96469993f670"), FoundationContext.User.ID, new Guid("005c5d81-f0fe-4dfe-b95d-b004c16fbcd3"));
			//Litium.Extensions.Extensions.Instance.SearchStatistics.SearchLogs.CreateSearchLog(Request.UserHostAddress, "squash", "", new Guid("2fa67779-1810-4fa5-a496-96469993f670"), FoundationContext.User.ID, new Guid("005c5d81-f0fe-4dfe-b95d-b004c16fbcd3"));
			//Litium.Extensions.Extensions.Instance.SearchStatistics.SearchLogs.CreateSearchLog(Request.UserHostAddress, "glasögon", "", new Guid("2fa67779-1810-4fa5-a496-96469993f670"), FoundationContext.User.ID, new Guid("005c5d81-f0fe-4dfe-b95d-b004c16fbcd3"));
			//Litium.Extensions.Extensions.Instance.SearchStatistics.SearchLogs.CreateSearchLog(Request.UserHostAddress, "import", "", new Guid("2fa67779-1810-4fa5-a496-96469993f670"), FoundationContext.User.ID, new Guid("005c5d81-f0fe-4dfe-b95d-b004c16fbcd3"));
			//Litium.Extensions.Extensions.Instance.SearchStatistics.SearchLogs.CreateSearchLog(Request.UserHostAddress, "ikea", "", new Guid("2fa67779-1810-4fa5-a496-96469993f670"), FoundationContext.User.ID, new Guid("005c5d81-f0fe-4dfe-b95d-b004c16fbcd3"));
			//Litium.Extensions.Extensions.Instance.SearchStatistics.SearchLogs.CreateSearchLog(Request.UserHostAddress, "hv71", "", new Guid("2fa67779-1810-4fa5-a496-96469993f670"), FoundationContext.User.ID, new Guid("005c5d81-f0fe-4dfe-b95d-b004c16fbcd3"));
			//Litium.Extensions.Extensions.Instance.SearchStatistics.SearchLogs.CreateSearchLog(Request.UserHostAddress, "stridsvagn", "", new Guid("2fa67779-1810-4fa5-a496-96469993f670"), FoundationContext.User.ID, new Guid("005c5d81-f0fe-4dfe-b95d-b004c16fbcd3"));
			//Litium.Extensions.Extensions.Instance.SearchStatistics.SearchLogs.CreateSearchLog(Request.UserHostAddress, "jojk", "", new Guid("2fa67779-1810-4fa5-a496-96469993f670"), FoundationContext.User.ID, new Guid("005c5d81-f0fe-4dfe-b95d-b004c16fbcd3"));
			//Litium.Extensions.Extensions.Instance.SearchStatistics.SearchLogs.CreateSearchLog(Request.UserHostAddress, "samer", "", new Guid("2fa67779-1810-4fa5-a496-96469993f670"), FoundationContext.User.ID, new Guid("005c5d81-f0fe-4dfe-b95d-b004c16fbcd3"));

        	ScriptManager manager = ScriptManager.GetCurrent(Page);
			ServiceReference serviceReference = new ServiceReference("~/Extensions/WebServices/SearchStatistics.asmx");
			if (manager != null && manager.Services.IndexOf(serviceReference) == -1)
        	{
        		manager.Services.Add(serviceReference);
        	}

            if (!Page.IsPostBack)
            {
				// Init toolbar
				InitToolbar();
				InitControls();

            	GetSearchList();
            }

        }

		/// <summary>
		/// Handles the ItemDataBound event of the RepeaterSearchWords control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.Web.UI.WebControls.RepeaterItemEventArgs"/> instance containing the event data.</param>
		protected void RepeaterSearchWords_ItemDataBound(object sender, RepeaterItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				SearchedWord searchedWord = (SearchedWord)e.Item.DataItem;
				Literal literalAverageHits = (Literal)e.Item.FindControl("literalAverageHits");
				Literal literalSearchCount = (Literal)e.Item.FindControl("literalSearchCount");
				Literal literalSearchWord = (Literal)e.Item.FindControl("literalSearchWord");

				literalSearchWord.Text = searchedWord.MandatorySearchWords;
				literalSearchCount.Text = searchedWord.SearchCount.ToString();
				literalAverageHits.Text = searchedWord.AverageHitCount.ToString();

				HtmlTableRow tableRow = (HtmlTableRow)e.Item.FindControl("tableRow");
				tableRow.Attributes.Add("onclick", GetSearchWordTableRowClickScript(searchedWord));
			}
		}

		/// <summary>
		/// Gets the search word table row click script.
		/// </summary>
		/// <param name="word">The word.</param>
		/// <returns></returns>
		private string GetSearchWordTableRowClickScript(SearchedWord word)
		{
			return string.Format("Extensions.SearchStatisticsAdmin.ShowSearchedWordDetails('{0}', '{1}');", word.MandatorySearchWords, c_websiteSelector.SelectedValue);
		}

		/// <summary>
		/// Gets the search list.
		/// </summary>
        private void GetSearchList()
        {
			Guid webSiteId = new Guid(c_websiteSelector.SelectedValue);

			SearchWordsListSortColumn sortColumn = SearchWordsListSortColumn.MANDATORY_SEARCH_WORDS;
			if (Request.QueryString["SortColumn"] == "SearchWord")
				sortColumn = SearchWordsListSortColumn.MANDATORY_SEARCH_WORDS;
			else if (Request.QueryString["SortColumn"] == "SearchCount")
				sortColumn = SearchWordsListSortColumn.SEARCH_COUNT;
			else if (Request.QueryString["SortColumn"] == "AverageHits")
				sortColumn = SearchWordsListSortColumn.AVERAGE_HIT_COUNT;

        	SortOrder sortOrder = Request.QueryString["SortOrder"] == "desc" ? SortOrder.Descending : SortOrder.Ascending;

        	DateTime startDate;
        	DateTime.TryParse(c_textBoxStartDate.Text, out startDate);
        	DateTime endDate;
        	DateTime.TryParse(c_textBoxEndDate.Text, out endDate);

			SearchedWordsList list = Litium.Extensions.Extensions.Instance.SearchStatistics.GetSearchedWords(webSiteId, startDate, endDate, sortColumn);

        	c_pager.ItemCount = list.GetItemCount();

			c_repeaterSearchWords.DataSource = list.GetPage(c_pager.CurrentPage+1, c_pager.PageSize, SearchedWordsList.GetSortColumnNameByType(sortColumn), sortOrder);
			c_repeaterSearchWords.DataBind();

			if(webSiteId != Guid.Empty || startDate != DateTime.MinValue || endDate != DateTime.MinValue)
				c_placeHolderFiltering.Visible = true;
        }

		/// <summary>
		/// Handles the Click event of the ButtonFilter control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
		protected void ButtonFilter_Click(object sender, EventArgs e)
		{
			string url = Request.Url.ToString();

			if (c_websiteSelector.SelectedValue != Guid.Empty.ToString())
				url = UrlUtilities.AddOrReplaceUrlParameter(url, "WebSiteID", c_websiteSelector.SelectedValue);
			else
				url = UrlUtilities.RemoveUrlParameter(url, "WebSiteID");

			if (!string.IsNullOrEmpty(c_textBoxStartDate.Text))
				url = UrlUtilities.AddOrReplaceUrlParameter(url, "StartDate", c_textBoxStartDate.Text);
			else
				url = UrlUtilities.RemoveUrlParameter(url, "StartDate");

			if (!string.IsNullOrEmpty(c_textBoxEndDate.Text))
				url = UrlUtilities.AddOrReplaceUrlParameter(url, "EndDate", c_textBoxEndDate.Text);
			else
				url = UrlUtilities.RemoveUrlParameter(url, "EndDate");

			// Revert back to page 1 (zero-based)
			url = UrlUtilities.AddOrReplaceUrlParameter(url, "Page", "0");

			Response.Redirect(url);
		}

		/// <summary>
		/// Inits the controls.
		/// </summary>
        private void InitControls()
        {
            // Populate website drop-down
            string selectorTitle = Solution.Instance.SystemStrings.GetValue("Extensions_SS_Select_Website", FoundationContext.User.Language.Culture, true);
            c_websiteSelector.Items.Add(new ListItem(selectorTitle, Guid.Empty.ToString()));
			c_dropDownListDeleteOldStatisticsWebsiteSelector.Items.Add(new ListItem(selectorTitle, Guid.Empty.ToString()));
            foreach (WebSite webSite in Module<ModuleCMS>.Instance.WebSites)
            {
            	ListItem item = new ListItem(webSite.Name, webSite.ID.ToString());
				if(Request.QueryString["WebSiteID"] == webSite.ID.ToString())
					item.Selected = true;
            	c_websiteSelector.Items.Add(item);

				c_dropDownListDeleteOldStatisticsWebsiteSelector.Items.Add(new ListItem(webSite.Name, webSite.ID.ToString()));
            }

        	c_textBoxStartDate.Text = Request.QueryString["StartDate"];
        	c_textBoxEndDate.Text = Request.QueryString["EndDate"];

			if (string.IsNullOrEmpty(c_textBoxStartDate.Text))
				c_textBoxStartDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
			if (string.IsNullOrEmpty(c_textBoxEndDate.Text))
				c_textBoxEndDate.Text = DateTime.Today.ToString("yyyy-MM-dd");

			c_buttonFilter.Text = Solution.Instance.SystemStrings.GetValue("Extensions_SS_Administration_Filter", FoundationContext.User.Language.Culture, true);

        	c_textBoxDeleteOldStatisticsDate.Text = DateTime.Now.Subtract(new TimeSpan(365, 0, 0, 0)).ToString("yyyy-MM-dd");

			c_imageSearchWordSortOrder.ImageUrl = "~/Extensions/Pages/Images/transparent.gif";
			c_imageSearchCountSortOrder.ImageUrl = "~/Extensions/Pages/Images/transparent.gif";
			c_imageAverageHitsSortOrder.ImageUrl = "~/Extensions/Pages/Images/transparent.gif";

			if(Request.QueryString["SortColumn"] != null)
			{
				if(Request.QueryString["SortColumn"] == "SearchWord")
				{
					if(Request.QueryString["SortOrder"] != "asc")
						c_imageSearchWordSortOrder.ImageUrl = "~/Extensions/Common/Images/sort_az_ascending.png";
					else
						c_imageSearchWordSortOrder.ImageUrl = "~/Extensions/Common/Images/sort_az_descending.png";
				}
				else if(Request.QueryString["SortColumn"] == "SearchCount")
				{
					if (Request.QueryString["SortOrder"] != "asc")
						c_imageSearchCountSortOrder.ImageUrl = "~/Extensions/Common/Images/sort_az_ascending.png";
					else
						c_imageSearchCountSortOrder.ImageUrl = "~/Extensions/Common/Images/sort_az_descending.png";
				}
				else if (Request.QueryString["SortColumn"] == "AverageHits")
				{
					if (Request.QueryString["SortOrder"] != "asc")
						c_imageAverageHitsSortOrder.ImageUrl = "~/Extensions/Common/Images/sort_az_ascending.png";
					else
						c_imageAverageHitsSortOrder.ImageUrl = "~/Extensions/Common/Images/sort_az_descending.png";
				}
			}
		}

		/// <summary>
		/// Handles the Click event of the LinkButtonSortColumn control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
		protected void LinkButtonSortColumn_Click(object sender, EventArgs e)
		{
			Response.Redirect(GetSortColumnUrl(((LinkButton)sender).CommandArgument));
		}

		/// <summary>
		/// Gets the sort column URL.
		/// </summary>
		/// <param name="sortColumn">The sort column.</param>
		/// <returns></returns>
		internal string GetSortColumnUrl(string sortColumn)
		{
			string url = Request.Url.ToString();
			string sortOrder = !Request.Url.ToString().Contains(sortColumn) ? "asc" : "desc";

			url = UrlUtilities.AddOrReplaceUrlParameter(url, "SortColumn", sortColumn);
			url = UrlUtilities.AddOrReplaceUrlParameter(url, "SortOrder", sortOrder);

			return url;
		}
        
        /// <summary>
        /// Inits toolbar
        /// </summary>
        private void InitToolbar()
        {
			c_toolbarItemDeleteHistory.Text = SystemStrings.GetValue("Extensions_SS_Toolbar_DeleteHistory", FoundationContext.Language.ID, true);
			c_toolbarItemDeleteHistory.Enabled = true;
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