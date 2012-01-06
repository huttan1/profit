<%@ page title="" language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_SettingsSearchIndex, Litum.Studio.Web" %>

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
						<tr runat="server" id="m_ag">
							<td>
								<asp:Literal ID="AGSizeLiteral" runat="server"></asp:Literal>
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="AGRebuildButton" CssClass="litInputButton" Style="margin: 0px;
									margin-top: 5px;" OnClick="AGRebuildButton_OnClick" />
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="AGUpdateButton" CssClass="litInputButton" Style="margin: 0px;
									margin-top: 5px;" OnClick="AGRebuildButton_OnClick" />
							</td>
						</tr>
						<tr runat="server" id="m_a">
							<td>
								<asp:Literal ID="ASizeLiteral" runat="server"></asp:Literal>
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="ARebuildButton" CssClass="litInputButton"
									Style="margin: 0px; margin-top: 5px;" OnClick="ARebuildButton_OnClick" />
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="AUpdateButton" CssClass="litInputButton"
									Style="margin: 0px; margin-top: 5px;" OnClick="ARebuildButton_OnClick" />
							</td>
						</tr>
						<tr runat="server" id="m_vg">
							<td>
								<asp:Literal ID="VGSizeLiteral" runat="server"></asp:Literal>
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="VGRebuildButton" CssClass="litInputButton"
									Style="margin: 0px; margin-top: 5px;" OnClick="VGRebuildButton_OnClick" />
							</td><td style="text-align: right">
								<asp:Button runat="server" ID="VGUpdateButton" CssClass="litInputButton"
									Style="margin: 0px; margin-top: 5px;" OnClick="VGRebuildButton_OnClick" />
							</td>
						</tr>
						<tr runat="server" id="m_assortment">
							<td>
								<asp:Literal ID="AssortmentSizeLiteral" runat="server"></asp:Literal>
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="AssortmentRebuildButton" CssClass="litInputButton" Style="margin: 0px;
									margin-top: 5px;" OnClick="AssortmentRebuildButton_OnClick" />
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="AssortmentUpdateButton" CssClass="litInputButton" Style="margin: 0px;
									margin-top: 5px;" OnClick="AssortmentRebuildButton_OnClick" />
							</td>
						</tr>
						<tr runat="server" id="m_pg">
							<td>
								<asp:Literal ID="PGSizeLiteral" runat="server"></asp:Literal>
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="PGRebuildButton" CssClass="litInputButton"
									Style="margin: 0px; margin-top: 5px;" OnClick="PGRebuildButton_OnClick" />
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="PGUpdateButton" CssClass="litInputButton"
									Style="margin: 0px; margin-top: 5px;" OnClick="PGRebuildButton_OnClick" />
							</td>
						</tr>
						<tr runat="server" id="m_p">
							<td>
								<asp:Literal ID="PSizeLiteral" runat="server"></asp:Literal>
							</td>
							<td style="text-align: right">
								<asp:Button runat="server" ID="PRebuildButton" CssClass="litInputButton"
									Style="margin: 0px; margin-top: 5px;" OnClick="PRebuildButton_OnClick" />
							</td><td style="text-align: right">
								<asp:Button runat="server" ID="PUpdateButton" CssClass="litInputButton"
									Style="margin: 0px; margin-top: 5px;" OnClick="PRebuildButton_OnClick" />
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
