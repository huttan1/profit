using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Web.UI.WebControls;
using App_Code.Site.CMS.Templates;
using Litium.Foundation.Modules.CMS.Content;
using Litium.Foundation.Modules.CMS.GUI.Constants;
using Litium.Foundation.Modules.CMS.Search;
using Litium.Foundation.Modules.CMS.WebControls;
using Image=System.Web.UI.WebControls.Image;

namespace Site.CMS.Templates
{
    /// <summary>
    /// Class to display the search result
    /// </summary>
    public partial class SearchResult1 : BaseTemplate
    {
        #region Constants

        private const string FILEHITCOUNT_REPLACEMENTPATTERN = "{FILES}";
        private const string HITCOUNT_REPLACEMENTPATTERN = "{COUNT}";
        private const string PAGEHITCOUNT_REPLACEMENTPATTERN = "{PAGES}";
        private const string PROPERTY_FILEHITCOUNT_PLURAL = "FileHits";
        private const string PROPERTY_FILEHITCOUNT_SINGULAR = "FileHit";
        private const string PROPERTY_HITCOUNT = "HitCount";
        private const string PROPERTY_PAGEHITCOUNT_PLURAL = "PageHits";
        private const string PROPERTY_PAGEHITCOUNT_SINGULAR = "PageHit";

        #endregion

        #region Properties

        /// <summary>
        /// Number of hits that are files.
        /// </summary>
        protected int m_fileHitCount;

        /// <summary>
        /// Number of hits.
        /// </summary>
        protected int m_pageHitCount;

        #endregion

