<%@ page language="C#" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_PriceLists, Litum.Studio.Web" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>

<%@ Import Namespace="Litium.Studio.UI.ProductCatalog.Common.Constants" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">

	<ComponentArt:ToolBar ID="ListToolbar" AutoPostBackOnSelect="true" OnItemCommand="ToolBar_ItemCommand"
		runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16">
		<Items runat="server">
			<ComponentArt:ToolBarItem ID="Pricings" runat="server" ItemType="DropDown" DropDownId="PricingMenu"
				ImageUrl="icons_standard/barcode_16.png" Enabled="false" DropDownImageUrl="toolbar/dropdown.gif"
				DropDownImageWidth="16" DropDownImageHeight="16" ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate"/>
			<ComponentArt:ToolBarItem ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif" ImageHeight="16"
				ImageWidth="1" />
			<ComponentArt:ToolBarItem ID="Export" runat="server" ImageUrl="icons_standard/export.png"
				Enabled="false" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="Import" runat="server"
				ImageUrl="icons_standard/import.png" Enabled="false" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
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
	<ComponentArt:Menu runat="server" ID="PricingMenu" OnItemSelected="PricingMenu_OnItemSelected"
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
			<ComponentArt:ItemLook LookId="ExpandableItemLook" RightIconUrl="menu/arrow.gif"
				RightIconWidth="20" RightIconHeight="15" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded"
				ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4"
				LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3" />
			<ComponentArt:ItemLook LookId="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16"
				CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10"
				LabelPaddingRight="10" LabelPaddingTop="3" />
		</ItemLooks>
		<Items runat="server">
			<ComponentArt:MenuItem ID="PricedArticle" runat="server" AutoPostBackOnSelect="true" />
			<ComponentArt:MenuItem ID="PriceArticle" runat="server" AutoPostBackOnSelect="true" />
		</Items>
	</ComponentArt:Menu>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" height="16px" class="litIconBarcode" alt="" /><asp:Label
		ID="priceListBreadcrumb" Text="" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<Telerik:RadScriptBlock runat="server">

		<script type="text/javascript">
			function selectGridItem(sender, eventArgs) {
				ListToolbar.beginUpdate(); 
				setCommonToolbarButtonEnabled('c_toolbarItemView', true);
			    <%if (Master.WriteAccess){%>			   
					setCommonToolbarButtonEnabled('c_toolbarItemEdit', true);
					setCommonToolbarButtonEnabled('c_toolbarItemDelete', true);
			    <%}%>
			    
				ListToolbar.get_items().getItem(0).set_enabled(true);
				ListToolbar.get_items().getItem(2).set_enabled(true);
				ListToolbar.endUpdate();
			}
		</script>

	</Telerik:RadScriptBlock>
	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="c_priceGrid" ID="c_priceGridHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid AllowPaging="true" runat="server" ID="c_priceGrid">
			<ClientSettings>
				<Selecting AllowRowSelect="true" />
				<ClientEvents OnRowSelecting="selectGridItem" />
			</ClientSettings>
			<MasterTableView runat="server" ClientDataKeyNames="ID">
				<Columns>
					<Telerik:GridClientSelectColumn HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="Name" HeaderStyle-Width="100%" />
					<Telerik:GridBoundColumn DataField="ID" Display="false" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>
