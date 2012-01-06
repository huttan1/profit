using System;
using System.Collections.Generic;
using Litium.Foundation.Modules.CMS.PageTypes;
using Litium.Foundation.Modules.CMS.Search;
using Litium.Foundation.Search;
using Litium.Foundation.Search.Constants;
using Litium.Foundation.Security;
using Litium.Framework.Search;
using TagNames = Litium.Foundation.Modules.CMS.Search.TagNames;

namespace App_Code.Site.CMS.MetaData
{
    public class QueryRequestFactory
    {
        private static QueryRequestFactory m_instance;

        public static QueryRequestFactory Instance
        {
            get
            {
                if (m_instance == null)
                {
                    m_instance = new QueryRequestFactory();
                }

                return m_instance;
            }
        }

        public QueryRequest GetPageTypeInstancesQueryRequest(Guid pageTypeId, Guid languageId, SecurityToken token)
        {
            // Set up page query.
            var request = new QueryRequest(languageId, CmsSearchDomains.Pages, token);

            // Set pagetype.
            request.FilterTags.Add(new Tag(TagNames.PageTypeId, pageTypeId));

            // Only published pages.
            request.FilterTags.Add(new Tag(TagNames.IsPublished, true));

            // Sort order.
            Sorting sorting = new Sorting(TagNames.PageIndex, SortingFieldType.Int);
            request.Sortings.Add(sorting);

            // Fetch many.
            request.Paging = new Paging(1, 999999);

            return request;
        }

        public QueryRequest GetMetadataSubjectInstancesQueryRequest(PageTypeCollection pageTypes, Guid languageId, SecurityToken token)
        {
            PageType pt = pageTypes.GetPageType("MetadataHolder");
            if (pt != null)
            {
                return GetPageTypeInstancesQueryRequest(pt.ID, languageId, token);
            }

            return null;
        }

        public QueryRequest GetMetadataTypeInstancesQueryRequest(PageTypeCollection pageTypes, Guid languageId, SecurityToken token)
        {
            PageType pt = pageTypes.GetPageType("MetadataCategory");
            if (pt != null)
            {
                return GetPageTypeInstancesQueryRequest(pt.ID, languageId, token);
            }

            return null;
        }

        public QueryRequest GetPagesTaggedWithMetadataQueryRequest(Metadata requiredMetadata, Guid parentPageId, Guid webSiteId, SortType sortType, int pageIndex, int pageSize, Guid languageId, SecurityToken token)
        {
            return GetPagesTaggedWithMetadataQueryRequest(new List<Metadata>() { requiredMetadata }, new List<Metadata>(), parentPageId, webSiteId, sortType, pageIndex, pageSize, languageId, token);
        }

        public QueryRequest GetPagesTaggedWithMetadataQueryRequest(List<Metadata> requiredMetadata, Guid webSiteId, SortType sortType, int pageIndex, int pageSize, Guid languageId, SecurityToken token)
        {
            return GetPagesTaggedWithMetadataQueryRequest(requiredMetadata, new List<Metadata>(), Guid.Empty, webSiteId, sortType, pageIndex, pageSize, languageId, token);
        }

        public QueryRequest GetPagesTaggedWithMetadataQueryRequest(List<Metadata> requiredMetadata, Guid parentPageId, Guid webSiteId, SortType sortType, int pageIndex, int pageSize, Guid languageId, SecurityToken token)
        {
            return GetPagesTaggedWithMetadataQueryRequest(requiredMetadata, new List<Metadata>(), parentPageId, webSiteId, sortType, pageIndex, pageSize, languageId, token);
        }

