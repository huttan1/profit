using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Litium.Foundation.Modules.ECommerce.Carriers;
using Litium.Foundation.Modules.ECommerce.WebControls;
using Litium.Foundation.Modules.CMS.GUI.Constants;
using System.Web;
using System.Web.UI.HtmlControls;

namespace Site.CMS.Templates.UserControls
{
    /// <summary>
    /// User control that will display paging UI.
    /// </summary>
    public partial class Paging : App_Code.Site.CMS.UserControls.BaseUserControl
    {
        #region Constructor
        /// <summary>
        /// Constructor. Set default values of PageSize, FirstPageNumber, DisplayedEntries and ActiveEntryLinkClass
        /// </summary>
        public Paging()
        {
            PageSize = 10;
            FirstPageNumber = 1;
            DisplayedEntries = 10;
            ActiveEntryLinkClass = "active";
        }
        #endregion

        #region Events
        /// <summary>
        /// Handles the on init event of the Page control.
        /// </summary>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected override void OnInit(EventArgs e)
        {
            int pageNumber;
            if (!int.TryParse(Request[ParameterConstants.PAGING_INDEX], out pageNumber))
                pageNumber = 1;

            CurrentPageNumber = pageNumber <= 0 ? 1 : pageNumber;
            
            base.OnInit(e);
        }
        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected override void OnLoad(EventArgs e)
        {
            InitNextButton();
            InitPreviousButton();
            InitFirstButton();
            InitLastButton();
            InitInformation();

            base.OnLoad(e);
        }
        #endregion

        #region Properties
        /// <summary>
        /// Set how many entries (Numberical links) that should be displayed
        /// </summary>
        public int DisplayedEntries { get; set; }

        /// <summary>
        /// Set or get the total hits 
        /// </summary>
        public int TotalHits { get; set; }

        /// <summary>
        /// Page size. Default value is 10
        /// </summary>
        public int PageSize { get; set; }

        /// <summary>
        /// Which page number is the first page number. Default value is 1
        /// </summary>
        public int FirstPageNumber { get; set; }

        /// <summary>
        /// Get or set the current page number
        /// </summary>
        public int CurrentPageNumber { get; set; }

        /// <summary>
        /// Get the last page number
        /// </summary>
        public int LastPageNumber
        {
            get
            {
                double itemCount = Convert.ToDouble(TotalHits);
                double pageSize = Convert.ToDouble(PageSize);
                return Convert.ToInt32(Math.Ceiling(itemCount / pageSize));
            }
        }

        /// <summary>
        /// CSS class for the active entry link
        /// </summary>
        public string ActiveEntryLinkClass { get; set; }
        
        /// <summary>
        /// Get the start item number of current page
        /// </summary>
        public int CurrentPageItemStartNumber
        {
            get
            {
                return CurrentPageNumber > 1 ? (CurrentPageNumber * PageSize) - PageSize + 1 : 1;
            }
        }

        /// <summary>
        /// Get the end item number of current page
        /// </summary>
        public int CurrentPageItemEndNumber
        {
            get
            {
                int endNumber = CurrentPageNumber > 1 ? CurrentPageNumber + PageSize - 1 : PageSize;
                return endNumber > TotalHits ? TotalHits : endNumber;
            }
        }

        #endregion

        #region Public methods

        /// <summary>
        /// Init entry interval links
        /// </summary>
        public void InitInformation()
        {
            int[] interval = EntryInterval();
            // Generate interval links
            for (int i = interval[0]; i < interval[1]; i++)
            {
                HtmlAnchor link = new HtmlAnchor();
                link.InnerText = i.ToString();
                link.HRef= GeneratePagingURL(ParameterConstants.PAGING_INDEX, (i).ToString());

                if (CurrentPageNumber == i && !String.IsNullOrEmpty(ActiveEntryLinkClass))
                    link.Attributes.Add("class", ActiveEntryLinkClass);

                m_pagingInformation.Controls.Add(link);
            }
        }

        /// <summary>
        /// Init button "Go to next page"
        /// </summary>
        public void InitNextButton()
        {
            if (CurrentPageNumber == LastPageNumber)
                m_pagingNext.Visible = false;
            else
            {
                m_pagingNext.NavigateUrl = GeneratePagingURL(ParameterConstants.PAGING_INDEX, (CurrentPageNumber + 1).ToString());
            }
        }
        /// <summary>
        /// Init button "Go to last page"
        /// </summary>
        public void InitLastButton()
        {
            if (CurrentPageNumber == LastPageNumber)
                m_pagingLast.Visible = false;
            else
            {
                m_pagingLast.NavigateUrl = GeneratePagingURL(ParameterConstants.PAGING_INDEX, LastPageNumber.ToString());
            }
        }

        /// <summary>
        /// Init button "Go to first page"
        /// </summary>
        public void InitFirstButton()
        {
            if (CurrentPageNumber > FirstPageNumber)
                m_pagingFirst.NavigateUrl = GeneratePagingURL(ParameterConstants.PAGING_INDEX, FirstPageNumber.ToString());
            else
                m_pagingFirst.Visible = false;
        }

        /// <summary>
        /// Init button "Go to previous page"
        /// </summary>
        public void InitPreviousButton()
        {
            if (CurrentPageNumber == FirstPageNumber)
                m_pagingPrevious.Visible = false;
            else
                m_pagingPrevious.NavigateUrl = GeneratePagingURL(ParameterConstants.PAGING_INDEX, (CurrentPageNumber - 1).ToString());
        }
        #endregion

        #region Private Methods
        /// <summary>
        /// Gets the entry interval to be shown
        /// </summary>
        /// <returns>An int[] where [0] is start index and [1] is end index</returns>
        private int[] EntryInterval()
        {
            double half = Math.Ceiling(Convert.ToDouble(DisplayedEntries / 2));
            double upperLimit = LastPageNumber - DisplayedEntries;
            double start = CurrentPageNumber > half ? Math.Max(Math.Min(CurrentPageNumber - half, upperLimit), 0) : 1;
            double end = CurrentPageNumber > half ? Math.Min(CurrentPageNumber + half + 1, LastPageNumber + 1) : Math.Min(DisplayedEntries, LastPageNumber);

            return new int[] { Convert.ToInt32(start), Convert.ToInt32(end) };
        }

        /// <summary>
        /// Method to build a new URL. It will find a specific key (In querystring) and replace its value.
        /// </summary>
        /// <param name="key">The key in querystring to be found</param>
        /// <param name="newValue">The value that will replace the old value</param>
        /// <returns>A new URL with updated value</returns>
        private string GeneratePagingURL(string key, string newValue)
        {
            var query = HttpUtility.ParseQueryString(Request.Url.Query);
            query[key] = newValue.ToString();
            return Request.Url.AbsolutePath + "?" + query.ToString();
        }
        #endregion
    }
}