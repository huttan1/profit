<%@ page language="C#" masterpagefile="~/LitiumStudio/Newsletter/Framework/Base1.master" inherits="LitiumStudio_Newsletter_Circulars, Litum.Studio.Web" %>
<%@ Import Namespace="Litium.Studio.UI.Newsletter.Circulars.Constants"%>

<%@ Register assembly="Litum.Studio.Web"  TagPrefix="LS" Namespace="Litium.Studio.UI" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Newsletter/Framework/Base1.master" %>
<asp:Content ID="ToolbarScripts" ContentPlaceHolderID="Scripts" runat="server">
    <script type="text/javascript">

        function RowSelected(sender, args, gridHelper) {
		    setCommonToolbarButtonEnabled('c_toolbarItemView', true);
		    setCommonToolbarButtonEnabled('c_toolbarItemDelete', true);
			if (args.getDataKeyValue("CanEdit") == "True") {
			    setCommonToolbarButtonEnabled('c_toolbarItemEdit', true);
			}
			if (args.getDataKeyValue("CanCopy") == "True")
				toolbarItemAction("activate", "1_0");
		}
		function RowDeselected(sender, args, gridHelper) {
			setCommonToolbarButtonEnabled('c_toolbarItemView', false);
			setCommonToolbarButtonEnabled('c_toolbarItemDelete', false);
			setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
			toolbarItemAction("disable", "1_0");
		}
	</script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="mc_toolbar" runat="server">
		<Toolbar:ToolbarItem OnClick="ToolbarItemCopy_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconCopy" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="mc_toolbarItemCopy" runat="server" />
		<Toolbar:DividerItem ID="DividerItem2" ImageURL="Images/transparent.gif" Class="litToolbarDivider"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemRefresh_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconRefresh"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="mc_toolbarItemRefresh" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" alt="" class="litIconCircularCirculars" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_circular" ID="m_circularHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID;CanEdit;CanCopy" />
		<Telerik:RadGrid runat="server" ID="m_circular">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="SentDate" HeaderStyle-Width="180px"/>
					<Telerik:GridBoundColumn DataField="Subject" />
					<Telerik:GridBoundColumn DataField="NumberOfRecipients" HeaderStyle-Width="140px" />
					<Telerik:GridBoundColumn DataField="Status"  HeaderStyle-Width="300px" />
					<Telerik:GridBoundColumn DataField="ReadingFrequenzy" HeaderStyle-Width="120px" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>
