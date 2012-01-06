using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Litium.Foundation.Modules;
using Litium.Foundation.Modules.CMS;
using Litium.Foundation.Modules.CMS.Content;
using Litium.Foundation.Modules.CMS.Pages;
using Litium.Foundation.Modules.CMS.PageTypes;
using Litium.Foundation.Modules.CMS.Templates;
using Litium.Foundation.Modules.CMS.WebSites;
using Page=System.Web.UI.Page;

public partial class Site_CMS_AddOns_PageTypeInstances : System.Web.UI.UserControl
{
	protected const string DEFAULT_LISTITEM_VALUE = "-1";

	/// <summary>
	/// Page_Load
	/// </summary>
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!CurrentState.Current.Token.IsSystemUser)
			throw new Exception("Please login as system user.");

		if (!IsPostBack)
			InitControls();
	}

	protected void InitControls()
	{
		InitDropdownlistPageTypes();
		InitCheckboxlistWebSites();
		InitRadioButtonListPageStatuses();
	}

	protected void InitDropdownlistPageTypes()
	{
		c_dropdownlistPageTypes.Items.Add(GetDefaultListItem("Choose pagetype"));

		foreach (PageType pageType in Module<ModuleCMS>.Instance.PageTypes)
		{
			c_dropdownlistPageTypes.Items.Add(new ListItem(pageType.Name, pageType.ID.ToString()));
		}
	}

	protected void InitDropdownlistTemplates(Guid pageTypeID)
	{
		c_dropdownlistTemplates.Items.Clear();
		c_dropdownlistTemplates.Enabled = (pageTypeID != Guid.Empty);

		if (pageTypeID == Guid.Empty)
			return;

		c_dropdownlistTemplates.Items.Add(GetDefaultListItem("Choose template"));

		foreach (Template template in Module<ModuleCMS>.Instance.PageTypes[pageTypeID].Templates)
		{
			c_dropdownlistTemplates.Items.Add(new ListItem(template.Name, template.ID.ToString()));
		}
	}

	protected void InitCheckboxlistWebSites()
	{
		foreach (WebSite webSite in Module<ModuleCMS>.Instance.WebSites)
		{
			ListItem listItem = new ListItem(webSite.Name, webSite.ID.ToString());

			listItem.Selected = webSite.IsDefaultWebSite;

			c_checkboxlistWebSites.Items.Add(listItem);
		}
	}

	protected void InitRadioButtonListPageStatuses()
	{
		foreach (PageStatus pageStatus in Enum.GetValues(typeof(PageStatus)))
		{
			ListItem listItem = new ListItem(pageStatus.ToString(), Convert.ToInt32(pageStatus).ToString());

			listItem.Selected = (pageStatus == PageStatus.PUBLISHED);

			c_checkboxlistPageStatuses.Items.Add(listItem);
		}
	}

	protected ListItem GetDefaultListItem(string text)
	{
		ListItem listItem = new ListItem(text, DEFAULT_LISTITEM_VALUE);
		listItem.Selected = true;
		return listItem;

	}

	protected List<Guid> GetWebSiteIDs()
	{
		List<Guid> webSiteIDs = new List<Guid>();
		foreach (ListItem listItem in c_checkboxlistWebSites.Items)
		{
			if (listItem.Selected)
				webSiteIDs.Add(new Guid(listItem.Value));
		}

		return webSiteIDs;
	}

	protected List<PageStatus> GetPageStatuses()
	{
		List<PageStatus> pageStatuses = new List<PageStatus>();

		foreach (ListItem listItem in c_checkboxlistPageStatuses.Items)
		{
			if (!listItem.Selected)
				continue;

			PageStatus pageStatus = (PageStatus)Convert.ToInt32(listItem.Value);

			pageStatuses.Add(pageStatus);
		}

		return pageStatuses;
	}

	protected Guid GetSelectedListItemValueAsGuid(DropDownList dropDownList)
	{
		Guid id = Guid.Empty;

		if (dropDownList.SelectedValue == DEFAULT_LISTITEM_VALUE)
			return id;

		return new Guid(dropDownList.SelectedValue);
	}

	protected void DropdownlistPageTypes_SelectedIndexChanged(object sender, EventArgs e)
	{
		Guid pageTypeID = Guid.Empty;

		if (c_dropdownlistPageTypes.SelectedValue != DEFAULT_LISTITEM_VALUE)
			pageTypeID = new Guid(c_dropdownlistPageTypes.SelectedValue);

		c_buttonSearch.Enabled = (pageTypeID != Guid.Empty);

		InitDropdownlistTemplates(pageTypeID);

	}

	protected void ButtonSearch_Click(object sender, EventArgs e)
	{
		Guid pageTypeID = GetSelectedListItemValueAsGuid(c_dropdownlistPageTypes);
		Guid templateID = GetSelectedListItemValueAsGuid(c_dropdownlistTemplates);
		List<Guid> webSiteIDs = GetWebSiteIDs();
		List<PageStatus> pageStatuses = GetPageStatuses();

		if (pageTypeID == Guid.Empty || webSiteIDs.Count == 0)
			return;

		List<Litium.Foundation.Modules.CMS.Pages.Page> pagetypeInstances = GetPageTypeInstances(pageTypeID, templateID, webSiteIDs, pageStatuses);

		c_pagerepaterInstances.DataSource = pagetypeInstances;
		c_pagerepaterInstances.DataBind();
	}

	protected List<Litium.Foundation.Modules.CMS.Pages.Page> GetPageTypeInstances(Guid pageTypeID, Guid templateID, List<Guid> webSiteIDs, List<PageStatus> pageStatuses)
	{
		List<Guid> pageTypeInstances = Module<ModuleCMS>.Instance.PageTypes[pageTypeID].Instances.InstanceIDs;
		List<Litium.Foundation.Modules.CMS.Pages.Page> pageTypeInstancesMatchingCriteria = new List<Litium.Foundation.Modules.CMS.Pages.Page>();

		List<Litium.Foundation.Modules.CMS.Pages.Page> pages = Litium.Foundation.Modules.CMS.Pages.Page.GetFromIDs(Module<ModuleCMS>.Instance, pageTypeInstances, CurrentState.Current.Token);

		foreach (Litium.Foundation.Modules.CMS.Pages.Page page in pages)
		{
			if (!webSiteIDs.Contains(page.WebSiteID))
				continue;

			if (!pageStatuses.Contains(page.Status))
				continue;

			if (templateID != Guid.Empty && page.TemplateID != templateID)
				continue;

			pageTypeInstancesMatchingCriteria.Add(page);
		}

		return pageTypeInstancesMatchingCriteria;
	}

	protected string GetStringContent(Litium.Foundation.Modules.CMS.Pages.Page page, string propertyName)
	{
		StringProperty property = page.Content[propertyName] as StringProperty;
		if(property != null && property.ValueCount > 0)
		{
			return property.GetValue();
		}

		return string.Empty;
	}
}
