<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_ArticleView, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<toolbar:HorizontalToolbar ToolbarIndex="1" ID="c_toolbarRight" runat="server">
		<toolbar:ToolbarItem DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink"
			ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="images/transparent.gif" ID="c_toolbarItemBack" OnClick="ToolbarItemBack_Click"
			runat="server" />
	</toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
	<img id="objIcon" runat="server" alt="" />
	<asp:Label runat="server" ID="c_headername" /> 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll" style="padding: 0px;">
			<table cellspacing="0" cellpadding="0" class="litProductList" width="100%">
				<tr>
					<th class="litProductListProduct" style="width: 15%;">
						<asp:Image ID="c_displayImage" runat="server" CssClass="litImageBorderSpace" Visible="false" />
					</th>
					<th class="litProductListDetails" style="width: 85%; vertical-align: top; padding-left: 15px;border-left: 1px solid #CFCDCC; background: #F9F9F9;">
						<div style="float: right; margin-top: 0px;">
							<asp:ListBox ID="c_langaugeListbox" runat="server" CssClass="litInputSelect" Style="width: auto;" Rows="1" AutoPostBack="true" OnSelectedIndexChanged="LanguageListbox_OnSelectedIndexChanged" />
						</div>
						<div class="litHeader">
							<asp:Label runat="server" ID="c_itemType" />
						</div>
						<div class="litParagraphText" runat="server" id="c_articleNumberPanel">
							<b><Foundation:ModuleString ID="ModuleString2" Name="ArticleNumber" runat="server" />: </b>
							<asp:Label ID="c_articleNumberLabel" runat="server" />
						</div>
						<div class="litParagraphText" runat="server" id="c_articleNamePanel">
							<b><Foundation:ModuleString ID="ModuleString13" Name="Name" runat="server" />: </b>
							<asp:Label ID="c_articleNameLabel" runat="server" />
						</div>
						<div class="litParagraphText" runat="server" id="c_articleUrlPanel">
							<b><Foundation:ModuleString ID="ModuleString1" Name="UrlName" runat="server" />: </b>
							<asp:Label ID="c_articleUrlLabel" runat="server" />
						</div>
						<div class="litParagraphText" runat="server" id="c_skuPanel">
							<b><Foundation:ModuleString ID="ModuleString9" Name="SKU" runat="server" />: </b>
							<asp:Label ID="c_sku" runat="server" />
						</div>
						<div id="Div1" class="litParagraphText" runat="server">
							<b><Foundation:ModuleString ID="ModuleString4" Name="ArticleGroup" runat="server" />: </b>
							<asp:Label ID="c_articleGroupLabel" runat="server" />
							<asp:HyperLink ID="ArticleGroupLink" runat="server" />
						</div>
					</th>
				</tr>
			</table>
		
		<table cellspacing="0" cellpadding="0" class="litProductList" width="100%">
			<tr>
				<th class="litProductListDetails" style="width: 85%; vertical-align: top;border-bottom: 0px;">
					<div class="litHeader" id="m_variantItem" runat="server" visible="false" style="margin-bottom:-10px;">
						<b><asp:Label runat="server" ID="c_variantGroupLabel" /></b>
						<a id="variantGroupToogle" href="javascript:void(0);" class="variantGroupToogleUp">
							&nbsp;
						</a>						
						<div id="variantGroupInformation" style="clear: both;" class="VGInformation">
                            		<div class="litParagraphText">
										<asp:Panel ID="pnlGroup" runat="server" CssClass="groupName">
											<asp:Label ID="c_VariantGroupGeneralLabel" runat="server" />
										</asp:Panel>
										<b><Foundation:ModuleString ID="c_VariantGroupNameProperty" Name="VariantName" runat="server" />:</b>										
										<asp:Label ID="c_VariantGroupNameValue" runat="server" CssClass="propertyItem"/>
									</div>
							<asp:Repeater runat="server" ID="c_propertiesVariantGroupRepeater" OnItemDataBound="PropertiesVariantGroupRepeaterDataBound">							   
								<ItemTemplate>
									<div class="litParagraphText">
										<asp:Panel ID="pnlGroup" runat="server" Visible="false" CssClass="groupName">
											<asp:Label ID="c_GroupLabel" runat="server" />
										</asp:Panel>
										<b><asp:Label ID="c_propertyLabel" runat="server" />:</b>
										<asp:Image ID="c_propertyImage" runat="server" Visible="false" Style="vertical-align: middle;" CssClass="propertyItem"/>
										<asp:HyperLink ID="c_propertyLink" runat="server" Visible="false" CssClass="imgLink propertyItem" style="color: #71BBE5;"/>
										<asp:Label ID="c_propertyValue" runat="server" Visible="false" CssClass="propertyItem"/>
									</div>
								</ItemTemplate>
							</asp:Repeater>
						</div>
						<hr />
						<b><asp:Label runat="server" ID="c_variantLabel" /></b>
					</div>
					<asp:Repeater runat="server" ID="c_propertiesRepeater" OnItemDataBound="PropertiesRepeaterDataBound">
						<ItemTemplate>
							<div class="litParagraphText">
								<asp:Panel ID="pnlGroup" runat="server" Visible="false" CssClass="groupName">
									<asp:Label ID="c_GroupLabel" runat="server" />
								</asp:Panel>
								<b><asp:Label ID="c_propertyLabel" runat="server" />:</b>
								<asp:Image ID="c_propertyImage" runat="server" Visible="false" Style="vertical-align: middle;" CssClass="propertyItem"/>
								<asp:HyperLink ID="c_propertyLink" runat="server" Visible="false" CssClass="imgLink propertyItem" style="color: #71BBE5;"/>
								<asp:Label ID="c_propertyValue" runat="server" Visible="false" CssClass="propertyItem"/>
							</div>
						</ItemTemplate>
					</asp:Repeater>
				</th>
			</tr>
		</table>
		
		<table cellpadding="0" cellspacing="0" class="priceListTbl" runat="server" id="c_includedArticlesTable" visible="false" style="padding-left :0px;">
			<tr>
				<td valign="top">
					<asp:Repeater runat="server" ID="c_repeaterArticles" OnItemDataBound="ArticlesRepeterItemBound">
						<HeaderTemplate>
							<table cellspacing="0" cellpadding="0" width="100%">
								<tr class="priceListTblHeader">
									<td align="left" class="priceListTblHeader" style="border-right: 0px;">
										<span style="font-size: 115%;">
											<Foundation:ModuleString ID="ModuleString3" Name="IncludedArticles" runat="server" />
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
									<asp:Label runat="server" ID="labelArticleName" />
								</td>
								<td>
									<asp:HyperLink ID="articleLink" runat="server" />
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
								    <%#((Litium.Foundation.Currencies.Currency)Eval("Currency")).Format(((Litium.Foundation.Modules.ProductCatalog.PriceLists.PriceListArticleCollection)Eval("Articles")).Get(ArticleID).Price, false, FoundationContext.Language.Culture)%>
							    </ItemTemplate>
						    </asp:TemplateField>
						    <asp:TemplateField HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem" HeaderStyle-Width="15%">
							    <HeaderTemplate>
								    <Foundation:ModuleString ID="ModuleString8" runat="server" Name="VAT" />
							    </HeaderTemplate>
							    <ItemTemplate>
								    <%#((Litium.Foundation.Modules.ProductCatalog.PriceLists.PriceListArticleCollection)Eval("Articles")).Get(ArticleID).VATPercentage.ToString("### ##0.##%")%>
							    </ItemTemplate>
						    </asp:TemplateField>
						     <asp:TemplateField HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem" HeaderStyle-Width="20%">
							    <HeaderTemplate>
								    <Foundation:ModuleString ID="ModuleString9" runat="server" Name="PriceWithVAT" />
							    </HeaderTemplate>
							    <ItemTemplate> 
								    <%#((Litium.Foundation.Currencies.Currency)Eval("Currency")).Format(((Litium.Foundation.Modules.ProductCatalog.PriceLists.PriceListArticleCollection)Eval("Articles")).Get(ArticleID).PriceWithVat, false, FoundationContext.Language.Culture)%>
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
											<Foundation:ModuleString ID="ModuleString5" Name="ProductInGroups" runat="server" />
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
									<asp:Label runat="server" ID="labelProductGroupName" />
								</td>
								<td>
									<asp:HyperLink ID="productLink" runat="server" />
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
		
		<script type="text/javascript">
		    cancelObject = document.getElementById("<% Response.Write(c_toolbarItemBack.ClientID.ToString()); %>");
		    document.onkeypress = function(e) { var key = (window.event) ? window.event.keyCode : e.keyCode; if (key == 27) simulateClick(cancelObject); }

		    $(function() // run after page loads
		    {
		        $("#variantGroupToogle").click(function() {
		            $("#variantGroupInformation").toggle("slow");
		            var myClass = $(this).attr("class");
		            if (myClass == "variantGroupToogleUp") {
		                $(this).removeClass("variantGroupToogleUp");
		                $(this).addClass("variantGroupToogleDown");
		            }
		            else if (myClass == "variantGroupToogleDown") {
		                $(this).removeClass("variantGroupToogleDown");
		                $(this).addClass("variantGroupToogleUp");
		            }
		        });
		    });
		</script>
	</div>
</asp:Content>
