<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_SettingsModulePanels, Litum.Studio.Web" %>

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
		<Toolbar:ToolbarItem OnClick="ToolbarItemEnablePanel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconModulePanel"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif"
			ID="c_toolbarItemEnablePanel" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemPanelAdmin_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
		    Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconGear"
		    SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif"
		    ID="c_toolbarItemPanelAdmin" runat="server" />
		<Toolbar:DividerItem ID="DividerItem4" ImageURL="/LitiumStudio/Images/transparent.gif"
			Class="litToolbarDivider" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../../LitiumStudio/Images/transparent.gif"
			ID="c_toolbarItemBack" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconModulePanel" /><asp:Label runat="server"
		ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" runat="Server">

	<script type="text/javascript">
		function RowSelected(sender, args) {
			toolbarItemAction("activate", "0_1,0_2,0_3,0_4");
			if (args.getDataKeyValue("AdminPanelPath") != "")
				toolbarItemAction("activate", "0_5");
		}
		function RowDeselected(sender, args) {
		    toolbarItemAction("disable", "0_1,0_2,0_3,0_4,0_5");
		}
	</script>

	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_modulePanels" ID="m_modulePanelHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID;AdminPanelPath" />
		<Telerik:RadGrid runat="server" ID="m_modulePanels">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="Title" />
					<Telerik:GridBoundColumn DataField="Status" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>
