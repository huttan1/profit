using System;
using Litium.Extensions;
using Litium.Extensions.Constants;
using Litium.Extensions.SearchStatistics;
using Litium.Foundation;
using Litium.Foundation.Log;
using Litium.Foundation.Modules.CMS;
using Litium.Foundation.Modules.CMS.Carriers;
using Litium.Foundation.Modules.CMS.GUI.Templates;
using Litium.Plus.Utilities;

public partial class Templates_LoadSearchHit : BaseTemplate
{
    /// <summary>
    /// Page load.
    /// </summary>
    protected void Page_Load(object sender, EventArgs e)
    {
		try
        {
			// Get url to startpage
			string startPageURL = CurrentState.ModuleCMS.WebSites.DefaultWebSite.GetTopPage(CurrentState.ModuleCMS.AdminToken).Url;

			// Set url for linkbutton. Linkbutton and other content will only be shown if something unexpected happens
        	c_buttonBack.NavigateUrl = Page.ResolveUrl(startPageURL);

			// Get page id string for the page that we want the user to be redirected to
			string pageIdString = Request[SearchStatisticsConstants.URL_PARAMETER_SEARCH_HIT_PAGE_ID];

			// Get searchlog id string for the log where the click will be saved
			string logIdString = Request[SearchStatisticsConstants.URL_PARAMETER_SEARCHLOG_ID];

			// If we have no pageid then redirect user to startpage and end here
			if (!StringUtilities.IsGuid(pageIdString))
				Response.Redirect(startPageURL, true);
			
			Guid pageID = new Guid(pageIdString);

        	PageInfoCarrier pageInfoCarrier = ModuleCMS.Instance.CacheManager.SiteMapCache.GetPage(pageID);

			// Page could not be found. redirect user to startpage and end here. This should probably never ever occur, just in case ...
			if (pageInfoCarrier == null)
				Response.Redirect(startPageURL, true);

			// Check if the string is in Guid format
			if (StringUtilities.IsGuid(logIdString))
			{
				Guid logID = new Guid(logIdString);

				// get the SearchLog object
				SearchLog searchLog = Extensions.Instance.SearchStatistics.SearchLogs.GetSearchLog(logID);

				// If we got a SearchLog object then store the page id. otherwise we log the error
				if (searchLog != null)
					searchLog.SetSelectedHitPageID(pageID);
				else
					Solution.Instance.Log.CreateLogEntry(GetType().FullName + ".Page_Load", "SearchLog object could not be found in session", LogLevels.MAJOR_ERROR);
			}

			// All done, redirect user to wanted page.
			Response.Redirect(Page.ResolveUrl(pageInfoCarrier.Url));

        }
		catch (Exception ex)
		{
		    if (!(ex is System.Threading.ThreadAbortException))
		    {
				Solution.Instance.Log.CreateLogEntry(GetType().FullName + ".Page_Load", ex, LogLevels.MAJOR_ERROR);
		    }
		}
    }
}
