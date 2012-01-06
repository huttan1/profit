<%@ page language="C#" masterpagefile="~/LitiumStudio/ECommerce/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_ECommerce_Deliveries, Litum.Studio.Web" %>
<%@ Import Namespace="Litium.Studio.UI.ECommerce.Common.Constants"%>
<%@ MasterType VirtualPath="~/LitiumStudio/ECommerce/Framework/Base1.master" %>

<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="Server">
<Telerik:RadCodeBlock runat="server">
<script type="text/javascript">

	var cancelDeselect = false;
	var cancelSelect = false;
	
        var checkBoxClicked = false;
        var checkCount = 0;
        var selectedIds;
        var selectedDeliveryCount = 0;         

        function setToolbarButtonEnabled(id, enabled) {
            c_toolbarDeliveries.get_items().getItemById(id).set_enabled(enabled);
        } 

        function callMethod_Failure(errors, userContext, methodName) {
            alert(errors.get_message());
        }

        function doPostBack(sender, eventArgs) {
            __doPostBack(sender, eventArgs);
        }

        function getStatesMenuItem(stateId, stateName) {
            var newItem = new ComponentArt.Web.UI.MenuItem();
            newItem.set_text(stateName);
            // Id later will be used to get the selected state.
            newItem.set_id('c_menuStatus_' + stateId);
            return newItem;
        }

        //return the value of the selected column, at row pointed out by itemIndex
        function GetRadGridColumnValue(grid, itemIndex, columnName)
        {
            var result = "";
            var MasterTable = grid.get_masterTableView();
            var row = MasterTable.get_dataItems()[itemIndex];
            if (row != null)
            {
                var cell = MasterTable.getCellByColumnUniqueName(row, columnName);
                if (cell != null)
                {
                    if (navigator.appName == "Microsoft Internet Explorer")
                        result = cell.innerText;
                    else
                        result = cell.textContent;
                }
            }
            return result;
        }
        
        function SetEditDeliveryStatusDropDown(sender, args, gridHelper, rowSelecting)
        {
            var deliveryCountByStatus = null;
            var deliveryCountByStatusString = $get('<%= c_hiddenDeliveryCountByStatus.ClientID %>').value;
            if (deliveryCountByStatusString != null && deliveryCountByStatusString.length > 0)
            {
                deliveryCountByStatus = JSON.parse(deliveryCountByStatusString);
                var currentDeliveryStatusId = GetRadGridColumnValue(sender, args._itemIndexHierarchical, "CurrentDeliveryStateId");
                if (rowSelecting)
                {
                    //increase the selection count.
                    for (i = 0; i < deliveryCountByStatus.length; i++)
                    {
                        if (deliveryCountByStatus[i].DeliveryStatusId == currentDeliveryStatusId)
                        {
                            deliveryCountByStatus[i].SelectedDeliveryCount += 1;
                            break;
                        }
                    }
                }
                else
                {
                    //now we are deselecting a row. decrease the count.
                    for (i = 0; i < deliveryCountByStatus.length; i++)
                    {
                        if (deliveryCountByStatus[i].DeliveryStatusId == currentDeliveryStatusId && deliveryCountByStatus[i].SelectedDeliveryCount > 0)
                        {
                            deliveryCountByStatus[i].SelectedDeliveryCount -= 1;
                            break;
                        }
                    }
                }
                deliveryCountByStatusString = JSON.stringify(deliveryCountByStatus);
                $get('<%= c_hiddenDeliveryCountByStatus.ClientID %>').value = deliveryCountByStatusString;
            }
            var editNextDeliveryStatusDropDownOptions = GetDeliveryStatusDropDownOptions(deliveryCountByStatus);
            PopulateEditDeliveryStatusDropDown(editNextDeliveryStatusDropDownOptions);
        }
        
        function GetDeliveryStatusDropDownOptions(deliveryCountByStatus)
        {
            var editNextDeliveryStatusDropDownOptions = null;
            if (deliveryCountByStatus != null)
            {
                //find the next set of statuses to populate the dropdown.
                var i = 0;
                for (i = 0; i < deliveryCountByStatus.length; i++)
                {
                    if (deliveryCountByStatus[i].SelectedDeliveryCount > 0)
                    {
                        if (editNextDeliveryStatusDropDownOptions == null)
                        {
                            //set to populate the edit status drop down with next statuses of
                            //first status found to have selected deliverys.
                            editNextDeliveryStatusDropDownOptions = deliveryCountByStatus[i].NextDeliveryStatuses;
                        }
                        else
                        {
                            //this condition will not be hit, if there is only one delivery status
                            //with more than one selected deliverys.                
                            //This condition is hit because, there are selected deliverys with a different delivery status.
                            editNextDeliveryStatusDropDownOptions = null;
                            break;
                        }
                    }
                }
            }
            return editNextDeliveryStatusDropDownOptions;
        }
        function PopulateEditDeliveryStatusDropDown(itemList)
        {
            c_menuEditStatus.get_items().clear();
            if ((itemList != null) && (itemList.length > 0))
            {
                var i = 0;
                for (i = 0; i < itemList.length; i++)
                {
                    c_menuEditStatus.get_items().add(getStatesMenuItem(itemList[i].DeliveryStatusID, itemList[i].Translation));
                }
                 <%  if (Master.WriteAccess)
				{%>
                setToolbarButtonEnabled('c_toolbarItemEditStatus', true);
                <%
				}%>
            }
            else
            {
                setToolbarButtonEnabled('c_toolbarItemEditStatus', false);
            }
        }
        
       function RowSelecting(sender, args, gridHelper) {
            if (args._domEvent.type != null) {
                var items = gridHelper.GetSelectedKeys();
                selectedIds = items;
                setCommonToolbarButtonEnabled('c_toolbarItemView', false);
                if (items.length == 1) {
                    setCommonToolbarButtonEnabled('c_toolbarItemView', true);
                }
                setToolbarButtonEnabled('c_toolbarItemPageNavigation', true);
                 <%  if (Master.WriteAccess)
				{%>
                setToolbarButtonEnabled('c_toolbarItemDeliveryProvider', true);
                <%
				}%>

                SetEditDeliveryStatusDropDown(sender, args, gridHelper, true);

                var grid = sender;
                var MasterTable = grid.get_masterTableView();
                $get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = items.length == MasterTable._virtualItemCount;

           }
           else {
           	if (cancelSelect)
           		args.set_cancel(true);
           }
       }

       function updateToolbar(selectedDeliveryCount) {      
           if (selectedDeliveryCount == 1)
               setCommonToolbarButtonEnabled('c_toolbarItemView', true);
           else
               setCommonToolbarButtonEnabled('c_toolbarItemView', false);
           if (selectedDeliveryCount > 0)
           {
               setToolbarButtonEnabled('c_toolbarItemPageNavigation', true);
                <%  if (Master.WriteAccess)
				{%>
               setToolbarButtonEnabled('c_toolbarItemDeliveryProvider', true);
               <%
				}%>
           }
           else
           {
               setToolbarButtonEnabled('c_toolbarItemPageNavigation', false);
               setToolbarButtonEnabled('c_toolbarItemDeliveryProvider', false);
           }
       }
       
        function RowDeselecting(sender, args, gridHelper) {
            if (args._domEvent.type != null) {

                var items = gridHelper.GetSelectedKeys();
                selectedIds = items;
                if (items != null && items.length > 0) {
                    if (items.length == 1) {
                        setCommonToolbarButtonEnabled('c_toolbarItemView', true);
                    }

                    setToolbarButtonEnabled('c_toolbarItemPageNavigation', true);
                    <%  if (Master.WriteAccess)
				    {%>
                    setToolbarButtonEnabled('c_toolbarItemDeliveryProvider', true);
                    <%
				    }%>
                }
                else {
                	ResetToolbar();
             }
             SetEditDeliveryStatusDropDown(sender, args, gridHelper, false);
			}
			else {
				if (cancelDeselect) {
					args.set_cancel(true);
				}
			}
        }

        function onEditDeliveryStatus(sender, eventArgs)
        {
            RadAjaxManager().showLoadingPanels("<%=c_deliveriesGrid.ClientID %>", RadAjaxManager().get_ajaxSettings());
            var menuItem = eventArgs.get_item().get_id();
            // State id is appended at the end of the menu item.
            var stateId = menuItem.substring(menuItem.lastIndexOf('_') + 1, menuItem.length);
            var deliveryCountByStatusString = $get('<%= c_hiddenDeliveryCountByStatus.ClientID %>').value;
            var gridHelper = Litium.Studio.UI.Common.WebControls.GridHelperAjax._instance['<%= c_deliveriesGrid.ClientID %>'];
            var selectedKeys = gridHelper.GetSelectedKeys();
            PageMethods.ChangeDeliveryStatus(stateId, deliveryCountByStatusString, selectedKeys, onEditDeliveryStatus_Success, callMethod_Failure);
        }

        function onEditDeliveryStatus_Success(results, userContext, methodName)
        {
            var deliveryCountByStatus = null;
            $get('<%= c_hiddenDeliveryCountByStatus.ClientID %>').value = results;
            if (results != null && results.length > 0)
                deliveryCountByStatus = JSON.parse(results);
            var editNextDeliveryStatusDropDownOptions = GetDeliveryStatusDropDownOptions(deliveryCountByStatus);
            PopulateEditDeliveryStatusDropDown(editNextDeliveryStatusDropDownOptions);
            updateGrid(false);
        }

        function onSelectAllClick(sender)
        {
            if (sender.checked)
            {
                cancelSelect = true;
                RadAjaxManager().showLoadingPanels("<%=c_deliveriesGrid.ClientID %>", RadAjaxManager().get_ajaxSettings());
                var deliveryStatus = $get('<%= c_hiddenDeliveryStatus.ClientID %>').value;
                var fromDate = $get('<%= c_hiddenDeliveryFromDate.ClientID %>').value;
                var toDate = $get('<%= c_hiddenDeliveryToDate.ClientID %>').value;
                var orderIds = $get('<%= c_hiddenOrderIDs.ClientID %>').value;
                var deliveryMethodID = $get('<%= c_hiddenDeliveryMethodID.ClientID %>').value;
                
                //first discard existing selections, then select all result set.
                ClearSelectedDeliveries();
                PageMethods.SelectAllDeliveries(deliveryStatus, deliveryMethodID, fromDate, toDate, orderIds, onSelectAllClick_Success, callMethod_Failure);
                cancelSelect = false;
            }
            else
            {
                cancelDeselect = true;
                ClearSelectedDeliveries();
                updateToolbar(0);
                updateGrid(true);
                cancelDeselect = false;
            }
        }

        function onSelectAllClick_Success(results, userContext, methodName)
        {
            var gridHelper = Litium.Studio.UI.Common.WebControls.GridHelperAjax._instance['<%= c_deliveriesGrid.ClientID %>'];
            gridHelper.SetSelectedKeys(results);
            var tableView = $find("<%= c_deliveriesGrid.ClientID %>").get_masterTableView();
            tableView.selectAllItems();
            SelectAllDeliveryCountByStatus();
            updateToolbar(results.length);
            updateGrid(false);
        }

        function SelectAllDeliveryCountByStatus()
        {
            var deliveryCountByStatus = null;
            var deliveryCountByStatusString = $get('<%= c_hiddenDeliveryCountByStatus.ClientID %>').value;
            if (deliveryCountByStatusString != null && deliveryCountByStatusString.length > 0)
            {
                deliveryCountByStatus = JSON.parse(deliveryCountByStatusString);
                //increase the selection count.
                for (i = 0; i < deliveryCountByStatus.length; i++)
                {
                    deliveryCountByStatus[i].SelectedDeliveryCount = deliveryCountByStatus[i].TotalDeliveryCount;
                }
                deliveryCountByStatusString = JSON.stringify(deliveryCountByStatus);
                $get('<%= c_hiddenDeliveryCountByStatus.ClientID %>').value = deliveryCountByStatusString;
            }
            var editNextDeliveryStatusDropDownOptions = GetDeliveryStatusDropDownOptions(deliveryCountByStatus);
            PopulateEditDeliveryStatusDropDown(editNextDeliveryStatusDropDownOptions);
        }
        
        function ResetToolbar() {
            setCommonToolbarButtonEnabled('c_toolbarItemView', false);
            setToolbarButtonEnabled('c_toolbarItemPageNavigation', false);
            setToolbarButtonEnabled('c_toolbarItemDeliveryProvider', false);
            setCommonToolbarButtonEnabled('c_toolbarItemDelete', false);
            setToolbarButtonEnabled('c_toolbarItemEditStatus', false);
        }

        function DateSelectedFrom(sender, eventArgs) {
            var date = '';
            if (eventArgs.get_newValue() != null) {
                date = eventArgs.get_newValue();
            }
            $get('<%= c_hiddenDeliveryFromDate.ClientID %>').value = date;
            ClearSelectedDeliveries();            
            ResetToolbar();
            updateGrid(true);
        }

        function DateSelectedTo(sender, eventArgs) {
            var date = '';
            if (eventArgs.get_newValue() != null) {
                date = eventArgs.get_newValue();
            }
            $get('<%= c_hiddenDeliveryToDate.ClientID %>').value = date;
            ClearSelectedDeliveries(); 
            ResetToolbar();
            updateGrid(true);
        }

        function ChangeStatus() {
            $get('<%= c_hiddenDeliveryStatus.ClientID %>').value = $get('<%= ddlStatuses.ClientID %>').value;
            ClearSelectedDeliveries(); 
            ResetToolbar();
            updateGrid(true);
        }

        function ChangeMethod() {
            $get('<%= c_hiddenDeliveryMethodID.ClientID %>').value = $get('<%= ddlMethods.ClientID %>').value;
            ClearSelectedDeliveries(); 
            ResetToolbar();
            updateGrid(true);
        }

        function updateGrid(clearOrderIDs) {
            var tableView = $find("<%= c_deliveriesGrid.ClientID %>").get_masterTableView();
            if (clearOrderIDs) {
                $get('<%= c_hiddenOrderIDs.ClientID %>').value = '';
            }
            tableView.rebind();
        }

        function ClearFilters() {
            var calendar = $find("<%= c_calendarFromDate.ClientID %>");
            calendar.clear();
            $get('<%= c_hiddenDeliveryFromDate.ClientID %>').value = '';
            var calendar1 = $find("<%= c_calendarToDate.ClientID %>");
            calendar1.clear();
            $get('<%= c_hiddenDeliveryToDate.ClientID %>').value = '';

            $get('<%= ddlMethods.ClientID %>').selectedIndex = 0;
            $get('<%= c_hiddenDeliveryMethodID.ClientID %>').value = '';
            $get('<%= ddlStatuses.ClientID %>').selectedIndex = 0;
            $get('<%= c_hiddenDeliveryStatus.ClientID %>').value = '-1';

            $get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = false;

            ClearSelectedDeliveries();
            updateGrid(true);
           }          

		function ClearSelectedDeliveries() {
		    var tableView = $find("<%= c_deliveriesGrid.ClientID %>").get_masterTableView();
		    tableView.clearSelectedItems();
		    var gridHelper = Litium.Studio.UI.Common.WebControls.GridHelperAjax._instance['<%= c_deliveriesGrid.ClientID %>'];
		    gridHelper.ClearSelectedKeys();
		    ClearDeliveryCountByStatus();
		}

		function ClearDeliveryCountByStatus()
		{
		    var deliveryCountByStatus = null;
		    var deliveryCountByStatusString = $get('<%= c_hiddenDeliveryCountByStatus.ClientID %>').value;
		    if (deliveryCountByStatusString != null && deliveryCountByStatusString.length > 0)
		    {
		        deliveryCountByStatus = JSON.parse(deliveryCountByStatusString);
		        //increase the selection count.
		        for (i = 0; i < deliveryCountByStatus.length; i++)
		        {
		            deliveryCountByStatus[i].SelectedDeliveryCount = 0;
		        }
		        deliveryCountByStatusString = JSON.stringify(deliveryCountByStatus);
		        $get('<%= c_hiddenDeliveryCountByStatus.ClientID %>').value = deliveryCountByStatusString;
		    }
		    //everything is cleared, just send null.
		    PopulateEditDeliveryStatusDropDown(null);
		}
		
		function RowDeselected(sender, args, gridHelper) {
    		$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = false;
		}
        
    </script>
