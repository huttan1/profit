<%@ page language="C#" masterpagefile="~/LitiumStudio/Newsletter/Framework/Base1.master" inherits="LitiumStudio_Newsletter_PhoneNumbers, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/Newsletter/Framework/Base1.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<asp:PlaceHolder runat="server" Visible="False" ID="mc_refreshTag">
		<meta http-equiv="refresh" content="5" />
	</asp:PlaceHolder>
	<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="mc_toolbar" runat="server">
	    <Toolbar:ToolbarItem OnClick="ToolbarItemAdd_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconAdd2" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="mc_toolbarItemAdd" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemDeleteAll_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="mc_toolbarItemDeleteAll" runat="server" />
		<Toolbar:DividerItem ID="DividerItem2" ImageURL="Images/transparent.gif" Class="litToolbarDivider"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemRefresh_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconRefresh"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="mc_toolbarItemRefresh" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemImport_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconImport2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="mc_toolbarItemImport" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemViewFailed_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconView" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="mc_toolbarItemViewFailed" runat="server" />
		<Toolbar:DividerItem ID="DividerItem3" ImageURL="Images/transparent.gif" Class="litToolbarDivider"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="mc_toolbarItemBack" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" runat="Server" ContentPlaceHolderID="LitiumStudioContentHeading">
	<img src="Images/transparent.gif" alt="" class="litIconCircularAddressLists" /><Foundation:ModuleString
		ID="ModuleString1" Name="AddressAdminPageSubHeader1" runat="server" />
	"<asp:Label runat="server" ID="mc_labelListName" />"
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">

	<script type="text/javascript">
	    function RowSelected(sender, args, gridHelper) {
			var selCount = gridHelper.GetSelectedKeys().length;
			setCommonToolbarButtonEnabled('c_toolbarItemDelete', true);
			if (selCount == 1)
			    setCommonToolbarButtonEnabled('c_toolbarItemEdit', true);
			else
			    setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
		}
		function RowDeselected(sender, args, gridHelper) {
			var selCount = gridHelper.GetSelectedKeys().length;
			if (selCount > 0) {
				if (selCount == 1)
				    setCommonToolbarButtonEnabled('c_toolbarItemEdit', true);
				else
				    setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
			} else {
			setCommonToolbarButtonEnabled('c_toolbarItemDelete', false);
			setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
			}
		}
	</script>

	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_circular" ID="m_circularHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid runat="server" ID="m_circular" AllowMultiRowSelection="true">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server" ClientDataKeyNames="ID">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="PhoneNumber" />
					<Telerik:GridBoundColumn DataField="CreatedDateTimeString" HeaderStyle-Width="140px" />
					<Telerik:GridBoundColumn DataField="UnsubscribedString" HeaderStyle-Width="130px" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>
