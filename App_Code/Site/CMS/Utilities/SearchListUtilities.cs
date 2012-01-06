using System;
using System.Collections.Generic;
using System.Web;
using Litium.Extensions.Metadata;
using Litium.Foundation.Modules.CMS;
using Litium.Extensions;
using Litium.Foundation.Modules.CMS.Pages;

/// <summary>
/// Summary description for LitiumSearchListUtilities
/// </summary>
public static class SearchListUtilities
{
	public static List<Guid> GetSelectedMetadataFromSession()
	{
		string sessionKey = GetSessionKey();
		List<Guid> metadata = new List<Guid>();

		if (HttpContext.Current.Session[sessionKey] == null)
		{
			HttpContext.Current.Session[sessionKey] = metadata;
			return metadata;
		}

		if (!(HttpContext.Current.Session[sessionKey] is List<Guid>))
		{
			HttpContext.Current.Session[sessionKey] = metadata;
			return metadata;
		}

		return (HttpContext.Current.Session[sessionKey] as List<Guid>);
	}

	public static bool IsMetadataSelected(Guid metadataId)
	{
		List<Guid> metadatas = GetSelectedMetadataFromSession();

		Guid existingMetadata = metadatas.Find(delegate(Guid p) { return p == metadataId; });

		return (existingMetadata != Guid.Empty);
	}

	public static void AddOrRemoveMetadataFromSelectedMetadata(Guid metadataId)
	{
		List<Guid> metadatas = GetSelectedMetadataFromSession();

		Guid existingMetadata = metadatas.Find(delegate(Guid p) { return p == metadataId; });

		if (existingMetadata == Guid.Empty)
			metadatas.Add(metadataId);
		else
			metadatas.Remove(existingMetadata);
	}

	private static string GetSessionKey()
	{
		return CurrentState.Current.PageID.ToString();
	}

	/// <summary>
	/// Gets the metadata link tag.
	/// </summary>
	/// <param name="metadata">The metadata.</param>
	/// <param name="metadataListPage">Metadata filtered list page, can be null.</param>
	/// <returns></returns>
	public static string GetMetadataLinkTag(Metadata metadata, Page metadataListPage)
	{
		string tag = string.Empty;

		if (metadata == null)
			return string.Empty;

		if (metadataListPage == null)
		{
			metadataListPage = Litium.Plus.Utilities.PageUtilities.GetFirstPublishedPageTypeInstance("MetadataFilteredList", CurrentState.Current.WebSiteID, Litium.Foundation.GUI.FoundationContext.Current.Token);
		}

		string metadataTranslation = metadata.Translations.GetMetadataTranslation(CurrentState.Current.WebSite.Culture).Translation;

		if (string.IsNullOrEmpty(metadataTranslation))
			return string.Empty;

		if (metadataListPage == null)
		{
			tag = "<span class=\"metadataSpanTag\">" + metadataTranslation + "</span>";
		}
		else
		{
			string linkTag = string.Format("<a href=\"{0}?MetadataID={1}\">{2}</a>", metadataListPage.GetUrlToPage(), metadata.ID, metadata.Translations.GetMetadataTranslation(CurrentState.Current.WebSite.Culture).Translation);
			tag = "<span class=\"metadataSpanTag\">" + linkTag + "</span>";
		}

		return tag;
	}

	public static List<Metadata> GetMetadatasForPage(Guid pageID, string metadataTypeName)
	{
		MetadataType metadataType = Extensions.Instance.Metadata.Types.GetMetadataType(metadataTypeName);

		return Extensions.Instance.Metadata.GetMetadataByPage(pageID, metadataType.Type);

	}
}
