<%@ page language="C#" masterpagefile="~/LitiumStudio/ECommerce/Framework/Base1.master" enableeventvalidation="false" autoeventwireup="true" inherits="LitiumStudio_ECommerce_Payments, Litum.Studio.Web" %>

<%@ Register TagPrefix="Pages" TagName="PaymentInformationPopup" Src="~/LitiumStudio/ECommerce/WebUserControls/EditPaymentDialog.ascx" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ECommerce/Framework/Base1.master" %>
<asp:Content ID="ToolbarScripts" ContentPlaceHolderID="Scripts" runat="server">
 <script type="text/javascript">

		var cancelDeselect = false;
		var cancelSelect = false;
        var selectedItemsCount = 0;
        var selectedPaymentCount = 0;       
	
		function ResetToolbar()
		{
		    setToolbarButtonEnabled("c_toolbarItemReserve", false);
			setToolbarButtonEnabled("c_toolbarItemCharge", false);
			setToolbarButtonEnabled("c_toolbarItemCancel", false);
			setCommonToolbarButtonEnabled("c_toolbarItemEdit", false);
			setToolbarButtonEnabled("c_toolbarItemReturn", false);
			setToolbarButtonEnabled("c_toolbarItemSynchronize", false);
			setCommonToolbarButtonEnabled("c_toolbarItemView", false);
            setToolbarButtonEnabled("c_toolbarItemPageNavigation", false);
		}
		
		function callMethod_Success(results, userContext, methodName)
		{
            selectedPaymentCount = parseInt(results);
            $get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = selectedPaymentCount == $find("<%= c_paymentsGrid.ClientID %>").get_masterTableView()._virtualItemCount && selectedPaymentCount != 0;
		}
		function callMethod_Failure(errors, userContext, methodName) {
			alert(errors.get_message());
		}

		// Enables or disables a button in the toolbar.
		function setToolbarButtonEnabled(id, enabled) {
			c_toolbarPayments.get_items().getItemById(id).set_enabled(enabled);
		}
        function CommonToolBarButtonCommand(sender, eventArgs) {
			var toolbarItem = eventArgs.get_item().get_id();
			if (toolbarItem == 'c_toolbarItemEdit') {
				ShowPaymentInformationPopup();
			}
		}
    
		// called from the toolbar on item select event.
		function ToolbarButtonCommand(sender, eventArgs) {
			var toolbarItem = eventArgs.get_item().get_id();
			if (toolbarItem == 'c_toolbarItemReserve') {
				<%=Page.ClientScript.GetPostBackClientHyperlink(DynamicHiddenButton, "reserve", true).Substring("javascript:".Length) %>;
				
			}
			else if (toolbarItem == 'c_toolbarItemCharge') {
				<%=Page.ClientScript.GetPostBackClientHyperlink(DynamicHiddenButton, "charge", true).Substring("javascript:".Length) %>;
				
			}
			else if (toolbarItem == 'c_toolbarItemCancel') {
				__doPostBack('cancel', '');
				
			}
			else if (toolbarItem == 'c_toolbarItemSynchronize') {
				__doPostBack('synchronize', '');
				
			}
			else if (toolbarItem == 'c_toolbarItemReturn') {
				var confirmationMessage = '<%= ConfirmationMessage %>';
				var confirmed = confirm(confirmationMessage);
				if (confirmed) {
				   setToolbarButtonEnabled("c_toolbarItemReturn", false); 
				    __doPostBack('return', '');
				   
				}
			}
		}

		// Called from toolbar item (edit)
		function ShowPaymentInformationPopup() {
			// Displays the edit payment dialog. 
			// This dialog is used to change payment information in case of an error in payment processing.
			// so that the user can change payment information and complete the payment.
            SetPaymentProviderIndex();
			EditPaymentDialog.show();
		}

		function SetPaymentProviderIndex() {
		    var grid = $find("<%=c_paymentsGrid.ClientID %>"); 
		    var selectedItems = grid.get_masterTableView().get_selectedItems();
		    if(selectedItems.length > 0)
		    {
                var paymentProvider = GetRadGridColumnValue(grid,selectedItems[0]._itemIndexHierarchical,"PaymentProvider");
		        var paymentMethod = GetRadGridColumnValue(grid,selectedItems[0]._itemIndexHierarchical,"PaymentMethod");
		        
		        if(paymentMethod != null && paymentProvider != null)
		        {
		            //this key should match the key used in the EditPaymentDialog.
		            var key = paymentProvider +"-"+ paymentMethod;
		        	var paymentMethodsDropDown = document.getElementById("<%=PaymentInfoDropDownListPaymentMethodOptionsControlID%>");
                    for (var i = 0; i < paymentMethodsDropDown.options.length; i++) 
                    {
				        if (paymentMethodsDropDown.options[i].value == key)
				        {
				            paymentMethodsDropDown.selectedIndex = i;
					        break;
					    }
			        }
		        }
		    }		    
		}

		// called from the on change event of the payment providers dropdown.
        function callMethod_Success_RebindMethodList(results, userContext, methodName) {
            if (results != '') {
                var state = new Array();
                document.getElementById("<%=c_paymentMethodDropDownList.ClientID%>").length = 0;
                if (results.indexOf('-') != -1) {
                    var stateInfo = new Array();
                    stateInfo = results.split('-');

                    var i = 0;
                    for (i = 0; i < stateInfo.length; i++) {
                        state = stateInfo[i].split(',');
                        var opt = document.createElement("option");
                        opt.text = state[1];
                        opt.value = state[0];
                        document.getElementById("<%=c_paymentMethodDropDownList.ClientID%>").options.add(opt);
                    }
                }
                else {
                    // Only one state. so no need to split it by - character.
                    state = results.split(',');
                    var opt = document.createElement("option");
                    opt.text = state[1];
                    opt.value = state[0];
                    document.getElementById("<%=c_paymentMethodDropDownList.ClientID%>").options.add(opt);
                }
            }
        }

		
		// called from the OK (update) button on the edit payment popup.
		function SavePayment() {
			var hiddenPaymentMethod = document.getElementById("<%=c_hiddenPaymentMethod.ClientID%>");
			selIndex = document.getElementById("<%= PaymentInfoDropDownListPaymentMethodOptionsControlID %>").selectedIndex;
			hiddenPaymentMethod.value = document.getElementById("<%= PaymentInfoDropDownListPaymentMethodOptionsControlID %>").options[selIndex].value;
    		__doPostBack('edit', 'change');
		}
        
        //return the value of the selected column, at row pointed out by itemIndex
        function GetRadGridColumnValue(grid, itemIndex, columnName)
        {
              var MasterTable = grid.get_masterTableView();
              var row = MasterTable.get_dataItems()[itemIndex];
              if(row != null)
              {
                  var cell = MasterTable.getCellByColumnUniqueName(row, columnName);
                  if(navigator.appName == "Microsoft Internet Explorer")
                        return cell.innerText;
                    else
                        return cell.textContent;
              }
              else
                  return null;
        }       

		function RowSelecting(sender, args, gridHelper) {
            if (args._domEvent.type != null) {
                var items = gridHelper.GetSelectedKeys();
                selectedItemsCount = items.length;
                
                //Sets the selected order id in the kreditor popup page.
                var orderId = '';
                if(navigator.appName == "Microsoft Internet Explorer")
                    orderId = sender.get_masterTableView().get_element().tBodies[0].rows[args._itemIndexHierarchical].cells[2].innerText;
                else
                    orderId = sender.get_masterTableView().get_element().tBodies[0].rows[args._itemIndexHierarchical].cells[2].textContent;
                
                SetPaymentInfo(sender, args, orderId);
                
                if (items.length > 1) {
                    ResetToolbar();
                }
                else
                {
                    setCommonToolbarButtonEnabled("c_toolbarItemView", true);
                    setToolbarButtonEnabled("c_toolbarItemSynchronize", true);
                }
                setToolbarButtonEnabled("c_toolbarItemPageNavigation", true);               
                
                if (items.length == 1)
                {
                    <%  if (Master.WriteAccess)
				    {%>
                    //updates the toolbar with the apropriate buttons enabled.
                	setToolbarButtonEnabled("c_toolbarItemCharge", GetRadGridColumnValue(sender, args._itemIndexHierarchical,"CanCharge").toLowerCase()=='true');
			        setToolbarButtonEnabled("c_toolbarItemReserve", GetRadGridColumnValue(sender, args._itemIndexHierarchical,"CanReserve").toLowerCase()=='true');
			        setToolbarButtonEnabled("c_toolbarItemCancel", GetRadGridColumnValue(sender, args._itemIndexHierarchical,"CanCancel").toLowerCase()=='true');
			        setCommonToolbarButtonEnabled("c_toolbarItemEdit", GetRadGridColumnValue(sender, args._itemIndexHierarchical,"CanEdit").toLowerCase()=='true');
			        setToolbarButtonEnabled("c_toolbarItemReturn", GetRadGridColumnValue(sender, args._itemIndexHierarchical,"CanReturn").toLowerCase()=='true');
			        <%
				    }%>
                }
                PageMethods.UpdateSelectedPayments(args._dataKeyValues.PaymentInfoId, 'true', callMethod_Success, callMethod_Failure);
           }
           else {
           	if (cancelSelect)
           		args.set_cancel(true);
           }
        }
        
        function RowDeselecting(sender, args, gridHelper) {
            if (args._domEvent.type != null) {
                var items = gridHelper.GetSelectedKeys();
                selectedItemsCount = items.length;
                
                //Sets the selected order id in the kreditor popup page.
                var orderId = '';
                if(navigator.appName == "Microsoft Internet Explorer")
                    orderId = sender.get_masterTableView().get_element().tBodies[0].rows[args._itemIndexHierarchical].cells[2].innerText;
                else
                    orderId = sender.get_masterTableView().get_element().tBodies[0].rows[args._itemIndexHierarchical].cells[2].textContent;
                
                SetPaymentInfo(sender, args, orderId);
                
                if (items.length != 1) {
                    ResetToolbar();
                }
                else
                {
                    if(items.length == 1)
                    {
                        setCommonToolbarButtonEnabled("c_toolbarItemView", true);
                        setToolbarButtonEnabled("c_toolbarItemSynchronize", true);
                    }
                    else if(items.length > 1)
                        setToolbarButtonEnabled("c_toolbarItemPageNavigation", true);
                }
                
                if (items.length == 0) {
                	PageMethods.ClearSelectedPayments(callMethod_Success, callMethod_Failure);
                }
                else
                {
                    PageMethods.UpdateSelectedPayments(args._dataKeyValues.PaymentInfoId, 'false', callMethod_Success, callMethod_Failure);
                }
                
                
                if (items.length == 1)
                {
                     <%  if (Master.WriteAccess)
				    {%>
                    //updates the toolbar with the apropriate buttons enabled.
                	setToolbarButtonEnabled("c_toolbarItemCharge", GetRadGridColumnValue(sender, args._itemIndexHierarchical,"CanCharge").toLowerCase()=='true');
			        setToolbarButtonEnabled("c_toolbarItemReserve", GetRadGridColumnValue(sender, args._itemIndexHierarchical,"CanReserve").toLowerCase()=='true');
			        setToolbarButtonEnabled("c_toolbarItemCancel", GetRadGridColumnValue(sender, args._itemIndexHierarchical,"CanCancel").toLowerCase()=='true');
			        setCommonToolbarButtonEnabled("c_toolbarItemEdit", GetRadGridColumnValue(sender, args._itemIndexHierarchical,"CanEdit").toLowerCase()=='true');
			        setToolbarButtonEnabled("c_toolbarItemReturn", GetRadGridColumnValue(sender, args._itemIndexHierarchical,"CanReturn").toLowerCase()=='true');
			        <%
				    }%>
                }
            }
			else {
				if (cancelDeselect) {
					args.set_cancel(true);
				}
			}
        }
        
        function SetPaymentInfo(sender, args, orderId)
        {
             
                // Sets the selected order in the current page
                document.getElementById("<%=c_hiddenOrderId.ClientID%>").value = orderId;
                // Sets the payment status of the selected payment to the hidden field.
                document.getElementById("<%=c_hiddenPaymentStatus.ClientID%>").value = sender.get_masterTableView().get_element().tBodies[0].rows[args._itemIndexHierarchical].cells[4].textContent; ;
                // Sets the payment provider of the selected payment to the hidden field.
                document.getElementById("<%=c_hiddenPaymentProvider.ClientID%>").value = sender.get_masterTableView().get_element().tBodies[0].rows[args._itemIndexHierarchical].cells[7].textContent; ;

                // Sets the payment status of the selected payment to the hidden field.
                document.getElementById("<%=c_hiddenInitialPaymentMethod.ClientID%>").value = sender.get_masterTableView().get_element().tBodies[0].rows[args._itemIndexHierarchical].cells[7].textContent; ;
                // Sets the payment provider of the selected payment to the hidden field.
                document.getElementById("<%=c_hiddenInitialPaymentProvider.ClientID%>").value = sender.get_masterTableView().get_element().tBodies[0].rows[args._itemIndexHierarchical].cells[9].textContent;

                // fill controls in the payment information popup
                document.getElementById("<%=PaymentInfoHiddenOrderIdControlID%>").value = orderId;
        }
       
        function DateSelectedFrom(sender, eventArgs) {
            var date = '';
            if (eventArgs.get_newValue() != null) {
                date = eventArgs.get_newValue();
            }
            $get('<%= c_hiddenPaymentFromDate.ClientID %>').value = date;
            var tableView = $find("<%= c_paymentsGrid.ClientID %>").get_masterTableView();
            tableView.clearSelectedItems();
            ResetToolbar();
            updateGrid(true);
        }

        function DateSelectedTo(sender, eventArgs) {
            var date = '';
            if (eventArgs.get_newValue() != null) {
                date = eventArgs.get_newValue();
            }
            $get('<%= c_hiddenPaymentToDate.ClientID %>').value = date;
            var tableView = $find("<%= c_paymentsGrid.ClientID %>").get_masterTableView();
            tableView.clearSelectedItems();
            ResetToolbar();
            updateGrid(true);
        }

        function ChangeStatus() {
            $get('<%= c_hiddenPaymentStatusFilter.ClientID %>').value = $get('<%= ddlStatuses.ClientID %>').value;
            var tableView = $find("<%= c_paymentsGrid.ClientID %>").get_masterTableView();
            tableView.clearSelectedItems();
            ResetToolbar();
            updateGrid(true);
        }

        function ChangeProvider() {
            var paymentProviderId = $get('<%= c_paymentProviderDropDownList.ClientID %>').value;
            $get('<%= c_hiddenPaymentProviderFilter.ClientID %>').value = paymentProviderId;
            var tableView = $find("<%= c_paymentsGrid.ClientID %>").get_masterTableView();
            tableView.clearSelectedItems();
            if(paymentProviderId == '')
            {
                $get('<%= c_hiddenPaymentMethodFilter.ClientID %>').value = '';
            }
            ResetToolbar();
            updateGrid(true);
            PageMethods.RebindPaymentMethods($get('<%= c_paymentProviderDropDownList.ClientID %>').value, callMethod_Success_RebindMethodList);
        }

        function ChangeMethod() {
            $get('<%= c_hiddenPaymentMethodFilter.ClientID %>').value = $get('<%= c_paymentMethodDropDownList.ClientID %>').value;
            var tableView = $find("<%= c_paymentsGrid.ClientID %>").get_masterTableView();
            tableView.clearSelectedItems();
            ResetToolbar();
            updateGrid(true);
        }

        function updateGrid(clearOrderIDs) {
            var tableView = $find("<%= c_paymentsGrid.ClientID %>").get_masterTableView();
            if (clearOrderIDs) {
                $get('<%= c_hiddenOrderIDs.ClientID %>').value = '';
            }
            tableView.rebind();
        }

        function ClearFilters() {
            var calendar = $find("<%= c_calendarFromDate.ClientID %>");
            calendar.clear();
            $get('<%= c_hiddenPaymentFromDate.ClientID %>').value = '';
            var calendar1 = $find("<%= c_calendarToDate.ClientID %>");
            calendar1.clear();
            $get('<%= c_hiddenPaymentToDate.ClientID %>').value = '';
            $get('<%= ddlStatuses.ClientID %>').selectedIndex = 0;
            $get('<%= c_paymentProviderDropDownList.ClientID %>').selectedIndex = 0;
            $get('<%= c_paymentMethodDropDownList.ClientID %>').selectedIndex = 0;
            $get('<%= c_hiddenPaymentStatusFilter.ClientID %>').value = '-1';
            $get('<%= c_hiddenPaymentMethodFilter.ClientID %>').value = '';
            $get('<%= c_hiddenPaymentProviderFilter.ClientID %>').value = '';
            updateGrid(true);
        }
           
		function HeaderShowing(sender, args) {
			$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = selectedPaymentCount == $find("<%= c_paymentsGrid.ClientID %>").get_masterTableView()._virtualItemCount;
		}

		function SelectAllClick(sender) {
			if (sender.checked) {
				SelectAllPayments();
			}
			else {
				ClearSelectedPayments();
			}
		}

		function SelectAllPayments() {
			var tableView = $find("<%= c_paymentsGrid.ClientID %>").get_masterTableView();
			tableView.clearSelectedItems();
			cancelDeselect = true;
			tableView.selectAllItems();
			PageMethods.SelectAllPayments(callMethod_Success, callMethod_Failure);
			cancelDeselect = false;
		}

		function ClearSelectedPayments() {
			var tableView = $find("<%= c_paymentsGrid.ClientID %>").get_masterTableView();
			cancelSelect = true;
			tableView.clearSelectedItems();
			if (tableView.get_selectedItems().length > 0)
				tableView.selectAllItems();
			cancelSelect = false;
			PageMethods.ClearSelectedPayments(callMethod_Success, callMethod_Failure);
		}
		
		function RowDeselected(sender, args, gridHelper) {
			if ($get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked)
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = false;
		}

	</script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	
    
	<div style="float:left;">
	    <Pages:PaymentInformationPopup ID="PaymentInformationPopupPage" runat="server" />
	    <ComponentArt:ToolBar ID="c_toolbarPayments" OnItemCommand="c_toolbarPayments_ItemCommand"
		    runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		    DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		    DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
		    ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		    DefaultItemImageHeight="16">
		    <Items runat="server">
			    <ComponentArt:ToolBarItem ID="c_toolbarItemReserve" runat="server" ImageUrl="icons_standard/navigate_check_16px.png"
				    CausesValidation="False" Enabled="false" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			    <ComponentArt:ToolBarItem ID="c_toolbarItemCharge" runat="server" ImageUrl="icons_standard/cashier_16px.png"
				    CausesValidation="False" Enabled="false" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			    <ComponentArt:ToolBarItem ID="sep2" runat="server" ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif"
				    ImageHeight="16" ImageWidth="2" />
			    <ComponentArt:ToolBarItem ID="c_toolbarItemCancel" runat="server" ImageUrl="icons_standard/sign_stop.png"
				    CausesValidation="False" Enabled="false" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			    <ComponentArt:ToolBarItem ID="c_toolbarItemReturn" runat="server" ImageUrl="icons_standard/undo_16px.png"
				    CausesValidation="False" Enabled="false" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			    <ComponentArt:ToolBarItem ID="sep3" runat="server" ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif"
				    ImageHeight="16" ImageWidth="2"/>
			    <ComponentArt:ToolBarItem ID="c_toolbarItemSynchronize" runat="server" ImageUrl="icons_standard/document_exchange_16px.png"
				    CausesValidation="False" Enabled="true" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			    <ComponentArt:ToolBarItem ID="c_toolbarItemPageNavigation" runat="server" ImageUrl="icons_standard/view.png"
				    ItemType="DropDown" DropDownId="c_menuNavigation" DropDownImageUrl="toolbar/dropdown.gif"
				    DropDownImageWidth="16" DropDownImageHeight="16" ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate"/>
			    
			    <%--<ComponentArt:ToolBarItem ID="c_toolbarItemTest" Text = "AurigaTest" ImageUrl="icons_standard/pencil.png" CausesValidation="False" Enabled = "true" />--%>
		    </Items>
		    <ClientEvents>
			    <ItemSelect EventHandler="ToolbarButtonCommand" />
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
	    <ComponentArt:Menu runat="server" ID="c_menuNavigation" ImagesBaseUrl="~/LitiumStudio/Images/"
		    CssClass="litNavMenuGroup" DefaultItemLookId="DefaultItemLook" DefaultGroupItemSpacing="1"
		    DefaultItemTextAlign="Left" DefaultItemTextWrap="false" DefaultGroupExpandOffsetX="0"
		    DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto" TopGroupExpandDirection="BelowLeft"
		    TopGroupExpandOffsetY="0" CollapseDuration="100" CollapseSlide="ExponentialDecelerate"
		    ExpandDuration="100" ExpandSlide="ExponentialDecelerate" ExpandDelay="0" ExpandOnClick="false"
		    CascadeCollapse="true" CollapseDelay="10000" HideSelectElements="false" HighlightExpandedPath="true"
		    KeyboardEnabled="true" OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true"
		    ShadowOffset="2" Orientation="Vertical" ContextMenu="Custom" OnItemSelected="c_menuNavigation_ItemSelected" Width="109">
		    <ItemLooks>
			    <ComponentArt:ItemLook LookId="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16"
				    CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive"
				    HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10"
				    LabelPaddingRight="10" LabelPaddingTop="3" />
			    <ComponentArt:ItemLook LookId="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16"
				    CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10"
				    LabelPaddingRight="10" LabelPaddingTop="3" />
		    </ItemLooks>
	    </ComponentArt:Menu>
	 </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
    <img src="Images/transparent.gif" style="vertical-align:middle; margin-right:5px;" class="litIconPayment" alt="" />
    <Foundation:ModuleString ID="ModuleString5" Name="Payments" Runat="server"/>
