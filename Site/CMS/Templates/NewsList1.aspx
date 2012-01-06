<%@ Page Language="C#" AutoEventWireup="false" Inherits="App_Code.Site.CMS.Templates.BaseTemplate" %>

<asp:Content ContentPlaceHolderID="Content" runat="Server">

	<h1><web:Text Name="Title" runat="server" /></h1>

	<web:ValueExists Name="Introduction" runat="server">
		<OnTrue>
			<p class="intro"><web:Text Name="Introduction" runat="server" /></p>
		</OnTrue>
	</web:ValueExists>

	<web:ValueExists Name="Text1" runat="server">
		<OnTrue>
			<web:Text Name="Text1" runat="server" />
		</OnTrue>
	</web:ValueExists>

	<web:ChildRepeater ChildrenPageTypeName="News" RenderEmpty="false" SortDirection="Descending" SortPropertyName="NewsDate" runat="server">
		<HeaderTemplate>
			<ul class="news plain">
		</HeaderTemplate>
		<FooterTemplate>
			</ul>
		</FooterTemplate>
		<ItemTemplate>
			<li class="container">
				<h2><web:PageLink runat="server"><web:Text Name="Title" runat="server" /></web:PageLink></h2>
				<web:ValueExists Name="Image1" runat="server">
					<OnTrue>
						<web:PageLink runat="server"><web:Image Name="Image1" MaxWidth="220" MaxHeight="140" runat="server" /></web:PageLink>
					</OnTrue>
				</web:ValueExists>
				<span class="date"><web:DateTime Name="NewsDate" runat="server" /></span>
				<web:ValueExists name="Introduction" runat="server">
					<OnTrue>
						<p><web:PageLink runat="server"><web:Text Name="Introduction" runat="server" /></web:PageLink></p>
					</OnTrue>
				</web:ValueExists>
			</li>
		</ItemTemplate>
	</web:ChildRepeater>

	<site:LinkList runat="server" />
	<site:FileList runat="server" />

</asp:Content>