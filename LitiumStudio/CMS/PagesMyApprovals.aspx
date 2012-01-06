<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesMyApprovals, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarTasks" runat="server" >
		<toolbar:ToolbarItem OnClick="ToolbarItemPublish_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPublish" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemPublish" runat="server" />
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarDivider" runat="server" ID="Divideritem1"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemCancelPublish_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCancelPublish" runat="server" />
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarDivider" runat="server" ID="Divideritem2"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemUpdate_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconRefresh" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemUpdate" runat="server" />
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" alt="" class="litIconReadyForPublish" />
	<asp:Label runat="server" ID="c_labelHeader" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <script type="text/javascript">
    	function GotoPage(pageID, hasWorkingCopy) {
    		if (hasWorkingCopy == "true") {
				document.location = 'PagesWorkingCopy.aspx?CMS_SP_ID=' + pageID;
    		}
    		else {
    			document.location = 'Pages.aspx?CMS_SP_ID=' + pageID;
    		}
    		return false;
    	}
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
		<Telerik:RadGrid runat="server" ID="m_cms" AllowMultiRowSelection="true">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="3%" ItemStyle-Width="3%" />
					<Telerik:GridBoundColumn DataField="ID" Visible="false" />
					<Telerik:GridBoundColumn DataField="Name" HeaderStyle-Width="24%" ItemStyle-Width="24%" />
					<Telerik:GridBoundColumn DataField="Place" HeaderStyle-Width="30%" ItemStyle-Width="30%" />
					<Telerik:GridBoundColumn DataField="DateUpdated" DataType="System.String" HeaderStyle-Width="20%" ItemStyle-Width="20%" />
                    <Telerik:GridBoundColumn DataField="LastUpdatedBy" HeaderStyle-Width="20%" ItemStyle-Width="20%" />
					<Telerik:GridBoundColumn DataField="HasWorkingCopy" Visible="false" />
                    <Telerik:GridHyperLinkColumn DataNavigateUrlFormatString='javascript:GotoPage("{0}", {1});' DataNavigateUrlFields="ID,HasWorkingCopy" Text="&lt;img class='litIconNavRightBlue' src='Images/transparent.gif' &gt;" HeaderStyle-Width="3%" ItemStyle-Width="3%" />
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