</Telerik:RadCodeBlock>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">

    <ComponentArt:ToolBar ID="c_toolbarDeliveries" AutoPostBackOnSelect="true" 
        OnItemCommand="c_toolbarDeliveries_ItemCommand" runat="server" 
        CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew" 
        DefaultItemHoverCssClass="litToolbarItemOnMouseOver" 
        DefaultItemActiveCssClass="litToolbarItemOnMouseDown" 
        DefaultItemDisabledCssClass="litToolbarItemDisabled" 
        ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false" 
        Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
        <Items runat="server">            
            <ComponentArt:ToolBarItem ID="c_toolbarItemEditStatus" runat="server" ImageUrl="icons_standard/pencil.png" ItemType="DropDown"
                DropDownId="c_menuEditStatus" DropDownImageUrl="toolbar/dropdown.gif" DropDownImageWidth="16" DropDownImageHeight="16"
                ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate"/>
            <ComponentArt:ToolBarItem id="sep2" ItemType="Separator" CssClass="" runat="server" ImageUrl="toolbar/break.gif" ImageHeight="16" ImageWidth="2" />
            <ComponentArt:ToolBarItem ID="c_toolbarItemPageNavigation" runat="server" ImageUrl="icons_standard/view.png" ItemType="DropDown"
                DropDownId="c_menuNavigation" DropDownImageUrl="toolbar/dropdown.gif" DropDownImageWidth="16" DropDownImageHeight="16"
                ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate"/>
            <ComponentArt:ToolBarItem id="sep3" ItemType="Separator" CssClass="" runat="server" ImageUrl="toolbar/break.gif" ImageHeight="16" ImageWidth="2" />
            <ComponentArt:ToolBarItem ID="c_toolbarItemDeliveryProvider"  runat="server" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" ImageUrl="icons_standard/mail_forward.png"/>
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
    <ComponentArt:Menu runat="server" ID="c_menuEditStatus" ImagesBaseUrl="~/LitiumStudio/Images/" CssClass="litNavMenuGroup" DefaultItemLookID="DefaultItemLook" DefaultGroupItemSpacing="1" DefaultItemTextAlign="Left" DefaultItemTextWrap="false" DefaultGroupExpandOffsetX="0" DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto" TopGroupExpandDirection="BelowLeft" TopGroupExpandOffsetY="0" CollapseDuration="100" CollapseSlide="ExponentialDecelerate" ExpandDuration="100" ExpandSlide="ExponentialDecelerate" ExpandDelay="0" ExpandOnClick="false" CascadeCollapse="true" CollapseDelay="10000" HideSelectElements="false" HighlightExpandedPath="true" KeyboardEnabled="true" OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true" ShadowOffset="2" Orientation="Vertical" ContextMenu="Custom">
        <ItemLooks>
            <ComponentArt:ItemLook LookID="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
            <ComponentArt:ItemLook LookID="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
        </ItemLooks>
        <ClientEvents>
		    <ItemSelect EventHandler="onEditDeliveryStatus" />
		</ClientEvents>
    </ComponentArt:Menu>
    <ComponentArt:Menu runat="server" ID="c_menuNavigation" ImagesBaseUrl="~/LitiumStudio/Images/" Width="108" CssClass="litNavMenuGroup" DefaultItemLookID="DefaultItemLook" DefaultGroupItemSpacing="1" DefaultItemTextAlign="Left" DefaultItemTextWrap="false" DefaultGroupExpandOffsetX="0" DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto" TopGroupExpandDirection="BelowLeft" TopGroupExpandOffsetY="0" CollapseDuration="100" CollapseSlide="ExponentialDecelerate" ExpandDuration="100" ExpandSlide="ExponentialDecelerate" ExpandDelay="0" ExpandOnClick="false" CascadeCollapse="true" CollapseDelay="10000" HideSelectElements="false" HighlightExpandedPath="true" KeyboardEnabled="true" OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true" ShadowOffset="2" Orientation="Vertical" ContextMenu="Custom" OnItemSelected="c_menuNavigation_ItemSelected">
        <ItemLooks>
            <ComponentArt:ItemLook LookID="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
            <ComponentArt:ItemLook LookID="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
        </ItemLooks>
    </ComponentArt:Menu>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <img src="Images/transparent.gif" style="vertical-align:middle; margin-right:5px;" class="litIconDocumentAdd2" alt="" />
    <Foundation:ModuleString ID="ModuleString1" Name="Deliveries" Runat="server"/>
    
