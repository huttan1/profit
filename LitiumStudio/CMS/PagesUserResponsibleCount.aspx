<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesUserResponsibleCount, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="c_toolbar" runat="server">
		<Toolbar:ToolbarItem OnClick="ToolbarItemChange_Click" Enabled="false" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="c_toolbarItemChange" runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarDivider"
			runat="server" ID="Divideritem1" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemWithoutResponsibility_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconView" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemWithoutResponsibility" runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarDivider"
			runat="server" ID="Divideritem3" />
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconRefresh" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemRefresh" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
    <img src="Images/transparent.gif" alt="" class="litIconDocumentPinned" />
	<Foundation:ModuleString ID="ModuleString16" name="MyPageResponsibility" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">

	<script language="javascript" type="text/javascript">
		function RowSelected(sender, args) {
			toolbarItemAction("activate", "0_0");
		}
		function RowDeselected(sender, args) {
			toolbarItemAction("disable", "0_0");
		}
	</script>

	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_pageResponsibility" ID="m_pageResponsibilityHelper"
			OnNeedData="gridHelper_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid runat="server" ID="m_pageResponsibility">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="Name" />
					<Telerik:GridBoundColumn DataField="Email" />
					<Telerik:GridBoundColumn DataField="Count" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>
