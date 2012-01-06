<%@ page language="C#" masterpagefile="~/LitiumStudio/Newsletter/Framework/Base1.master" inherits="LitiumStudio_Newsletter_AddressLists, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/Newsletter/Framework/Base1.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<asp:PlaceHolder runat="server" Visible="False" ID="mc_refreshTag">
		<meta http-equiv="refresh" content="5" />
	</asp:PlaceHolder>

	<script type="text/javascript">
	    var selectedItems;
		// Shows confirmation dialogs and progress bar for actions of toolbar belonging to edit area.

		// Export
		function Export() 
		{
            //var selectedItems = m_circularHelper.GetSelectedKeys();
            if(selectedItems.length > 0)
            {
                var selectedItem = selectedItems[0];
	            window.open("AddressListsExport.aspx?FF_SelectedItemID=" + selectedItem + "&AddressListType=Email"); 
            }
		}
	</script>

	<ComponentArt:ToolBar ID="c_toolBar" AutoPostBackOnSelect="true" OnItemCommand="ToolBar_ItemCommand"
		runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"		
		DefaultItemDisabledCssClass="litToolbarItemDisabledCA" ImagesBaseUrl="~/LitiumStudio/Images/"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16">
		<Items runat="server">			
			<ComponentArt:ToolBarItem ID="c_synchronization" runat="server" ImageUrl="icons_standard/document_exchange_16px.png"
				ItemType="DropDown" DropDownId="c_syncSubMenu" DropDownImageUrl="toolbar/dropdown.gif"
				DropDownImageWidth="16" DropDownImageHeight="16" ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate"/>
			<ComponentArt:ToolBarItem ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif" ImageHeight="16"
				ImageWidth="2" ID="c_synchronizationSeparator" runat="server" />			
			<ComponentArt:ToolBarItem ID="c_toolbarItemRefresh" runat="server"
			    ImageUrl="icons_standard/refresh_16px.png"   ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif" ImageHeight="16"
				ImageWidth="2"/>
			<ComponentArt:ToolBarItem ID="c_toolbarItemExport" runat="server" ImageUrl="icons_standard/export.png"
				ClientSideCommand="Export()"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
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
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_dropDownImageUrl() ##" alt="" style="display: block;"/>
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
	<ComponentArt:Menu runat="server" ID="c_syncSubMenu" OnItemSelected="c_syncSubMenu_OnItemSelected"
		ImagesBaseUrl="~/LitiumStudio/Images/" CssClass="litNavMenuGroup" DefaultItemLookId="DefaultItemLook"
		DefaultGroupItemSpacing="1" DefaultItemTextAlign="Left" DefaultItemTextWrap="false"
		DefaultGroupExpandOffsetX="0" DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto"
		TopGroupExpandDirection="BelowLeft" TopGroupExpandOffsetY="0" CollapseDuration="100"
		CollapseSlide="ExponentialDecelerate" ExpandDuration="100" ExpandSlide="ExponentialDecelerate"
		ExpandDelay="0" ExpandOnClick="false" CascadeCollapse="true" CollapseDelay="10000"
		HideSelectElements="false" HighlightExpandedPath="true" KeyboardEnabled="true"
		OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true" ShadowOffset="2"
		Orientation="Vertical" ContextMenu="Custom">
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
			<ComponentArt:MenuItem ID="c_syncGroups" Look-LeftIconUrl="" AutoPostBackOnSelect="true" />
			<ComponentArt:MenuItem ID="c_syncOrgs" Look-LeftIconUrl="" AutoPostBackOnSelect="true" />
		</Items>
	</ComponentArt:Menu>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" style="vertical-align: middle; margin-right: 5px;"
		class="litIconCircularAddressLists" alt="" /><span><Foundation:ModuleString runat="server"
			Name="AddressLists" />
		</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">

	<script type="text/javascript">
	    function RowSelected(sender, args, gridHelper) {
	        setCommonToolbarButtonEnabled('c_toolbarItemView', true);
	        setCommonToolbarButtonEnabled('c_toolbarItemEdit', true);
	        setCommonToolbarButtonEnabled('c_toolbarItemDelete', true);			
			c_toolBar.get_items().getItemById("c_synchronization").set_enabled(true);
			c_toolBar.get_items().getItemById("c_toolbarItemExport").set_enabled(true);
			selectedItems = gridHelper.GetSelectedKeys();
		}
		function RowDeselected(sender, args) {
		    setCommonToolbarButtonEnabled('c_toolbarItemView', false);
		    setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
		    setCommonToolbarButtonEnabled('c_toolbarItemDelete', false);
			c_toolBar.get_items().getItemById("c_synchronization").set_enabled(false);
			c_toolBar.get_items().getItemById("c_toolbarItemExport").set_enabled(false);
		}
	</script>

	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_circular" ID="m_circularHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid runat="server" ID="m_circular">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="Name" />
					<Telerik:GridBoundColumn DataField="NumberOfRecipients" HeaderStyle-Width="140px" />
					<Telerik:GridBoundColumn DataField="LastRegistered" HeaderStyle-Width="130px" />
					<Telerik:GridBoundColumn DataField="ImportStatus" HeaderStyle-Width="120px" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>
