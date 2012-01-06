<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_CMS_WebSites, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="c_toolbar" runat="server">
		<Toolbar:ToolbarItem OnClick="ToolbarItemAdd_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconAdd2" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemAdd" runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarDivider"
			runat="server" ID="Divideritem3" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemEdit_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="c_toolbarItemEdit" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemDelete_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="c_toolbarItemDelete" runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarDivider"
			runat="server" ID="Divideritem4" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemStrings_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconBookOpen"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="c_toolbarItemStrings" runat="server" />
		<Toolbar:DividerItem ID="DividerItem2" ImageURL="Images/transparent.gif" Class="litToolbarDivider"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemRefresh_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconRefresh"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="c_toolbarItemRefresh" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<Foundation:ModuleString Name="WebSiteAdminPageSubHeader1" runat="server" ID="Systemstring10" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentRight" runat="Server">
	<script language="javascript" type="text/javascript">
		function RowSelected(sender, args) {
			toolbarItemAction("activate", "0_1,0_3");
			if (args.getDataKeyValue("IsDeletable") == "True")
				toolbarItemAction("activate", "0_2");
		}
		function RowDeselected(sender, args) {
			toolbarItemAction("disable", "0_1,0_2,0_3");
		}
	</script>
	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_websites" ID="m_websitesHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID;IsDeletable" />
		<Telerik:RadGrid runat="server" ID="m_websites">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="Name" />
					<Telerik:GridBoundColumn DataField="Language" />
					<Telerik:GridBoundColumn DataField="Framework" />
					<Telerik:GridBoundColumn DataField="Path" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>
