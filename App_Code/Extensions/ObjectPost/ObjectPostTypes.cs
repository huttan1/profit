namespace App_Code.Extensions.ObjectPost
{
	public enum ObjectPostTypes
	{
		/// <summary>
		/// CMS pages
		/// </summary>
		CMS_PAGE = 10,

		/// <summary>
		/// Relations persons
		/// </summary>
		RELATIONS_PERSON = 20,
		
		/// <summary>
		/// Relations groups
		/// </summary>
		RELATIONS_GROUP = 30,

		/// <summary>
		/// Relations organizations
		/// </summary>
		RELATIONS_ORGANIZATION = 40,
		
		/// <summary>
		/// Productcatalog articles
		/// </summary>
		PRODUCTCATALOG_ARTICLE = 50,
		
		/// <summary>
		/// Productcatalog products
		/// </summary>
		PRODUCTCATALOG_PRODUCT = 60,

		/// <summary>
		/// Productcatalog productgroups
		/// </summary>
		PRODUCTCATALOG_PRODUCT_GROUP = 70
	}
}