using System;
using System.Collections.Generic;
using System.Linq;
using Litium.Foundation;
using Litium.Foundation.Modules.CMS;
using Litium.Foundation.Modules.CMS.Cache;
using Litium.Foundation.Modules.CMS.Carriers;
using Litium.Foundation.Modules.CMS.Content;
using Litium.Foundation.Modules.CMS.Pages;
using Litium.Foundation.Search;
using Litium.Foundation.Security;
using Litium.Framework.Search;
using log4net;

namespace App_Code.Site.CMS.MetaData
{
    public class MetadataService
    {
        public Guid PageTypeMetadataSubjectID { get; private set; }
        public Guid PageTypeMetadataTypeID { get; private set; }

        public static readonly MetadataService Instance = new MetadataService(ModuleCMS.Instance);
        private ILog _log = LogManager.GetLogger("MetadataService");
        
        static MetadataService()
        {
        }

        private MetadataService(ModuleCMS moduleCMS)
        {
            PageTypeMetadataSubjectID = moduleCMS.PageTypes.GetPageType("MetadataHolder").ID;
            PageTypeMetadataTypeID = moduleCMS.PageTypes.GetPageType("MetadataCategory").ID;
        }

        public Guid GetPageTypeMetadataSubjectID()
        {
            return PageTypeMetadataSubjectID;
        }

        public Guid GetPageTypeMetadataTypeID()
        {
            return PageTypeMetadataTypeID;
        }

        /// <summary>
        /// Get a metadata by its name.
        /// </summary>
        /// <param name="request">The request.</param>
        /// <param name="token">The security token.</param>
        /// <returns></returns>
        public Metadata GetMetadata(QueryRequest request, SecurityToken token)
        {
            SearchResponse response = Solution.Instance.SearchService.Search(request);
            if (response != null)
            {
                if (response.Hits.Count > 0)
                {
                    foreach (Hit hit in response.Hits)
                    {
                        Guid pageId = new Guid(hit.Id);
                        if (Page.ExistsPage(pageId))
                        {
                            Page page = Page.GetFromID(pageId, token);
                            return new Metadata(page, this, token);
                        }
                    }
                }
            }
            else
            {
                _log.Error("Search returned null instead of zero results.");
            }

            return null;
        }

        /// <summary>
        /// Gets a list of metadatas with only the most basic information set (ID and Name).
        /// </summary>
        /// <param name="request">The request.</param>
        /// <param name="searchService">The search service.</param>
        /// <param name="siteMapCache">The site map cache.</param>
        /// <returns>A list of metadata with most basic information</returns>
        public List<Metadata> GetBasicMetadata(QueryRequest request, SiteMapCache siteMapCache)
        {
            SearchResponse response = Solution.Instance.SearchService.Search(request);

            List<Metadata> metadatas = new List<Metadata>();

            if (response != null)
            {
                List<PageInfoCarrier> pages = GetPageInfoCarriersFromSearchResponse(response, siteMapCache);
                foreach (PageInfoCarrier page in pages)
                {
                    metadatas.Add(new Metadata(page, this));
                }
            }
            else
            {
                _log.Error("Search returned null instead of zero results.");
            }

            return metadatas;
        }

        /// <summary>
        /// Gets <see cref="Metadata"/> with complete set of information.
        /// </summary>
        /// <param name="request">The request.</param>
        /// <param name="searchService">The search service.</param>
        /// <param name="permissionManager">The permission manager.</param>
        /// <param name="token">The token.</param>
        /// <returns></returns>
        public List<Metadata> GetMetadatas(QueryRequest request, Litium.Foundation.Modules.CMS.Security.PermissionManager permissionManager, SecurityToken token)
        {
            // Perform search
            SearchResponse response = Solution.Instance.SearchService.Search(request);
            if (response == null)
            {
                _log.Error("Search returned null instead of zero results.");
                return new List<Metadata>();
            }

            List<Page> pages = GetPagesFromSearchResponse(response, permissionManager, token);

            List<Metadata> mds = new List<Metadata>();
            foreach (Page page in pages)
            {
                mds.Add(new Metadata(page, this, token));
            }

            return mds;
        }

