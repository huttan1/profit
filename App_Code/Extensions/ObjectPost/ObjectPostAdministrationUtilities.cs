using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;
using Litium.Foundation;
using Litium.Foundation.GUI;
using Litium.Foundation.Modules;
using Litium.Foundation.Modules.CMS;
using Litium.Foundation.Modules.CMS.Carriers;
using Litium.Foundation.Modules.CMS.WebSites;
using Litium.Foundation.Modules.ProductCatalog;
using Litium.Foundation.Modules.ProductCatalog.Products;
using Litium.Plus.Comparers;

namespace App_Code.Extensions.ObjectPost
{
	public static class ObjectPostAdministrationUtilities
	{
		private const string ERROR_MESSAGE_PAGE_MISSING = "Saknas";
		private const string ERROR_MESSAGE_PAGE_NOT_PUBLISHED = "Ej publicerad";

		/// <summary>
		/// Gets the hyper link for object post object.
		/// </summary>
		/// <param name="objectPostId">The object post id</param>
		/// <param name="objectPostType">Type of the object post.</param>
		/// <param name="webSiteID">The web site ID.</param>
		/// <returns></returns>
		public static string GetHyperLinkForObjectPostObject(Guid objectPostId, ObjectPostTypes objectPostType)
		{
			Litium.Extensions.ObjectPost.ObjectPost objectPost = Litium.Extensions.Extensions.Instance.ObjectPosts.GetObjectPost(objectPostId);
			
			if (objectPost == null)
				return string.Empty;

			switch (objectPostType)
			{
				case ObjectPostTypes.CMS_PAGE:
					return GetHyperLinkForPage(objectPost.ObjectID);
				case ObjectPostTypes.PRODUCTCATALOG_PRODUCT:
					return GetHyperLinkForProduct(objectPost.ObjectID, objectPost.WebSiteID); // NOTE: I extensions för 4.4.3 finns websiteid på objectPost objectet.
				default:
					return string.Empty;
			}
		}

		private static string GetHyperLinkForProduct(Guid guid, Guid webSiteID)
		{
			WebSite webSite = Module<ModuleCMS>.Instance.WebSites.GetWebSite(webSiteID);

			Product product = Product.GetProduct(guid);
			if (product != null)
			{
				string link = "http://" + webSite.DomainName + "/Modules/ProductCatalog/Product.aspx?pgid=" + product.ProductGroupID + "&pid=" + product.ProductID;
				return CreateHyperLinkMarkup(link, product.GetDisplayName(FoundationContext.Current.LanguageID));
			}

			return String.Empty;
		}

		private static string GetHyperLinkForPage(Guid pageID)
		{
			// TODO: Check if page is published? // jani

			PageInfoCarrier pageInfoCarrier = Module<ModuleCMS>.Instance.CacheManager.SiteMapCache.GetPage(pageID);

			if (pageInfoCarrier == null)
				return ERROR_MESSAGE_PAGE_MISSING;

			return CreateHyperLinkMarkup(VirtualPathUtility.ToAbsolute(pageInfoCarrier.Url), pageInfoCarrier.ShortName);
		}

		private static string CreateHyperLinkMarkup(string url, string text)
		{
			return "<a target=\"_blank\" href=\"" + url + "\">" + text + "</a>";
		}

		/// <summary>
		/// Returns number of reports for a ObjectPostType
		/// </summary>
		/// <param name="objectPostType">Type of the object post.</param>
		/// <returns>number of reports for a ObjectPostType</returns>
		public static int GetReportsForObjectPostType(ObjectPostTypes objectPostType)
		{
			List<Litium.Extensions.ObjectPost.ObjectPost> objectPosts = Litium.Extensions.Extensions.Instance.ObjectPosts.GetObjectPostByType((short) objectPostType);

			int reports = 0;

			foreach (Litium.Extensions.ObjectPost.ObjectPost objectPost in objectPosts)
			{
				reports += objectPost.Reports.All.Count;
			}

			return reports;
		}

		/// <summary>
		/// Inits dropdownlist with WebSites. Also sets member for the selected website id. Sorts ascending on WebSite name
		/// </summary>
		public static void InitDropDownWebSites(Guid selectedWebSiteID, DropDownList dropDownList)
		{
			List<ListItem> listItems = new List<ListItem>();

			foreach (WebSite webSite in Module<ModuleCMS>.Instance.WebSites)
			{
				ListItem listItem = new ListItem(webSite.Name, webSite.ID.ToString());

				if (webSite.ID == selectedWebSiteID)
				{
					listItem.Selected = true;
				}

				listItems.Add(listItem);
			}

			listItems.Sort(GenericListListItemComparer.TextAscendingComparison);
			dropDownList.Items.Clear();
			dropDownList.Items.AddRange(listItems.ToArray());
		}


