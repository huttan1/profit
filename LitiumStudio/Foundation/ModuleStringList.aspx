<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_ModuleStringList, Litum.Studio.Web" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="c_toolbar" runat="server">
		<Toolbar:ToolbarItem OnClick="ToolbarItemAdd_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconAdd2" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="/LitiumStudio/Images/transparent.gif" ID="c_toolbarItemAdd" runat="server" />
		<Toolbar:DividerItem ImageURL="/LitiumStudio/Images/transparent.gif" Class="litToolbarDivider"
			runat="server" ID="Divideritem1" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemEdit_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/Images/transparent.gif"
			ID="c_toolbarItemEdit" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemDelete_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/Images/transparent.gif"
			ID="c_toolbarItemDelete" runat="server" />
		<Toolbar:DividerItem ID="DividerItem2" ImageURL="/LitiumStudio/Images/transparent.gif"
			Class="litToolbarDivider" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemDeleteAll_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/Images/transparent.gif"
			ID="c_toolbarItemDeleteAll" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemRefresh_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconRefresh"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/Images/transparent.gif"
			ID="c_toolbarItemRefresh" runat="server" />
		<Toolbar:DividerItem ID="DividerItem3" ImageURL="/LitiumStudio/Images/transparent.gif"
			Class="litToolbarDivider" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemExport_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconExport2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/Images/transparent.gif"
			ID="c_toolbarItemExport" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemImport_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconImport2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/Images/transparent.gif"
			ID="c_toolbarItemImport" runat="server" />
		<Toolbar:DividerItem ID="DividerItem4" ImageURL="/LitiumStudio/Images/transparent.gif"
			Class="litToolbarDivider" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../../LitiumStudio/Images/transparent.gif"
			ID="c_toolbarItemBack" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconModules" /><Foundation:SystemString
		Name="ModuleStringAdminPageSubHeader1" runat="server" ID="Systemstring5" />
	"<asp:Label ID="c_labelModuleName" runat="server" />"
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" runat="Server">

	<script type="text/javascript">
		function RowSelected(sender, args) {
			toolbarItemAction("activate", "0_1,0_2,0_5");
		}
		function RowDeselected(sender, args) {
			toolbarItemAction("disable", "0_1,0_2,0_5");
		}
	</script>

	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_moduleString" ID="m_moduleStringHelper"
			OnNeedData="grid_NeedData" DataKeyName="Name" />
			
		<Telerik:RadGrid runat="server" ID="m_moduleString">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" /> 
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="Name"/>
					<Telerik:GridBoundColumn DataField="Description"/>
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>
