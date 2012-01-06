<%@ page language="C#" debug="true" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_Articles, Litum.Studio.Web" %>
<%@ Import Namespace="Litium.Studio.UI.ProductCatalog.Common.Constants"%>
<%@ Import Namespace="Litium.Foundation.Modules.ProductCatalog.Articles"%>

<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="c_toolbarRight" runat="server">
		<Toolbar:DividerItem ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif"
			Class="litToolbarDivider" runat="server" ID="Divideritem5" />
		<Toolbar:ToolbarItem ID="c_toolbarItemCreateNewProduct" OnBeforeUnload="return false;"
			OnClientClick="CreateNewProduct(this, '1_0'); return false;" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconProduct"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif"
			runat="server" />
		<Toolbar:ToolbarItem ID="c_toolbarTranslate" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconTranslate"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif"
			runat="server" OnClick="ToolbarItemTranslate_Click" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<div style="float: left">
		<img src="Images/transparent.gif" height="16px" class="litIconArticleGroup" alt="" />
		<asp:Label ID="articleBreadcrumb" Text="" runat="server" />
	</div>
	<span style="float: right; margin-right: 7px;">
		<Foundation:ModuleString ID="ModuleString1" Name="DragArticleHelpText" runat="server" />
	</span>
</asp:Content>
<asp:Content ContentPlaceHolderID="LitiumStudioFilterArea" runat="server">
	<Telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">

		<script type="text/javascript">
			function updateGrid() {
				$find("<%=c_articlesGrid.ClientID %>").get_masterTableView().rebind();
			}
		</script>

	</Telerik:RadScriptBlock>
	<LS:FilterAreaSetting runat="server" FilterAreaState="Open" />
	
	<div class="articlesFilterFirstRow">
		<div class="articlesFilterItem" style="width:12%; white-space: nowrap;">
			<asp:CheckBox ID="c_variantGroupCheckBox" Checked="true" runat="server" onclick="updateGrid()" />&nbsp;
			<Foundation:ModuleString ID="VariantGroupLbl" Name="Variants" runat="server" />
		</div>
		<div class="articlesFilterItem" style="width:10%; white-space: nowrap;">
			<asp:CheckBox ID="c_articlesCheckBox" Checked="true" runat="server" onclick="updateGrid()" />&nbsp;
			<Foundation:ModuleString ID="ArticlesLbl" Name="Articles" runat="server" />
		</div>
	</div>
	<div class="articlesFilterLastRow">
		<div class="articlesFilterItem" style="width:12%; white-space: nowrap;">
			<asp:CheckBox ID="c_variantsCheckBox" Checked="true" runat="server" onclick="updateGrid()" />&nbsp;
			<Foundation:ModuleString ID="VariantsLbl" Name="VariantRegister" runat="server" />
		</div>
		
		<div class="articlesFilterItem" style="width:10%; white-space: nowrap;">
			<asp:CheckBox ID="c_packagesCheckBox" Checked="true" runat="server" onclick="updateGrid()" />&nbsp;
			<Foundation:ModuleString ID="PackagesLbl" Name="Packages" runat="server" />
		</div>
		
		<div class="articlesFilterItem" style=" white-space: nowrap;">
			<asp:Label ID="c_publishedLabel" runat="server" />&nbsp;
			<asp:DropDownList ID="c_publishedDropDown" onchange="updateGrid()" runat="server" />
		</div>
		<div class="articlesFilterItem" style=" white-space: nowrap;">
			<asp:Label ID="c_statusLabel" runat="server" />&nbsp;
			<asp:DropDownList ID="c_statusDropDown" onchange="updateGrid()" runat="server" />
		</div>
		<br /><br />
	</div>
	
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentNoScroll">
	 <telerik:RadAjaxLoadingPanel ID="RadAjaxArticleLoadingPanel" Skin="Windows7"  runat="server"/>
   <LS:GridHelperAjax runat="server" AssociatedControlID="c_articlesGrid" ID="c_articleGridHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID;Type" />
		<Telerik:RadGrid OnRowDrop="ArticlesGrid_RowDrop" AllowPaging="true" AllowMultiRowSelection="true" OnItemCreated="articlesGrid_ItemCreated"
			runat="server" ID="c_articlesGrid">
			<ClientSettings AllowRowsDragDrop="true">
				<Selecting AllowRowSelect="true" />
				<ClientEvents OnRowDropping="onRowDropping" OnRowSelecting="RowSelecting" OnRowDeselecting="RowDeselecting" OnRowCreating="HeaderShowing" OnRowDeselected="RowDeselected" OnRowDragStarted="RowDragStarted" OnRowDropped="RowDropped"/>
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridImageColumn DataImageUrlFields="ImageUrl" DataImageUrlFormatString="{0}" HeaderStyle-Width="30" ItemStyle-HorizontalAlign="Center"/>
					<Telerik:GridBoundColumn DataField="ArticleNumber" />
					<Telerik:GridBoundColumn DataField="DisplayName" />
					<Telerik:GridBoundColumn DataField="TypeDisplayString" />
					<Telerik:GridBoundColumn DataField="Remarks" />
					<Telerik:GridBoundColumn DataField="ProductsColumn" />
					<Telerik:GridBoundColumn DataField="Status" />
					<Telerik:GridBoundColumn DataField="TemplateName" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	    <asp:HiddenField ID="c_hiddenSelectAllClientID" value="" runat="server" />
	    <asp:HiddenField ID="c_hiddenSelectedItemType" value="" runat="server" />
	</div>

    <Telerik:RadScriptBlock ID="RadScriptBlock3" runat="server">
        <script type="text/javascript">
           var currentLoadingPanel = null; 
           var currentUpdatedControl = null;
          function ShowLoadingPanel(){             
			
				currentLoadingPanel = $find("<%= RadAjaxArticleLoadingPanel.ClientID%>");
				currentUpdatedControl = "<%= c_articlesGrid.ClientID %>";
				//show the loading panel over the updated control 
				currentLoadingPanel.show(currentUpdatedControl);				
            } 
             function HideLoadingPanel() {
                //hide the loading panel and clean up the global variables 
                if (currentLoadingPanel != null) {
                    currentLoadingPanel.hide(currentUpdatedControl);
                }
                currentUpdatedControl = null;
                currentLoadingPanel = null;               
            } 
        	var cancelDeselect = false;
        	var cancelSelect = false;
        	var selectedArticleCount = 0;
        	var selectAllClicked = false;
        	
            //Buttons


            //0_1 - create product
        	//0_2 - translate

        	function RowDropped(sender, args) {
        		//disable all toolbar buttons after rows selection is cleared
        		callMethod_Success('0|0||', '', '')
        	}
        	
        	function RowSelecting(sender, args, gridHelper) {
        	    ProcessRowSelecting(sender, args, gridHelper);
          }

          function ProcessRowSelecting(sender, args, gridHelper) {
          	if (!selectAllClicked && args._dataKeyValues && args._dataKeyValues.ID && args._dataKeyValues.Type) {
          		PageMethods.UpdateSelectedArticles(args._dataKeyValues.ID, args._dataKeyValues.Type, 'true', callMethod_Success, callMethod_Failure);
          	}
          	else {
          		if (cancelSelect)
          			args.set_cancel(true);
          	}
          }

          function RowDeselecting(sender, args, gridHelper) {
               ProcessRowDeselecting(sender, args, gridHelper)
          }
           
           function ProcessRowDeselecting(sender, args, gridHelper) {
           	if (!selectAllClicked && args._dataKeyValues && args._dataKeyValues.ID && args._dataKeyValues.Type) {
           		PageMethods.UpdateSelectedArticles(args._dataKeyValues.ID, args._dataKeyValues.Type, 'false', callMethod_Success, callMethod_Failure);
           	}
           	else {
           		if (cancelDeselect) {
           			args.set_cancel(true);
           		}
           	}
           }

           function HeaderShowing(sender, args) {
           	$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = selectedArticleCount == $find("<%= c_articlesGrid.ClientID %>").get_masterTableView()._virtualItemCount;
           }

           function SelectAllClick(sender) {
           	selectAllClicked = true;
           	if (sender.checked) {
           		SelectAllArticles();
           	}
           	else {
           		ClearSelectedArticles();
           	}
           	selectAllClicked = false;
           }

           function SelectAllArticles() {
           	var tableView = $find("<%= c_articlesGrid.ClientID %>").get_masterTableView();
           	tableView.clearSelectedItems();
           	cancelDeselect = true;
           	tableView.selectAllItems();
           	PageMethods.SelectAllArticles(callMethod_Success, callMethod_Failure);
           	cancelDeselect = false;
           }

           function ClearSelectedArticles() {
           	var tableView = $find("<%= c_articlesGrid.ClientID %>").get_masterTableView();
           	cancelSelect = true;
           	tableView.clearSelectedItems();
           	if (tableView.get_selectedItems().length > 0)
           		tableView.selectAllItems();
           	cancelSelect = false;
           	PageMethods.ClearSelectedArticles(callMethod_Success, callMethod_Failure);
           }

           function RowDeselected(sender, args, gridHelper) {
           	if ($get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked)
           		$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = false;
           }

           function callMethod_Success(results, userContext, methodName) {
           	var res = new Array();
           	res = results.split('|');

           	selectedArticleCount = parseInt(res[0]);
           	var selectedVGCount = parseInt(res[1]);
           	var canEdit = <%=Litium.Foundation.Modules.ProductCatalog.ModuleProductCatalog.Instance.PermissionManager.UserHasContentAllPermission(FoundationContext.Token.UserID,true,true).ToString().ToLower()%>;
           	$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = selectedArticleCount == $find("<%= c_articlesGrid.ClientID %>").get_masterTableView()._virtualItemCount && selectedArticleCount != 0;

           	// Buttons state
           	if (selectedArticleCount == 1) {
           		if ('<%= IsAllArticlesMode.ToString().ToLower() %>' == 'false' && canEdit) {
           			toolbarItemAction("activate", "0_0");
           		}
           		setCommonToolbarButtonEnabled('c_toolbarItemView', true);
           		if (selectedVGCount == 0 && canEdit) {
           			toolbarItemAction("activate", "0_1");//not allow copy for variant group
           			if (res[4] === 'True') {
           			toolbarItemAction("activate", "1_1");
           			}
           			else{
           			toolbarItemAction("disable", "1_1");
           			}
           		}
           	}
           	else {
           		toolbarItemAction("disable", "0_1");
           		setCommonToolbarButtonEnabled('c_toolbarItemView', false);
           		toolbarItemAction("disable", "1_1");
           	}

           	// Edit button.
           	if (res[2] === 'True') {
           		setCommonToolbarButtonEnabled('c_toolbarItemEdit', canEdit);
           	}
           	else {
           		setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
           	}

           	// Enable 'Delete','cut' and 'Create Products' buttons.
           	if (selectedArticleCount > 0 && canEdit) {
           		toolbarItemAction("activate", "1_0");
           		if ('<%= IsAllArticlesMode.ToString().ToLower() %>' == 'false') {
           			toolbarItemAction("activate", "0_0");
           		}
           		setCommonToolbarButtonEnabled('c_toolbarItemDelete', canEdit);
           	}
           	else {
           		toolbarItemAction("disable", "1_0");
           		toolbarItemAction("disable", "0_0");
           		setCommonToolbarButtonEnabled('c_toolbarItemDelete', false);
           	}

           	$get('<%= c_hiddenSelectedItemType.ClientID %>').value = res[3];
           }
           
           function callMethod_Failure(errors, userContext, methodName) {
            	alert(errors.get_message());
           }

           function DeleteItems() {
           	var selectedType = $get('<%= c_hiddenSelectedItemType.ClientID %>').value;
          
           	var isConfirmed = false;
			switch (selectedType) {
				case '<%= ArticleViewRowType.None.ToString() %>':
					isConfirmed = confirm('<%= m_currentModule.Strings.GetValue(ModuleStringConstants.ARTICLE_VIEW_DELETE_MULTIITEM_CONFIRM, FoundationContext.LanguageID, true) %>');
					break;
				case '<%= ArticleViewRowType.Article.ToString() %>':
					isConfirmed = confirm('<%= m_currentModule.Strings.GetValue(ModuleStringConstants.ARTICLE_VIEW_DELETE_ARTICLE_CONFIRM, FoundationContext.LanguageID, true) %>');
					break;
				case '<%= ArticleViewRowType.Variant.ToString() %>':
					isConfirmed = confirm('<%= m_currentModule.Strings.GetValue(ModuleStringConstants.ARTICLE_VIEW_DELETE_VARIANT_CONFIRM, FoundationContext.LanguageID, true) %>');
					break;
				case '<%= ArticleViewRowType.Package.ToString() %>':
					isConfirmed = confirm('<%= m_currentModule.Strings.GetValue(ModuleStringConstants.ARTICLE_VIEW_DELETE_PACKAGE_CONFIRM, FoundationContext.LanguageID, true) %>');
					break;
				case '<%= ArticleViewRowType.VariantGroup.ToString() %>':
					isConfirmed = confirm('<%= m_currentModule.Strings.GetValue(ModuleStringConstants.ARTICLE_VIEW_DELETE_VARIANTGROUP_CONFIRM, FoundationContext.LanguageID, true) %>');
					break;				
           	}
           	if(isConfirmed)
           	{
           		ShowLoadingPanel();
           	}
           	else{
           		HideLoadingPanel();           	 	
           	}           	
           	return isConfirmed;
           }

			//<![CDATA[

			var cancelObject = null;
			var createProduct = false; // gets value from included iframe document

			function CreateNewProduct(sender, buttonIndex) {
				// show dialog if toolbar item is not disabled
				PageMethods.SetHoldSelectedState();
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
			function disableSaveButton() {
				document.getElementById('<%=CreateNewProductButtonClientID%>').disabled = true;
			}
			//]]>
		</script>

	</Telerik:RadScriptBlock>
	<input type="hidden" id="mc_CreateNewProductCatalogID" value="" runat="server" />
	<input type="hidden" id="mc_ClearSelectedArticles" runat="server" />
	<ComponentArt:Dialog Alignment="TopLeft" FooterCssClass="CreateNewProductDialogBottom"
		ContentCssClass="CreateNewProductDialog" Height="300" ID="CreateNewProductDialog"
		IFrameCssClass="CreateNewProductDialogIframe" IFrameBorder="0" Modal="true" runat="server"
		Width="300" X="270" Y="100">
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
				border="0" scrolling="yes" frameborder="0" marginheight="0" marginwidth="0">
			</iframe>
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
