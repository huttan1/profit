<%@ page language="C#" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_StockBalance, Litum.Studio.Web" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>

<%@ Import Namespace="Litium.Studio.UI.ProductCatalog.Common.Constants" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
 <Telerik:RadScriptBlock ID="RadScriptBlock3" runat="server">
	<script type="text/javascript">
    
        var checkBoxClicked = false;
        var checkCount = 0;
        var buttonViewRowID = 'c_toolbarItemView';
        var buttonEditRowID = 'c_toolbarItemEdit';
        var buttonDeleteID = 'c_toolbarItemDelete';
        var buttonExportID = 'c_toolbarItemExport';
        
        //<![CDATA[
        function c_toolbarStockBalance_ItemBeforeSelect(sender, eventArgs) {
            var id = eventArgs.get_item().get_id();
            if (id == buttonDeleteID) {
                if (!confirm('<%=SystemStrings.GetValue(Litium.Studio.UI.ProductCatalog.Common.Constants.SystemStringConstants.LABEL_CONFIRMATION_DELETE, FoundationContext.LanguageID, true)%>')) {
                    eventArgs.set_cancel(true);
                }
            }
        }
        //]]>

        getElementsByClassName = function(sender, className)
        {
            var elements = [];
            var myclass = new RegExp('\\b' + className + '\\b');
            var elem = sender.getElementsByTagName('*');
            
            for (var i = 0, l = elem.length; i < l; i++)
            {
                var classes = elem[i].className;
                
                if (myclass.test(classes))
                {
                    elements.push(elem[i]);
                }
            }
            
            return elements;
        };     

        // event handler of the toggle checkbox
        function toggleWarehouseItems_OnChange(sender)
        {
            checkCount = setCheckedStateAllVisibleItems(c_itemGrid, sender.checked);

            setCommonToolbarButtonEnabled(buttonViewRowID, checkCount > 0 && checkCount == 1);
           
			<%
				if (Master.WriteAccess)
				{%>
				setCommonToolbarButtonEnabled(buttonEditRowID, checkCount > 0 && checkCount == 1);
					
				<%} %>
            setToolbarButtonEnabled(buttonExportID, checkCount > 0);
            
            //setToolbarButtonEnabled(buttonDeleteID, checkCount > 0);
            PageMethods.GetWareHouseRemovability(getSelectedIds(), callMethod_Success, callMethod_Failure);

        }
    
        // sets the checked state of all visible item to checked
        // returns number of visible items
        function setCheckedStateAllVisibleItems(grid, checked)
        {
            var itemIndex = 0;
            var visibleCount = 0;
            var searchTerm = searchboxElement().value;

            grid.beginUpdate();
            
            while (gridItem = grid.Table.GetRow(itemIndex))
            {
                if (isItemVisible(gridItem, searchTerm))
                {
                    gridItem.SetValue(0, checked, true);
                    
                    if (checked)
                    {
                        visibleCount++;
                    }
                }
                else
                {
                    gridItem.SetValue(0, false, true);
                }
                
                itemIndex++;
            }
            
            grid.endUpdate();
            
            return visibleCount;
        }

        // returns true/false depending on whether the item is visible or not
        function isItemVisible(item, filter)
        {
            var cells = item.get_cells();
            filter = filter.toLowerCase();
            
            for (i = 0, l = cells.length; i < l; i++)
            {
                if (cells[i].get_text().toLowerCase().indexOf(filter) > -1)
                {            
                    return true;
                }
            }
            
            return false;
        }    

        // returns the input text element used for searching
        function searchboxElement()
        {
            return getElementsByClassName(document, 'SearchBox')[0];
        }        


        function onCheckChange(sender, eventArgs)
        {
            checkBoxClicked = true;
        }
        
        function onItemSelect(sender, eventArgs)
        {
            var orderID = '';
            var checked = eventArgs.get_item().get_cells()[0].get_value();
            if (!checkBoxClicked) 
            {
                c_itemGrid.beginUpdate();
                eventArgs.get_item().SetValue(0, ! checked);
                c_itemGrid.endUpdate();
            } 
            else 
            {
                checkBoxClicked = false;
            }
        
            if(eventArgs.get_item().get_cells()[0].get_value()) 
            {
                checkCount++;
            } 
            else
            {
                checkCount--;
            }
			<%if (Master.WriteAccess){%>				
				setCommonToolbarButtonEnabled(buttonEditRowID, checkCount > 0 && checkCount == 1);
				setCommonToolbarButtonEnabled(buttonDeleteID, checkCount > 0);
			<%} %>
            setCommonToolbarButtonEnabled(buttonViewRowID, checkCount > 0 && checkCount == 1);
           
            setToolbarButtonEnabled(buttonExportID, checkCount > 0);
            
            var selectedIds = getSelectedIds();
            if (selectedIds == '')
            {
                setCommonToolbarButtonEnabled(buttonViewRowID, false);
                setCommonToolbarButtonEnabled(buttonEditRowID, false);
                setCommonToolbarButtonEnabled(buttonDeleteID, false);
                setToolbarButtonEnabled(buttonExportID, false);
            }
            else
            {
                PageMethods.GetWareHouseRemovability(selectedIds, callMethod_Success, callMethod_Failure);
            }
        }
        
     

        function setToolbarButtonEnabled(id, enabled)
        {
            c_toolbarStockBalance.get_items().getItemById(id).set_enabled(enabled);
        }

        function callMethod_Failure(errors, userContext, methodName) 
        {    
            alert(errors.get_message()); 
        }  

        function callMethod_Success(results, userContext, methodName) 
        {
            if (methodName == 'GetWareHouseRemovability')
            {
                if (results == 'true')
                {	<%
					if (Master.WriteAccess)
					{%>
					setCommonToolbarButtonEnabled(buttonDeleteID, true);
						
					<%} %>
                    
                   }
                else
                {
                    setCommonToolbarButtonEnabled(buttonDeleteID, false);
                    }
            }
        }

        function toolbarItemSelected(sender, eventArgs) {
        	var toolbarItem = eventArgs.get_item().get_id();
        	if (toolbarItem == 'c_toolbarItemAdd') {
        		document.location = '<%= ResolveUrl(UrlConstants.WAREHOUSE_ADD_EDIT) %>';
        	}
        	if (toolbarItem == 'c_toolbarItemImport') {
        		__doPostBack("import");
        	}
        	if (toolbarItem == 'c_toolbarImportAbort') {
        		__doPostBack("importabort");
        	}
        	if (toolbarItem == 'c_toolbarImportFile') {
        		__doPostBack("importfile");
        	}
        }
           		
	</script>
