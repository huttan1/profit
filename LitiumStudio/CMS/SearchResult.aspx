<%@ page title="" language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_SearchResult, Litum.Studio.Web" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" Runat="Server">
	<div id="divToollbar" runat="server" style="padding-left: 5px; float: left;">
		<ComponentArt:ToolBar 
			ID="c_toolbarRight" 
			AutoPostBackOnSelect="true" 
			runat="server"
			CssClass="litToolbar"
		    DefaultItemCssClass="litToolbarItemNew"
		    DefaultItemHoverCssClass="litToolbarItemOnMouseOver"
		    DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		    DefaultItemDisabledCssClass="litToolbarItemDisabled"
		    DefaultItemExpandedCssClass="litToolbarItemOnMouseDown"
			ImagesBaseUrl="~/LitiumStudio/Images/"
			ItemSpacing="0" 
			UseFadeEffect="false"
			Orientation="Horizontal"
			DefaultItemImageWidth="16"
			DefaultItemImageHeight="16"
			OnItemCommand="ToolBarLeftTree_ItemCommand">
			<Items>			    
				<ComponentArt:ToolBarItem ID="Edit" ImageUrl="icons_standard/pencil.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
			    <ComponentArt:ToolBarItem ID="Garbage" ImageUrl="icons_standard/garbage_empty.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
                <ComponentArt:ToolBarItem ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif" ImageHeight="16" ImageWidth="1" />
                <ComponentArt:ToolBarItem ID="Cut" ImageUrl="icons_standard/cut.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
                <ComponentArt:ToolBarItem ID="Copy" ImageUrl="icons_standard/copy.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
                <ComponentArt:ToolBarItem ID="CopyRecursively" ImageUrl="icons_standard/copy_recursively_16px.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
                <ComponentArt:ToolBarItem ID="Paste" ImageUrl="icons_standard/clipboard.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
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
			    <ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemDropDownTemplate">
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
	</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
	<img src="Images/transparent.gif" class="litIconDocumentFind2" alt="" />
	<Foundation:ModuleString ID="ModuleString1" Name="SearchResult" Runat="server" />
	<asp:Label runat="server" ID="c_labelHeader" />
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentRight" Runat="Server">
	<Telerik:RadCodeBlock runat="server">
		<script language="javascript" type="text/javascript">
			var selectedItemCount = 0;
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
				var tableView = $find("<%= m_cmsSearch.ClientID %>").get_masterTableView();
				tableView.clearSelectedItems();
				cancelDeselect = true;
				tableView.selectAllItems();
				PageMethods.SelectAll(callMethod_Success, callMethod_Failure);
				cancelDeselect = false;
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = true;
			}
			function ClearSelected() {
				var tableView = $find("<%= m_cmsSearch.ClientID %>").get_masterTableView();
				cancelSelect = true;
				tableView.clearSelectedItems();
				if (tableView.get_selectedItems().length > 0)
					tableView.selectAllItems();
				cancelSelect = false;
				PageMethods.DeselectAll(callMethod_Success, callMethod_Failure);
				setToolbarButtonEnabled(false, 'Edit|Garbage|Cut|Copy|CopyRecursively|Paste');
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = false;
			}
			function RowSelecting(sender, args, gridHelper) {
				if (args._domEvent.type != null) {
					SetToolbarActive(args._dataKeyValues.ID, true)
				}
				else {
					if (cancelSelect)
						args.set_cancel(true);
				}
			}
			function RowDeselecting(sender, args, gridHelper) {
				if (args._domEvent.type != null) {
					SetToolbarActive(args._dataKeyValues.ID, false)
				}
				else {
					if (cancelDeselect) {
						args.set_cancel(true);
					}
				}
			}
			function SetToolbarActive(ids, selected) {
				PageMethods.IsButtonEnabled(ids, selected, callMethod_Success, callMethod_Failure);
			}
			function callMethod_Success(results, userContext, methodName) {
				var buttonsEnable = new Array();
				buttonsEnable = results.split('|');
				// Edit.
				if (buttonsEnable[0] === 'True') {
					setToolbarButtonEnabled(true, 'Edit');
				}
				else {
					setToolbarButtonEnabled(false, 'Edit');
				}
				// Trashcan.
				if (buttonsEnable[1] === 'True') {
					setToolbarButtonEnabled(true, 'Garbage');
				}
				else {
					setToolbarButtonEnabled(false, 'Garbage');
				}
				// Cut.
				if (buttonsEnable[2] === 'True') {
					setToolbarButtonEnabled(true, 'Cut');
				}
				else {
					setToolbarButtonEnabled(false, 'Cut');
				}
				// Copy.
				if (buttonsEnable[3] === 'True') {
					//setToolbarButtonEnabled(true, 'Copy');
				}
				else {
					setToolbarButtonEnabled(false, 'Copy');
				}
				// CopyWithSubPages.
				if (buttonsEnable[4] === 'True') {
					//setToolbarButtonEnabled(true, 'CopyRecursively');
				}
				else {
					setToolbarButtonEnabled(false, 'CopyRecursively');
				}
				// Select 'SelectAll' CheckBox.
				selectedItemCount = parseInt(buttonsEnable[5]);
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = selectedItemCount == $find("<%= m_cmsSearch.ClientID %>").get_masterTableView()._virtualItemCount;
			}
			function callMethod_Failure(errors, userContext, methodName) {
				alert(errors.get_message());
			}
			function setToolbarButtonEnabled(enabled, ids) {
				var idsArr = ids.split("|");
				for (i = 0; i < idsArr.length; i++) {
					c_toolbarRight.get_items().getItemById(idsArr[i]).set_enabled(enabled);
				}
			}
			function RowDeselected(sender, args, gridHelper) {
				if ($get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked)
					$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = false;
			}
			function HeaderShowing(sender, args) {
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = selectedItemCount == $find("<%= m_cmsSearch.ClientID %>").get_masterTableView()._virtualItemCount;
			}
		</script>
	</Telerik:RadCodeBlock>

	<LS:GridHelperAjax runat="server" ID="m_cmsSearchHelper" AssociatedControlID="m_cmsSearch" OnNeedData="GetData" DataKeyName="ID" />
	<Telerik:RadGrid runat="server" ID="m_cmsSearch" AllowMultiRowSelection="true" OnItemCreated="GridItemCreated" OnPageIndexChanged="GridPageIndexChanged" OnSortCommand="GridSort">
		<ClientSettings>
			<ClientEvents OnRowCreating="HeaderShowing" OnRowSelecting="RowSelecting" OnRowDeselecting="RowDeselecting" OnRowDeselected="RowDeselected" />
			<Selecting allowrowselect="True" />
		</ClientSettings>
		<MasterTableView runat="server">
			<Columns>
				<Telerik:GridBoundColumn UniqueName="ID" DataField="ID" Visible="false" />
				<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="5%" ItemStyle-Width="5%" />
				<Telerik:GridImageColumn DataImageUrlFields="IconImageUrl" DataImageUrlFormatString="{0}" HeaderStyle-Width="5%" ItemStyle-Width="5%" />
				<Telerik:GridBoundColumn DataField="Name" HeaderStyle-Width="10%" ItemStyle-Width="10%" />
				<Telerik:GridBoundColumn UniqueName="TypeName" DataField="TypeName" HeaderStyle-Width="10%" ItemStyle-Width="10%" />
				<Telerik:GridBoundColumn DataField="Path" HeaderStyle-Width="20%" ItemStyle-Width="20%" />
				<Telerik:GridBoundColumn DataField="CreatedDateString" HeaderStyle-Width="10%" ItemStyle-Width="10%" />
				<Telerik:GridBoundColumn DataField="AuthorUserName" HeaderStyle-Width="10%" ItemStyle-Width="10%" />	
				<Telerik:GridTemplateColumn HeaderStyle-Width="5%" ItemStyle-Width="5%">
				<ItemTemplate>
				<a href="<%#ResolveUrl("" + Eval("EditUrl")) %>"><%#Eval("EditUrlText") %></a>
				</ItemTemplate>
				</Telerik:GridTemplateColumn>			
				<Telerik:GridHyperLinkColumn DataNavigateUrlFormatString="{0}" DataNavigateUrlFields="ViewUrl" Text="&lt;img class='litIconNavRightBlue' src='Images/transparent.gif' &gt;" HeaderStyle-Width="5%" ItemStyle-Width="5%" />
				<Telerik:GridBoundColumn UniqueName="EditUrl" DataField="EditUrl" Visible="false" />
				<Telerik:GridBoundColumn UniqueName="ViewUrl" DataField="ViewUrl" Visible="false" />
			</Columns>
		</MasterTableView>
	</Telerik:RadGrid>
	<asp:HiddenField ID="c_hiddenSelectAllClientID" value="" runat="server" />
</asp:Content>