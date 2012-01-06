using System;
using System.Web.UI.WebControls;
using Litium.Extensions.Metadata;
using Litium.Foundation.Modules.CMS;

namespace App_Code.Site.Comparers
{
	/// <summary>
	/// Sorts a generic list with metadata objects
	/// </summary>
	public class GenericListMetadataComparer
	{
		/// <summary>
		/// Sorts ascending by translation
		/// </summary>
		public static Comparison<Metadata> TranslationAscendingComparison = delegate(Metadata p1, Metadata p2)
     	{
			if (p1 == null || p2 == null)
				return 0;

			string translation1 = p1.Translations.GetMetadataTranslation(CurrentState.Current.WebSite.Culture).Translation;
			string translation2 = p2.Translations.GetMetadataTranslation(CurrentState.Current.WebSite.Culture).Translation;

			if (string.IsNullOrEmpty(translation1) || string.IsNullOrEmpty(translation2))
				return 0;

			return translation1.CompareTo(translation2);
     	};

	}
}