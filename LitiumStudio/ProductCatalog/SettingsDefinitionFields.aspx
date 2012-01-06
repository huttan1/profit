<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_ProductCatalog_SettingsDefinitionFields, Litum.Studio.Web" enableeventvalidation="false" %>

<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="c_toolbar" runat="server">
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconAdd2" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="images/transparent.gif" ID="c_toolbarItemAdd" runat="server" />
		<Toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarDivider"
			runat="server" />
		<Toolbar:ToolbarItem ID="c_toolbarItemEdit" OnClick="ToolbarItemEdit_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif"
			runat="server" />
		<Toolbar:ToolbarItem ID="c_toolbarItemDelete" OnClick="ToolbarItemDelete_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif"
			runat="server" />
		<Toolbar:DividerItem ID="DividerItem2" ImageURL="images/transparent.gif" Class="litToolbarDivider"
			runat="server" />
		<Toolbar:ToolbarItem ID="c_toolbarItemCopy" Enabled="false" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconCopy" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" runat="server" />
		<Toolbar:ToolbarItem ID="c_toolbarItemPaste" Enabled="false" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPaste" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" runat="server" />
		<Toolbar:DividerItem ID="DividerItem3" ImageURL="images/transparent.gif" Class="litToolbarDivider"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemExport_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconExport2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif"
			ID="c_toolbarItemExport" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemImport_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconImport2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif"
			ID="c_toolbarItemImport" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<Foundation:ModuleString ID="ModuleString3" Name="SettingsDefinitionFieldsHeader"
		runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">

	<script language="javascript" type="text/javascript">
		function RowSelected(sender, args) {
			toolbarItemAction("activate", "0_1,0_2,0_3");
		}
		function RowDeselected(sender, args) {
			toolbarItemAction("disable", "0_1,0_2,0_3");
		}
	</script>

	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_definitionField" ID="m_definitionFieldHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid runat="server" ID="m_definitionField">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="Name" />
					<Telerik:GridBoundColumn DataField="Type" />
					<Telerik:GridBoundColumn DataField="Altenative" />
					<Telerik:GridBoundColumn DataField="Required" />
					<Telerik:GridBoundColumn DataField="WriteProtected" />
					<Telerik:GridBoundColumn DataField="LanguageDependent" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>