<%@ page title="" language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_SearchResult2, Litum.Studio.Web" %>
<%@ Import Namespace="Litium.Studio.UI.MediaArchive.Constants"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
	<div style="float:left;">
		<ComponentArt:ToolBar 
				ID="c_toolBarNew"
				runat="server"
				AutoPostBackOnSelect="true"
				CssClass="litToolbar" 
                DefaultItemHoverCssClass="litToolbarItemOnMouseOver"
                DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		        DefaultItemDisabledCssClass="litToolbarItemDisabled" 
		        DefaultItemExpandedCssClass="litToolbarItemOnMouseDown"
				ImagesBaseUrl="~/LitiumStudio/Images/" 
				ItemSpacing="0" 
				UseFadeEffect="false" 
				Orientation="Horizontal" 
				DefaultItemImageWidth="16" 
				DefaultItemImageHeight="16">
				<Items runat="server">
					<ComponentArt:ToolBarItem ID="c_toolbarItemNew" Text='<%=m_currentModule.Strings.GetValue(ModuleStringConstants.CONFIRMATION_DELETE_FOLDERS_AND_FILES, FoundationContext.LanguageID, true) %>' ImageUrl="icons_standard/add.png" ItemType="DropDown" runat="server"
                       DropDownId="c_newMenu" DropDownImageUrl="toolbar/dropdown.gif" DropDownImageWidth="16" DropDownImageHeight="16"
                       ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate"/>
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
		<ComponentArt:Menu runat="server" ID="c_newMenu" DefaultDisabledItemLookId="DisabledItemLook" ImagesBaseUrl="~/LitiumStudio/Images/" CssClass="litNavMenuGroup" DefaultItemLookID="DefaultItemLook" DefaultGroupItemSpacing="10" DefaultItemTextAlign="Left" DefaultItemTextWrap="false" DefaultGroupExpandOffsetX="0" DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto" TopGroupExpandDirection="BelowLeft" TopGroupExpandOffsetY="0" CollapseDuration="100" CollapseSlide="ExponentialDecelerate" ExpandDuration="100" ExpandSlide="ExponentialDecelerate" ExpandDelay="0" ExpandOnClick="false" CascadeCollapse="true" CollapseDelay="10000" HideSelectElements="false" HighlightExpandedPath="true" KeyboardEnabled="true" OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true" ShadowOffset="2" Orientation="Vertical" ContextMenu="Custom" ScrollingEnabled="true" ScrollDownLookId="ScrollDownItemLook" ScrollUpLookId="ScrollUpItemLook" OnItemSelected="AddMenu_OnItemSelected" >
			<ItemLooks>
				<ComponentArt:ItemLook LookID="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="5" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="4"/>
				<ComponentArt:ItemLook LookId="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16"
					CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10"
					LabelPaddingRight="10" LabelPaddingTop="3" />
				<ComponentArt:ItemLook LookID="ExpandableItemLook" RightIconUrl="menu/arrow.gif" RightIconWidth="20" RightIconHeight="15" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
				<ComponentArt:ItemLook LookID="BreakItem" ImageUrl="splitter/splitter_verBg.gif" ImageWidth="100%" ImageHeight="1" />
			</ItemLooks>
		
		</ComponentArt:Menu>
	</div>
	<div style="float:left;">
		<toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarRight"   runat="server" >
			<toolbar:ToolbarItem ID="c_toolbarItemView" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconView" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/MediaArchive/Images/transparent.gif" runat="server"  OnClick="ToolbarItemView_Click" />
			<toolbar:ToolbarItem ID="c_toolbarItemEdit" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/MediaArchive/Images/transparent.gif" runat="server" OnClick="ToolbarItemEdit_Click" />
			<toolbar:ToolbarItem ID="c_toolbarItemDelete" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/MediaArchive/Images/transparent.gif" runat="server"   OnClick="ToolbarItemDelete_Click" />
			<toolbar:ToolbarItem ID="c_toolbarItemCut" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconCut" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/MediaArchive/Images/transparent.gif" runat="server"/><%--OnClick="ToolbarItemCut_Click"--%>
			<toolbar:ToolbarItem ID="c_toolbarItemCopy" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconCopy" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/MediaArchive/Images/transparent.gif" runat="server"/><%--OnClick="ToolbarItemCopy_Click"--%>
			<toolbar:ToolbarItem ID="c_toolbarItemPaste" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPaste" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/MediaArchive/Images/transparent.gif" runat="server"/><%--OnClick="ToolbarItemPaste_Click"--%>
			</toolbar:HorizontalToolbar>
	</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" class="litIconDocumentFind2" alt="" />
	<Foundation:ModuleString ID="ModuleString1" Name="SearchResultHeader" Runat="server"/>
	<asp:Label runat="server" ID="c_labelHeader" />
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentRight" Runat="Server">
	<Telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
		<script language="javascript" type="text/javascript">
			//Buttons
			//1_0 - View
			//1_1 - Edit
			//1_2 - Delete
			//1_3 - Copy
			//1_4 - Paste
			//1_5 - Cut
			
			var selectedOrderCount = 0;
			var cancelDeselect = false;
			var cancelSelect = false;
			function SelectAllClick(sender) {
				if (sender.checked) {
					SelectAll();
				}
				else {
					ClearSelected();
				}
			}
			function SelectAll() {
				var tableView = $find("<%= m_maSearch.ClientID %>").get_masterTableView();
				tableView.clearSelectedItems();
				cancelDeselect = true;
				tableView.selectAllItems();
				PageMethods.SelectAll(callMethod_Success, callMethod_Failure);
				cancelDeselect = false;
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = true;
			}
			function ClearSelected() {
				var tableView = $find("<%= m_maSearch.ClientID %>").get_masterTableView();
				cancelSelect = true;
				tableView.clearSelectedItems();
				if (tableView.get_selectedItems().length > 0)
					tableView.selectAllItems();
				cancelSelect = false;
				PageMethods.DeselectAll(callMethod_Success, callMethod_Failure);
				toolbarItemAction("disable", "1_0,1_1,1_2,1_3,1_4,1_5");
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = false;
			}
			function RowSelecting(sender, args, gridHelper) {
				if (args._domEvent.type != null) {
					SetToolbarActive(args._dataKeyValues.ID, gridHelper, true)
				}
				else {
					if (cancelSelect)
						args.set_cancel(true);
				}
			}
			function RowDeselecting(sender, args, gridHelper) {
				if (args._domEvent.type != null) {
					SetToolbarActive(args._dataKeyValues.ID, gridHelper, false)
				}
				else {
					if (cancelDeselect) {
						args.set_cancel(true);
					}
				}
			}
			function RowDeselected(sender, args, gridHelper) {
				if ($get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked)
					$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = false;
			}
			function SetToolbarActive(ids, gridHelper, selected) {
				var items = gridHelper.GetSelectedKeys();
				PageMethods.IsButtonEnabled(ids, selected, callMethod_Success, callMethod_Failure);
			}
			function callMethod_Success(results, userContext, methodName) {
				var buttonsEnable = new Array();
				buttonsEnable = results.split('|');
				
				// View.
				if (buttonsEnable[0] === 'True') {
					toolbarItemAction("activate", "1_0");
				}
				else {
					toolbarItemAction("disable", "1_0");
				}
				// Edit.
				if (buttonsEnable[1] === 'True') {
					toolbarItemAction("activate", "1_1");
				}
				else {
					toolbarItemAction("disable", "1_1");
				}

				// Delete.
				if (buttonsEnable[2] === 'True') {
					toolbarItemAction("activate", "1_2");
				}
				else {
					toolbarItemAction("disable", "1_2");
				}
			
				// Copy.
				if (buttonsEnable[3] === 'True') {
					//toolbarItemAction("activate", "1_3");
				}
				else {
					toolbarItemAction("disable", "1_3");
				}
				// Cut.
				if (buttonsEnable[4] === 'True') {
					//toolbarItemAction("activate", "1_5");
				}
				else {
					toolbarItemAction("disable", "1_5");
				}
				// define that is folder.
				$("#<%= c_hiddenFieldIsFolder.ClientID %>").val(buttonsEnable[6]);
				
				// set Selected Item Id.
				$("#<%= c_hiddenFieldSelectedItemId.ClientID %>").val(buttonsEnable[7]);

				var isFolder = $("#<%= c_hiddenFieldIsFolder.ClientID %>").val();
				var id = $("#<%= c_hiddenFieldSelectedItemId.ClientID %>").val();
				
				// Select 'SelectAll' CheckBox.
				selectedOrderCount = parseInt(buttonsEnable[5]);
				var selectedOrderCount1 = $find("<%= m_maSearch.ClientID %>").get_masterTableView()._virtualItemCount;
				
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = selectedOrderCount == $find("<%= m_maSearch.ClientID %>").get_masterTableView()._virtualItemCount;
			}

			function show_Delete_Message() {
			
				var isFolder = $("#<%= c_hiddenFieldIsFolder.ClientID %>").val();
				var id = $("#<%= c_hiddenFieldSelectedItemId.ClientID %>").val();

				if (isFolder === "True") {
					OpenDeleteDialog('<%=m_currentModule.Strings.GetValue(ModuleStringConstants.TOOLBAR_DELETE_FOLDER_IMAGES, FoundationContext.LanguageID, true) %>', '', id, '<%=UrlConstants.SEARCH_RESULT2 %>', '1', '');
					return false;
				}
				else if (isFolder === "False") {
					OpenDeleteDialog('<%=m_currentModule.Strings.GetValue(ModuleStringConstants.TOOLBAR_DELETE_IMAGE_VERSIONS, FoundationContext.LanguageID, true) %>', '', id, '<%= UrlConstants.SEARCH_RESULT2 %>', '0', '');
					return false;
				}
				else if (isFolder === "") {
					var result = confirm('<%=m_currentModule.Strings.GetValue(ModuleStringConstants.CONFIRMATION_DELETE_FOLDERS_AND_FILES, FoundationContext.LanguageID, true) %>' + 'test');
					return result;
				}
				return false;
			}
			  
			function callMethod_Failure(errors, userContext, methodName) {
				alert(errors.get_message());
			}
			function HeaderShowing(sender, args) {
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = selectedOrderCount == $find("<%= m_maSearch.ClientID %>").get_masterTableView()._virtualItemCount;
			}
		</script>
	</Telerik:RadCodeBlock>
	<div class="lsContentNoScroll">
	<LS:GridHelperAjax runat="server" ID="m_maSearchHelper" AssociatedControlID="m_maSearch" OnNeedData="GetData" DataKeyName="ID"/>
	<Telerik:RadGrid runat="server" ID="m_maSearch" AllowMultiRowSelection="true"  OnItemDataBound="m_maSearch_ItemDataBound"  OnPageIndexChanged="GridPageIndexChanged" >
		<ClientSettings>
			<ClientEvents OnRowCreating="HeaderShowing" OnRowSelecting="RowSelecting" OnRowDeselecting="RowDeselecting" OnRowDeselected="RowDeselected" />
			<Selecting allowrowselect="True" />
		</ClientSettings>
		<MasterTableView runat="server">
			<Columns>
				<Telerik:GridBoundColumn UniqueName="ID" DataField="ID" Visible="false"/>
				<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn"  HeaderStyle-Width="25"/>
				<Telerik:GridImageColumn DataImageUrlFields="IconImageUrl" DataImageUrlFormatString="{0}" ImageWidth="16px" ImageHeight="16px"/>
				<Telerik:GridBoundColumn DataField="Name" />				
				<Telerik:GridBoundColumn DataField="FileName" />				
				<Telerik:GridBoundColumn UniqueName="TypeName" DataField="TypeName" />
				<Telerik:GridBoundColumn DataField="FolderPath" />
				<Telerik:GridHyperLinkColumn UniqueName="DownloadPath"
				    DataNavigateUrlFormatString="{0}" DataNavigateUrlFields="DownloadPath"
				    Text="&lt;img class='litIconDownload' src='Images/transparent.gif' &gt;" HeaderStyle-Width="25px" ItemStyle-Width="25px"/>
				<Telerik:GridHyperLinkColumn UniqueName="EditUrl" DataNavigateUrlFormatString="{0}"
				    DataNavigateUrlFields="EditUrl" Text="&lt;img class='litIconPencil'
				    src='Images/transparent.gif' &gt;" HeaderStyle-Width="25px" ItemStyle-Width="25px"/>
				<Telerik:GridHyperLinkColumn UniqueName="ViewUrl" DataNavigateUrlFormatString="{0}"
				    DataNavigateUrlFields="ViewUrl" Text="&lt;img class='litIconNavRightBlue'
				    src='Images/transparent.gif' &gt;" HeaderStyle-Width="25px" ItemStyle-Width="25px"/>
			</Columns>
		</MasterTableView>
	</Telerik:RadGrid>
	</div>
	<asp:HiddenField ID="c_hiddenSelectAllClientID" value="" runat="server" />
	<asp:HiddenField ID="c_hiddenFieldIsFolder" value="" runat="server" />
	<asp:HiddenField ID="c_hiddenFieldSelectedItemId" value="" runat="server" />
			
</asp:Content>

