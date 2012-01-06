<%@ page language="C#" masterpagefile="~/LitiumStudio/Relations/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_Relations_Persons, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/Relations/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="c_toolbarRight" runat="server">
		<Toolbar:DividerItem ID="c_divider5" ImageURL="Images/transparent.gif" Class="litToolbarDivider"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemAssign_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconAssignAdd"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="c_toolbarItemAssign" runat="server" />
		<Toolbar:DividerItem ID="c_divider_import" ImageURL="Images/transparent.gif" Class="litToolbarDivider"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemImport_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconImport2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="c_toolbarItemImport" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemExport_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconExport2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="c_toolbarItemExport" runat="server" />
		<Toolbar:DividerItem ID="c_divider_refresh" ImageURL="Images/transparent.gif" Class="litToolbarDivider"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemRefresh_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconRefresh"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="c_toolbarItemRefresh" runat="server" />
		<Toolbar:DividerItem ID="c_divider_adv_search" ImageURL="Images/transparent.gif"
			Class="litToolbarDivider" runat="server" />
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
	<Foundation:ModuleString runat="server" Name="HasLogin" /> <asp:DropDownList ID="c_hasLogin" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DroplistChanged" style="margin-right: 15px;" /> 
	<span runat="server" id="c_ecommercePanel"><Foundation:ModuleString runat="server" Name="IsEcommerceCustomer" /> <asp:DropDownList ID="c_isEcommerceCustomer" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DroplistChanged" style="margin-right: 15px;" /></span>
	<asp:Panel runat="server" ID="c_alphabeticList" CssClass="AlphabetLinkList" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">

	<Telerik:RadCodeBlock ID="RadScriptBlock1" runat="server" >
		<script language="javascript" type="text/javascript">
			//Buttons
			//0_0 - Cut
			//0_1 - Copy
			//0_2 - Paste
			//1_5 - Delete
			//1_6 - Asign group/org
			//1_7 - Import
			//1_8 - Export

			var cancelDeselect = false;
			var cancelSelect = false;
			var selectedItemsCount = 0;

			function callMethod_Success(result, userContext, methodName) {
	            RadAjaxManager().hideLoadingPanels("<%=c_personsGrid2.ClientID %>", RadAjaxManager().get_ajaxSettings());
				selectedItemsCount = result;
				updateGridHeader();
				if (selectedItemsCount == 0){
					$find("<%=c_personsGridHelper.ClientID %>_ClientState").ClearSelectedKeys();
					toolbarItemAction("disable", "1_2");
					setCommonToolbarButtonEnabled('c_toolbarItemView', false);
				<%if(HasWritePermission) {%>
                    toolbarItemAction("disable", "1_0");
					setCommonToolbarButtonEnabled('c_toolbarItemDelete', false);
					setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
				<%} %>
				}	
			}

			function callMethod_Failure(errors, userContext, methodName) {
	            RadAjaxManager().hideLoadingPanels("<%=c_personsGrid2.ClientID %>", RadAjaxManager().get_ajaxSettings());
				alert(errors.get_message());
			}

			function updateGridHeader() {
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = selectedItemsCount >= $find("<%= c_personsGrid2.ClientID %>").get_masterTableView()._virtualItemCount && selectedItemsCount != 0;
			}

			function SelectAllClick(sender) {
				if (sender.checked) {
					SelectAllItems();
				}
				else {
					ClearSelection();
				}
			}

			function SelectAllItems() {
	            RadAjaxManager().showLoadingPanels("<%=c_personsGrid2.ClientID %>", RadAjaxManager().get_ajaxSettings());
				var tableView = $find("<%= c_personsGrid2.ClientID %>").get_masterTableView();
				tableView.clearSelectedItems();
				cancelDeselect = true;
				tableView.selectAllItems();
				PageMethods.SelectAllItems(callMethod_Success, callMethod_Failure);
				cancelDeselect = false;
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = true;
			}

			function ClearSelection() {
	            RadAjaxManager().showLoadingPanels("<%=c_personsGrid2.ClientID %>", RadAjaxManager().get_ajaxSettings());
				var tableView = $find("<%= c_personsGrid2.ClientID %>").get_masterTableView();
				cancelSelect = true;
				tableView.clearSelectedItems();
				if (tableView.get_selectedItems().length > 0)
					tableView.selectAllItems();
				cancelSelect = false;
				PageMethods.ClearSelection(callMethod_Success, callMethod_Failure);
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = false;
			}

			function RowSelecting(sender, args, gridHelper) {
				var items = gridHelper.GetSelectedKeys();
				if (items.length == 1) {
				    setCommonToolbarButtonEnabled('c_toolbarItemView', true);
					<%if(HasWritePermission)
                     {%>					
					setCommonToolbarButtonEnabled('c_toolbarItemEdit', true);
					<%
                    }%>
				}
				else {
					setCommonToolbarButtonEnabled('c_toolbarItemView', false);
					<%if(HasWritePermission)
                     {%>
					setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
					<%
                    }%>
				}
				<%if(HasWritePermission)
                {%>
				setCommonToolbarButtonEnabled('c_toolbarItemDelete', true);
				toolbarItemAction("activate", "1_0");
				<%
                }%>
				toolbarItemAction("activate", "1_2");

				if (args._domEvent.type != null) {
					var totalCount = $find("<%= c_personsGrid2.ClientID %>").get_masterTableView()._virtualItemCount;
					PageMethods.UpdateSelection(args._dataKeyValues.ID, 'true', totalCount, callMethod_Success, callMethod_Failure);
				}
				else {
					if (cancelSelect)
						args.set_cancel(true);
				}
			}

			function RowDeselecting(sender, args, gridHelper) {
				var items = gridHelper.GetSelectedKeys();
				if (items.length == 0) {
					toolbarItemAction("disable", "1_2");
					setCommonToolbarButtonEnabled('c_toolbarItemView', false);
				<%if(HasWritePermission)
                {%>
                    toolbarItemAction("disable", "1_0");
					setCommonToolbarButtonEnabled('c_toolbarItemDelete', false);
					setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
				<%
                }%>
				}
				else if (items.length == 1) {
				<%if(HasWritePermission)
                {%>
					setCommonToolbarButtonEnabled('c_toolbarItemDelete', true);
					setCommonToolbarButtonEnabled('c_toolbarItemEdit', true);
				<%
                }%>
					setCommonToolbarButtonEnabled('c_toolbarItemView', true);					
				}
				
				if (args._domEvent.type != null) {
					if (items != null && items.length > 0) {
						var totalCount = $find("<%= c_personsGrid2.ClientID %>").get_masterTableView()._virtualItemCount;
						PageMethods.UpdateSelection(args._dataKeyValues.ID, 'false', totalCount, callMethod_Success, callMethod_Failure);
					}
					else {
						PageMethods.ClearSelection(callMethod_Success, callMethod_Failure);
					}
				}
				else {
					if (cancelDeselect) {
						args.set_cancel(true);
					}
				}
			}

			function RowDeselected(sender, args, gridHelper) {
	  			$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = false;
			}

			function HeaderShowing(sender, args) {
				updateGridHeader();
			}
		</script>
	</Telerik:RadCodeBlock>

	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="c_personsGrid2" ID="c_personsGridHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid runat="server" ID="c_personsGrid2" AllowMultiRowSelection="true" OnItemCreated="GridItemCreated" OnPageIndexChanged="GridPageIndexChanged" OnSortCommand="GridSorted">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelecting" OnRowDeselecting="RowDeselecting" OnRowCreating="HeaderShowing" OnRowDeselected="RowDeselected"/>
				<Selecting allowrowselect="True" />
			</ClientSettings>
			<MasterTableView runat="server">
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
	<asp:HiddenField ID="c_hiddenSelectAllClientID" value="" runat="server" />
</asp:Content>
