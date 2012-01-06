<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_GroupList, Litum.Studio.Web" %>

<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls"
	Assembly="Litium.Studio.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
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
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconFoundationGroups" /><Foundation:SystemString
		runat="server" Name="Groups" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">
    <script type="text/javascript">
        function RowSelected(sender, args, data) {
            if (!data)
                data = args.get_gridDataItem().get_dataItem();
            toolbarItemAction("activate", "0_1,0_2");
            if (args.getDataKeyValue("CanDelete") == "True")
                toolbarItemAction("activate", "0_3");
        }
        function RowDeselected(sender, args) {
            toolbarItemAction("disable", "0_1,0_2,0_3");
        }
        function DataBound(sender, args) {
            RowDeselected(sender, args);
            var items = sender.get_masterTableView().get_selectedItems();
            if (items.length > 0) {
                for (i in items)
                    RowSelected(sender, args, items[i].get_dataItem());
            }
        }
	</script>	
 <div class="lsContentNoScroll">
	<LS:GridHelperAjax runat="server" AssociatedControlID="m_group" ID="m_groupHelper"
		OnNeedData="grid_NeedData" DataKeyName="ID;CanDelete" />
	<Telerik:RadGrid runat="server" ID="m_group">
    	<ClientSettings>
			<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" OnDataBound="DataBound" />
		</ClientSettings>
		<MasterTableView runat="server" ClientDataKeyNames="ID">
			<Columns>
			    <Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
				<Telerik:GridBoundColumn DataField="Name" />
				<Telerik:GridBoundColumn DataField="DisplayName"/>
				<Telerik:GridBoundColumn DataField="Active"/>
				<Telerik:GridBoundColumn DataField="Type"/>				
			</Columns>
		</MasterTableView>
	</Telerik:RadGrid>
</div>
</asp:Content>
