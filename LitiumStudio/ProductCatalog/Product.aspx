<%@ page language="C#" description="~/LitiumStudio/Foundation/Framework/Base1.master" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_Product, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<ComponentArt:ToolBar ID="ToolBar1" EnableViewState="false" AutoPostBackOnSelect="true"
		OnItemCommand="ToolBar_ItemCommand" runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16">
		<Items runat="server">
			<ComponentArt:ToolBarItem ID="EditArticle" ImageUrl="icons_standard/pencil.png" />
			<ComponentArt:ToolBarItem ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif"
				ImageHeight="16" ImageWidth="2" />
			<ComponentArt:ToolBarItem ID="Relations" ImageUrl="icons_standard/assign_add.png" />
			<ComponentArt:ToolBarItem ID="SeperatorRelations" ItemType="Separator" CssClass=""
				ImageUrl="toolbar/break.gif" ImageHeight="16" ImageWidth="2" />
			<ComponentArt:ToolBarItem ID="Publish" ImageUrl="icons_standard/ok.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
			<ComponentArt:ToolBarItem ID="Unpublish" ImageUrl="icons_standard/unpublish_16px.png"
				ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
			<ComponentArt:ToolBarItem ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif"
				ImageHeight="16" ImageWidth="2" />
			<ComponentArt:ToolBarItem ID="PriceAgents" ImageUrl="icons_standard/document_pinned_16px.png"
				ItemType="DropDown" DropDownId="PriceAgentsMenu" DropDownImageUrl="toolbar/dropdown.gif"
				DropDownImageWidth="16" DropDownImageHeight="16" ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate" />
			<ComponentArt:ToolBarItem ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif"
				ImageHeight="16" ImageWidth="2" />
			<ComponentArt:ToolBarItem ID="Export" ImageUrl="icons_standard/export.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
			<ComponentArt:ToolBarItem ID="SeperatorExport" ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif"
				ImageHeight="16" ImageWidth="2" />
			<ComponentArt:ToolBarItem ID="FolderUp" ImageUrl="../ProductCatalog/images/folder_up.png"
				ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
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
	<ComponentArt:Menu EnableViewState="false" runat="server" ID="PriceAgentsMenu" DefaultDisabledItemLookId="DisabledItemLook"
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
			<ComponentArt:MenuItem ID="Remove" Look-LeftIconUrl="icons_standard/document_pinned_delete_16px.png"
				DisabledLook-LeftIconUrl="icons_standard_disabled/document_pinned_delete_16px.png" AutoPostBackOnSelect="true" />
		</Items>
	</ComponentArt:Menu>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<asp:Image runat="server" ImageUrl="Images/transparent.gif" ID="c_headerimage" />
	<span><Foundation:ModuleString ID="ModuleString1" Name="Product" runat="server" />:&nbsp;<asp:Label runat="server" ID="c_headername" /></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll" style="padding: 0px;">
		<div class="litListWithTreeWithTabAreaV2 ">
			<table border="0" cellspacing="0" cellpadding="0" class="litProductList" width="100%">
				<tr>
					<th class="litProductListProduct" style="width: 15%; background: #F9F9F9;">
						<asp:Image ID="c_displayImage" runat="server" CssClass="litImageBorderSpace" />
					</th>
					<th class="litProductListDetails" style="width: 85%; vertical-align: top; border-left: 1px solid #CFCDCC;
						background: #F9F9F9;">
						<div style="float: right; margin-top: 0px;">
							<asp:ListBox ID="c_langaugeListbox" runat="server" CssClass="litInputSelect" Style="width: auto;"
								Rows="1" AutoPostBack="true" OnSelectedIndexChanged="LanguageListbox_OnSelectedIndexChanged">
							</asp:ListBox>
						</div>
						<div runat="server" id="c_articleData">
							<div class="litParagraphText" runat="server" id="c_articleNumberPanel">
								<b><Foundation:ModuleString ID="ModuleString2" Name="ArticleNumber" runat="server" />:</b>&nbsp;<asp:Label ID="c_articleNumberLabel" runat="server" />
                             </div>
							<div class="litParagraphText" runat="server" id="Div1">
								<b><Foundation:ModuleString ID="ModuleString4" Name="Name" runat="server" /></b>:&nbsp;<asp:Label runat="server" ID="c_displayName" />
							</div>
							<div class="litParagraphText" runat="server" id="c_urlPanel" visible="false">
								<b><Foundation:ModuleString ID="ModuleString6" Name="UrlName" runat="server" />:</b>&nbsp;<asp:Label ID="c_urlLabel" runat="server" />
							</div>							
							<div class="litParagraphText" runat="server" id="c_publishPanel">
								<b><Foundation:ModuleString ID="ModuleString7" Name="Published" runat="server" />:</b>&nbsp;<asp:Label ID="c_publishedLabel" runat="server" /><asp:Image runat="server" ImageUrl="Images/transparent.gif" ID="c_publishedImage" />
							</div>
							<div class="litParagraphText" runat="server" id="Div4">
								<b><Foundation:ModuleString ID="ModuleString8" Name="PricedProduct" runat="server" />:</b>&nbsp;<asp:Label ID="c_priceLabel" runat="server" />
							</div>
						    <br />
							<asp:Repeater runat="server" ID="c_publishedOnPages">
								<HeaderTemplate>
                                    <b><Foundation:ModuleString ID="ModuleString1" runat="server" Name="ProductPublishedOnPlaces" CssClass="litParagraphText" /></b>
                        			<div class="litParagraphText">
								</HeaderTemplate>
								<ItemTemplate>
									<a href="<%# Container.DataItem%>" target="_blank" ><%# Container.DataItem%></a>
								</ItemTemplate>
								<SeparatorTemplate>
									<br />
								</SeparatorTemplate>
								<FooterTemplate>
                                    </div>
								</FooterTemplate>
							</asp:Repeater>
						</div>
					</th>
				</tr>
			</table>
			<table cellpadding="15" cellspacing="0" border="0" width="400" runat="server" id="c_tableProperty">
				<tr>
					<td valign="top">
						<div>
							<asp:Repeater runat="server" ID="c_propertiesRepeater" OnItemDataBound="PropertiesRepeaterDataBound">
								<ItemTemplate>
									<div class="litParagraphText" style="word-wrap: none;">
										<b>
											<asp:Label ID="c_propertyLabel" runat="server" />:</b>
										<asp:Label ID="c_propertyValue" runat="server" Visible="false" CssClass="propertyItem"/><asp:Image ID="c_propertyImage"
											runat="server" Visible="false" Style="vertical-align: middle;" CssClass="propertyItem"/>
										<asp:HyperLink ID="c_propertyLink" runat="server" Visible="false" CssClass="propertyItem"/>
									</div>
								</ItemTemplate>
							</asp:Repeater>
						</div>
					</td>
				</tr>
			</table>
		</div>
		
		<table cellpadding="0" cellspacing="0" class="priceListTbl" runat="server" id="c_tableBoxedArticle" visible="false" style="padding-left :0px;">
			<tr>
				<td valign="top">
					<asp:Repeater runat="server" ID="c_articleRepeater" OnItemDataBound="ArticlesRepeterItemBound">
						<HeaderTemplate>
							<table cellspacing="0" cellpadding="0" width="100%">
								<tr class="priceListTblHeader">
									<td align="left" class="priceListTblHeader" style="border-right: 0px;">
										<span style="font-size: 115%;">
										<asp:Label runat="server" ID="HeaderArticleLabel" />											
										</span>
									</td>
									<td align="left" class="priceListTblHeader" style="border-left: 0px;">
										&nbsp;
									</th>
								</tr>
						</HeaderTemplate>
						<ItemTemplate>
							<tr>
								<td class="priceListTblItem" width="50%">
									<asp:Label runat="server" ID="ArticleNameLabel" />
								</td>
								<td>
									<asp:HyperLink ID="ArticleLink" runat="server" />
								</td>
							</tr>
						</ItemTemplate>
						<FooterTemplate>
							</table>
						</FooterTemplate>
					</asp:Repeater>
				</td>
			</tr>
		</table>
		
		<table cellpadding="0" cellspacing="0" class="priceListTbl" runat="server" id="c_priceListTable" visible="false" style="padding-left :0px;">
            <tr>
                <td valign="top">
                    <asp:GridView runat="server" Width="100%" CellPadding="0" CellSpacing="0" ID="c_pricelist" CssClass="priceListTbl" AutoGenerateColumns="false" GridLines="Horizontal">
					    <Columns>
						    <asp:TemplateField HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem" HeaderStyle-Width="25%">
							    <HeaderTemplate>
								    <Foundation:ModuleString ID="ModuleString5" runat="server" Name="PriceList" />
							    </HeaderTemplate>
							    <ItemTemplate>
								    <%#Eval("Name") %>
								</ItemTemplate>
						    </asp:TemplateField>
						    <asp:TemplateField HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem" HeaderStyle-Width="25%">
							    <HeaderTemplate>
								    <Foundation:ModuleString ID="ModuleString6" runat="server" Name="PriceListCurrency" />
							    </HeaderTemplate>
							    <ItemTemplate>
								    <%#((Litium.Foundation.Currencies.Currency)Eval("Currency")).RegionInfo.CurrencyEnglishName%>
							    </ItemTemplate>
						    </asp:TemplateField>
						    <asp:TemplateField HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem" HeaderStyle-Width="15%">
							    <HeaderTemplate>
								    <Foundation:ModuleString ID="ModuleString7" runat="server" Name="Price" />
							    </HeaderTemplate>
							    <ItemTemplate>
								    <%#((Litium.Foundation.Currencies.Currency)Eval("Currency")).Format(((Litium.Foundation.Modules.ProductCatalog.PriceLists.PriceListArticleCollection)Eval("Articles")).Get(m_currentProduct.Item.ID).Price, false, FoundationContext.Culture)%>
							    </ItemTemplate>
						    </asp:TemplateField>
						    <asp:TemplateField HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem" HeaderStyle-Width="15%">
							    <HeaderTemplate>
								    <Foundation:ModuleString ID="ModuleString8" runat="server" Name="VAT" />
							    </HeaderTemplate>
							    <ItemTemplate>
								    <%#((Litium.Foundation.Modules.ProductCatalog.PriceLists.PriceListArticleCollection)Eval("Articles")).Get(m_currentProduct.Item.ID).VATPercentage.ToString("### ##0.##%")%>
							    </ItemTemplate>
						    </asp:TemplateField>
						     <asp:TemplateField HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem" HeaderStyle-Width="20%">
							    <HeaderTemplate>
								    <Foundation:ModuleString ID="ModuleString9" runat="server" Name="PriceWithVAT" />
							    </HeaderTemplate>
							    <ItemTemplate> 
								    <%#((Litium.Foundation.Currencies.Currency)Eval("Currency")).Format(((Litium.Foundation.Modules.ProductCatalog.PriceLists.PriceListArticleCollection)Eval("Articles")).Get(m_currentProduct.Item.ID).PriceWithVat, false, FoundationContext.Culture)%>
							    </ItemTemplate>
						    </asp:TemplateField>
					    </Columns>
				    </asp:GridView>
                </td>
            </tr>
		</table>
		<table cellspacing="0" cellpadding="0" class="priceListTbl" runat="server" id="c_warehouseTable" visible="false" style="padding-left :0px;">
			<tr>
				<td valign="top">
					<asp:GridView runat="server" CellPadding="0" CellSpacing="0" ID="c_warehouse" CssClass="priceListTbl" AutoGenerateColumns="false" GridLines="Horizontal">
					    <Columns>
						    <asp:TemplateField HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem" HeaderStyle-Width="25%">
							    <HeaderTemplate>
								    <Foundation:ModuleString ID="ModuleString10" runat="server" Name="Warehouse" />
							    </HeaderTemplate>
							    <ItemTemplate>
								    <%#Eval("WarehouseName") %>
								</ItemTemplate>
						    </asp:TemplateField>
						    <asp:TemplateField HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem">
							    <HeaderTemplate>
								    <Foundation:ModuleString ID="ModuleString11" runat="server" Name="StockBalance" />
							    </HeaderTemplate>
							    <ItemTemplate>
								    <%#Eval("StockBalance")%>
								</ItemTemplate>
						    </asp:TemplateField>
					    </Columns>
				    </asp:GridView>
				</td>
			</tr>
		</table>
		<table cellpadding="0" cellspacing="0" class="priceListTbl" runat="server" id="c_productsTable" visible="false" style="padding-left :0px;">
			<tr>
				<td valign="top">
					<asp:Repeater runat="server" ID="c_productsRepeter" OnItemDataBound="ProductsRepeterItemBound">
						<HeaderTemplate>
							<table cellspacing="0" cellpadding="0" width="100%">
								<tr class="priceListTblHeader">
									<td align="left" class="priceListTblHeader" style="border-right: 0px;">
										<span style="font-size: 115%;">
											<Foundation:ModuleString ID="ModuleStringProductInGroups" Name="ProductInGroups" runat="server" />
										</span>
									</td>
									<td align="left" class="priceListTblHeader" style="border-left: 0px;">
										&nbsp;
									</th>
								</tr>
						</HeaderTemplate>
						<ItemTemplate>
							<tr>
								<td class="priceListTblItem" width="50%">
									<asp:Label runat="server" ID="ProductGroupNameLabel" />
								</td>
								<td>
									<asp:HyperLink ID="ProductLink" runat="server" />
								</td>
							</tr>
						</ItemTemplate>
						<FooterTemplate>
							</table>
						</FooterTemplate>
					</asp:Repeater>
				</td>
			</tr>
		</table>
	</div>
</asp:Content>