        public List<Guid> GetMetadataIdList(QueryRequest request)
        {
            SearchResponse response = Solution.Instance.SearchService.Search(request);
            return response.Hits.Select(hit => new Guid(hit.Id)).ToList();
        }

        /// <summary>
        /// Gets the metadata from provided list of ids
        /// </summary>
        /// <param name="metadataIds">The metadata ids.</param>
        /// <param name="token">The token.</param>
        /// <returns></returns>
        public List<Metadata> GetMetadataFromIDs(List<Guid> metadataIds, SecurityToken token)
        {
            List<Page> pages = Page.GetFromIDs(metadataIds, token);

            List<Metadata> mds = new List<Metadata>();
            foreach (Page page in pages)
            {
                mds.Add(new Metadata(page, this, token));
            }

            return mds;
        }

        /// <summary>
        /// Sets the metadata on provided page, the metadata provided will be the only metadata saved on the page.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <param name="metadatas">A list of metadata to be saved on page.</param>
        /// <param name="token">The token.</param>
        public void SetMetadataOnPage(PropertyCollection collection, List<Metadata> metadatas, SecurityToken token)
        {
            StringShortProperty property = GetOrCreateMetadataProperty(collection, token);
            if (property.ValueCount > 0)
                property.DeleteAllValues(token);

            foreach (Metadata metadata in metadatas)
            {
                property.SetValue(property.ValueCount, metadata.ID.ToString(), token);
            }
        }


        /// <summary>
        /// Gets the metadatas from provided page.
        /// </summary>
        /// <param name="collection">The property collection to use.</param>
        /// <param name="token">The token.</param>
        /// <returns>A list of metadatas.</returns>
        public List<Metadata> GetMetadatasFromPage(PropertyCollection collection, SecurityToken token)
        {
            List<Metadata> mds = new List<Metadata>();
            StringShortProperty property = GetOrCreateMetadataProperty(collection, token);
            if (property.ValueCount > 0)
            {
                for (int i = 0; i < property.ValueCount; i++)
                {
                    string pageId = property.GetValue(i);
                    Guid id = new Guid(pageId);
                    if (id != Guid.Empty && Page.ExistsPage(id))
                    {
                        Page mdPage = Page.GetFromID(id, token);
                        mds.Add(new Metadata(mdPage, this, token));
                    }
                }
            }
            return mds;
        }

        #region -- Private methods --

        private StringShortProperty GetOrCreateMetadataProperty(PropertyCollection collection, SecurityToken token)
        {
            StringShortProperty property = collection[Metadata.PropertyNameSelectedMetadata] as StringShortProperty;
            if (property == null)
                property = collection.CreateStringShortProperty(Metadata.PropertyNameSelectedMetadata, false, false, true, token);
            return property;
        }

        private List<PageInfoCarrier> GetPageInfoCarriersFromSearchResponse(SearchResponse response, SiteMapCache siteMapCache)
        {
            var pages = (from hit in response.Hits
                         select new Guid(hit.Id) into pageID
                         where Page.ExistsPage(pageID)
                         select siteMapCache.GetPage(pageID)).ToList();

            return pages;
        }

        private List<Page> GetPagesFromSearchResponse(SearchResponse response, Litium.Foundation.Modules.CMS.Security.PermissionManager permissionManager, SecurityToken token)
        {
            List<Page> pages = new List<Page>();

            if (response != null && response.Hits != null)
            {
                foreach (Hit hit in response.Hits)
                {
                    Guid pageId = new Guid(hit.Id);

                    // Verify that page exists and user has permission to view page
                    if (Page.ExistsPage(pageId) && permissionManager.UserHasPageReadPermission(token.UserID, pageId, true, true))
                    {
                        // Fetch page from database
                        Page page = Page.GetFromID(pageId, token);
                        pages.Add(page);
                    }
                }
            }

            return pages;
        }

        #endregion
    }
}