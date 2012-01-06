<%@ WebHandler Language="C#" debug="true" Class="Litium.Studio.UI.Relations.Common.Utilities.PersonNode" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.SessionState;
using System.Xml;
using Litium.Foundation.GUI;
using Litium.Foundation.Modules.Relations;
using Litium.Utilities.XML;

namespace Litium.Studio.UI.Relations.Common.Utilities
{
    [Obsolete("Not supported any longer.")] //451
public class PersonNode : IHttpHandler, IRequiresSessionState
    {
        [Obsolete("Not supported any longer.")] //451
        public void ProcessRequest(HttpContext context)
        {
            
            //Fetch stuff from session...
			FoundationContext foundation = FoundationContext.Current;
			if (foundation != null)
            {
                ModuleRelations m_currentModule =  ModuleRelations.Instance;


                string startNodeString = context.Request["treenode"];
                if (startNodeString != null)
                    startNodeString = TreeNodeReplace.Decode(startNodeString);

                SortedList nodes = PersonNodes.GetNodes(startNodeString, m_currentModule, foundation);

                XmlDocument xmlDoc = new XmlDocument();
                XmlElement rootNode = xmlDoc.CreateElement("TreeViewNodes");
                xmlDoc.AppendChild(rootNode);

                if (nodes != null)
                {
                    foreach (DictionaryEntry entry in nodes)
                    {
                        if (entry.Value is List<Guid>)
                        {
                            xmlDoc.DocumentElement.AppendChild(GeneratePersonNode(xmlDoc, ((string)entry.Key).Replace(PersonNodes.TREESPLIT.ToString(), " - "), startNodeString + PersonNodes.TREESUBNODE + ((string)entry.Key) + PersonNodes.TREENODE, false));
                        }
                        else
                        {
                            xmlDoc.DocumentElement.AppendChild(GeneratePersonNode(xmlDoc, ((string)entry.Key).Replace(PersonNodes.TREESPLIT.ToString(), " - "), startNodeString + PersonNodes.TREESUBNODE + ((string)entry.Key), true));
                        }
                    }
                }


                context.Response.ContentType = "text/xml";
                context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                context.Response.Cache.SetNoStore();
                context.Response.Cache.SetExpires(DateTime.MinValue);
                context.Response.Write(xmlDoc.InnerXml);
            }
        }

        [Obsolete("Not supported any longer.")] //451
        public bool IsReusable
        {
            get { return false; }
        }


        private static XmlElement GeneratePersonNode(XmlDocument xmlDoc, string text, string treenode, bool buildCallback)
        {
            XmlElement rootElement = xmlDoc.CreateElement("treeviewnode");

            // Add attributes
            ConversionUtilities.AddAttribute(rootElement, "Text", text);
            ConversionUtilities.AddAttribute(rootElement, "AutoPostBackOnSelect", true);
            ConversionUtilities.AddAttribute(rootElement, "AutoPostBackOnMove", true);
            ConversionUtilities.AddAttribute(rootElement, "Value", "person_" + Uri.EscapeDataString(treenode));

			if(buildCallback)
			{
                
                ConversionUtilities.AddAttribute(rootElement, "ContentCallbackUrl", "../../LitiumStudio/Relations/XMLGenerators/personnode.ashx?treenode=" + Uri.EscapeDataString(TreeNodeReplace.Encode(treenode)));
			}

            ConversionUtilities.AddAttribute(rootElement, "ImageUrl", "~/LitiumStudio/Images/icons_standard/businesswoman.png");
            ConversionUtilities.AddAttribute(rootElement, "DroppingEnabled", false);
            ConversionUtilities.AddAttribute(rootElement, "DroppingAcrossTreesEnabled", false);
            ConversionUtilities.AddAttribute(rootElement, "DraggingEnabled", false);
            ConversionUtilities.AddAttribute(rootElement, "DraggingAcrossTreesEnabled", true);

            ConversionUtilities.AddAttribute(rootElement, "R_ID", Uri.EscapeDataString(treenode));

            return rootElement;
        }

       }
}