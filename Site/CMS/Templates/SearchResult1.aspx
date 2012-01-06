<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchResult1.aspx.cs" Inherits="Site.CMS.Templates.SearchResult1" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">

	<h1><web:Text Name="Title" runat="server" /></h1>

	<web:ValueExists Name="Introduction" runat="server">
		<OnTrue>
			<p class="intro"><web:Text Name="Introduction" runat="server" /></p>
		</OnTrue>
	</web:ValueExists>

	<web:Text Name="Text1" runat="server" />
    
	<h2><web:Text Name="SearchTermHeading" runat="server" />
	<span class="query"><asp:Literal ID="m_literalSearchTerm" runat="server" /></span></h2>

	<asp:PlaceHolder ID="m_placeHolderHitCount" runat="server">
		<p class="hits"><asp:Literal ID="m_literalHitCount" runat="server" /></p>
	</asp:PlaceHolder>

	<asp:PlaceHolder ID="m_placeHolderNoHits" Visible="false" runat="server">
		<web:Text Name="NoHits" runat="server" />
	</asp:PlaceHolder>

	<asp:Repeater ID="m_repeaterSearchResult" OnItemDataBound="RepeaterSearchHitsOnItemDataBound" runat="server">
		<HeaderTemplate>
			<ol class="searchresult plain">
		</HeaderTemplate>
		<FooterTemplate>
			</ol>
		</FooterTemplate>
		<ItemTemplate>
			<li>
				<h3><asp:HyperLink ID="hyperLinkPage" runat="server" /></h3>
				<web:UsePage ID="usePage" Visible="false" runat="server">
					<web:ValueExists Name="Introduction" runat="server">
						<OnTrue>
							<p class="intro"><web:Text Name="Introduction" LimitLength="200" runat="server" /></p>
						</OnTrue>
					</web:ValueExists>
				</web:UsePage>
				<asp:Repeater ID="repeaterFiles" OnItemDataBound="RepeaterFilesOnItemDataBound" Visible="false" runat="server">
					<HeaderTemplate>
						 <ul class="files plain">
					</HeaderTemplate>
					<FooterTemplate>
						</ul>
					</FooterTemplate>
					<ItemTemplate>
						<li>
							<asp:HyperLink ID="hyperLinkFile" runat="server">
								<asp:Image ID="imageMediaArchiveFileIcon" GenerateEmptyAlternateText="true" Height="16" Width="16" runat="server" />
								<asp:Literal ID="literalFileName" runat="server" />&nbsp;<asp:Literal ID="literalFileSize" runat="server" />
							</asp:HyperLink>
						</li>
					</ItemTemplate>
				</asp:Repeater>
			</li>
		</ItemTemplate>
	</asp:Repeater>
    <site:Paging ID="Paging" runat="server" />

</asp:Content>