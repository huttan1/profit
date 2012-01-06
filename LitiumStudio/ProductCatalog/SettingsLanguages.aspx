<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_ProductCatalog_SettingsLanguages, Litum.Studio.Web" enableeventvalidation="false" %>

<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="c_toolbar" runat="server">
		<Toolbar:ToolbarItem ID="c_toolbarItemAddToArticles" OnClick="ToolbarItemArticleConnect_Click"
			DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconConnect" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="images/transparent.gif" runat="server" />
		<Toolbar:ToolbarItem ID="c_toolbarItemAddToCatalogs" OnClick="ToolbarItemCatalogConnect_Click"
			DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconConnect" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="images/transparent.gif" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<Foundation:ModuleString ID="ModuleString1" Name="SettingsLanguagesHeader" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<script type="text/javascript">
		function RowSelected(sender, args) {
			toolbarItemAction("activate", "0_0,0_1");
		}
		function RowDeselected(sender, args) {
			toolbarItemAction("disable", "0_0,0_1");
		}
	</script>
	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_language" ID="m_languageHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid runat="server" ID="m_language">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="Name" />
					<Telerik:GridBoundColumn DataField="Articles" />
					<Telerik:GridBoundColumn DataField="VariantGroups" />
					<Telerik:GridBoundColumn DataField="Assortments" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>
