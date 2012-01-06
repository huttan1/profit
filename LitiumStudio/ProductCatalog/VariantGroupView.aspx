<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_VariantGroupView, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<toolbar:HorizontalToolbar ToolbarIndex="1" ID="ToolbarRight" runat="server">
		<toolbar:ToolbarItem DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/icons_standard/sort_az_descending.png" 
			ID="ToolbarItemEditSortOrder" OnClick="ToolbarItemEditSortOrderClick"
			runat="server" />
		<toolbar:ToolbarItem DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink"
			ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="images/transparent.gif" ID="ToolbarItemBack" OnClick="ToolbarItemBackClick"
			runat="server" />
	</toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
	<img id="HeaderImage" runat="server" alt="" />
	<asp:Label runat="server" ID="HeaderLabel" /> 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll" style="padding: 0px;">
			<table cellspacing="0" cellpadding="0" class="litProductList" width="100%">
				<tr>
					<th class="litProductListGroup" style="width: 15%; height: 100px; background: #F9F9F9;">
						<asp:Image ID="VariantGroupImage" runat="server" CssClass="litImageBorderSpace" Visible="false" />
					</th>
					<th class="litProductListDetails" style="width: 85%; vertical-align: top; padding-left: 15px;border-left: 1px solid #CFCDCC; background: #F9F9F9;">
						<div style="float: right; margin-top: 0px;">
							<asp:ListBox ID="LangaugeListbox" runat="server" CssClass="litInputSelect" Style="width: auto;" Rows="1" AutoPostBack="true" OnSelectedIndexChanged="LanguageListboxSelectedIndexChanged" />
						</div>
						<div class="litHeader">
							<asp:Label runat="server" ID="TypeLabel" />
						</div>
						<div class="litParagraphText" runat="server">
							<b><Foundation:ModuleString ID="ModuleStringName" Name="Name" runat="server" />: </b>
							<asp:Label ID="VariantGroupNameLabel" runat="server" />
						</div>
						<div id="Div1" class="litParagraphText" runat="server">
							<b><Foundation:ModuleString ID="ModuleString1" Name="ArticleGroup" runat="server" />: </b>
							<asp:Label ID="ArticleGroupLabel" runat="server" />
							<asp:HyperLink ID="ArticleGroupLink" runat="server" />
						</div>
					</th>
				</tr>
			</table>
		
		<br />
		<asp:Label ID="GeneralInfoLabel" runat="server" Font-Bold="true" ForeColor="#AFAFAF" style="font-size: 85%; padding-left: 5px;"></asp:Label>	
		<table cellspacing="0" cellpadding="0" class="litProductList" width="100%">
			<tr>
				<th class="litProductListDetails" style="width: 85%; vertical-align: top;border-bottom: 0px;">
					<asp:Repeater runat="server" ID="VariantGroupPropertiesRepeater" OnItemDataBound="PropertiesRepeaterDataBound">
						<ItemTemplate>
							<div class="litParagraphText">
								<b><asp:Label ID="PropertyLabel" runat="server" />:</b>
								<asp:Image ID="PropertyImage" runat="server" Visible="false" Style="vertical-align: middle;" CssClass="propertyItem"/>
								<asp:HyperLink ID="PropertyLink" runat="server" Visible="false" CssClass="imgLink propertyItem" style="color: #71BBE5;"/>
								<asp:Label ID="PropertyValue" runat="server" Visible="false" CssClass="propertyItem"/>
							</div>
						</ItemTemplate>
					</asp:Repeater>
				</th>
			</tr>
		</table>
		
		<table cellpadding="0" cellspacing="0" class="priceListTbl" runat="server" id="VariantsTable" visible="false" style="padding-left :0px;">
			<tr>
				<td valign="top">
					<asp:Repeater runat="server" ID="VariantsRepeater" OnItemDataBound="VariantsRepeterItemBound">
						<HeaderTemplate>
							<table cellspacing="0" cellpadding="0" width="100%">
								<tr class="priceListTblHeader">
									<td align="left" class="priceListTblHeader" style="border-right: 0px;">
										<span style="font-size: 115%;">
											<Foundation:ModuleString ID="ModuleStringVariantRegister" Name="VariantRegister" runat="server" />
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
									<asp:Label runat="server" ID="VariantNameLabel" />
								</td>
								<td>
									<asp:HyperLink ID="VariantLink" runat="server" />
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
				
		<table cellspacing="0" cellpadding="0" class="priceListTbl" runat="server" id="WarehouseTable" visible="false" style="padding-left :0px;">
			<tr>
				<td valign="top">
					<asp:GridView runat="server" CellPadding="0" CellSpacing="0" ID="WarehouseGrid" CssClass="priceListTbl" AutoGenerateColumns="false" GridLines="Horizontal">
					    <Columns>
						    <asp:TemplateField HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem" HeaderStyle-Width="25%">
							    <HeaderTemplate>
								    <Foundation:ModuleString ID="ModuleStringWarehouse" runat="server" Name="Warehouse" />
							    </HeaderTemplate>
							    <ItemTemplate>
								    <%#Eval("WarehouseName") %>
								</ItemTemplate>
						    </asp:TemplateField>
						    <asp:TemplateField HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem">
							    <HeaderTemplate>
								    <Foundation:ModuleString ID="ModuleStringStockBalance" runat="server" Name="StockBalance" />
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
				
		<table cellpadding="0" cellspacing="0" class="priceListTbl" runat="server" id="ProductsTable" visible="false" style="padding-left :0px;">
			<tr>
				<td valign="top">
					<asp:Repeater runat="server" ID="ProductsRepeter" OnItemDataBound="ProductsRepeterItemBound">
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
		
		<script type="text/javascript">
    		cancelObject = document.getElementById("<% Response.Write(ToolbarItemBack.ClientID.ToString()); %>");
    		document.onkeypress = function(e) { var key = (window.event) ? window.event.keyCode : e.keyCode; if (key == 27) simulateClick(cancelObject); }
		</script>
	</div>
</asp:Content>
