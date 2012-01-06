using System;
using Litium.Foundation.Modules.CMS;
using Litium.Foundation.Modules.CMS.Carriers;
using Litium.Foundation.Modules.CMS.Pages;
using Litium.Foundation.Modules.CMS.PageTypes;
using Litium.Foundation.Modules.Relations;
using Litium.Foundation.Modules.Relations.Organizations;
using Litium.Extensions;
using Litium.Extensions.EmailValidation;
using iPerson = Litium.Foundation.Modules.Relations.Persons.Person;

/// <summary>
///	Test1.
/// </summary>
public partial class EmailValidationConfirmation : Litium.Foundation.Modules.CMS.GUI.Templates.ContentPageTemplate
{
    /// <summary>
    /// Page_Load.
    /// </summary>
    protected void Page_Load(object sender, EventArgs e)
    {
		// If in admin mode show the texts
		if(CurrentState.IsInAdministrationMode)
		{
			c_panelFail.Visible = true;
			c_panelSucess.Visible = true;
		}

		if(!IsPostBack)
		{
			if(Request.QueryString["RequestID"] != null)
			{
				Guid requestId = new Guid(Request.QueryString["RequestID"]);
				if(requestId != Guid.Empty)
				{
					ValidationRequest request = Extensions.Instance.ValidationRequests.GetValidationRequest(requestId);
                    if (request != null)
                    {
                        bool sucess = false;
                        switch (request.Type)
                        {
                            case EmailValidationTargetTypes.Group:
                                CreateGroupMembership(request.TargetID, request.UserID);
                                request.Delete();
                                sucess = true;
                                break;
                            case EmailValidationTargetTypes.Organization:
                                CreateOrganizationMembership(request.TargetID, request.UserID);
                                request.Delete();
                                sucess = true;
                                break;
                        }

                        c_panelSucess.Visible = sucess;
                        c_panelFail.Visible = !sucess;
                        c_panelSecondTime.Visible = false;
                    }
                    else
                    {
                        // The account is already activated
                        c_panelFail.Visible = false;
                        c_panelSucess.Visible = false;
                        c_panelSecondTime.Visible = true;
                    }
				}
			}
		}
    }

	/// <summary>
	/// Creates a membership in specified group
	/// </summary>
	/// <param name="groupId">ID of the group to create membership in</param>
	/// <param name="userId">ID of the person to create membership for</param>
	protected void CreateGroupMembership(Guid groupId, Guid userId)
	{
		iPerson person = ModuleRelations.Instance.Persons.GetPerson(userId);
		if(person != null)
		{
			Litium.Foundation.Modules.Relations.Groups.Group group = ModuleRelations.Instance.Groups[groupId];
			if(group != null)
			{
				if(!group.Members.IsMember(person))
				{
					group.Members.CreateMembership(person, FoundationContext.SystemToken);
				}
			}
		}
	}

	/// <summary>
	/// Creates a membership in specified organization
	/// </summary>
	/// <param name="orgId">ID of the organization to create membership in</param>
	/// <param name="userId">ID of the person to create membership for</param>
	protected void CreateOrganizationMembership(Guid orgId, Guid userId)
	{
		Organization org = ModuleRelations.Instance.Organizations.GetOrganization(orgId);
		if(org != null && !org.Members.IsMember(userId))
		{
			iPerson person = ModuleRelations.Instance.Persons.GetPerson(userId);
			if(person != null)
			{
				org.Members.CreateMembership(person, FoundationContext.SystemToken);
			}
		}
	}

	/// <summary>
	/// Gets the url to current websites EmailValidation page
	/// </summary>
	/// <returns>Url EmailValidation page</returns>
	protected string GetConfirmationUrl()
	{
		PageType pt = ModuleCMS.Instance.PageTypes.GetPageType("EmailValidation");
		if(pt != null)
		{
			Page page = null;
			foreach (Guid id in pt.Instances.InstanceIDs)
			{
				if (ModuleCMS.Instance.PermissionManager.UserHasPageReadPermission(FoundationContext.Token.UserID, id, true, true))
				{
					PageInfoCarrier carrier = ModuleCMS.Instance.CacheManager.SiteMapCache.GetPage(id);
					if (carrier != null && carrier.WebSiteID == CurrentState.WebSiteID && carrier.PageStatus == PageStatus.PUBLISHED)
					{
						page = Litium.Foundation.Modules.CMS.Pages.Page.GetFromID(ModuleCMS.Instance, id, FoundationContext.Token);
						break;
					}
				}
			}

			if(page != null)
			{
				return "http://" + Request.ServerVariables["SERVER_NAME"] + ResolveUrl(page.Url);
			}
		}

		return "";
	}
}