<%@ WebHandler Language="C#" debug="true" Class="Litium.Studio.UI.Relations.Common.Utilities.GroupNode" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Web;
using System.Web.SessionState;
using System.Xml;
using Litium.Foundation.GUI;
using Litium.Foundation.Modules.Relations;
using Litium.Foundation.Modules.Relations.Groups;
using Litium.Utilities.XML;

namespace Litium.Studio.UI.Relations.Common.Utilities
{
    public class GroupNode : IHttpHandler, IRequiresSessionState
    {
        /// <summary>
        /// Number of nodes before grouping.
        /// </summary>
        internal int NumberOfNodesBeforeGrouping = NodeGrouping.NUMBER_OF_NODES_BEFORE_GROUPING;
        
        public void ProcessRequest(HttpContext context)
        {
            //Fetch stuff from session...
			FoundationContext foundation = FoundationContext.Current;
			if (foundation != null)
			{
				ModuleRelations m_currentModule = ModuleRelations.Instance;

				if(m_currentModule != null)
				{
					XmlDocument xmlDoc = new XmlDocument();
					XmlElement rootNode = xmlDoc.CreateElement("TreeViewNodes");
					xmlDoc.AppendChild(rootNode);


                    string groupByText = context.Request["groupnode"];
                    if (groupByText == null)
                        groupByText = string.Empty;
                    
				    List<Group> groups = new List<Group>();
                    foreach(Group group in m_currentModule.Groups)
                    {
                        if(group.Name.StartsWith(groupByText, true, foundation.Culture))
                        {
                            groups.Add(group);
                        }
                    }
                    groups.Sort();

                    if (groups.Count > NumberOfNodesBeforeGrouping)
                    {
                        CreateGroupingNodes(groupByText, groups, xmlDoc);
                    }
                    else
                    {
                        foreach (Group g in groups)
                        {
                            xmlDoc.DocumentElement.AppendChild(GenerateGroupNode(xmlDoc, g.Name, g.ID.ToString()));
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

        
        private static void CreateGroupingNodes(string groupByText, List<Group> groups, XmlDocument xmlDoc)
        {
            int groupingNameSize = groupByText.Length + 1;

            Dictionary<string, string> grouping = new Dictionary<string, string>();
            List<Group> groupList = new List<Group>(groups);
            foreach (Group group in groupList)
            {
                int keyLength = Math.Min(group.Name.Length, groupingNameSize);

                if (keyLength < groupingNameSize)
                {
                    groups.Remove(group);
                    xmlDoc.DocumentElement.AppendChild(GenerateGroupNode(xmlDoc, group.Name, group.ID.ToString()));
                }
                else
                {
                    string key = group.Name.Substring(0, keyLength);
                    if (!grouping.ContainsKey(key.ToLower()))
                        grouping.Add(key.ToLower(), key);
                }
            }
            if (grouping.Count == 1)
            {
                List<string> keys = new List<string>(grouping.Values);
                CreateGroupingNodes(keys[0], groups, xmlDoc);
            }
            else
            {

                foreach (string key in grouping.Values)
                {
                    if (key.Length == 1)
                        xmlDoc.DocumentElement.AppendChild(GenerateSortNode(xmlDoc, key.ToUpper()));
                    else
                        xmlDoc.DocumentElement.AppendChild(GenerateSortNode(xmlDoc, key));
                }
            }
        }

        private static XmlElement GenerateGroupNode(XmlDocument xmlDoc, string text, string treenode)
        {
            XmlElement rootElement = xmlDoc.CreateElement("treeviewnode");

            // Add attributes
            ConversionUtilities.AddAttribute(rootElement, "Text", text);
            ConversionUtilities.AddAttribute(rootElement, "AutoPostBackOnSelect", true);
            ConversionUtilities.AddAttribute(rootElement, "AutoPostBackOnMove", true);
            ConversionUtilities.AddAttribute(rootElement, "Value", "group_" + Uri.EscapeDataString(treenode));

            ConversionUtilities.AddAttribute(rootElement, "ImageUrl", "~/LitiumStudio/Images/icons_standard/businesspeople.png");
            ConversionUtilities.AddAttribute(rootElement, "DroppingEnabled", false);
            ConversionUtilities.AddAttribute(rootElement, "DroppingAcrossTreesEnabled", false);
            ConversionUtilities.AddAttribute(rootElement, "DraggingEnabled", false);
            ConversionUtilities.AddAttribute(rootElement, "DraggingAcrossTreesEnabled", true);

			ConversionUtilities.AddAttribute(rootElement, "R_ID", "group_" + Uri.EscapeDataString(treenode));

            return rootElement;
        }

        private static XmlElement GenerateSortNode(XmlDocument xmlDoc, string text)
        {
            XmlElement rootElement = xmlDoc.CreateElement("treeviewnode");

            // Add attributes
            ConversionUtilities.AddAttribute(rootElement, "Text", text);
            ConversionUtilities.AddAttribute(rootElement, "AutoPostBackOnSelect", false);
            ConversionUtilities.AddAttribute(rootElement, "AutoPostBackOnMove", false);
            ConversionUtilities.AddAttribute(rootElement, "Selectable", false);
            ConversionUtilities.AddAttribute(rootElement, "Value", "groupnode_" + text);

            ConversionUtilities.AddAttribute(rootElement, "ContentCallbackUrl", "../../LitiumStudio/Relations/XMLGenerators/groupnode.ashx?groupnode=" + HttpUtility.UrlEncode(text));

            
            ConversionUtilities.AddAttribute(rootElement, "DroppingEnabled", false);
            ConversionUtilities.AddAttribute(rootElement, "DroppingAcrossTreesEnabled", false);
            ConversionUtilities.AddAttribute(rootElement, "DraggingEnabled", false);
            ConversionUtilities.AddAttribute(rootElement, "DraggingAcrossTreesEnabled", false);

            //ConversionUtilities.AddAttribute(rootElement, "R_ID", "organization_" + Uri.EscapeDataString(treenode));

            return rootElement;
        }
    }
}