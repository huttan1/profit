<%@ page language="C#" masterpagefile="~/LitiumStudio/Newsletter/Framework/Base1.master" inherits="LitiumStudio_Newsletter_SMS, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Newsletter/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbar" runat="server" >	   
		<toolbar:ToolbarItem OnClick="ToolbarItemCopy_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconCopy" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCopy" runat="server"/>
	    <toolbar:DividerItem ID="DividerItem2" ImageURL="Images/transparent.gif" Class="litToolbarDivider" runat="server" />
	    <toolbar:ToolbarItem OnClick="ToolbarItemRefresh_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconRefresh" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemRefresh" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" runat="Server" ContentPlaceHolderID="LitiumStudioContentHeading">
	<img src="Images/transparent.gif" alt="" class="litIconCircularSMS" />
    <span class="litContentTopHeader"><asp:Label runat="server" ID="c_labelHeader" /></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
	<script type="text/javascript">
		function RowSelected(sender, args) {
		    setCommonToolbarButtonEnabled('c_toolbarItemView', true);
		    setCommonToolbarButtonEnabled('c_toolbarItemDelete', true);
			if (args.getDataKeyValue("CanEdit") == "True")
			    setCommonToolbarButtonEnabled('c_toolbarItemEdit', true);
			if (args.getDataKeyValue("CanCopy") == "True")
				toolbarItemAction("activate", "1_0");
		}
		function RowDeselected(sender, args) {
		    setCommonToolbarButtonEnabled('c_toolbarItemView', false);
		    setCommonToolbarButtonEnabled('c_toolbarItemDelete', false);
		    setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
			toolbarItemAction("disable", "1_0");
		}
	</script>

	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_circular" ID="m_circularHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID;CanEdit;CanCopy" />
		<Telerik:RadGrid runat="server" ID="m_circular">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server" ClientDataKeyNames="ID">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="SentDate" HeaderStyle-Width="180px" />
					<Telerik:GridBoundColumn DataField="Subject"/>
					<Telerik:GridBoundColumn DataField="NumberOfRecipients" HeaderStyle-Width="140px" />
					<Telerik:GridBoundColumn DataField="Status" HeaderStyle-Width="300px"/>
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>