</Telerik:RadScriptBlock>
	<ComponentArt:ToolBar ID="c_toolbarStockBalance" AutoPostBackOnSelect="true" OnItemCommand="ToolBar_ItemCommand"
		runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16">
		<Items runat="server">
			<ComponentArt:ToolBarItem ID="c_toolbarItemExport" runat="server" ImageUrl="icons_standard/export.png"
				Enabled="false" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
			<ComponentArt:ToolBarItem ID="c_toolbarItemImport" AutoPostBackOnSelect="false" Enabled="false"
				runat="server" ImageUrl="icons_standard/import.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
		</Items>
		<ClientEvents>
			<ItemSelect EventHandler="toolbarItemSelected" />
			<ItemBeforeSelect EventHandler="c_toolbarStockBalance_ItemBeforeSelect" />
		</ClientEvents>
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
									alt="" style="display: block;" />
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
		</ClientTemplates>
	</ComponentArt:ToolBar>
	<ComponentArt:ToolBar ID="c_toolbarImportToolbar" Visible="false" AutoPostBackOnSelect="false"
		OnItemCommand="ToolBar_ItemCommand" runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16">
		<Items runat="server">
			<ComponentArt:ToolBarItem ID="c_toolbarImportAbort" runat="server" ImageUrl="icons_standard/sign_stop.png"
				CausesValidation="False" ClientTemplateId="c_toolbarLeftTreeItemButtonsTemplate" />
			<ComponentArt:ToolBarItem ID="c_toolbarImportFile" runat="server" ImageUrl="icons_standard/import.png"
				ClientTemplateId="c_toolbarLeftTreeItemButtonsTemplate" />
		</Items>
		<ClientEvents>
			<ItemSelect EventHandler="toolbarItemSelected" />
		</ClientEvents>
		<ClientTemplates>
			<ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemButtonsTemplate">
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
		</ClientTemplates>
	</ComponentArt:ToolBar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" class="litIconShelf" alt="" />
	<asp:Label ID="warehouseBreadcrumb" Text="" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<asp:PlaceHolder runat="server" ID="c_listPlaceHolder">
 <Telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
		<script type="text/javascript">
			//<![CDATA[
			var selectedItemCount = 0;

			function selectGridItem(sender, eventArgs) {
				selectedItemCount = selectedItemCount + 1;
				c_toolbarStockBalance.beginUpdate();
				changeToolbarStatus();
				c_toolbarStockBalance.endUpdate();
			}

			function unselectGridItem(sender, eventArgs) {
				selectedItemCount = selectedItemCount - 1;
				c_toolbarStockBalance.beginUpdate();
				changeToolbarStatus();
				c_toolbarStockBalance.endUpdate();
			}
			function changeToolbarStatus() {

				if (selectedItemCount == 1) {
				<%if (Master.WriteAccess)
					{%>		
						setCommonToolbarButtonEnabled(buttonViewRowID, true);
						setCommonToolbarButtonEnabled(buttonEditRowID, true);
					<%}%>
				}
				else {
					setCommonToolbarButtonEnabled(buttonViewRowID, false);
					setCommonToolbarButtonEnabled(buttonEditRowID, false);
				}
				if (selectedItemCount > 0) {
				<%if (Master.WriteAccess)
					{%>	
						setCommonToolbarButtonEnabled(buttonDeleteID, true);
					<%
					}%>
					c_toolbarStockBalance.get_items().getItem(0).set_enabled(true);
				} else {
					setCommonToolbarButtonEnabled(buttonDeleteID, false);
					c_toolbarStockBalance.get_items().getItem(0).set_enabled(false);
				}
			}
			c_toolbarStockBalance.beginUpdate();
			if (selectedItemCount == 0) {
				setCommonToolbarButtonEnabled(buttonDeleteID, false);
				c_toolbarStockBalance.get_items().getItem(0).set_enabled(false);
			}
			c_toolbarStockBalance.endUpdate();
		</script>
