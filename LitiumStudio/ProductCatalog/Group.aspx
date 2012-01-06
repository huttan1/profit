<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_Group, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">

	<ComponentArt:ToolBar ID="ToolBar1" AutoPostBackOnSelect="true" OnItemCommand="ToolBar_ItemCommand"
		runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16" EnableViewState="false"
		DefaultItemImageHeight="16">
		<Items>			
			<ComponentArt:ToolBarItem ID="Relations" ImageUrl="icons_standard/assign_add.png"
			    ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="SeperatorRelations" ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif"
				ImageHeight="16" ImageWidth="2" />
			<ComponentArt:ToolBarItem ID="Publish" ImageUrl="icons_standard/ok.png" ItemType="DropDown"
				DropDownId="PublishMenu" DropDownImageUrl="toolbar/dropdown.gif" DropDownImageWidth="16"
				DropDownImageHeight="16" ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate"/>
			<ComponentArt:ToolBarItem ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif" ImageHeight="16"
				ImageWidth="2" />
			<ComponentArt:ToolBarItem ID="PriceAgents" ImageUrl="icons_standard/document_pinned_16px.png"
				ItemType="DropDown" DropDownId="PriceAgentsMenu" DropDownImageUrl="toolbar/dropdown.gif"
				DropDownImageWidth="16" DropDownImageHeight="16"  ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate"/>
			<ComponentArt:ToolBarItem ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif" ImageHeight="16"
				ImageWidth="2" ID="PriceAgentsSeparator" runat="server" />
			<ComponentArt:ToolBarItem ID="Export" ImageUrl="icons_standard/export.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="SeperatorExport" ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif"
				ImageHeight="16" ImageWidth="2" />
			<ComponentArt:ToolBarItem ID="FolderUp" ImageUrl="icons_standard/folder_up.png"
			    ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif" ImageHeight="16"
				ImageWidth="2" />
			<ComponentArt:ToolBarItem ID="EditSortOrder" ImageUrl="icons_standard/sort_az_descending.png"
			    ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
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
	<ComponentArt:Menu runat="server" ID="PriceAgentsMenu" DefaultDisabledItemLookId="DisabledItemLook" EnableViewState="false"
		OnItemSelected="PriceAgentsMenu_OnItemSelected" ImagesBaseUrl="~/LitiumStudio/Images/"
		CssClass="litNavMenuGroup" DefaultItemLookId="DefaultItemLook" DefaultGroupItemSpacing="1"
		DefaultItemTextAlign="Left" DefaultItemTextWrap="false" DefaultGroupExpandOffsetX="0"
		DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto" TopGroupExpandDirection="BelowLeft"
		TopGroupExpandOffsetY="0" CollapseDuration="100" CollapseSlide="ExponentialDecelerate"
		ExpandDuration="100" ExpandSlide="ExponentialDecelerate" ExpandDelay="0" ExpandOnClick="false"
		CascadeCollapse="true" CollapseDelay="10000" HideSelectElements="false" HighlightExpandedPath="true"
		KeyboardEnabled="true" OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true"
		ShadowOffset="2" Orientation="Vertical" ContextMenu="Custom">
		<ItemLooks>
			<ComponentArt:ItemLook LookId="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16"
				CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive"
				HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10"
				LabelPaddingRight="10" LabelPaddingTop="3" />
			<ComponentArt:ItemLook LookId="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16"
				CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10"
				LabelPaddingRight="10" LabelPaddingTop="3" />
		</ItemLooks>
		<Items>
			<ComponentArt:MenuItem ID="Add" Look-LeftIconUrl="icons_standard/document_pinned_over_16px.png"
				DisabledLook-LeftIconUrl="icons_standard_disabled/document_pinned_over_16px.png" AutoPostBackOnSelect="true" />
			<ComponentArt:MenuItem ID="AddSelected" Look-LeftIconUrl="icons_standard/document_pinned_over_16px.png"
				DisabledLook-LeftIconUrl="icons_standard_disabled/document_pinned_over_16px.png" AutoPostBackOnSelect="true" />
			<ComponentArt:MenuItem ID="Remove" Look-LeftIconUrl="icons_standard/document_pinned_delete_16px.png"
				DisabledLook-LeftIconUrl="icons_standard_disabled/document_pinned_delete_16px.png" AutoPostBackOnSelect="true" />
			<ComponentArt:MenuItem ID="RemoveSelected" Look-LeftIconUrl="icons_standard/document_pinned_delete_16px.png"
				DisabledLook-LeftIconUrl="icons_standard_disabled/document_pinned_delete_16px.png" AutoPostBackOnSelect="true" />
		</Items>
	</ComponentArt:Menu>
	<ComponentArt:Menu runat="server" ID="PublishMenu" DefaultDisabledItemLookId="DisabledItemLook" EnableViewState="false"
		OnItemSelected="PublishMenu_OnItemSelected" ImagesBaseUrl="~/LitiumStudio/Images/"
		CssClass="litNavMenuGroup" DefaultItemLookId="DefaultItemLook" DefaultGroupItemSpacing="1"
		DefaultItemTextAlign="Left" DefaultItemTextWrap="false" DefaultGroupExpandOffsetX="0"
		DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto" TopGroupExpandDirection="BelowLeft"
		TopGroupExpandOffsetY="0" CollapseDuration="100" CollapseSlide="ExponentialDecelerate"
		ExpandDuration="100" ExpandSlide="ExponentialDecelerate" ExpandDelay="0" ExpandOnClick="false"
		CascadeCollapse="true" CollapseDelay="10000" HideSelectElements="false" HighlightExpandedPath="true"
		KeyboardEnabled="true" OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true"
		ShadowOffset="2" Orientation="Vertical" ContextMenu="Custom">
		<ItemLooks>
			<ComponentArt:ItemLook LookId="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16"
				CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive"
				HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10"
				LabelPaddingRight="10" LabelPaddingTop="3" />
			<ComponentArt:ItemLook LookId="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16"
				CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10"
				LabelPaddingRight="10" LabelPaddingTop="3" />
		</ItemLooks>
		<Items>
			<ComponentArt:MenuItem ID="PublishSelected" Look-LeftIconUrl="icons_standard/ok.png"
				DisabledLook-LeftIconUrl="icons_standard_disabled/ok.png" AutoPostBackOnSelect="true" />
			<ComponentArt:MenuItem ID="PublishProductGroup" Look-LeftIconUrl="icons_standard/ok.png"
				DisabledLook-LeftIconUrl="icons_standard_disabled/ok.png" AutoPostBackOnSelect="true" />
			<ComponentArt:MenuItem ID="PublishAll" Look-LeftIconUrl="icons_standard/ok.png"
				DisabledLook-LeftIconUrl="icons_standard_disabled/ok.png" AutoPostBackOnSelect="true" />
			<ComponentArt:MenuItem ID="UnpublishSelected" Look-LeftIconUrl="icons_standard/unpublish_16px.png"
				DisabledLook-LeftIconUrl="icons_standard_disabled/unpublish_16px.png" AutoPostBackOnSelect="true" />
			<ComponentArt:MenuItem ID="UnpublishAll" Look-LeftIconUrl="icons_standard/unpublish_16px.png"
				DisabledLook-LeftIconUrl="icons_standard_disabled/unpublish_16px.png" AutoPostBackOnSelect="true" />
		</Items>
	</ComponentArt:Menu>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<asp:Image runat="server" ImageUrl="Images/transparent.gif" AlternateText="" ID="c_headerimage" /><asp:Label
		runat="server" ID="c_headername" />
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="LitiumStudioFilterArea">
	<LS:FilterAreaSetting ID="FilterAreaSetting1" runat="server" FilterAreaState="AlwaysOpen" NoMargin="True" />
	<div style="max-height: 200px; overflow-y:auto; border-top-width: 1px; border-top-style: solid;" class="borderColor">
		<table border="0" cellspacing="0" cellpadding="0" class="litProductList" width="100%">
			<tr>
				<th runat="server" class="litProductListProduct" style="width: 15%; height: 110px; background: #F9F9F9;" id="c_thCell" valign="top">
					<div style="height: 110px; width: 150px; text-align: center;">
						<asp:Image ID="c_displayImage" runat="server" CssClass="litImageBorderSpace" />
					</div>
				</th>
				<th  class="litProductListDetails" style="font-size: 13px; width: 85%; vertical-align: top; padding-left: 15px;border-left: 1px solid #CFCDCC; background: #F9F9F9;" colspan="3">
					<div style="float: right; margin-top: 0px;">
						<asp:ListBox ID="c_langaugeListbox" runat="server" CssClass="litInputSelect" Style="width: auto;"
							Rows="1" AutoPostBack="true" OnSelectedIndexChanged="LanguageListbox_OnSelectedIndexChanged" />
					</div>
					<asp:Repeater runat="server" ID="c_propertiesRepeater" OnItemDataBound="PropertiesRepeaterDataBound">
						<ItemTemplate>
							<div class="litParagraphText">
								<b>
									<asp:Label ID="c_propertyLabel" runat="server" />:</b>
								<asp:Label ID="c_propertyValue" runat="server" Visible="false" CssClass="propertyItem"/><asp:Image ID="c_propertyImage"
									runat="server" Visible="false" Style="vertical-align: middle;" CssClass="propertyItem"/>
								<asp:HyperLink ID="c_propertyLink" runat="server" Visible="false" CssClass="propertyItem"/>
							</div>
						</ItemTemplate>
					</asp:Repeater>

					<asp:Repeater runat="server" ID="c_publishedOnPages">
						<HeaderTemplate>
							<br />
                            <b><Foundation:ModuleString ID="ModuleString1" runat="server" Name="ProductGroupPublishedOnPlaces" CssClass="litParagraphText" /></b>
							<div class="litParagraphText">
						</HeaderTemplate>
						<ItemTemplate>
							<a href="<%# Container.DataItem%>" target="_blank"><%# Container.DataItem%></a>
						</ItemTemplate>
						<SeparatorTemplate>
							<br />
						</SeparatorTemplate>
						<FooterTemplate>
							</div>
						</FooterTemplate>
					</asp:Repeater>
				</th>
			</tr>
		</table>
	</div>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentRight" runat="server">
<Telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
<script type="text/javascript">
	//<![CDATA[
	var cancelDeselect = false;
	var cancelSelect = false;
	var selectedItemsCount = 0;

	function RowSelecting(sender, args, gridHelper) {
		if (args._domEvent.type != null) {
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
		$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = selectedItemsCount == $find("<%= c_productItemsGrid.ClientID %>").get_masterTableView()._virtualItemCount;
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
		var tableView = $find("<%= c_productItemsGrid.ClientID %>").get_masterTableView();
		tableView.clearSelectedItems();
		cancelDeselect = true;
		tableView.selectAllItems();
		PageMethods.SelectAllItems(callMethod_Success, callMethod_Failure);
		cancelDeselect = false;
		$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = true;
	}

	function ClearSelection() {
		var tableView = $find("<%= c_productItemsGrid.ClientID %>").get_masterTableView();
		cancelSelect = true;
		tableView.clearSelectedItems();
		if (tableView.get_selectedItems().length > 0)
			tableView.selectAllItems();
		cancelSelect = false;
		PageMethods.ClearSelection(callMethod_Success, callMethod_Failure);
		$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = false;
	}
	
	function callMethod_Success(results, userContext, methodName) {
		updateToolbar(results);
	}

	function callMethod_Failure(errors, userContext, methodName) {
		alert(errors.get_message());
	}

	function updateToolbar(results) {
	   		
		var res = new Array();
		res = results.split('|');

		selectedItemsCount = parseInt(res[0]);
		var canPublish = parseInt(res[1]) == 1;
		var containsVG = res[2];
		var canEdit = <%=Litium.Foundation.Modules.ProductCatalog.ModuleProductCatalog.Instance.PermissionManager.UserHasContentAllPermission(FoundationContext.Token.UserID,true,true).ToString().ToLower()%>;
		var hasRelationTypes = res[3];

		$get($get('<%=c_hiddenSelectAllClientID.ClientID%>').value).checked = selectedItemsCount == $find("<%=c_productItemsGrid.ClientID%>").get_masterTableView()._virtualItemCount && selectedItemsCount != 0;
		ToolBar1.beginUpdate();


		if (selectedItemsCount == 0) {
			setCommonToolbarButtonEnabled('c_toolbarItemView', false);
			setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
			setCommonToolbarButtonEnabled('c_toolbarItemDelete', false);
			ToolBar1.get_items().getItem(0).set_enabled(false);
			PublishMenu.get_items().getItem(0).set_enabled(false);
			PublishMenu.get_items().getItem(3).set_enabled(false);
			toolbarItemAction("disable", "0_0");
			toolbarItemAction("disable", "0_1");
		}
		else if (selectedItemsCount == 1) {
			setCommonToolbarButtonEnabled('c_toolbarItemEdit', canEdit);
			setCommonToolbarButtonEnabled('c_toolbarItemView', true);
			setCommonToolbarButtonEnabled('c_toolbarItemDelete', canEdit);
            
            ToolBar1.get_items().getItem(0).set_enabled(canEdit==1  && hasRelationTypes==1); 
			
            PublishMenu.get_items().getItem(0).set_enabled(canPublish);
			PublishMenu.get_items().getItem(3).set_enabled(canEdit);
			if(canEdit) 
			{
			    toolbarItemAction("activate", "0_0");
			    toolbarItemAction("activate", "0_1");
			}
		}
		else {
			setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
			setCommonToolbarButtonEnabled('c_toolbarItemView', false);
			setCommonToolbarButtonEnabled('c_toolbarItemDelete', canEdit);
			ToolBar1.get_items().getItem(0).set_enabled(false);
			PublishMenu.get_items().getItem(0).set_enabled(canPublish);
			PublishMenu.get_items().getItem(3).set_enabled(canEdit);
			if(canEdit) 
			{
			toolbarItemAction("activate", "0_0");
			toolbarItemAction("activate", "0_1");
			}
		}
		
		ToolBar1.endUpdate();
	}

	function RowDropped(sender, args) {
		ClearSelection();
	}

	//]]>

	</script>
	
		<% if (!c_productItemsGrid.ShowHeader){ %>
           <style>
               div.RadGrid_Default .rgHeaderDiv .rgMasterTable
                {
	                border-bottom: solid 0px #cfcdcc;
                }
           </style>
	    <% }%>
	</Telerik:RadScriptBlock>
	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="c_productItemsGrid" ID="c_productItemsGridHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid
			OnItemCreated="GridItemCreated"
			OnPageIndexChanged="GridPageIndexChanged" 
			OnSortCommand="GridSorted"   
			OnRowDrop="ProductItemsGrid_RowDrop"   
			AllowPaging="true" 
			AllowMultiRowSelection="true" 
			runat="server"
			ID="c_productItemsGrid">
			<ClientSettings  AllowRowsDragDrop="true"   >	
				<Selecting AllowRowSelect="true" />
				<Scrolling AllowScroll="true" />
				<Resizing AllowColumnResize="true" />
				<ClientEvents  OnRowDropping="onRowDropping" OnRowCreating="HeaderShowing" OnRowSelecting="RowSelecting" OnRowDeselecting="RowDeselecting" OnRowDeselected="RowDeselected" OnRowDropped="RowDropped" />
			</ClientSettings>
			<MasterTableView runat="server" ClientDataKeyNames="ID">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridImageColumn DataImageUrlFields="ImageUrl" ImageHeight="40px" ImageWidth="40px" DataImageUrlFormatString="{0}"
						DataType="System.String" HeaderStyle-Width="60" />
					<Telerik:GridBoundColumn DataField="Name" />
					<Telerik:GridBoundColumn DataField="ArticleNumber" />
					<Telerik:GridBoundColumn DataField="TypeName" />
					<Telerik:GridBoundColumn DataField="Remarks" />
					<Telerik:GridBoundColumn DataField="Published" />
					<Telerik:GridBoundColumn DataField="Status" />
					<Telerik:GridBoundColumn DataField="CanBeInPriceAgentsList" HeaderStyle-Width="100" />
					<Telerik:GridTemplateColumn DataField="Referer" HeaderStyle-Width="24px" >
					    <ItemTemplate>  
                              <asp:HyperLink runat="server" ID="EditButton" NavigateUrl='<%# Eval("EditUrl") %>' runat="server">
                                   <img ID="EditImage" class='litIconPencil' src='Images/transparent.gif' />
                              </asp:HyperLink>  
                         </ItemTemplate>
                     </Telerik:GridTemplateColumn>
					<Telerik:GridHyperLinkColumn DataNavigateUrlFormatString="{0}" DataNavigateUrlFields="ViewUrl" Text="&lt;img class='litIconNavRightBlue' src='Images/transparent.gif' &gt;" HeaderStyle-Width="24" />
					<Telerik:GridBoundColumn DataField="ID" Visible="false" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
		<asp:HiddenField ID="c_hiddenSelectAllClientID" value="" runat="server" />
	</div>
</asp:Content>
