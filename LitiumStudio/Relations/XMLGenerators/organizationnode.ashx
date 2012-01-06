<%@ WebHandler Language="C#" debug="true" Class="Litium.Studio.UI.Relations.Common.Utilities.OrganizationNode" %>

using System;
using System.Collections.Generic;
using System.Globalization;
using System.Web;
using System.Web.SessionState;
using System.Xml;
using Litium.Foundation.GUI;
using Litium.Foundation.Modules.Relations;
using Litium.Foundation.Modules.Relations.Organizations;
using Litium.Utilities.XML;

namespace Litium.Studio.UI.Relations.Common.Utilities
{
    public class OrganizationNode : IHttpHandler, IRequiresSessionState
    {

        private int NumberOfNodesBeforeGrouping = NodeGrouping.NUMBER_OF_NODES_BEFORE_GROUPING;
        
        public void ProcessRequest(HttpContext context)
        {
            //Fetch stuff from session...
            FoundationContext foundation = FoundationContext.Current;
			if(foundation != null)
			{
				ModuleRelations m_currentModule = ModuleRelations.Instance;

				if(m_currentModule != null)
				{
					string startNodeString = context.Request["treenode"];
					if (startNodeString != null)
						startNodeString = TreeNodeReplace.Decode(startNodeString);

					XmlDocument xmlDoc = new XmlDocument();
					XmlElement rootNode = xmlDoc.CreateElement("TreeViewNodes");
					xmlDoc.AppendChild(rootNode);

                    string groupingText = string.Empty;
					Guid parentOrgId = Guid.Empty;
                    
					if (startNodeString != null)
					{
						string[] values = startNodeString.Split(Convert.ToChar("_"));
                        
                        
                        if (values.Length == 2)
						{
                            try
							{
								parentOrgId = new Guid(values[1]);
							}
							catch
							{
							    parentOrgId = Guid.Empty;
							}
                        } if (values.Length >= 3)
                        {
                            try
                            {
                                groupingText = string.Join("_",values,2,values.Length-2);
                                parentOrgId = new Guid(values[1]);
                            }
                            catch
                            {
                                parentOrgId = Guid.Empty;
                            }
                        }
					}





                    List<Organization> organizations = new List<Organization>();

                    if (parentOrgId == Guid.Empty)
                    {
                        foreach(Organization org in m_currentModule.Organizations.GetOrganizations())
                        {
                            if (org.Name.StartsWith(groupingText, true, foundation.Culture))
                            {
                                organizations.Add(org);
                            }
                        }
                    }
                    else
                    {
                        Organization parentOrg = m_currentModule.Organizations.GetOrganization(parentOrgId);
                        if (parentOrg != null)
                        {
                            foreach (Organization org in parentOrg.ChildOrganizations.GetOrganizations())
                            {
                                if (org.Name.StartsWith(groupingText, true, foundation.Culture))
                                {
                                    organizations.Add(org);
                                }
                            }                
                        }
                    }


                    
                    

                    if (organizations.Count > NumberOfNodesBeforeGrouping)
                    {
                     CreateGroupingNodes(groupingText,organizations,parentOrgId.ToString(),xmlDoc);   
                    }
                    else
                    {
                        organizations.Sort(new OrganizationComparer(foundation.User.Language.Culture.CompareInfo));
                        foreach (Organization org in organizations)
                        {
                            bool childs = org.ChildOrganizations.Count > 0;
                            xmlDoc.DocumentElement.AppendChild(GenerateOrgNode(xmlDoc, org.Name, org.ID.ToString(), childs));
                        }
                    }
                                        
                    
					context.Response.ContentType = "text/xml";
					context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
					context.Response.Cache.SetNoStore();
					context.Response.Cache.SetExpires(DateTime.MinValue);
					context.Response.Write(xmlDoc.InnerXml);
				}
			}
        }

        public bool IsReusable
        {
            get { return false; }
        }