        #region Events

        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ExecuteSearch();
                InitHitCountDisplay();
            }
        }

        protected virtual void RepeaterSearchHitsOnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                PublicSearchResultItem searchResultItem = (PublicSearchResultItem) e.Item.DataItem;
                PublicPageSearchResultItem searchPageResultItem = searchResultItem as PublicPageSearchResultItem;
                HyperLink link = (HyperLink) e.Item.FindControl("hyperLinkPage");
                Repeater fileRepeater = (Repeater) e.Item.FindControl("repeaterFiles");

                link.Text = searchResultItem.Name;
                link.NavigateUrl = searchResultItem.Url;

                if (searchResultItem.PageID != Guid.Empty)
                {
                    if (searchPageResultItem != null)
                    {
                        UsePage usePage = (UsePage) e.Item.FindControl("usePage");
                        usePage.Visible = true;
                        usePage.PageID = searchResultItem.PageID;
                    }
                }

                if (searchPageResultItem != null)
                {
                    if (searchPageResultItem.Content != null)
                    {
                        Collection<PublicFileSearchResultItem> files = new Collection<PublicFileSearchResultItem>();

                        foreach (PublicContentSearchResultItem item in searchPageResultItem.Content)
                        {
                            PublicFileSearchResultItem fileItem = item as PublicFileSearchResultItem;

                            if (fileItem != null)
                            {
                                files.Add(fileItem);
                            }
                        }

                        if (files.Count > 0)
                        {
                            m_fileHitCount += files.Count;
                            fileRepeater.Visible = true;
                            fileRepeater.DataSource = files;
                            fileRepeater.DataBind();
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Handles the item data bound event of the Repeater control.
        /// </summary>
        /// <param name="e">The <see cref="System.Web.UI.WebControls.RepeaterItemEventArgs"/> instance containing the event data.</param>
        /// <param name="sender">The source of the event</param>
        protected void RepeaterFilesOnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                PublicFileSearchResultItem resultItem = (PublicFileSearchResultItem) e.Item.DataItem;

                if (resultItem != null)
                {
                    HyperLink link = (HyperLink) e.Item.FindControl("hyperLinkFile");
                    link.NavigateUrl = resultItem.Url;

                    Literal fileNameLabel = (Literal) e.Item.FindControl("literalFileName");
                    fileNameLabel.Text = resultItem.Name;

                    Literal fileSizeLabel = (Literal) e.Item.FindControl("literalFileSize");
                    fileSizeLabel.Text = string.Format("({0} Kb)", resultItem.FileSizeKb/1024);

                    Image fileIcon = (Image) e.Item.FindControl("imageMediaArchiveFileIcon");

                    if (resultItem.IconUrl == null)
                    {
                        fileIcon.Visible = false;
                    }
                    else
                    {
                        fileIcon.ImageUrl = resultItem.IconUrl;
                    }
                }
            }
        }

        #endregion

        #region Public Methods
        /// <summary>
        /// Bind result repeater with search hits
        /// </summary>
        /// <param name="resultItems">A collection of search objects</param>
        /// <param name="totalHits">The total hits.</param>
        public virtual void DataBindResultGrid(IEnumerable<PublicSearchResultItem> resultItems, int totalHits)
        {
            m_repeaterSearchResult.DataSource = resultItems;
            m_repeaterSearchResult.DataBind();
            m_pageHitCount = totalHits;
        }

        /// <summary>
        /// Perform search operation
        /// </summary>
        /// <param name="text">Search text</param>
        /// <param name="pageIndex">Index of the page.</param>
        /// <param name="pageSize">Size of the page.</param>
        /// <param name="totalHits">The total hits.</param>
        /// <returns>A collection of search objects</returns>
        public virtual IEnumerable<PublicSearchResultItem> SearchPage(string text, int pageIndex, int pageSize, out int totalHits)
        {
            Guid webSiteId = GetWebSiteIdForCurrentContext();

            return new SiteSearcher().Search(text.Trim(), webSiteId, FoundationContext.LanguageID, pageIndex - 1, pageSize, out totalHits, FoundationContext.Token);
        }

        /// <summary>
        /// Get website ID for the current user or current website
        /// </summary>
        /// <returns></returns>
        public virtual Guid GetWebSiteIdForCurrentContext()
        {
            string webSiteIdString = Request[ParameterConstants.WEB_SITE_ID];
            return !string.IsNullOrEmpty(webSiteIdString) ? new Guid(webSiteIdString) : CurrentPage.WebSiteID;
        }

        #endregion 

        #region Private Methods

        /// <summary>
        /// Executes the search.
        /// </summary>
        private void ExecuteSearch()
        {
            string query = Server.UrlDecode(Request[SearchField.SEARCH_STRING]);

            if (!string.IsNullOrEmpty(query))
            {
                int totalHits;
                IEnumerable<PublicSearchResultItem> resultItems = SearchPage(query, Paging.CurrentPageNumber, Paging.PageSize, out totalHits);
                DataBindResultGrid(resultItems, totalHits);
                Paging.TotalHits = totalHits;
                m_literalSearchTerm.Text = query;
                if (totalHits == 0)
                    Paging.Visible = false;
            }
        }


        /// <summary>
        /// Sets the text displaying the number of hits.
        /// </summary>
        private void InitHitCountDisplay()
        {
            if (m_pageHitCount > 0)
            {
                m_placeHolderNoHits.Visible = false;
                m_placeHolderHitCount.Visible = true;
                m_literalHitCount.Text = GetHitCountText();
            }
            else
            {
                m_placeHolderHitCount.Visible = false;
                m_placeHolderNoHits.Visible = true;
            }
        }

        /// <summary>
        /// Gets the text displaying the number of hits.
        /// </summary>
        private string GetHitCountText()
        {
            string text = string.Empty;
            StringShortProperty hitCountProperty = CurrentSettings.GetProperty(PROPERTY_HITCOUNT) as StringShortProperty;
            if (hitCountProperty != null && hitCountProperty.ValueCount > 0)
                text = hitCountProperty.GetValue(0);

            if (string.IsNullOrEmpty(text))
            {
                return string.Empty;
            }

            string fileHitCount = string.Empty;
            string pageHitCount = string.Empty;
            string pageHitCountPropertyName = (m_pageHitCount == 1) ? PROPERTY_PAGEHITCOUNT_SINGULAR : PROPERTY_PAGEHITCOUNT_PLURAL;
            StringShortProperty pageHitCountProperty = CurrentSettings.GetProperty(pageHitCountPropertyName) as StringShortProperty;
            if (pageHitCountProperty != null && pageHitCountProperty.ValueCount > 0)
                pageHitCount = pageHitCountProperty.GetValue(0);

            pageHitCount = pageHitCount.Contains(HITCOUNT_REPLACEMENTPATTERN) ? pageHitCount.Replace(HITCOUNT_REPLACEMENTPATTERN, m_pageHitCount.ToString()) 
                                                                              : m_pageHitCount.ToString();

            if (m_fileHitCount > 0)
            {
                string fileCountPropertyName = (m_fileHitCount == 1) ? PROPERTY_FILEHITCOUNT_SINGULAR : PROPERTY_FILEHITCOUNT_PLURAL;

                StringShortProperty fileCountProperty = CurrentSettings.GetProperty(fileCountPropertyName) as StringShortProperty;
                if (fileCountProperty != null && fileCountProperty.ValueCount > 0)
                    fileHitCount = fileCountProperty.GetValue(0);

                fileHitCount = fileHitCount.Contains(HITCOUNT_REPLACEMENTPATTERN) ? fileHitCount.Replace(HITCOUNT_REPLACEMENTPATTERN, m_fileHitCount.ToString()) 
                                                                                  : m_fileHitCount.ToString();
            }

            if (text.Contains(PAGEHITCOUNT_REPLACEMENTPATTERN))
                text = text.Replace(PAGEHITCOUNT_REPLACEMENTPATTERN, pageHitCount);

            if (text.Contains(FILEHITCOUNT_REPLACEMENTPATTERN))
                text = text.Replace(FILEHITCOUNT_REPLACEMENTPATTERN, fileHitCount);

            return text;
        }
        #endregion
    }
}