</asp:Content>
<asp:Content ID="LitiumStudioFilterArea" ContentPlaceHolderID="LitiumStudioFilterArea"
	runat="server">
	<LS:FilterAreaSetting ID="FilterAreaSetting1" runat="server" FilterAreaState="Open" />
	<div style="padding-bottom: 3px;display :inline;">
	    <div>
	        <span class="lsFilterItem">
		        <Foundation:ModuleString Name="PaymentFilterStartDate" runat="server" ID="c_moduleStringDateSelection" />
		        <LS:DateTimeHelper ID="DateTimeHelper2" AssociatedControlID="c_calendarFromDate"
			        runat="server" />
		        <Telerik:RadDatePicker runat="server" Width="160" ID="c_calendarFromDate" AutoPostBack="false"
			        EnableTyping="false" style=" margin-left: 5px;">
			        <ClientEvents OnDateSelected="DateSelectedFrom" />
		        </Telerik:RadDatePicker>
		    </span>
		    <span class="lsFilterItem">
		        <Foundation:ModuleString Name="PaymentFilterStatus" runat="server" ID="ModuleString3" />
		        <asp:DropDownList ID="ddlStatuses" runat="server" Style="vertical-align: middle; margin-left: 9px;"
			        onchange="ChangeStatus()" Width="150px" />
			</span>
		</div>
		<div>
		    <span class="lsFilterItem">
		        <Foundation:ModuleString Name="PaymentFilterEndDate" runat="server" ID="ModuleString2" />
		        <LS:DateTimeHelper ID="DateTimeHelper3" AssociatedControlID="c_calendarToDate" runat="server" />
		        <Telerik:RadDatePicker runat="server" ID="c_calendarToDate" Width="160" AutoPostBack="false"
			        EnableTyping="false" style=" margin-left: 9px;">
			        <ClientEvents OnDateSelected="DateSelectedTo" />
		        </Telerik:RadDatePicker>
    		 </span> 
    		 <span class="lsFilterItem">  
		        <Foundation:ModuleString Name="PaymentFilterMethod" runat="server" ID="ModuleString1" />
		        <asp:DropDownList runat="server" ID="c_paymentMethodDropDownList" onchange="ChangeMethod()" Width="150" style="margin-left: 4px;" />
		     </span>
		     <span class="lsFilterItem">
		        <Foundation:ModuleString Name="PaymentFilterProvider" runat="server" ID="ModuleString4"  />		    
		    <asp:DropDownList runat="server" ID="c_paymentProviderDropDownList" onchange="ChangeProvider()" Width="150"  />	
		    </span>
		     <span class="lsFilterItem">
		        <asp:HyperLink runat="server" ID="c_hyperLinkClearFilter" Text="Clear filters" onclick="ClearFilters()" />
		    	<asp:CompareValidator ID="c_dateCompareValidator" runat="server" ControlToValidate="c_calendarToDate"
			        ControlToCompare="c_calendarFromDate" Operator="GreaterThanEqual" Type="Date" style="width:0px;">
		        </asp:CompareValidator>
		     </span>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" class="noScroll"  runat="Server">
    <div class="lsContentNoScroll">
        <LS:GridHelperAjax runat="server" ID="m_paymentsHelper" AssociatedControlID="c_paymentsGrid"
		    OnNeedData="grid_NeedData" DataKeyName="PaymentInfoId" AllowSorting="true"/>
	    <Telerik:RadGrid ID="c_paymentsGrid" runat="server" Style="height: 100%;" AllowMultiRowSelection="true" OnItemCreated="paymentsGrid_ItemCreated" OnDataBound="grid_radGridDataBound" OnItemDataBound="grid_itemDataBound" >
		    <ClientSettings>
			    <ClientEvents OnRowCreating="HeaderShowing" OnRowSelecting="RowSelecting" OnRowDeselecting="RowDeselecting" OnRowDeselected="RowDeselected" />
		    </ClientSettings> 
		    <MasterTableView runat="server" ClientDataKeyNames="PaymentInfoId">
		        <SortExpressions>
		            <Telerik:GridSortExpression  FieldName="FormattedPaymentDateTime" SortOrder="Descending" />
		        </SortExpressions>
		        <Columns>
		            <Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
    		        <Telerik:GridBoundColumn DataField="PaymentInfoId" Display="false" />
				    <Telerik:GridBoundColumn DataField="OrderID" Display="false" />
                    <Telerik:GridBoundColumn DataField="ReferenceId" />
				    <Telerik:GridBoundColumn DataField="ExternalOrderId" />
				    <Telerik:GridBoundColumn DataField="FormattedPaymentStatus" />
				    <Telerik:GridBoundColumn DataField="FormattedPaymentDateTime" />
				    <Telerik:GridBoundColumn DataField="FormattedPaymentMethod" />
				    <Telerik:GridBoundColumn DataField="PaymentProvider" />
				    <Telerik:GridBoundColumn DataField="FormattedAmountWithVat" ItemStyle-HorizontalAlign="right" HeaderStyle-HorizontalAlign="right" />
				    <Telerik:GridBoundColumn DataField="PaymentMethod" Display="false" />
				    <Telerik:GridBoundColumn DataField="CanCharge" Display="false" />
				    <Telerik:GridBoundColumn DataField="CanReserve" Display="false" />
				    <Telerik:GridBoundColumn DataField="CanCancel" Display="false" />
				    <Telerik:GridBoundColumn DataField="CanEdit" Display="false" />
				    <Telerik:GridBoundColumn DataField="CanReturn" Display="false" />
		        </Columns>
		    </MasterTableView>
	    </Telerik:RadGrid>
    	
	    <asp:UpdatePanel runat="server" ID="DynamicHolderUpdater" ChildrenAsTriggers="false"
		    UpdateMode="Conditional">
		    <ContentTemplate>
			    <asp:Button CssClass="litInputButton" runat="server" ID="DynamicHiddenButton" CausesValidation="false" Style="display: none;"
				    OnClick="DynamicButton_Click" />
		    </ContentTemplate>
	    </asp:UpdatePanel>
	    <asp:PlaceHolder runat="server" ID="DynamicHolder"></asp:PlaceHolder>
        <Telerik:RadScriptBlock ID="RadScriptBlock2" runat="server" >
	    <script type="text/javascript">
	    </script>
	    </Telerik:RadScriptBlock>
	    <asp:HiddenField ID="c_hiddenOrderId" runat="server" />
	    <asp:HiddenField ID="c_hiddenPaymentProvider" runat="server" />
	    <asp:HiddenField ID="c_hiddenPaymentMethod" runat="server" />
	    <asp:HiddenField ID="c_hiddenPaymentStatus" runat="server"/>
	    <asp:HiddenField ID="c_hiddenPaymentFromDate" runat="server" />
	    <asp:HiddenField ID="c_hiddenPaymentToDate" runat="server" />
	    <asp:HiddenField ID="c_hiddenOrderIDs" runat="server" />
	    <asp:HiddenField ID="c_hiddenPaymentMethodFilter" runat="server" />
	    <asp:HiddenField ID="c_hiddenPaymentStatusFilter" runat="server" Value="-1"  />
	    <asp:HiddenField ID="c_hiddenPaymentProviderFilter" runat="server"  />
    	
	    <asp:HiddenField ID="c_hiddenInitialPaymentMethod" runat="server" />
	    <asp:HiddenField ID="c_hiddenInitialPaymentProvider" runat="server" />
	    <asp:HiddenField ID="c_hiddenCustomParameter" runat="server" />
    	<asp:HiddenField ID="c_hiddenSelectAllClientID" value="" runat="server" />

    </div>

</asp:Content>
