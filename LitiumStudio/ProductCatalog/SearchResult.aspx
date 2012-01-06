<%@ page title="" language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_SearchResult, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<div style="float: left;">
		<ComponentArt:ToolBar ID="c_toolBarNew" runat="server" AutoPostBackOnSelect="true"
			CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew" DefaultItemHoverCssClass="litToolbarItemOnMouseOver"
			DefaultItemActiveCssClass="litToolbarItemOnMouseDown" DefaultItemDisabledCssClass="litToolbarItemDisabled"
			ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false"
			Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
			<Items runat="server">
				<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemNew" ImageUrl="icons_standard/add.png"
					ItemType="DropDown" DropDownId="c_newMenu" DropDownImageUrl="toolbar/dropdown.gif"
					DropDownImageWidth="16" DropDownImageHeight="16" ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate" />
			</Items>
			<ClientTemplates>
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
		<ComponentArt:Menu runat="server" ID="c_newMenu" DefaultDisabledItemLookId="DisabledItemLook"
			ImagesBaseUrl="~/LitiumStudio/Images/" CssClass="litNavMenuGroup" DefaultItemLookId="DefaultItemLook"
			DefaultGroupItemSpacing="10" DefaultItemTextAlign="Left" DefaultItemTextWrap="false"
			DefaultGroupExpandOffsetX="0" DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto"
			TopGroupExpandDirection="BelowLeft" TopGroupExpandOffsetY="0" CollapseDuration="100"
			CollapseSlide="ExponentialDecelerate" ExpandDuration="100" ExpandSlide="ExponentialDecelerate"
			ExpandDelay="0" ExpandOnClick="false" CascadeCollapse="true" CollapseDelay="10000"
			HideSelectElements="false" HighlightExpandedPath="true" KeyboardEnabled="true"
			OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true" ShadowOffset="2"
			Orientation="Vertical" ContextMenu="Custom" ScrollingEnabled="true" ScrollDownLookId="ScrollDownItemLook"
			ScrollUpLookId="ScrollUpItemLook" OnItemSelected="NewItemSelected">
			<ItemLooks>
				<ComponentArt:ItemLook LookId="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16"
					CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive"
					HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="5" LabelPaddingLeft="10"
					LabelPaddingRight="10" LabelPaddingTop="4" />
				<ComponentArt:ItemLook LookId="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16"
					CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="5" LabelPaddingLeft="10"
					LabelPaddingRight="10" LabelPaddingTop="4" />
				<ComponentArt:ItemLook LookId="ExpandableItemLook" RightIconUrl="menu/arrow.gif"
					RightIconWidth="20" RightIconHeight="15" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded"
					ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4"
					LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3" />
				<ComponentArt:ItemLook LookId="BreakItem" ImageUrl="splitter/splitter_verBg.gif"
					ImageWidth="100%" ImageHeight="1" />
			</ItemLooks>
			<Items>
				<ComponentArt:MenuItem ID="m_Article" Look-LeftIconUrl="icons_standard/product_blue.png"
					AutoPostBackOnSelect="true" />
				<ComponentArt:MenuItem ID="m_VariantGroup" Look-LeftIconUrl="icons_standard/variant.png"
					AutoPostBackOnSelect="true" />
				<ComponentArt:MenuItem LookId="BreakItem" />
				<ComponentArt:MenuItem ID="m_ProductCatalog" Look-LeftIconUrl="icons_standard/earth2.png"
					AutoPostBackOnSelect="true" />
				<ComponentArt:MenuItem ID="m_ProductGroup" Look-LeftIconUrl="icons_standard/folder_closed.png"
					AutoPostBackOnSelect="true" />
				<ComponentArt:MenuItem LookId="BreakItem" />
				<ComponentArt:MenuItem ID="m_PriceList" Look-LeftIconUrl="icons_standard/barcode_16.png"
					AutoPostBackOnSelect="true" />
				<ComponentArt:MenuItem ID="m_Warehouse" Look-LeftIconUrl="icons_standard/shelf_empty16.png"
					AutoPostBackOnSelect="true" />
			</Items>
		</ComponentArt:Menu>
	</div>
	<div style="float: left;">
		<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="c_toolbarRight" runat="server">
			<Toolbar:ToolbarItem ID="c_toolbarItemView" DisabledClass="litToolbarItem litToolbarItemDisabled"
				Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconView" SelectedClass="litToolbarItem litToolbarItemSelected"
				ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif" runat="server"
				OnClick="ToolbarItemView_Click" />
			<Toolbar:ToolbarItem ID="c_toolbarItemEdit" DisabledClass="litToolbarItem litToolbarItemDisabled"
				Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil"
				SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif"
				runat="server" OnClick="ToolbarItemEdit_Click" />
			<Toolbar:ToolbarItem ID="c_toolbarItemDelete" DisabledClass="litToolbarItem litToolbarItemDisabled"
				Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2"
				SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif"
				runat="server" OnClick="ToolbarItemDelete_Click" />
			<Toolbar:ToolbarItem ID="c_toolbarItemCut" DisabledClass="litToolbarItem litToolbarItemDisabled"
				Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconCut" SelectedClass="litToolbarItem litToolbarItemSelected"
				ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif" runat="server"
				OnClick="ToolbarItemCut_Click" />
			<Toolbar:ToolbarItem ID="c_toolbarItemCopy" DisabledClass="litToolbarItem litToolbarItemDisabled"
				Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconCopy" SelectedClass="litToolbarItem litToolbarItemSelected"
				ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif" runat="server"
				OnClick="ToolbarItemCopy_Click" />
			<Toolbar:ToolbarItem ID="c_toolbarItemPaste" DisabledClass="litToolbarItem litToolbarItemDisabled"
				Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPaste" SelectedClass="litToolbarItem litToolbarItemSelected"
				ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif" runat="server" />
			<Toolbar:ToolbarItem ID="c_toolbarItemCreateNewProduct" DisabledClass="litToolbarItem litToolbarItemDisabled"
				Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconProduct"
				SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif"
				runat="server" OnBeforeUnload="return false;" OnClientClick="CreateNewProduct(this, '1_6'); return false;" />
			<Toolbar:ToolbarItem ID="c_toolbarItemPublish" DisabledClass="litToolbarItem litToolbarItemDisabled"
				Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPublish"
				SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif"
				runat="server" OnClick="ToolbarItemPublish_Click" />
			<Toolbar:ToolbarItem ID="c_toolbarItemUnpublish" DisabledClass="litToolbarItem litToolbarItemDisabled"
				Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconUnpublish"
				SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif"
				runat="server" OnClick="ToolbarItemUnpublish_Click" />
		</Toolbar:HorizontalToolbar>
	</div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" class="litIconDocumentFind2" alt="" />
	<Foundation:ModuleString ID="ModuleString1" Name="SearchResultHeader" runat="server" />
	<asp:Label runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioFilterArea" runat="server">
	<LS:FilterAreaSetting ID="FilterAreaSetting1" runat="server" FilterAreaState="Open" />
	<div id="filterContainer">
		<div class="articlesFilterFirstRow">
			<div class="articlesFilterItem" style="width: 12%; white-space: nowrap;">
				<asp:CheckBox ID="c_variantGroupCheckBox" Checked="true" runat="server" onclick="updateGrid()" />&nbsp;
				<Foundation:ModuleString ID="VariantGroupLbl" Name="Variants" runat="server" />
			</div>
			<div class="articlesFilterItem" style="width: 10%; white-space: nowrap;">
				<asp:CheckBox ID="c_articlesCheckBox" Checked="true" runat="server" onclick="updateGrid()" />&nbsp;
				<Foundation:ModuleString ID="ArticlesLbl" Name="Articles" runat="server" />
			</div>
			<div class="articlesFilterItem" style="width: 10%; white-space: nowrap;">
				<asp:CheckBox ID="c_productsCheckBox" Checked="true" runat="server" onclick="updateGrid()" />&nbsp;
				<Foundation:ModuleString ID="ArticlesLbl2" Name="Products" runat="server" />
			</div>
			<div class="articlesFilterItem" style="width: 10%; white-space: nowrap;">
				<asp:CheckBox ID="c_articleGroupsCheckBox" Checked="true" runat="server" onclick="updateGrid()" />&nbsp;
				<Foundation:ModuleString ID="ArticlesLbl3" Name="ArticleGroups" runat="server" />
			</div>
			<div class="articlesFilterItem" style="white-space: nowrap; margin-left: 10px">
				<asp:Label ID="c_publishedLabel" runat="server" />&nbsp;
				<asp:DropDownList ID="c_publishedDropDown" onchange="updateGrid()" runat="server" />
			</div>
		</div>
		<div class="articlesFilterLastRow">
			<div class="articlesFilterItem" style="width: 12%; white-space: nowrap;">
				<asp:CheckBox ID="c_variantsCheckBox" Checked="true" runat="server" onclick="updateGrid()" />&nbsp;
				<Foundation:ModuleString ID="VariantsLbl" Name="VariantRegister" runat="server" />
			</div>
			<div class="articlesFilterItem" style="width: 10%; white-space: nowrap;">
				<asp:CheckBox ID="c_packagesCheckBox" Checked="true" runat="server" onclick="updateGrid()" />&nbsp;
				<Foundation:ModuleString ID="PackagesLbl" Name="Packages" runat="server" />
			</div>
			<div class="articlesFilterItem" style="width: 10%; white-space: nowrap;">
				<asp:CheckBox ID="c_productGroupsCheckBox" Checked="true" runat="server" onclick="updateGrid()" />&nbsp;
				<Foundation:ModuleString ID="PackagesLbl2" Name="ProductGroups" runat="server" />
			</div>
			<div class="articlesFilterItem" style="width: 10%; white-space: nowrap;">
			</div>
			<div class="articlesFilterItem" style="white-space: nowrap; margin-left: 10px">
				<asp:Label ID="c_statusLabel" runat="server" />&nbsp;
				<asp:DropDownList ID="c_statusDropDown" onchange="updateGrid()" runat="server" />
			</div>
			<br />
			<br />
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<Telerik:RadCodeBlock runat="server">
		<script language="javascript" type="text/javascript">
			//Buttons
			//1_0 - View
			//1_1 - Edit
			//1_2 - Delete
			//1_3 - Cut
			//1_4 - Copy
			//1_5 - Paste
			//1_6 - Create Product
			//1_7 - Publish
			//1_8 - Unblish
			var selectedItemCount = 0;
			var cancelDeselect = false;
			var enableCreateProduct = false;
			var cancelSelect = false;
			function SelectAllClick(sender) {
				toggleStatus(true);
				if (sender.checked) {
					SelectAll();
				}
				else {
					ClearSelected();
				}
			}
			function SelectAll() {
				toggleStatus(true);
				var tableView = $find("<%= m_pcSearch.ClientID %>").get_masterTableView();
				tableView.clearSelectedItems();
				cancelDeselect = true;
				tableView.selectAllItems();
				PageMethods.SelectAll(callMethod_Success, callMethod_Failure);
				cancelDeselect = false;
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = true;
			}
			function ClearSelected() {
				toggleStatus(true);
				var tableView = $find("<%= m_pcSearch.ClientID %>").get_masterTableView();
				cancelSelect = true;
				tableView.clearSelectedItems();
				if (tableView.get_selectedItems().length > 0)
					tableView.selectAllItems();
				cancelSelect = false;
				PageMethods.DeselectAll(callMethod_Success, callMethod_Failure);
				toolbarItemAction("disable", "1_0,1_1,1_2,1_3,1_4,1_5,1_6,1_7,1_8");
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
				toggleStatus(true);
				PageMethods.IsButtonEnabled(ids, selected, callMethod_Success, callMethod_Failure);
			}
			function callMethod_Success(results, userContext, methodName) {
				var buttonsEnable = new Array();
				buttonsEnable = results.split('|');
					// View.
				if (buttonsEnable[6] === 'True') {
					toolbarItemAction("activate", "1_0");
				}
				else {
					toolbarItemAction("disable", "1_0");
				}
				
  <%if (Master.WriteAccess) {%>	
				// Edit.
				if (buttonsEnable[0] === 'True') {
					toolbarItemAction("activate", "1_1");
				}
				else {
					toolbarItemAction("disable", "1_1");
				}
				// CrateProduct.
				if (buttonsEnable[1] === 'True') {
					enableCreateProduct =true;
					toolbarItemAction("activate", "1_6");
				}
				else {
					enableCreateProduct =false;
					toolbarItemAction("disable", "1_6");
				}
				// Publish.
				if (buttonsEnable[2] === 'True') {
					toolbarItemAction("activate", "1_7");
				}
				else {
					toolbarItemAction("disable", "1_7");
				}
				
				// Unpublish.
				if (buttonsEnable[3] === 'True') {
					toolbarItemAction("activate", "1_8");
				}
				else {
					toolbarItemAction("disable", "1_8");
				}
				// Copy.
				if (buttonsEnable[4] === 'True') {
					toolbarItemAction("activate", "1_4");
				}
				else {
					toolbarItemAction("disable", "1_4");
				}
				// Cut.
				if (buttonsEnable[5] === 'True') {
					toolbarItemAction("activate", "1_3");
				}
				else {
					toolbarItemAction("disable", "1_3");
				}
			
				// Select 'SelectAll' CheckBox.
				selectedItemCount = parseInt(buttonsEnable[7]);
				
				if (selectedItemCount > 0) {
					toolbarItemAction("activate", "1_2");
				}
				else {
					toolbarItemAction("disable", "1_2");
				}				
			<%}%>	
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = buttonsEnable[8] === 'True';
				toggleStatus(false);
			}
			function callMethod_Failure(errors, userContext, methodName) {
<%
# if DEBUG
%>
				alert(errors.get_message());
<%
# endif
%>
				toggleStatus(false);
			}
			function HeaderShowing(sender, args) {
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = selectedItemCount == $find("<%= m_pcSearch.ClientID %>").get_masterTableView()._virtualItemCount;
			}
			function RowDeselected(sender, args, gridHelper) {
				if ($get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked)
					$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = false;
			}
			function RowDragCheck(sender, eventArgs)
			 { 
				if(!enableCreateProduct)
				{
					eventArgs.set_cancel(true) 
				}				
			 }
			function updateGrid() {
				$find("<%=m_pcSearch.ClientID %>").get_masterTableView().rebind();
			}
			function toggleStatus(disable) {
				if (disable) {
					$('#filterContainer :input').attr('disabled', true);
				} else {
					$('#filterContainer :input').removeAttr('disabled');
				}   
			}
			var __doPostBackOriginalCallUpdateSelectedAfter = __doPostBack;
			__doPostBack = function(sender,args) {
				if (sender.toString().indexOf("<%=m_pcSearch.UniqueID %>") != -1)
					toggleStatus(true);
				__doPostBackOriginalCallUpdateSelectedAfter(sender,args);
				if (sender.toString().indexOf("<%=m_pcSearch.UniqueID %>") != -1)
					setTimeout(function(){ PageMethods.UpdateSelected(callMethod_Success, callMethod_Failure); }, 100);
			}
		</script>
	</Telerik:RadCodeBlock>
	<LS:GridHelperAjax runat="server" ID="m_pcSearchHelper" AssociatedControlID="m_pcSearch"
		OnNeedData="GetData" DataKeyName="ID" />
	<Telerik:RadGrid runat="server" ID="m_pcSearch" OnRowDrop="Grid_RowDrop" AllowMultiRowSelection="true"
		OnItemCreated="GridItemCreated" OnPageIndexChanged="GridPageIndexChanged" OnSortCommand="GridSort">
		<ClientSettings AllowRowsDragDrop="true">
			<ClientEvents OnRowCreating="HeaderShowing" OnRowDragStarted="RowDragCheck" OnRowSelecting="RowSelecting"
				OnRowDeselecting="RowDeselecting" OnRowDeselected="RowDeselected" OnRowDropping="onRowDropping" />
			<Selecting AllowRowSelect="True" />
		</ClientSettings>
		<MasterTableView runat="server">
			<Columns>
				<Telerik:GridBoundColumn UniqueName="ID" DataField="ID" Visible="false" />
				<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
				<Telerik:GridImageColumn DataImageUrlFields="IconImageUrl" DataImageUrlFormatString="{0}"
					HeaderStyle-Width="30" />
				<Telerik:GridBoundColumn DataField="ArticleNumber" />
				<Telerik:GridBoundColumn DataField="Name" />
				<Telerik:GridBoundColumn UniqueName="TypeName" DataField="TypeName" />
				<Telerik:GridBoundColumn DataField="RemarksText" />
				<Telerik:GridBoundColumn AllowSorting="false" DataField="Status" />
				<Telerik:GridBoundColumn AllowSorting="false" DataField="Published" />
				<Telerik:GridBoundColumn DataField="Template" />
				<Telerik:GridTemplateColumn DataField="Referer" HeaderStyle-Width="30px">
					<ItemTemplate>
						<asp:HyperLink runat="server" ID="EditButton" NavigateUrl='<%# Eval("EditUrl") %>'
							runat="server">
                                   <img class='litIconPencil' src='Images/transparent.gif' />
						</asp:HyperLink>
					</ItemTemplate>
				</Telerik:GridTemplateColumn>
				<Telerik:GridHyperLinkColumn DataNavigateUrlFormatString="{0}" HeaderStyle-Width="30"
					DataNavigateUrlFields="ViewUrl" Text="&lt;img class='litIconNavRightBlue' src='Images/transparent.gif' &gt;" />
				<Telerik:GridBoundColumn UniqueName="EditUrl" DataField="EditUrl" Visible="false" />
				<Telerik:GridBoundColumn UniqueName="ViewUrl" DataField="ViewUrl" Visible="false" />
			</Columns>
		</MasterTableView>
	</Telerik:RadGrid>
	<asp:HiddenField ID="c_hiddenSelectAllClientID" Value="" runat="server" />
	<Telerik:RadScriptBlock runat="server">
		<script type="text/javascript">
			//<![CDATA[
			var cancelObject = null;
			var createProduct = false; // gets value from included iframe document
			function CreateNewProduct(sender, buttonIndex) {
				CreateProductsPress();
				// show dialog if toolbar item is not disabled
				var item = document.getElementById('ToolbarItem_' + buttonIndex);
				if (item.className.indexOf('litToolbarItemDisabled') === -1) {
					CreateNewProductDialog.show();
				}
			}
			function CreateNewProductDialog_OnShow(dialog) {
				CreateNewProductDialog.set_offsetX((document.body.clientWidth / 2) - 150);
				CreateNewProductDialog.set_offsetY((document.body.clientHeight / 2) - 175);

				document.getElementById(dialog.get_id()).style.display = 'block';
				document.getElementById(dialog.get_id()).style.visiblity = 'visible';
			}
			function CreateNewProductDialog_OnClose(dialog) {
				if (createProduct) {
					// get reference to iframe with product tree
					var iframeDocument = document.getElementById('CreateNewProductDialogIframe').contentWindow.document;

					// check if a node was selected
					if (iframeDocument.getElementById('ProductCatalogID').value) {
						// set value of the hidden input element to the value of the selected node 
						document.getElementById('<%=CreateNewProductCatalogID%>').value = iframeDocument.getElementById('ProductCatalogID').value
					}
				}

				document.getElementById(dialog.get_id()).style.display = 'none';
				document.getElementById(dialog.get_id()).style.visiblity = 'hidden';
			}
			function CloseCreateNewProductDialog(status) {
				createProduct = status;
				CreateNewProductDialog.Close();
			}
			function enableSaveButton() {
				document.getElementById('<%=CreateNewProductButtonClientID%>').disabled = false;
			}

			function CreateProductsPress() {
				PageMethods.CreateProductsPress(createProductsPress_Success, createProductsPress_Failure);
			}
			function createProductsPress_Success(results, userContext, methodName) {
			}
			function createProductsPress_Failure(errors, userContext, methodName) {
				alert(errors.get_message());
			}
			//]]>
		</script>
	</Telerik:RadScriptBlock>
	<asp:HiddenField ID="mc_CreateNewProductCatalogID" Value="" runat="server" />
	<ComponentArt:Dialog Alignment="TopLeft" FooterCssClass="CreateNewProductDialogBottom"
		ContentCssClass="CreateNewProductDialog" Height="300" ID="CreateNewProductDialog"
		IFrameCssClass="CreateNewProductDialogIframe" IFrameBorder="0" Modal="true" runat="server"
		Width="300" X="0" Y="0">
		<ClientEvents>
			<OnShow EventHandler="CreateNewProductDialog_OnShow" />
			<OnClose EventHandler="CreateNewProductDialog_OnClose" />
		</ClientEvents>
		<HeaderTemplate>
			<table cellpadding="0" cellspacing="0" width="302" onmousedown="CreateNewProductDialog.StartDrag(event);">
				<tr>
					<td width="6">
						<img style="display: block;" src="../../LitiumStudio/Images/ca_dialog/top_left.gif" />
					</td>
					<td style="padding: 3px; padding-bottom: 0px; background-image: url(../../LitiumStudio/Images/ca_dialog/top.gif);">
						<table width="100%" height="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td valign="bottom" class="litHeader3">
									<%=m_currentModule.Strings.GetValue("ArticlesCreateNewProduct", FoundationContext.Language.Culture, true)%>
								</td>
								<td align="right" valign="middle">
								</td>
							</tr>
						</table>
					</td>
					<td width="30" style="background-image: url(../../LitiumStudio/Images/ca_dialog/top.gif);">
						<img id="Img2" style="display: block; margin-top: 2px;" src="../../LitiumStudio/Images/ca_dialog/close.gif"
							onclick="CloseCreateNewProductDialog(false);">
					</td>
					<td width="6">
						<img id="Img3" style="display: block;" src="../../LitiumStudio/Images/ca_dialog/top_right.gif" />
					</td>
				</tr>
			</table>
		</HeaderTemplate>
		<ContentTemplate>
			<iframe id="CreateNewProductDialogIframe" class="CreateNewProductDialogIframe" src="<%=Page.ResolveUrl("~/LitiumStudio/ProductCatalog/Framework/SelectProductCatalog.aspx")%>"
				border="0" frameborder="0" marginheight="0" marginwidth="0"></iframe>
		</ContentTemplate>
		<FooterTemplate>
			<table class="litModalPopupBottom" cellpadding="0" cellspacing="0" width="302">
				<tr>
					<td style="background: url(../../LitiumStudio/Images/ca_dialog/left.gif) repeat-y left top;">
						<img style="display: block;" src="../../LitiumStudio/Images/ca_dialog/spacer.gif"
							height="1" width="6" />
					</td>
					<td style="text-align: right; padding-top: 10px; padding-right: 2px; padding-bottom: 3px;">
						<input type="button" onclick="CloseCreateNewProductDialog(false);" class="litInputButton"
							id="Button1" value="<%=m_currentModule.Strings.GetValue("Cancel", FoundationContext.LanguageID, true)%>" />
						&nbsp;
						<asp:Button ID="CreateNewProductButton" disabled="disabled" CssClass="litInputButton"
							OnClientClick="CloseCreateNewProductDialog(true);" OnClick="CreateNewProductButton_OnClick"
							OnLoad="CreateNewProductButton_OnLoad" runat="server" />
					</td>
					<td style="background: url(../../LitiumStudio/Images/ca_dialog/right.gif) repeat-y right top;">
						<img style="display: block;" src="../../LitiumStudio/Images/ca_dialog/spacer.gif"
							height="1" width="6" />
					</td>
				</tr>
				<tr>
					<td width="6">
						<img style="display: block;" src="../../LitiumStudio/Images/ca_dialog/bottom_left.png" />
					</td>
					<td style="background-image: url(../../LitiumStudio/Images/ca_dialog/bottom.gif);">
						<img style="display: block;" src="../../LitiumStudio/Images/ca_dialog/spacer.gif"
							height="5" width="288" />
					</td>
					<td width="6">
						<img style="display: block;" src="../../LitiumStudio/Images/ca_dialog/bottom_right.png" />
					</td>
				</tr>
			</table>
		</FooterTemplate>
	</ComponentArt:Dialog>
</asp:Content>
