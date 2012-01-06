<%@ Control Language="C#" AutoEventWireup="false" ClassName="LinkList" %>

<web:ValueExists Name="Links" runat="server">
	<OnTrue>
		<div class="linklist">
			<h2><web:WebSiteString Name="SiteLinkListHeader" runat="server" /></h2>
			<web:LinkRepeater Name="Links" RenderEmpty="false" runat="server">
				<HeaderTemplate>
					<ul class="links plain">
				</HeaderTemplate>
				<FooterTemplate>
					</ul>
				</FooterTemplate>
				<ItemTemplate>
					<li><web:PageLink runat="server"><web:ShortName runat="server" /></web:PageLink></li>
				</ItemTemplate>
			</web:LinkRepeater>
		</div>
	</OnTrue>
</web:ValueExists>