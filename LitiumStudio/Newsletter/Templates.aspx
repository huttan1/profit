<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_Newsletter_Templates, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<asp:PlaceHolder runat="server" Visible="False" ID="mc_refreshTag">
		<meta http-equiv="refresh" content="5" />
	</asp:PlaceHolder>
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="mc_toolbar" runat="server">
		<Toolbar:ToolbarItem OnClick="ToolbarItemAdd_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconAdd2" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="mc_toolbarItemAdd" runat="server" />
		<Toolbar:DividerItem ID="DividerItem2" ImageURL="Images/transparent.gif" Class="litToolbarDivider"
			runat="server" />
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
	<img src="../Images/transparent.gif" alt="" class="litIconCircular" />
	<Foundation:ModuleString ID="ModuleString2" Name="TemplateAdminPageSubHeader1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">

	<script language="javascript" type="text/javascript">
		function RowSelected(sender, args, data) {
			toolbarItemAction("activate", "0_1");
			toolbarItemAction("activate", "0_2");
		}
		function RowDeselected(sender, args) {
			toolbarItemAction("disable", "0_1");
			toolbarItemAction("disable", "0_2");
		}
	</script>

	<LS:GridHelperAjax runat="server" AssociatedControlID="m_templates" ID="m_templatesHelper"
		OnNeedData="grid_NeedData" DataKeyName="ID" />
	<Telerik:RadGrid runat="server" ID="m_templates">
		<ClientSettings>
			<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
		</ClientSettings>
		<MasterTableView runat="server">
			<Columns>
				<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
				<Telerik:GridBoundColumn DataField="Name" />
				<Telerik:GridBoundColumn DataField="Description" />
				<Telerik:GridBoundColumn DataField="FileName" />
				<Telerik:GridImageColumn DataImageUrlFields="ImageURL" DataImageUrlFormatString="{0}" />
			</Columns>
		</MasterTableView>
	</Telerik:RadGrid>
</asp:Content>
