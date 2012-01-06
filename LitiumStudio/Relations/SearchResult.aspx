<%@ page title="" language="C#" masterpagefile="~/LitiumStudio/Relations/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_Relations_SearchResult, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/Relations/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Telerik:RadCodeBlock ID="RadScriptBlock1" runat="server">
		<script language="javascript" type="text/javascript">

			var cancelDeselect = false;
			var cancelSelect = false;
			var selectedItemsCount = 0;
			var enableAssignButton = false;

			function updateToolbar() {
			    setToolbarButtonEnabled('c_toolbarItemView', selectedItemsCount == 1);
				<%if(HasWritePermission)
                {%>
				setToolbarButtonEnabled('c_toolbarItemEdit', selectedItemsCount == 1);
				setToolbarButtonEnabled('c_toolbarItemDelete', selectedItemsCount > 0);
				<%
                }%>
			    setToolbarButtonEnabled('c_toolbarItemAssign', enableAssignButton && selectedItemsCount > 0);
			    setToolbarButtonEnabled('c_toolbarItemExport', selectedItemsCount > 0);
			}

			function setToolbarButtonEnabled(id, enabled) {
				c_toolbarMain.get_items().getItemById(id).set_enabled(enabled);
			}

			function updateGridHeader() {
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = selectedItemsCount == $find("<%= c_searchResultGrid.ClientID %>").get_masterTableView()._virtualItemCount && selectedItemsCount != 0;
			}

			function callMethod_Success(result, userContext, methodName) {
				selectedItemsCount = result[0];
				enableAssignButton = result[1];
				updateGridHeader();
				updateToolbar();
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

			function HeaderShowing(sender, args) {
				updateGridHeader();
			}
			
		</script>
	</Telerik:RadCodeBlock>
	<ComponentArt:ToolBar ID="c_toolbarMain" OnItemCommand="c_toolbarMain_ItemCommand"
		runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled" DefaultItemExpandedCssClass="litToolbarItemOnMouseDown"
		ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false"
		Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
		<Items runat="server">
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemAdd" ImageUrl="icons_standard/add.png"
				ItemType="DropDown" DropDownId="c_menuItemAdd" DropDownImageUrl="toolbar/dropdown.gif"
				DropDownImageWidth="16" DropDownImageHeight="16" ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate" />
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemView" ImageUrl="icons_standard/view.png"
				AutoPostBackOnSelect="true" Style="padding: 1px 3px;" ClientTemplateId="c_toolbarLeftTreeItemButtonsTemplate" />
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemEdit" ImageUrl="icons_standard/pencil.png"
				AutoPostBackOnSelect="true" ClientTemplateId="c_toolbarLeftTreeItemButtonsTemplate" />
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemDelete" ImageUrl="icons_standard/delete.png"
				AutoPostBackOnSelect="true" ClientTemplateId="c_toolbarLeftTreeItemButtonsTemplate" />
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemCut" ImageUrl="icons_standard/cut.png"
				ClientTemplateId="c_toolbarLeftTreeItemButtonsTemplate" Enabled="false" />
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemCopy" ImageUrl="icons_standard/copy.png"
				ClientTemplateId="c_toolbarLeftTreeItemButtonsTemplate" Enabled="false" />
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemPaste" ImageUrl="icons_standard/clipboard.png"
				ClientTemplateId="c_toolbarLeftTreeItemButtonsTemplate" Enabled="false" />
			<ComponentArt:ToolBarItem runat="server" ItemType="Separator" />
			<ComponentArt:ToolBarItem ImageUrl="../Relations/Images/assign_add.png" ID="c_toolbarItemAssign"
				runat="server" ClientTemplateId="c_toolbarLeftTreeItemButtonsTemplate" AutoPostBackOnSelect="true" />
			<ComponentArt:ToolBarItem ImageUrl="icons_standard/export.png" ID="c_toolbarItemExport"
				runat="server" ClientTemplateId="c_toolbarLeftTreeItemButtonsTemplate" AutoPostBackOnSelect="true" />
		</Items>
		<ClientTemplates>
			<ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemButtonsTemplate">
				<table cellspacing="0" cellpadding="0" border="0" style="margin: 0px; margin-right: auto;">
					<tbody>
						<tr>
							<td class="ToolbarItemLeft">
								&nbsp;
							</td>
							<td class="ca_tb_img ToolbarItemMain">
								<img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##"
									alt="" style="display: block;" title="## DataItem.get_toolTip() ##" />
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
								<img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##"
									alt="" style="display: block;" title="## DataItem.get_toolTip() ##" />
							</td>
							<td class="ca_tb_txt ToolbarItemMain">
								<nobr>## DataItem.get_text() ##</nobr>
							</td>
							<td rowspan="1" class="ca_tb_ddn ToolbarItemMain">
								<img height="16" width="16" border="0" src="../Images/## DataItem.get_dropDownImageUrl() ##"
									alt="" style="display: block;" title="## DataItem.get_toolTip() ##" />
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<asp:Label runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" ID="c_gridHelper" AssociatedControlID="c_searchResultGrid"
			OnNeedData="GetData" DataKeyName="ID" />
		<Telerik:RadGrid ID="c_searchResultGrid" runat="server" Style="height: 100%;" AllowMultiRowSelection="true"
			OnItemCreated="GridItemCreated" OnPageIndexChanged="GridPageIndexChanged" OnSortCommand="GridSorted">
			<ClientSettings>
				<ClientEvents OnRowCreating="HeaderShowing" OnRowSelecting="RowSelecting" OnRowDeselecting="RowDeselecting"
					OnRowDeselected="RowDeselected" />
				<Selecting AllowRowSelect="True" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridBoundColumn UniqueName="ID" DataField="Id" Visible="false" />
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30px"
						ItemStyle-Width="30px" />
					<Telerik:GridImageColumn DataImageUrlFields="IconImageUrl" DataImageUrlFormatString="{0}"
						HeaderStyle-Width="30px" ItemStyle-Width="30px" />
					<Telerik:GridBoundColumn DataField="FirstName" HeaderStyle-Width="100px" ItemStyle-Width="100px" />
					<Telerik:GridBoundColumn DataField="LastName" HeaderStyle-Width="100px" ItemStyle-Width="100px" />
					<Telerik:GridBoundColumn DataField="Email" HeaderStyle-Width="100px" ItemStyle-Width="100px" />
					<Telerik:GridBoundColumn DataField="TypeName" HeaderStyle-Width="100px" ItemStyle-Width="100px" />
					<Telerik:GridBoundColumn DataField="CustomerTypeText" HeaderStyle-Width="100px" ItemStyle-Width="100px" />
					<Telerik:GridBoundColumn DataField="CustomerNumber" HeaderStyle-Width="100px" ItemStyle-Width="100px" />
					<Telerik:GridTemplateColumn DataField="Referer" HeaderStyle-Width="30px" ItemStyle-Width="30px">
						<ItemTemplate>
							<asp:HyperLink runat="server" ID="EditButton" NavigateUrl='<%# Eval("EditUrl") %>'
								runat="server">
                                   <img ID="EditImage" class='litIconPencil' src='Images/transparent.gif' />
							</asp:HyperLink>
						</ItemTemplate>
					</Telerik:GridTemplateColumn>
					<Telerik:GridHyperLinkColumn DataNavigateUrlFormatString="{0}" DataNavigateUrlFields="ViewUrl"
						Text="&lt;img class='litIconNavRightBlue' src='Images/transparent.gif' &gt;"
						HeaderStyle-Width="25px" ItemStyle-Width="25px" />
					<Telerik:GridBoundColumn UniqueName="EditUrl" DataField="EditUrl" Visible="false" />
					<Telerik:GridBoundColumn UniqueName="ViewUrl" DataField="ViewUrl" Visible="false" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
		<asp:HiddenField ID="c_hiddenItemIDs" Value="" runat="server" />
		<asp:HiddenField ID="c_hiddenSelectAllClientID" Value="" runat="server" />
	</div>
</asp:Content>
