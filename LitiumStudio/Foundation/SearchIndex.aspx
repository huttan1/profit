<%@ page title="" language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_SearchIndex, Litum.Studio.Web" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" class="litIconLicense" style="vertical-align: middle;"
		alt="" /><Foundation:SystemString ID="SystemString1" runat="server" Name="SearchIndexPageHeader" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
		<asp:UpdatePanel runat="server" ID="Info" ChildrenAsTriggers="false" UpdateMode="Conditional">
			<ContentTemplate>
				<Foundation:InformationGroup ID="SearchIndexRebuildInformationGroup" runat="server"
					Width="500px">
					<table width="100%" border="0">
						<tr runat="server" id="m_cms">
							<td>
								<asp:Literal ID="CmsSizeLiteral" runat="server"></asp:Literal>
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="CmsRebuildButton" CssClass="litInputButton" Style="margin: 0px;
									margin-top: 5px;" OnClick="CmsRebuildButton_OnClick" />
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="CmsUpdateButton" CssClass="litInputButton" Style="margin: 0px;
									margin-top: 5px;" OnClick="CmsRebuildButton_OnClick" />
							</td>
						</tr>
						<tr runat="server" id="m_ecom">
							<td>
								<asp:Literal ID="EcommerceSizeLiteral" runat="server"></asp:Literal>
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="EcommerceRebuildButton" CssClass="litInputButton"
									Style="margin: 0px; margin-top: 5px;" OnClick="EcommerceRebuildButton_OnClick" />
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="EcommerceUpdateButton" CssClass="litInputButton"
									Style="margin: 0px; margin-top: 5px;" OnClick="EcommerceRebuildButton_OnClick" />
							</td>
						</tr>
						<tr runat="server" id="m_ma">
							<td>
								<asp:Literal ID="MediaArchiveSizeLiteral" runat="server"></asp:Literal>
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="MediaArchiveRebuildButton" CssClass="litInputButton"
									Style="margin: 0px; margin-top: 5px;" OnClick="MediaArchiveRebuildButton_OnClick" />
							</td><td style="text-align: right">
								<asp:Button runat="server" ID="MediaArchiveUpdateButton" CssClass="litInputButton"
									Style="margin: 0px; margin-top: 5px;" OnClick="MediaArchiveRebuildButton_OnClick" />
							</td>
						</tr>
						<tr runat="server" id="m_nl">
							<td>
								<asp:Literal ID="CircularSizeLiteral" runat="server"></asp:Literal>
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="CircularRebuildButton" CssClass="litInputButton" Style="margin: 0px;
									margin-top: 5px;" OnClick="CircularRebuildButton_OnClick" />
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="CircularUpdateButton" CssClass="litInputButton" Style="margin: 0px;
									margin-top: 5px;" OnClick="CircularRebuildButton_OnClick" />
							</td>
						</tr>
						<tr runat="server" id="m_pc">
							<td>
								<asp:Literal ID="ProductCatalogSizeLiteral" runat="server"></asp:Literal>
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="ProductCatalogRebuildButton" CssClass="litInputButton"
									Style="margin: 0px; margin-top: 5px;" OnClick="ProductCatalogRebuildButton_OnClick" />
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="ProductCatalogUpdateButton" CssClass="litInputButton"
									Style="margin: 0px; margin-top: 5px;" OnClick="ProductCatalogRebuildButton_OnClick" />
							</td>
						</tr>
						<tr runat="server" id="m_rel">
							<td>
								<asp:Literal ID="RelationsSizeLiteral" runat="server"></asp:Literal>
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="RelationsRebuildButton" CssClass="litInputButton"
									Style="margin: 0px; margin-top: 5px;" OnClick="RelationsRebuildButton_OnClick" />
							</td><td style="text-align: right">
								<asp:Button runat="server" ID="RelationsUpdateButton" CssClass="litInputButton"
									Style="margin: 0px; margin-top: 5px;" OnClick="RelationsRebuildButton_OnClick" />
							</td>
						</tr>
						<tr>
							<td>
								<br />
								<asp:Literal ID="IndexJobQueueLength" runat="server" />
							</td>
							<td style="text-align: right">
								<br />
								<asp:Button runat="server" ID="RebuildAllButton" CssClass="litInputButton" Style="margin: 0px;
									margin-top: 5px;" OnClick="RebuildAllButton_OnClick" />
							</td><td style="text-align: right">
								<br />
								<asp:Button runat="server" ID="UpdateAllButton" CssClass="litInputButton" Style="margin: 0px;
									margin-top: 5px;" OnClick="RebuildAllButton_OnClick" />
							</td>
						</tr>
					</table>
				</Foundation:InformationGroup>
				<asp:Timer runat="server" Interval="1000" ID="Timer" OnTick="TimerUpdate" />
			</ContentTemplate>
		</asp:UpdatePanel>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LitiumStudioFilterArea" runat="Server">
</asp:Content>
