<%@ page language="C#" masterpagefile="~/LitiumStudio/Relations/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_Relations_Groups, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/Relations/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="c_toolbarRight" runat="server">
		<Toolbar:DividerItem ID="c_divider_adv_search" ImageURL="Images/transparent.gif"
			Class="litToolbarDivider" runat="server" />
			<Toolbar:ToolbarItem OnClick="ToolbarItemManagePersons_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconAssignAdd"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="c_toolbarItemManagePersons" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemAssign_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconManagePerson"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="c_toolbarItemAssign" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemImport_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconImport2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="c_toolbarItemImport" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemExport_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconExport2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="c_toolbarItemExport" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemAdvSearch_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconRelationsFind"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="c_toolbarItemAdvSearch" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" id="c_headerImage" runat="server" alt="" /><asp:Label
		ID="relationsBreadcrumb" Text="" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="LitiumStudioFilterArea">
	<LS:FilterAreaSetting runat="server" ID="c_filterState" FilterAreaState="Open" />
	<asp:Panel runat="server" ID="c_alphabeticList" CssClass="AlphabetLinkList" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<Telerik:RadCodeBlock ID="RadScriptBlock1" runat="server" >
	<script type="text/javascript">
	    //Buttons
	    //0_0 - Cut
	    //0_1 - Copy
	    //0_2 - Paste
	    
		//1_3 - View 
		//1_4 - Edit
		//1_5 - Delete
		//1_6 - Asign group/org
		//1_7 - Import
		//1_8 - Export
		function RowSelected(sender, args, gridHelper) {
                       
			var items = gridHelper.GetSelectedKeys();			
			setCommonToolbarButtonEnabled('c_toolbarItemView', true);
			<%if(HasWritePermission) {%>               
			setCommonToolbarButtonEnabled('c_toolbarItemEdit', true);
			setCommonToolbarButtonEnabled('c_toolbarItemDelete', true);
			toolbarItemAction("activate", "0_1");
			toolbarItemAction("activate", "1_0");
			toolbarItemAction("activate", "1_1");			    
			<%}%>
            
            var itemMembersCountCell = sender.get_masterTableView().get_dataItems()[args.get_itemIndexHierarchical()].get_element().cells[2];
            //innerText in IE,Opera/Chrome, textContent in FF and Safari
            if(itemMembersCountCell.innerText == '0' || itemMembersCountCell.textContent == '0')
                toolbarItemAction("disable", "1_3");
            else
                toolbarItemAction("activate", "1_3");
		}
		function RowDeselected(sender, args, gridHelper) {		    
		    setCommonToolbarButtonEnabled('c_toolbarItemView', false);
		   <%if(HasWritePermission)
                {%>
		        setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
		        setCommonToolbarButtonEnabled('c_toolbarItemDelete', false);
		        toolbarItemAction("disable", "0_0,0_1");
		        toolbarItemAction("disable", "1_0");
		        toolbarItemAction("disable", "1_1");
		        
		    <%
            }%>
            toolbarItemAction("disable", "1_3");
            toolbarItemAction("disable", "1_8");
		}
	</script>
</Telerik:RadCodeBlock>
	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="c_personsGrid2" ID="c_personsGridHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid runat="server" ID="c_personsGrid2">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="Name" HeaderStyle-Width="200px" />
					<Telerik:GridBoundColumn DataField="MemberCount" HeaderStyle-Width="80px" />
					<Telerik:GridBoundColumn DataField="Description" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>
