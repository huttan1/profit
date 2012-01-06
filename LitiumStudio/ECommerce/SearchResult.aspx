<%@ page title="" language="C#" masterpagefile="~/LitiumStudio/ECommerce/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_ECommerce_SearchResult, Litum.Studio.Web" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Telerik:RadCodeBlock ID="RadScriptBlock1" runat="server" >
		<script language="javascript" type="text/javascript">
			
			var cancelDeselect = false;
			var cancelSelect = false;
			var selectedItemsCount = 0;

			function initToolbar() {
				updateToolbar(parseInt("<%= SelectedItems.Count %>"));
			}
			
			function updateToolbar(selectedItemsCount) {
				// None item selected
				if (selectedItemsCount == 0) {
					setToolbarButtonEnabled('c_toolbarItemView', false);
					setToolbarButtonEnabled('c_toolbarItemEdit', false);
					setToolbarButtonEnabled('c_toolbarItemDelete', false);
					setToolbarButtonEnabled('c_toolbarItemEditStatus', false);
					setToolbarButtonEnabled('c_toolbarItemViewRelated', false);
				}
				else {
					// Single item selected
					if (selectedItemsCount == 1) {
						setToolbarButtonEnabled('c_toolbarItemView', true);
					}
					// Multi items selected
					else {
						setToolbarButtonEnabled('c_toolbarItemView', false);
					}
				}
			}

			function updateToolbarExtended(selectedItemsInfo) {
				var itemInfo = new Array();
				itemInfo = selectedItemsInfo.split('|');

				// * Enable or disable the edit button
				var isEditable = (itemInfo[0] == 'True')
				setToolbarButtonEnabled('c_toolbarItemEdit', isEditable);

				// * Enable or disable the delete button
				var isDeletable = (itemInfo[1] == 'True')
				setToolbarButtonEnabled('c_toolbarItemDelete', isDeletable);

				// * Enable or disable the view related button
				var isViewRelatedAllowed = (itemInfo[2] == 'True')
				setToolbarButtonEnabled('c_toolbarItemViewRelated', isViewRelatedAllowed);

				// * Initialize EditStatus menu
				c_menuEditStatus.get_items().clear();
				// State is not empty
				if (itemInfo[3] != '') {
					var state = new Array();
					// Multi states
					if (itemInfo[3].indexOf('-') != -1) {
						var stateInfo = new Array();
						stateInfo = itemInfo[3].split('-');

						var i = 0;
						for (i = 0; i < stateInfo.length; i++) {
							state = stateInfo[i].split(',');
							c_menuEditStatus.get_items().add(getStatesMenuItem(state[0], state[1]));
						}
					}
					// Single state
					else {
						state = itemInfo[3].split(',');
						c_menuEditStatus.get_items().add(getStatesMenuItem(state[0], state[1]));
					}
					setToolbarButtonEnabled('c_toolbarItemEditStatus', true);
				}
				// State empty -> disable EditStatus menu
				else {
					setToolbarButtonEnabled('c_toolbarItemEditStatus', false);
				}

				selectedItemsCount = parseInt(itemInfo[4]);
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = selectedItemsCount == $find("<%= c_searchResultGrid.ClientID %>").get_masterTableView()._virtualItemCount && selectedItemsCount != 0;
				updateToolbar(selectedItemsCount);
			}

			function setToolbarButtonEnabled(id, enabled) {
				c_toolbarMain.get_items().getItemById(id).set_enabled(enabled);
			}

			function getStatesMenuItem(stateId, stateName) {
				var newItem = new ComponentArt.Web.UI.MenuItem();
				newItem.set_text(stateName);
				// Id later will be used to get the selected state.
				newItem.set_id('c_menuStatus_' + stateId);
				return newItem;
			}	
			
			function callMethod_Success(results, userContext, methodName) {
				updateToolbarExtended(results);
			}

			function callMethod_Failure(errors, userContext, methodName) {
				alert(errors.get_message());
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
				var tableView = $find("<%= c_searchResultGrid.ClientID %>").get_masterTableView();
				tableView.clearSelectedItems();
				cancelDeselect = true;
				tableView.selectAllItems();
				PageMethods.SelectAllItems(callMethod_Success, callMethod_Failure);
				cancelDeselect = false;
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = true;
			}

			function ClearSelection() {
				var tableView = $find("<%= c_searchResultGrid.ClientID %>").get_masterTableView();
				cancelSelect = true;
				tableView.clearSelectedItems();
				if (tableView.get_selectedItems().length > 0)
					tableView.selectAllItems();
				cancelSelect = false;
				PageMethods.ClearSelection(callMethod_Success, callMethod_Failure);
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = false;
			}

			function clearSelectionCallMethod_Success(results, userContext, methodName) {
				initToolbar();
			}

			function RowSelecting(sender, args, gridHelper) {
				if (args._domEvent.type != null) {
					var items = gridHelper.GetSelectedKeys();
					PageMethods.UpdateSelection(args._dataKeyValues.ID, 'true', callMethod_Success, callMethod_Failure);
				}
				else {
					if (cancelSelect)
						args.set_cancel(true);
				}
			}
			
			function RowDeselecting(sender, args, gridHelper) {
				if (args._domEvent.type != null) {
					var items = gridHelper.GetSelectedKeys();
					if (items != null && items.length > 0) {
						PageMethods.UpdateSelection(args._dataKeyValues.ID, 'false', callMethod_Success, callMethod_Failure);
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

			function updateGrid(clearItemsIDs) {
				var tableView = $find("<%= c_searchResultGrid.ClientID %>").get_masterTableView();
				if (clearItemsIDs) {
					$get('<%= c_hiddenItemIDs.ClientID %>').value = '';
				}
				tableView.rebind();
			}

			function HeaderShowing(sender, args) {
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = selectedItemsCount == $find("<%= c_searchResultGrid.ClientID %>").get_masterTableView()._virtualItemCount;
			}
		</script>

	</Telerik:RadCodeBlock>
	<ComponentArt:ToolBar ID="c_toolbarMain" OnItemCommand="c_toolbarMain_ItemCommand"
		runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16">
		<Items runat="server">
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemAdd" ImageUrl="icons_standard/add.png"
				ItemType="DropDown" DropDownId="c_menuItemAdd" DropDownImageUrl="toolbar/dropdown.gif"
				DropDownImageWidth="16" DropDownImageHeight="16"  ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate"/>
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemView" ImageUrl="icons_standard/view.png"
				AutoPostBackOnSelect="true" Style="padding: 1px 3px;" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemEdit" ImageUrl="icons_standard/pencil.png"
				AutoPostBackOnSelect="true"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemDelete" ImageUrl="icons_standard/delete.png" 
				AutoPostBackOnSelect="true"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="ToolBarItem1" runat="server" ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif"
				ImageHeight="16" ImageWidth="2" />
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemCopy" ImageUrl="icons_standard/copy.png"
				AutoPostBackOnSelect="false"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="ToolBarItem3" runat="server" ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif"
				ImageHeight="16" ImageWidth="2" />
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemEditStatus" ImageUrl="icons_standard/pencil.png"
				ItemType="DropDown" DropDownId="c_menuEditStatus" DropDownImageUrl="toolbar/dropdown.gif"
				DropDownImageWidth="16" DropDownImageHeight="16"  ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate"/>
			<ComponentArt:ToolBarItem ID="ToolBarItem2" runat="server" ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif"
				ImageHeight="16" ImageWidth="2" />
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemViewRelated" ImageUrl="icons_standard/view.png"
				ItemType="DropDown" DropDownId="c_menuViewRelated" DropDownImageUrl="toolbar/dropdown.gif"
				DropDownImageWidth="16" DropDownImageHeight="16" ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate"/>
		</Items>
		<ClientTemplates>
		    <ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemButtonTemplate">
		        <table cellspacing="0" cellpadding="0" border="0" style="margin: 0px; margin-right: auto;">
		            <tbody>
		                <tr>
		                    <td class="ToolbarItemLeft">
		                        &nbsp;
		                    </td>
		                    <td class="ca_tb_img ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##" alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
		                    </td>
		                    <td class="ca_tb_txt ToolbarItemMain">
		                        <nobr>## DataItem.get_text() ##</nobr>
		                    </td>
		                    <td class="ToolbarItemRight">
		                        &nbsp;
		                    </td>
		                </tr>
		            </tbody>
		         </table>			       
		    </ComponentArt:ClientTemplate>
		    <ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemButtonDropDownTemplate">
		        <table cellspacing="0" cellpadding="0" border="0" style="margin: 0px; margin-right: auto;">
		            <tbody>
		                <tr>
		                    <td class="ToolbarItemLeft">
		                        &nbsp;
		                    </td>
		                    <td class="ca_tb_img ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##" alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
		                    </td>
		                    <td class="ca_tb_txt ToolbarItemMain">
		                        <nobr>## DataItem.get_text() ##</nobr>
		                    </td>
		                    <td rowspan="1" class="ca_tb_ddn ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_dropDownImageUrl() ##" alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
		                    </td>
		                    <td class="ToolbarItemRight">
		                        &nbsp;
		                    </td>
		                 </tr>
		             </tbody>
		         </table>
		    </ComponentArt:ClientTemplate>
		</ClientTemplates>  
	</ComponentArt:ToolBar>
	<ComponentArt:Menu runat="server" ID="c_menuItemAdd" ImagesBaseUrl="~/LitiumStudio/Images/"
		CssClass="litNavMenuGroup" DefaultItemLookId="DefaultItemLook" DefaultGroupItemSpacing="1"
		DefaultItemTextAlign="Left" DefaultItemTextWrap="false" DefaultGroupExpandOffsetX="0"
		DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto" TopGroupExpandDirection="BelowLeft"
		TopGroupExpandOffsetY="0" CollapseDuration="100" CollapseSlide="ExponentialDecelerate"
		ExpandDuration="100" ExpandSlide="ExponentialDecelerate" ExpandDelay="0" ExpandOnClick="false"
		CascadeCollapse="true" CollapseDelay="10000" HideSelectElements="false" HighlightExpandedPath="true"
		KeyboardEnabled="true" OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true"
		ShadowOffset="2" Orientation="Vertical" ContextMenu="Custom" OnItemSelected="c_menuItemAdd_ItemSelected">
		<ItemLooks>
			<ComponentArt:ItemLook LookId="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16"
				CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive"
				HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10"
				LabelPaddingRight="10" LabelPaddingTop="3" />
			<ComponentArt:ItemLook LookId="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16"
				CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10"
				LabelPaddingRight="10" LabelPaddingTop="3" />
		</ItemLooks>
	</ComponentArt:Menu>
	<ComponentArt:Menu runat="server" ID="c_menuEditStatus" ImagesBaseUrl="~/LitiumStudio/Images/"
		CssClass="litNavMenuGroup" DefaultItemLookId="DefaultItemLook" DefaultGroupItemSpacing="1"
		DefaultItemTextAlign="Left" DefaultItemTextWrap="false" DefaultGroupExpandOffsetX="0"
		DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto" TopGroupExpandDirection="BelowLeft"
		TopGroupExpandOffsetY="0" CollapseDuration="100" CollapseSlide="ExponentialDecelerate"
		ExpandDuration="100" ExpandSlide="ExponentialDecelerate" ExpandDelay="0" ExpandOnClick="false"
		CascadeCollapse="true" CollapseDelay="10000" HideSelectElements="false" HighlightExpandedPath="true"
		KeyboardEnabled="true" OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true"
		ShadowOffset="2" Orientation="Vertical" ContextMenu="Custom" AutoPostBackOnSelect="true" OnItemSelected="c_menuEditStatus_ItemSelected">
		<ItemLooks>
			<ComponentArt:ItemLook LookId="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16"
				CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive"
				HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10"
				LabelPaddingRight="10" LabelPaddingTop="3" />
			<ComponentArt:ItemLook LookId="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16"
				CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10"
				LabelPaddingRight="10" LabelPaddingTop="3" />
		</ItemLooks>
	</ComponentArt:Menu>
	<ComponentArt:Menu runat="server" ID="c_menuViewRelated" ImagesBaseUrl="~/LitiumStudio/Images/"
		CssClass="litNavMenuGroup" DefaultItemLookId="DefaultItemLook" DefaultGroupItemSpacing="1"
		DefaultItemTextAlign="Left" DefaultItemTextWrap="false" DefaultGroupExpandOffsetX="0"
		DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto" TopGroupExpandDirection="BelowLeft"
		TopGroupExpandOffsetY="0" CollapseDuration="100" CollapseSlide="ExponentialDecelerate"
		ExpandDuration="100" ExpandSlide="ExponentialDecelerate" ExpandDelay="0" ExpandOnClick="false"
		CascadeCollapse="true" CollapseDelay="10000" HideSelectElements="false" HighlightExpandedPath="true"
		KeyboardEnabled="true" OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true"
		ShadowOffset="2" Orientation="Vertical" ContextMenu="Custom" OnItemSelected="c_menuViewRelated_ItemSelected">
		<ItemLooks>
			<ComponentArt:ItemLook LookId="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16"
				CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive"
				HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10"
				LabelPaddingRight="10" LabelPaddingTop="3" />
			<ComponentArt:ItemLook LookId="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16"
				CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10"
				LabelPaddingRight="10" LabelPaddingTop="3" />
		</ItemLooks>
	</ComponentArt:Menu>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<asp:Label runat="server" ID="c_labelHeader"/>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" class="noScroll" runat="Server">
    <div class="lsContentNoScroll">
	    
	    <LS:GridHelperAjax runat="server" ID="c_gridHelper" AssociatedControlID="c_searchResultGrid"
		    OnNeedData="GetData" DataKeyName="ID" />
	    
	    <Telerik:RadGrid ID="c_searchResultGrid" runat="server" Style="height: 100%;" AllowMultiRowSelection="true" OnItemCreated="GridItemCreated" OnPageIndexChanged="GridPageIndexChanged" OnSortCommand="GridSorted" >
		    <ClientSettings> 
			    <ClientEvents OnRowCreating="HeaderShowing" OnRowSelecting="RowSelecting" OnRowDeselecting="RowDeselecting" OnRowDeselected="RowDeselected" />
				<Selecting allowrowselect="True" />
		    </ClientSettings>
		    <MasterTableView runat="server">
				<Columns>
					<Telerik:GridBoundColumn UniqueName="ID" DataField="Id" Visible="false" />
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30px" ItemStyle-Width="30px" />
					<Telerik:GridImageColumn DataImageUrlFields="IconImageUrl" DataImageUrlFormatString="{0}" HeaderStyle-Width="30px" ItemStyle-Width="30px" />
					<Telerik:GridBoundColumn DataField="IdString" HeaderStyle-Width="300px" ItemStyle-Width="300px"/>
					<Telerik:GridBoundColumn DataField="StatusName" />
					<Telerik:GridBoundColumn DataField="Email" HeaderStyle-Width="250px" ItemStyle-Width="250px"/>
					<Telerik:GridBoundColumn DataField="CreatedDateString" />
					<Telerik:GridBoundColumn DataField="UpdatedDateString" />
					<Telerik:GridHyperLinkColumn DataNavigateUrlFormatString="{0}" DataNavigateUrlFields="EditUrl" Text="&lt;img class='litIconPencil' src='Images/transparent.gif' &gt;" HeaderStyle-Width="50px" ItemStyle-Width="50px"/>
					<Telerik:GridHyperLinkColumn DataNavigateUrlFormatString="{0}" DataNavigateUrlFields="ViewUrl" Text="&lt;img class='litIconNavRightBlue' src='Images/transparent.gif' &gt;" HeaderStyle-Width="50px" ItemStyle-Width="50px"/>
					<Telerik:GridBoundColumn UniqueName="EditUrl" DataField="EditUrl" Visible="false" />
					<Telerik:GridBoundColumn UniqueName="ViewUrl" DataField="ViewUrl" Visible="false" />
				</Columns>
		    </MasterTableView>
	    </Telerik:RadGrid>
	   
	    <Telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
		    <script type="text/javascript">
		    	var isAddAllowed = '<%=IsAddAllowed%>' == 'True';
		    	var isEditAllowed = '<%=IsEditAllowed%>' == 'True';
		    	c_toolbarMain.get_items().getItemById('c_toolbarItemAdd').set_visible(isAddAllowed);
		    	c_toolbarMain.get_items().getItemById('c_toolbarItemEdit').set_visible(isEditAllowed);
		    </script>
	    </Telerik:RadScriptBlock>
	   
	    <asp:HiddenField ID="c_hiddenItemIDs" value="" runat="server" />
	    <asp:HiddenField ID="c_hiddenSelectAllClientID" value="" runat="server" />
	</div>
</asp:Content>
