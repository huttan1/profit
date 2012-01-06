<?xml version="1.0" encoding="utf-8"?>
<%@ Page Language="C#" CodeFile="MetadataFilteredFeed1.aspx.cs" Inherits="Templates_MetadataFilteredFeed1" %>
<%@ Import Namespace="Litium.Plus.Utilities"%>
<%@ Register TagPrefix="ExtensionsMetadata" Namespace="Litium.Extensions.Metadata.WebControls" Assembly="Litium.Extensions" %>

<%--Note: The Response.Write's are used to make this page pass Resharpers Solution-wide Analysis--%>

<asp:PlaceHolder id="c_placeHolderRSS" Visible="false" runat="server">
	<%Response.Write("<rss version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">");%>
		<%Response.Write("<channel>");%>
			<title><web:Text Name="Title" HtmlEncode="true" runat="server" /></title>
			<link><web:PageURL runat="server" /></link>
			<%Response.Write("<description>");%><web:Text Name="Introduction" HtmlEncode="true" runat="server" /><%Response.Write("</description>");%>
			<%Response.Write("<langauge>");%><% = CurrentState.WebSite.Culture.IetfLanguageTag %><%Response.Write("</language>");%>
			<%Response.Write("<copyright>");%><web:Text Name="CopyrightsText" HtmlEncode="true" runat="server" /><%Response.Write("</copyright>");%>
			<%Response.Write("<lastBuildDate>");%><% = DateUtilities.GetRFC822Date(System.DateTime.Now.ToUniversalTime()) %><%Response.Write("</lastBuildDate>");%>
			<%Response.Write("<docs>");%>http://www.rssboard.org/rss-2-0-1<%Response.Write("</docs>");%>
			<%Response.Write("<generator>");%>Litium Studio Extensions 4.4<%Response.Write("</generator>");%>
			<plus:HasResponsibleUser runat="server">
				<OnTrue>
					<%Response.Write("<managingEditor>");%><plus:ResponsibleUserEmail runat="server" /></managingEditor>
				</OnTrue>
			</plus:HasResponsibleUser>
			<%Response.Write("<ttl>");%>60<%Response.Write("</ttl>");%>
			<atom:link href="<web:PageURL runat='server' />" rel="self" type="application/rss+xml" />
			<ExtensionsMetadata:MetadataPageRepeater ID="c_metadataPageRepeaterRSS" PageSize="20" SelectedPageIndex="0" IncludeStartNode="true" UsePageing="true" runat="server">
				<ItemTemplate>
					<%Response.Write("<item>");%>
						<title><web:Text Name="Title" HtmlEncode="true" runat="server" /></title>
						<%Response.Write("<description>");%><web:Text Name="Introduction" HtmlEncode="true" runat="server" /><%Response.Write("</description>");%>
						<%Response.Write("<pubDate>");%><Plus:PagePublishedDate FormatRFC822="true" runat="server" /><%Response.Write("</pubDate>");%>
						<%Response.Write("<guid isPermaLink=\"true\">");%><web:PageURL runat="server" /><%Response.Write("</guid>");%>
						<plus:HasResponsibleUser runat="server">
							<OnTrue>
								<%Response.Write("<author>");%><plus:ResponsibleUserEmail runat="server" /><%Response.Write("</author>");%>
							</OnTrue>
						</plus:HasResponsibleUser>
					<%Response.Write("</item>");%>
				</ItemTemplate>
			</ExtensionsMetadata:MetadataPageRepeater>
		<%Response.Write("</channel>");%>
	<%Response.Write("</rss>");%>
</asp:PlaceHolder>
	
<asp:placeholder id="c_placeHolderAtom" Visible="false" runat="server">
	<%Response.Write("<feed xmlns=\"http://www.w3.org/2005/Atom\" xml:lang=\"" + CurrentState.WebSite.Culture.TwoLetterISOLanguageName + "\">");%>
		<title type="text"><web:Text Name="Title" HtmlEncode="true" runat="server" /></title>
		<id><web:PageURL runat="server" /></id>
		<link rel="alternate" type="text/html" href="<%Response.Write(CurrentPage.Url);%>"/>
		<link rel="self" type="application/atom+xml" href="<% = Request.Url.ToString() %>"/>
		<%Response.Write("<updated>");%><% = DateUtilities.GetRFC3339Date(System.DateTime.Now.ToUniversalTime()) %><%Response.Write("</updated>");%>
		<%Response.Write("<rights>");%><web:Text Name="CopyrightsText" HtmlEncode="true" runat="server" /><%Response.Write("</rights>");%>
		<ExtensionsMetadata:MetadataPageRepeater ID="c_metadataPageRepeaterAtom" PageSize="20" SelectedPageIndex="0" IncludeStartNode="true" UsePageing="true" runat="server">
			<ItemTemplate>
				<%Response.Write("<entry>");%>
					<title type="text"><web:Text Name="Title" HtmlEncode="true" runat="server" /></title>
					<link rel="alternate" href="<%Response.Write(CurrentPage.Url);%>"/>
					<%Response.Write("<id>");%><web:PageURL runat="server" /><%Response.Write("</id>");%>
					<%Response.Write("<author>");%>
						<%Response.Write("<name>");%><plus:ResponsibleUserName runat="server" /><%Response.Write("</name>");%>
						<%Response.Write("<email>");%><plus:ResponsibleUserEmail runat="server" /><%Response.Write("</email>");%>
					<%Response.Write("</author>");%>
					<%Response.Write("<published>");%><plus:PagePublishedDate FormatRFC3339="true" runat="server" /><%Response.Write("</published>");%>
					<%Response.Write("<updated>");%><plus:PageCreatedDate FormatRFC3339="true" runat="server" /><%Response.Write("</updated>");%>
					<%Response.Write("<summary type=\"xhtml\">");%><web:Text Name="Introduction" HtmlEncode="true" runat="server" /><%Response.Write("</summary>");%>
					<%Response.Write("<content type=\"xhtml\">");%>
						<%Response.Write("<div xmlns=\"http://www.w3.org/1999/xhtml\">");%><web:Text Name="Text1" HtmlEncode="true" runat="server" /><%Response.Write("</div>");%>
					<%Response.Write("</content>");%>
				<%Response.Write("</entry>");%>
			</ItemTemplate>
		</ExtensionsMetadata:MetadataPageRepeater>
	<%Response.Write("</feed>");%>
</asp:placeholder>