</asp:Content>
    <asp:Content ID="LitiumStudioFilterArea" ContentPlaceHolderID="LitiumStudioFilterArea"
	runat="server">
	<LS:FilterAreaSetting ID="FilterAreaSetting1" runat="server" FilterAreaState="Open" />
	<div style="padding-bottom: 3px;display :inline;">
	    <div>
	        <span class="lsFilterItem">
		        <Foundation:ModuleString Name="DeliveryFilterStartDate" runat="server" ID="c_moduleStringDateSelection" />
		        <LS:DateTimeHelper ID="DateTimeHelper2" AssociatedControlID="c_calendarFromDate"
			        runat="server" />
		        <Telerik:RadDatePicker runat="server" Width="160" ID="c_calendarFromDate" AutoPostBack="false"
			        EnableTyping="false" style=" margin-left: 5px;">
			        <ClientEvents OnDateSelected="DateSelectedFrom" />
		        </Telerik:RadDatePicker>
		    </span>
		    <span class="lsFilterItem">
		        <Foundation:ModuleString Name="DeliveryFilterStatus" runat="server" ID="ModuleString3" />		    
		        <asp:DropDownList ID="ddlStatuses" runat="server" Style="vertical-align: middle; margin-left: 9px;"
			        onchange="ChangeStatus()" Width="150px" />
		    </span>
		</div>
		<div>
		    <span class="lsFilterItem">
		        <Foundation:ModuleString Name="DeliveryFilterEndDate" runat="server" ID="ModuleString2" />
		        <LS:DateTimeHelper ID="DateTimeHelper3" AssociatedControlID="c_calendarToDate" runat="server" />
		        <Telerik:RadDatePicker runat="server" ID="c_calendarToDate" Width="160" AutoPostBack="false"
			        EnableTyping="false" style=" margin-left: 9px;">
			        <ClientEvents OnDateSelected="DateSelectedTo" />
		        </Telerik:RadDatePicker>
		    </span>
		    <span class="lsFilterItem">
		        <Foundation:ModuleString Name="DeliveryFilterMethod" runat="server" ID="ModuleString4" />
		        <asp:DropDownList ID="ddlMethods" runat="server" Style="vertical-align: middle; margin-left: 5px;"
			        onchange="ChangeMethod()" Width="150px" />		        
		   </span>
		   <span class="lsFilterItem">
		        <asp:HyperLink runat="server" ID="c_hyperLinkClearFilter" Text="Clear filters" onclick="ClearFilters()" />		       
		        <asp:CompareValidator ID="c_dateCompareValidator" runat="server" ControlToValidate="c_calendarToDate"
			        ControlToCompare="c_calendarFromDate" Operator="GreaterThanEqual" Type="Date" style="width:auto;">
		        </asp:CompareValidator>
		   </span>    
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" class="noScroll" runat="Server">
    <div class="lsContentNoScroll" id="div_GridPlaceHolder" runat="server">
	    <%--   RadGrid and Ajax helper is created in OnInit because of additional order info dynamic columns
        --%>        
	    <asp:HiddenField ID="c_hiddenFieldGridCustomParameter" runat="server" />
	    <asp:HiddenField ID="c_hiddenFieldGridFilter" runat="server" />
	    <asp:HiddenField ID="c_hiddenDeliveryStatus" value="-1" runat="server" />
	    <asp:HiddenField ID="c_hiddenDeliveryFromDate" value="" runat="server" />
	    <asp:HiddenField ID="c_hiddenDeliveryToDate" value="" runat="server" />
	    <asp:HiddenField ID="c_hiddenOrderIDs" value="" runat="server" />
	    <asp:HiddenField ID="c_hiddenDeliveryMethodID" value="" runat="server" />
	    <asp:HiddenField ID="c_hiddenSelectAllClientID" value="" runat="server" />
	    <div  style="display:none;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
	        <ContentTemplate>
	            <asp:HiddenField ID="c_hiddenDeliveryCountByStatus" value="" runat="server" />
	        </ContentTemplate>
	        </asp:UpdatePanel>
	    </div>
       <script type="text/javascript">
        //<![CDATA[
        // Image preloading
        var img1 = new Image();
        img1.src = '../../LitiumStudio/Images/grid/spinner.gif';
        //]]>    
        </script>
    </div>
</asp:Content>