		/// <summary>
		/// Inits dropdownlist with ObjectPostTypes. Includes only ObjectPostTypes that has reported ObjectPosts. Sorts ascending on text
		/// </summary>
		public static void InitDropDownObjectPostTypes(string selectedObjectPostTypeValue, DropDownList dropDownList)
		{
			short objectPostTypeValue = short.Parse(selectedObjectPostTypeValue);

			InitDropDownObjectPostTypes((ObjectPostTypes) objectPostTypeValue, dropDownList);
		}

		public static void InitDropDownObjectPostTypes(short selectedObjectPostTypeValue, DropDownList dropDownList)
		{
			InitDropDownObjectPostTypes((ObjectPostTypes)selectedObjectPostTypeValue, dropDownList);
		}

		/// <summary>
		/// Inits dropdownlist with ObjectPostTypes and number of reports. Includes only ObjectPostTypes that has reported ObjectPosts. Sorts ascending on text
		/// </summary>
		public static void InitDropDownObjectPostTypes(ObjectPostTypes selectedObjectPostType, DropDownList dropDownList)
		{
			List<ListItem> listItems = new List<ListItem>();

			string selectedObjectPostTypeValue = ((short) selectedObjectPostType).ToString();

			foreach (int objectPostTypeValue in Enum.GetValues(typeof (ObjectPostTypes)))
			{
				string reports = " (" + GetReportsForObjectPostType((ObjectPostTypes) objectPostTypeValue) + ")";
				string objectPostTypesTranslation = GetObjectPostTypeText((ObjectPostTypes) objectPostTypeValue);
				ListItem listItem = new ListItem(objectPostTypesTranslation + reports, objectPostTypeValue.ToString());

				if (listItem.Value == selectedObjectPostTypeValue)
				{
					listItem.Selected = true;
				}

				listItems.Add(listItem);
			}

			listItems.Sort(GenericListListItemComparer.TextAscendingComparison);

			dropDownList.Items.Clear();
			dropDownList.Items.AddRange(listItems.ToArray());
		}

		public static string GetObjectPostTypeText(ObjectPostTypes objectPostTypeValue)
		{
			// Get description of the type from system strings
			string systemStringName = "Extensions_OP_Type_" + (short) objectPostTypeValue;
			string objectPostTypesTranslation = Solution.Instance.SystemStrings.GetValue(systemStringName, FoundationContext.Current.Culture, true);
			if (string.IsNullOrEmpty(objectPostTypesTranslation))
			{
				objectPostTypesTranslation = objectPostTypeValue + string.Format(" (Create a systemstring named {0} to set type name)", systemStringName);
			}
			return objectPostTypesTranslation;
		}

		/// <summary>
		/// Inits dropdownlist with ObjectPostTypes and number of posts for web site. Sorts ascending on text
		/// Use Guid.Empty for web site id to get number of post for all websites.
		/// </summary>
		public static void InitDropDownObjectPostTypesAllPosts(ObjectPostTypes selectedObjectPostType, DropDownList dropDownList, Guid webSiteID)
		{
			List<ListItem> listItems = new List<ListItem>();

			string selectedObjectPostTypeValue = ((short) selectedObjectPostType).ToString();

			foreach (int objectPostTypeValue in Enum.GetValues(typeof (ObjectPostTypes)))
			{
				List<Litium.Extensions.ObjectPost.ObjectPost> objectPosts;
				
				if(webSiteID != Guid.Empty)
					objectPosts = Litium.Extensions.Extensions.Instance.ObjectPosts.GetObjectPostByWebSiteAndType(webSiteID, (short)objectPostTypeValue);
				else
					objectPosts = Litium.Extensions.Extensions.Instance.ObjectPosts.GetObjectPostByType((short)objectPostTypeValue);

				string posts = " (" + objectPosts.Count + ")";
				string objectPostTypesTranslation = GetObjectPostTypeText((ObjectPostTypes) objectPostTypeValue);
				ListItem listItem = new ListItem(objectPostTypesTranslation + posts, objectPostTypeValue.ToString());

				if (listItem.Value == selectedObjectPostTypeValue)
				{
					listItem.Selected = true;
				}

				listItems.Add(listItem);
			}

			listItems.Sort(GenericListListItemComparer.TextAscendingComparison);

			dropDownList.Items.Clear();
			dropDownList.Items.AddRange(listItems.ToArray());
		}
	}
}