</Telerik:RadScriptBlock>
		<div class="lsContentNoScroll">
			<LS:GridHelperAjax runat="server" AssociatedControlID="c_warehouseItemsGrid" ID="c_warehouseItemsGridHelper"
				OnNeedData="grid_NeedData" DataKeyName="ID" />
			<Telerik:RadGrid AllowPaging="true" AllowMultiRowSelection="true" runat="server"
				ID="c_warehouseItemsGrid">
				<ClientSettings>
					<Selecting AllowRowSelect="true" />
					<ClientEvents OnRowSelecting="selectGridItem" OnRowDeselecting="unselectGridItem" />
				</ClientSettings>
				<MasterTableView runat="server" ClientDataKeyNames="ID">
					<Columns>
						<Telerik:GridClientSelectColumn HeaderStyle-Width="30" />
						<Telerik:GridBoundColumn DataField="Name" />
						<Telerik:GridBoundColumn DataField="Description" />
						<Telerik:GridBoundColumn DataField="Address" />
						<Telerik:GridBoundColumn DataField="ID" Display="false" />
						<Telerik:GridBoundColumn DataField="IsDefault" Display="false" />
					</Columns>
				</MasterTableView>
			</Telerik:RadGrid>
		</div>
	</asp:PlaceHolder>
	<asp:PlaceHolder runat="server" ID="c_importPlaceHolder" Visible="false">
		<div class="lsContentScroll">
			<asp:Panel runat="server" ID="c_importErrorPanel" Visible="false">
				<img src="Images/transparent.gif" style="vertical-align: middle;" alt="" class="litIconError" /><span
					class="litErrorMsg"><Foundation:ModuleString ID="ModuleString5" runat="server" Name="PriceListImportError" />
				</span>
				<br />
				<br />
			</asp:Panel>
			<div class="litText">
				<Foundation:ModuleString ID="ModuleString3" runat="server" Name="SettingsImportDescription1" />
				<br />
				<br />
				<Foundation:ModuleString ID="ModuleString4" runat="server" Name="SettingsImportDescription2" />
				<br />
				<br />
			</div>
			<%--<div class="litText">
                <asp:CheckBox runat="server" ID="c_importArticle" /><Foundation:ModuleString ID="ModuleString2"
                    runat="server" Name="PriceListImportArticle" />
                <br />
                <br />
            </div>--%>
			<div style="float: left;">
				<asp:FileUpload runat="server" ID="c_importFile" CssClass="litInputText" size="63" /></div>
			<div style="float: left; padding-left: 10px; padding-top: 2px;">
				<asp:RequiredFieldValidator runat="server" ID="c_validatorImportFile" ControlToValidate="c_importFile"
					Display="Dynamic" />
			</div>
			<div style="clear: both;">
			</div>
			<br />
			<br />
		</div>

		<script type="text/javascript">
			var submitObject = document.getElementById("<%=c_toolbarItemImport.ClientID%>");
			var cancelObject = document.getElementById("<%=c_toolbarImportAbort.ClientID%>");
			document.onkeypress = function(e) { var key = (window.event) ? window.event.keyCode : e.keyCode; if (key == 27) simulateClick(cancelObject); else if (key == 13) simulateClick(submitObject); }
		</script>

	</asp:PlaceHolder>
</asp:Content>
