<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_SettingsMetadata, Litum.Studio.Web" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="mc_toolbar" runat="server">
		<Toolbar:ToolbarItem OnClick="ToolbarItemAdd_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconAdd2" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="mc_toolbarItemAdd" runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarDivider"
			runat="server" ID="Divideritem1" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemEdit_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="mc_toolbarItemEdit" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemDelete_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="mc_toolbarItemDelete" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
		<Foundation:ModuleString Name="SettingsMetadataPageHeader" runat="server" ID="Systemstring10" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">

	<script language="javascript" type="text/javascript">
		function RowSelected(sender, args) {
			toolbarItemAction("activate", "0_1,0_2");
		}
		function RowDeselected(sender, args) {
			toolbarItemAction("disable", "0_1,0_2");
		}
	</script>

	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_metadata" ID="m_metadataHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid runat="server" ID="m_metadata">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="Name" />
					<Telerik:GridBoundColumn DataField="Active" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>
