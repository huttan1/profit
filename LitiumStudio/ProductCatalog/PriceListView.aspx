<%@ page language="C#" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_PriceListView, Litum.Studio.Web" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>

<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
    <ComponentArt:ToolBar ID="ToolBar1" AutoPostBackOnSelect="true" OnItemCommand="ToolBar_ItemCommand"
        runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
        DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
        DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
        ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
        DefaultItemImageHeight="16">
        <Items runat="server">
            <ComponentArt:ToolBarItem ID="Back" runat="server"
                ImageUrl="icons_standard/arrow_left_blue_16px.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif" ImageHeight="16"
                ImageWidth="1" />
            <ComponentArt:ToolBarItem ID="Pricings" runat="server" ItemType="DropDown" DropDownId="PricingMenu" ImageUrl="icons_standard/barcode_16.png"
                DropDownImageUrl="toolbar/dropdown.gif" DropDownImageWidth="16" DropDownImageHeight="16" ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate"/>
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
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <img src="Images/transparent.gif" class="litIconBarcode" alt="" /><asp:Label runat="server"
                ID="c_header" />    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
    <div class="lsContentScroll">
		<Foundation:InformationGroup runat="server" ID="c_informationGroup1" Width="300px" >
			<asp:Label runat="server" ID="c_name" Visible="false" />
			<table cellpadding="15" cellspacing="0" border="0" class="litModuleContentWithTreeMainSizeV2">
				<tr>
					<td valign="top">
						<div>
							<span class="litBoldHeader">
								<Foundation:SystemString ID="ModuleString1" Name="Active" runat="server" />:&nbsp;                   
							</span>
							<span class="litText">
								<asp:Label runat="server" ID="c_active" />
							</span>
						</div>
						<div style="padding-top: 10px;">
							<span class="litBoldHeader">
								<Foundation:ModuleString ID="ModuleString12" Name="PriceListCurrency" runat="server" />:&nbsp;                   
							</span>
							<span class="litText">
								<asp:Label runat="server" ID="c_currencyID" />
							</span>
						</div>
						<asp:Panel runat="server" ID="c_priceListDateInterval">
							<div style="padding-top: 10px;">
								<span class="litBoldHeader">
									<Foundation:ModuleString ID="PriceListDateIntervalLabel" Name="PriceListDateInterval" runat="server" />:&nbsp;
								</span>
								<span class="litText">
									<asp:Label runat="server" ID="c_validDate" />
								</span>
							</div>
						</asp:Panel>
						<asp:Panel runat="server" ID="c_priceListGroups">
							<div style="padding-top: 10px;">
								<span class="litBoldHeader">
									<Foundation:ModuleString ID="PriceListGroupsLabel" Name="PriceListGroups" runat="server" />:&nbsp;
								</span>
								<span class="litText">
									<asp:Label runat="server" ID="c_groupText" />
								</span>
							</div>
						</asp:Panel>
						<asp:Panel runat="server" ID="c_priceListOrganization">
							<div style="padding-top: 10px;">
								<span class="litBoldHeader">
									<Foundation:ModuleString ID="PriceListOrganizationLabel" Name="PriceListOrganization" runat="server" />:&nbsp;
								</span>
								<span class="litText">
									<asp:Label runat="server" ID="c_organizationText" />
								</span>
							</div>
						</asp:Panel>
						<asp:Panel runat="server" ID="c_priceListProductCatalog">
							<div style="padding-top: 10px;">
								<span class="litBoldHeader">
									<Foundation:ModuleString ID="ModuleString6" Name="PriceListProductCatalog" runat="server" />:&nbsp;
								</span>
								<span class="litText">
									<asp:Label runat="server" ID="c_productCatalogText" />
								</span>
							</div>
						</asp:Panel>
					</td>
				</tr>
			</table>
		</Foundation:InformationGroup>
    </div>
</asp:Content>