        public QueryRequest GetPagesTaggedWithMetadataQueryRequest(List<Metadata> requiredMetadatas, List<Metadata> optionalMetadatas, Guid parentPageId, Guid webSiteId, SortType sortType, int pageIndex, int pageSize, Guid languageId, SecurityToken token)
        {
            var request = new QueryRequest(languageId, SearchDomains.Pages, token);

            // Make sure page is searchable
            request.FilterTags.Add(new Tag(TagNames.IsSearchable, bool.TrueString));

            // Make sure pages are published
            request.FilterTags.Add(new Tag(TagNames.IsPublished, bool.TrueString));

            if (parentPageId != Guid.Empty)
            {
                // Only search pages under specified page
                request.FilterTags.Add(new Tag(TagNames.PageParentTreeId, parentPageId));
            }

            if (webSiteId != Guid.Empty)
            {
                // Only search pages under specified web site
                request.FilterTags.Add(new Tag(TagNames.WebSiteId, webSiteId));
            }

            // Add required metadatas as filter
            foreach (Metadata metadata in requiredMetadatas)
            {
                request.FilterTags.Add(new Tag(TagNames.GetTagNameForProperty(Metadata.PropertyNameSelectedMetadata), metadata.ID));
            }

            if (optionalMetadatas != null && optionalMetadatas.Count > 0)
            {
                // Add optional metadatas
                OptionalTagClause optionalMetadatasClause = new OptionalTagClause();
                foreach (Metadata metadata in optionalMetadatas)
                {
                    optionalMetadatasClause.FilterTags.Add(new Tag(TagNames.GetTagNameForProperty(Metadata.PropertyNameSelectedMetadata), metadata.ID));
                }
                request.FilterTags.Add(optionalMetadatasClause);
            }

            request.Paging = GetPaging(pageIndex, pageSize);

            Sorting sorting = GetSortType(sortType);

            if (sorting != null)
            {
                request.Sortings.Add(sorting);
            }

            return request;
        }

        private static Paging GetPaging(int pageIndex, int pageSize)
        {
            if (pageIndex < 1)
            {
                pageIndex = 1;
            }

            return new Paging(pageIndex, pageSize);
        }

        public QueryRequest GetPagesTaggedWithMetadataQueryRequest(Guid metadataId, Guid parentPageId, Guid webSiteId, Guid languageId, int pageIndex, int pageSize, SecurityToken token)
        {
            var request = new QueryRequest(languageId, SearchDomains.Pages, token);

            // Make sure page is searchable
            request.FilterTags.Add(new Tag(TagNames.IsSearchable, bool.TrueString));

            // Make sure pages are published
            request.FilterTags.Add(new Tag(TagNames.IsPublished, bool.TrueString));

            if (parentPageId != Guid.Empty)
            {
                // Only search pages under specified page
                request.FilterTags.Add(new Tag(TagNames.PageParentTreeId, parentPageId));
            }

            if (webSiteId != Guid.Empty)
            {
                // Only search pages under specified web site
                request.FilterTags.Add(new Tag(TagNames.WebSiteId, webSiteId));
            }

            // Add required metadatas as filter
            request.FilterTags.Add(new Tag(TagNames.GetTagNameForProperty(Metadata.PropertyNameSelectedMetadata), metadataId));

            // Set paging
            request.Paging = GetPaging(pageIndex, pageSize);

            return request;
        }

        public QueryRequest GetMetadataByNameQueryRequest(string name, Guid pageTypeId, Guid languageId, SecurityToken token)
        {
            // Set up page query.
            var request = new QueryRequest(languageId, CmsSearchDomains.Pages, token);

            // Set pagetype.
            request.FilterTags.Add(new Tag(TagNames.PageTypeId, pageTypeId));

            // Set pagetype.
            request.FilterTags.Add(new Tag(TagNames.Name, name) { AllowFuzzy = false });

            // Only published pages.
            request.FilterTags.Add(new Tag(TagNames.IsPublished, true));

            request.Paging = Paging.Default;

            return request;
        }

        /// <summary>
        /// Gets a sorting from provided sort type.
        /// </summary>
        /// <param name="sortType">Type of sort.</param>
        /// <returns>A <see cref="Sorting"/>. If <see cref="SortType.Relevance"/> is provided null is returned.</returns>
        private Sorting GetSortType(SortType sortType)
        {
            switch (sortType)
            {
                case SortType.Alphabetical:
                    return new Sorting(TagNames.Name, SortDirection.Ascending, SortingFieldType.String);
                case SortType.PublishDate:
                    return new Sorting(TagNames.StartPublishDateTime, SortDirection.Descending, SortingFieldType.Date);
                case SortType.Index:
                    return new Sorting(TagNames.PageIndex, SortDirection.Ascending, SortingFieldType.String);
                default:
                    break;
            }

            return null;
        }
    }
}