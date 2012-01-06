<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesTrashcan, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarTrashcan" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemTrashcanRestore_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconRecycle" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemTrashcanRestore" runat="server"/>	
	    <toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem3"/>
	    <toolbar:ToolbarItem OnClick="ToolbarItemTrashcanDelete_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemTrashcanDelete" runat="server"/>	
	    <toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem1"/>
	    <toolbar:ToolbarItem OnClick="ToolbarItemTrashcanReset_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconGarbageDelete" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemTrashcanReset" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" alt="" class="litIconGarbageEmpty" />
	<asp:Label runat="server" ID="c_labelHeader" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
	<script type="text/javascript">
		function RowSelected(sender, args, gridHelper) {
			ActiveButton(gridHelper)
		}
		function RowDeselected(sender, args, gridHelper) {
			ActiveButton(gridHelper)
		}
		function ActiveButton(gridHelper) {
			var items = gridHelper.GetSelectedKeys();
			if (items.length > 0) {
				toolbarItemAction("activate", "1_0,1_1");
			}
			else {
				toolbarItemAction("disable", "1_0,1_1");
			}
		}
    </script>
    
    <div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" ID="m_cmsHelper" AssociatedControlID="m_cms" OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid runat="server" ID="m_cms" AllowMultiRowSelection="false">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="3%" ItemStyle-Width="3%" />
					<Telerik:GridBoundColumn DataField="ID" Visible="false" />
					<Telerik:GridBoundColumn DataField="Name" HeaderStyle-Width="30%" ItemStyle-Width="30%" />
					<Telerik:GridBoundColumn DataType="System.String" DataField="MovedToTrashcan" HeaderStyle-Width="67%" ItemStyle-Width="67%" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
    
    <script type="text/javascript">
    	//<![CDATA[
    	// Image preloading
    	var img1 = new Image();
    	img1.src = '../../LitiumStudio/Images/grid/spinner.gif';
    	//]]>    
    </script>
</asp:Content>