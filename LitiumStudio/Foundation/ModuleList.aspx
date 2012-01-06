<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_ModuleList, Litum.Studio.Web" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="c_toolbar" runat="server">
		<Toolbar:ToolbarItem OnClick="ToolbarItemAdd_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconAdd2" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="../images/transparent.gif" ID="c_toolbarItemAdd" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemView_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconView" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="../images/transparent.gif" ID="c_toolbarItemView" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemEdit_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif"
			ID="c_toolbarItemEdit" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemDelete_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif"
			ID="c_toolbarItemDelete" runat="server" />
		<Toolbar:DividerItem ID="DividerItem2" ImageURL="../images/transparent.gif" Class="litToolbarDivider"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemRefresh_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconRefresh"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif"
			ID="c_toolbarItemRefresh" runat="server" />
		<Toolbar:DividerItem ID="DividerItem3" ImageURL="../images/transparent.gif" Class="litToolbarDivider"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemExport_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconExport2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif"
			ID="c_toolbarItemExport" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemImport_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconImport2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif"
			ID="c_toolbarItemImport" runat="server" />
		<Toolbar:DividerItem ImageURL="../images/transparent.gif" Class="litToolbarDivider"
			runat="server" ID="Divideritem4" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemStrings_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconBookOpen"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif"
			ID="c_toolbarItemStrings" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemModulePanels_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconModulePanel"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif"
			ID="c_toolbarItemModulePanels" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconModules" /><asp:Label runat="server"
		ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" runat="Server">

	<script type="text/javascript">
		function RowSelected(sender, args) {
		    toolbarItemAction("activate", "0_1,0_2,0_3,0_5,0_7,0_8");
		}
		function RowDeselected(sender, args) {
		    toolbarItemAction("disable", "0_1,0_2,0_3,0_5,0_7,0_8");
		}
	</script>

	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_module" ID="m_moduleHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid runat="server" ID="m_module">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="Name" />
					<Telerik:GridBoundColumn DataField="Version" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>