        private static void CreateGroupingNodes(string groupByText, List<Organization> organizations, string  parentNode, XmlDocument xmlDoc)
        {
            int groupingNameSize = groupByText.Length + 1;

            Dictionary<string, string> grouping = new Dictionary<string, string>();

            List<Organization> organizationList = new List<Organization>(organizations);

            foreach (Organization organization in organizationList)
            {
                int keyLength = Math.Min(organization.Name.Length, groupingNameSize);

                if (keyLength < groupingNameSize)
                {
                    bool childs = organization.ChildOrganizations.Count > 0;
                    organizations.Remove(organization);
                    xmlDoc.DocumentElement.AppendChild(GenerateOrgNode(xmlDoc, organization.Name, organization.ID.ToString(), childs));

                }
                else
                {
                    string key = organization.Name.Substring(0, keyLength);
                    if (!grouping.ContainsKey(key.ToLower()))
                        grouping.Add(key.ToLower(), key);
                }
            }
            if (grouping.Count == 1)
            {
                List<string> keys = new List<string>(grouping.Values);
                CreateGroupingNodes(keys[0], organizations, parentNode,xmlDoc);
            }
            else
            {
                foreach (string key in grouping.Values)
                {
                    if (key.Length == 1)
                        xmlDoc.DocumentElement.AppendChild(GenerateSortNode(xmlDoc, key.ToUpper(),parentNode));
                    else
                        xmlDoc.DocumentElement.AppendChild(GenerateSortNode(xmlDoc, key, parentNode));
                }
            }
        }
        
        
		private static XmlElement GenerateOrgNode(XmlDocument xmlDoc, string text, string treenode, bool buildCallback)
        {
            XmlElement rootElement = xmlDoc.CreateElement("treeviewnode");

            // Add attributes
            ConversionUtilities.AddAttribute(rootElement, "Text", text);
            ConversionUtilities.AddAttribute(rootElement, "AutoPostBackOnSelect", true);
            ConversionUtilities.AddAttribute(rootElement, "AutoPostBackOnMove", true);
            ConversionUtilities.AddAttribute(rootElement, "Value", "organization_" + Uri.EscapeDataString(treenode));

			if(buildCallback)
			{
                ConversionUtilities.AddAttribute(rootElement, "ContentCallbackUrl", "../../LitiumStudio/Relations/XMLGenerators/organizationnode.ashx?treenode=" + "organization_" + Uri.EscapeDataString(TreeNodeReplace.Encode(treenode)));
			}

            ConversionUtilities.AddAttribute(rootElement, "ImageUrl", "~/LitiumStudio/Images/icons_standard/office_building.png");
            ConversionUtilities.AddAttribute(rootElement, "DroppingEnabled", false);
            ConversionUtilities.AddAttribute(rootElement, "DroppingAcrossTreesEnabled", false);
            ConversionUtilities.AddAttribute(rootElement, "DraggingEnabled", false);
            ConversionUtilities.AddAttribute(rootElement, "DraggingAcrossTreesEnabled", true);

			ConversionUtilities.AddAttribute(rootElement, "R_ID", "organization_" + Uri.EscapeDataString(treenode));

            return rootElement;
        }


        private static XmlElement GenerateSortNode(XmlDocument xmlDoc, string text, string treenode)
        {
            XmlElement rootElement = xmlDoc.CreateElement("treeviewnode");

            // Add attributes
            ConversionUtilities.AddAttribute(rootElement, "Text", text);
            ConversionUtilities.AddAttribute(rootElement, "AutoPostBackOnSelect", false);
            ConversionUtilities.AddAttribute(rootElement, "AutoPostBackOnMove", false);
            ConversionUtilities.AddAttribute(rootElement, "Selectable", false);
            ConversionUtilities.AddAttribute(rootElement, "Value", "organization_"+ Uri.EscapeDataString(treenode)+"_"+text);

            ConversionUtilities.AddAttribute(rootElement, "ContentCallbackUrl", "../../LitiumStudio/Relations/XMLGenerators/organizationnode.ashx?treenode=" + "organization_" + Uri.EscapeDataString(TreeNodeReplace.Encode(treenode) + "_" + text));

            //ConversionUtilities.AddAttribute(rootElement, "ImageUrl", "~/LitiumStudio/Images/icons_standard/sign_stop.png");
            ConversionUtilities.AddAttribute(rootElement, "DroppingEnabled", false);
            ConversionUtilities.AddAttribute(rootElement, "DroppingAcrossTreesEnabled", false);
            ConversionUtilities.AddAttribute(rootElement, "DraggingEnabled", false);
            ConversionUtilities.AddAttribute(rootElement, "DraggingAcrossTreesEnabled", false);

//            ConversionUtilities.AddAttribute(rootElement, "R_ID", "organization_" + Uri.EscapeDataString(treenode));

            return rootElement;
        }
        

        private class OrganizationComparer : IComparer<Organization>
        {
            private readonly CompareInfo compareInfo;

            public OrganizationComparer(CompareInfo compInfo)
            {
                compareInfo = compInfo;
            }

            public int Compare(Organization x, Organization y)
            {
                return compareInfo.Compare(x.Name, y.Name);
            }
        }

    }
}