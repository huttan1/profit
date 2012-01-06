<%@ page language="C#" masterpagefile="~/LitiumStudio/ECommerce/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_ECommerce_Orders, Litum.Studio.Web" %>

<%@ Register TagPrefix="lf" TagName="LeftFilter" Src="~/LitiumStudio/ECommerce/WebUserControls/LeftFilter.ascx" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ECommerce/Framework/Base1.master" %>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="Server">
<script type="text/javascript">

    var cancelDeselect = false;
    var cancelSelect = false;

    function onEditOrderStatus(sender, eventArgs) {
        RadAjaxManager().showLoadingPanels("<%=c_ordersGrid.ClientID %>", RadAjaxManager().get_ajaxSettings());
        var menuItem = eventArgs.get_item().get_id();
        // State id is appended at the end of the menu item.
        var stateId = menuItem.substring(menuItem.lastIndexOf('_') + 1, menuItem.length);
        var orderCountByStatusString = $get('<%= c_hiddenOrderCountByStatus.ClientID %>').value;
        var gridHelper = Litium.Studio.UI.Common.WebControls.GridHelperAjax._instance['<%= c_ordersGrid.ClientID %>'];
        var selectedKeys = gridHelper.GetSelectedKeys();
        PageMethods.ChangeOrderStatus(stateId, orderCountByStatusString, selectedKeys, onEditOrderStatus_Success, callMethod_Failure);
    }

    function onEditOrderStatus_Success(results, userContext, methodName)
    {
        var orderCountByStatus = null;
        $get('<%= c_hiddenOrderCountByStatus.ClientID %>').value = results;
        if (results != null && results.length > 0)
            orderCountByStatus = JSON.parse(results);
        
        var editNextOrderStatusDropDownOptions = GetOrderStatusDropDownOptions(orderCountByStatus);
        PopulateEditOrderStatusDropDown(editNextOrderStatusDropDownOptions);
        
        var editButtonEnabled = IsEditButtonEnabled(orderCountByStatus);
        var deleteButtonEnabled = IsDeleteButtonEnabled(orderCountByStatus);
        UpdateEditDeleteButtonStatus(editButtonEnabled, deleteButtonEnabled);
        
        updateGrid(false);
    }

    function updateToolbar(selectedOrderCount) {
        if (selectedOrderCount > 0) {
            if (selectedOrderCount == 1) {
                setCommonToolbarButtonEnabled('c_toolbarItemView', true);
                <%  if (Master.WriteAccess)
				{%>
                setECommerceCommonToolbarButtonEnabled('c_toolbarItemCopy', true);
                <%
				}%>
            }
            else {
                setCommonToolbarButtonEnabled('c_toolbarItemView', false);
                setECommerceCommonToolbarButtonEnabled('c_toolbarItemCopy', false);
            }
            
            if(selectedOrderCount < 10000)
                setToolbarButtonEnabled('c_toolbarItemExport', true);
                
            setToolbarButtonEnabled('c_toolbarItemPageNavigation', true);
        }
        else {
            //no order is selected.
            setCommonToolbarButtonEnabled('c_toolbarItemView', false);
            setToolbarButtonEnabled('c_toolbarItemExport', false);
            setECommerceCommonToolbarButtonEnabled('c_toolbarItemCopy', false);
            setToolbarButtonEnabled('c_toolbarItemPageNavigation', false);
            
            setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
            setCommonToolbarButtonEnabled('c_toolbarItemDelete', false);
            setToolbarButtonEnabled('c_toolbarItemEditStatus', false);
        }
    }

    function setToolbarButtonEnabled(id, enabled) {
        c_toolbarOrders.get_items().getItemById(id).set_enabled(enabled);
    } 

    function callMethod_Failure(errors, userContext, methodName) {
        alert(errors.get_message());
    }

    function getStatesMenuItem(stateId, stateName) {
        var newItem = new ComponentArt.Web.UI.MenuItem();
        newItem.set_text(stateName);
        // Id later will be used to get the selected state.
        newItem.set_id('c_menuStatus_' + stateId);
        return newItem;
    }


    function onToolbarItemSelect(sender, eventArgs)
    {
        var toolbarItem = eventArgs.get_item().get_id();
        if (toolbarItem == 'c_toolbarItemDelete' && confirm("<%=m_currentModule.Strings[Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.DELETE_ORDER_CONFIRMATION, FoundationContext.LanguageID] %>")) {
            var gridHelper = Litium.Studio.UI.Common.WebControls.GridHelperAjax._instance['<%= c_ordersGrid.ClientID %>'];
            var selectedKeys = gridHelper.GetSelectedKeys();
            PageMethods.DeleteOrder(selectedKeys, onDeleteAll_Success, callMethod_Failure);

            setCommonToolbarButtonEnabled('c_toolbarItemView', false);
            setToolbarButtonEnabled('c_toolbarItemExport', false);
            setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
            setCommonToolbarButtonEnabled('c_toolbarItemDelete', false);
            setToolbarButtonEnabled('c_toolbarItemEditStatus', false);
            setECommerceCommonToolbarButtonEnabled('c_toolbarItemCopy', false);
            setToolbarButtonEnabled('c_toolbarItemPageNavigation', false);
        }
        if (toolbarItem == 'c_toolbarItemAdd') {
            PageMethods.AddOrder(onAddOrder_Success, callMethod_Failure);
            document.location = '<%= AddOrderUrl %>';
            return false;
        }
    }

    function onAddOrder_Success(results, userContext, methodName) {
    
    }

    function onDeleteAll_Success(results, userContext, methodName) {
        ClearSelectedOrders();
        updateGrid(true);
    }

    function onSelectAllClick(sender) {
        if (sender.checked)
        {
            cancelSelect = true;
            RadAjaxManager().showLoadingPanels("<%=c_ordersGrid.ClientID %>", RadAjaxManager().get_ajaxSettings());
            var orderStatus = $get('<%= c_hiddenOrderStatus.ClientID %>').value;
            var fromDate = $get('<%= c_hiddenOrderFromDate.ClientID %>').value;
            var toDate = $get('<%= c_hiddenOrderToDate.ClientID %>').value;
            var orderIds = $get('<%= c_hiddenOrderIDs.ClientID %>').value;
            //first discard existing selections, then select all result set.
            ClearSelectedOrders();
            PageMethods.SelectAllOrders(orderStatus, fromDate, toDate, orderIds, onSelectAllClick_Success, callMethod_Failure);
            cancelSelect = false;
        }
        else
        {
            cancelDeselect = true;
            ClearSelectedOrders();
            updateToolbar(0);
            updateGrid(true);
            cancelDeselect = false;
        }
    }

    function onSelectAllClick_Success(results, userContext, methodName) {
        var gridHelper = Litium.Studio.UI.Common.WebControls.GridHelperAjax._instance['<%= c_ordersGrid.ClientID %>'];
        gridHelper.SetSelectedKeys(results);
        var tableView = $find("<%= c_ordersGrid.ClientID %>").get_masterTableView();
        tableView.selectAllItems();
        SelectAllOrderCountByStatus();
        updateToolbar(results.length);
        updateGrid(false);        
    }

    function SelectAllOrderCountByStatus() {
        var orderCountByStatus = null;
        var orderCountByStatusString = $get('<%= c_hiddenOrderCountByStatus.ClientID %>').value;
        if (orderCountByStatusString != null && orderCountByStatusString.length > 0)
        {
            orderCountByStatus = JSON.parse(orderCountByStatusString);
            //increase the selection count.
            for (i = 0; i < orderCountByStatus.length; i++)
            {
                orderCountByStatus[i].SelectedOrderCount = orderCountByStatus[i].TotalOrderCount;                
            }
            orderCountByStatusString = JSON.stringify(orderCountByStatus);
            $get('<%= c_hiddenOrderCountByStatus.ClientID %>').value = orderCountByStatusString;
        }
        
        var editNextOrderStatusDropDownOptions = GetOrderStatusDropDownOptions(orderCountByStatus);
        PopulateEditOrderStatusDropDown(editNextOrderStatusDropDownOptions);
        var editButtonEnabled = IsEditButtonEnabled(orderCountByStatus);
        var deleteButtonEnabled = IsDeleteButtonEnabled(orderCountByStatus);
        UpdateEditDeleteButtonStatus(editButtonEnabled, deleteButtonEnabled);
     }

    function ClearSelectedOrders() {
        var tableView = $find("<%= c_ordersGrid.ClientID %>").get_masterTableView();
        tableView.clearSelectedItems();
        var gridHelper = Litium.Studio.UI.Common.WebControls.GridHelperAjax._instance['<%= c_ordersGrid.ClientID %>'];
        gridHelper.ClearSelectedKeys();
        ClearOrderCountByStatus();
    }  

    function ClearOrderCountByStatus()
    {
        var orderCountByStatus = null;
        var orderCountByStatusString = $get('<%= c_hiddenOrderCountByStatus.ClientID %>').value;
        if (orderCountByStatusString != null && orderCountByStatusString.length > 0)
        {
            orderCountByStatus = JSON.parse(orderCountByStatusString);
            //increase the selection count.
            for (i = 0; i < orderCountByStatus.length; i++)
            {
                orderCountByStatus[i].SelectedOrderCount = 0;
            }
            orderCountByStatusString = JSON.stringify(orderCountByStatus);
            $get('<%= c_hiddenOrderCountByStatus.ClientID %>').value = orderCountByStatusString;
        }
        //everything is cleared, just send null.
        PopulateEditOrderStatusDropDown(null);
        UpdateEditDeleteButtonStatus(false, false);
    }
    
    //return the value of the selected column, at row pointed out by itemIndex
    function GetRadGridColumnValue(grid, itemIndex, columnName) {
        var result = "";
        var MasterTable = grid.get_masterTableView();
        var row = MasterTable.get_dataItems()[itemIndex];
        if (row != null) {
            var cell = MasterTable.getCellByColumnUniqueName(row, columnName);
            if (cell != null) {
                if (navigator.appName == "Microsoft Internet Explorer")
                    result = cell.innerText;
                else
                    result = cell.textContent;
            }
        }
        return result;
    }

    function RowSelecting(sender, args, gridHelper) {
        if (args._domEvent.type != null)
        {
            var items = gridHelper.GetSelectedKeys();
            if (items != null && items.length > 0) {
                SetEditOrderStatusDropDown(sender, args, gridHelper, true);
                updateToolbar(items.length);
                //select the select all check box, if all are selected.
                var grid = sender;
                var MasterTable = grid.get_masterTableView();
                $get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = items.length == MasterTable._virtualItemCount;
            }
            else {
                updateToolbar(0);
            }
        }
        else {
            if (cancelSelect)
                args.set_cancel(true);
        }
    }

    function SetEditOrderStatusDropDown(sender, args, gridHelper, rowSelecting)
    {
        var orderCountByStatus = null;
        var orderCountByStatusString = $get('<%= c_hiddenOrderCountByStatus.ClientID %>').value;
        if (orderCountByStatusString != null && orderCountByStatusString.length > 0)
        {
            orderCountByStatus = JSON.parse(orderCountByStatusString);
            var currentOrderStatusId = GetRadGridColumnValue(sender, args._itemIndexHierarchical, "CurrentOrderStateId");
            if (rowSelecting)
            {
                //increase the selection count.
                for (i = 0; i < orderCountByStatus.length; i++)
                {
                    if (orderCountByStatus[i].OrderStatusId == currentOrderStatusId)
                    {
                        orderCountByStatus[i].SelectedOrderCount += 1;
                        break;
                    }
                }
            }
            else
            {
                //now we are deselecting a row. decrease the count.
                for (i = 0; i < orderCountByStatus.length; i++)
                {
                    if (orderCountByStatus[i].OrderStatusId == currentOrderStatusId && orderCountByStatus[i].SelectedOrderCount > 0)
                    {
                        orderCountByStatus[i].SelectedOrderCount -= 1;
                        break;
                    }
                }
            }
            orderCountByStatusString = JSON.stringify(orderCountByStatus);
            $get('<%= c_hiddenOrderCountByStatus.ClientID %>').value = orderCountByStatusString;        
        }
        var editNextOrderStatusDropDownOptions = GetOrderStatusDropDownOptions(orderCountByStatus);
        PopulateEditOrderStatusDropDown(editNextOrderStatusDropDownOptions);
        var editButtonEnabled = IsEditButtonEnabled(orderCountByStatus);
        var deleteButtonEnabled = IsDeleteButtonEnabled(orderCountByStatus);
        UpdateEditDeleteButtonStatus(editButtonEnabled, deleteButtonEnabled);
    }
    function IsEditButtonEnabled(orderCountByStatus) {
        var enabled = true;
        var totalSelectedCount = 0;
        if (orderCountByStatus != null)
        {
            var i = 0;
            for (i = 0; i < orderCountByStatus.length; i++)
            {
                totalSelectedCount += orderCountByStatus[i].SelectedOrderCount;
                if (orderCountByStatus[i].SelectedOrderCount == 1)
                {
                    enabled = orderCountByStatus[i].IsEditable;
                }
                enabled = enabled && totalSelectedCount <= 1;
                if (!enabled)
                    break;
            }
        }
        else
        {
            enabled = false;
        }
        return enabled && totalSelectedCount == 1;
    }

    function IsDeleteButtonEnabled(orderCountByStatus) {
        var enabled = true;
        var totalSelectedCount = 0;
        if (orderCountByStatus != null)
        {
            var i = 0;
            for (i = 0; i < orderCountByStatus.length; i++)
            {
                totalSelectedCount += orderCountByStatus[i].SelectedOrderCount;
                if (orderCountByStatus[i].SelectedOrderCount == 1)
                {
                    enabled = orderCountByStatus[i].IsDeletable;
                }
                enabled = enabled && totalSelectedCount <= 1;
                if (!enabled)
                    break;
            }
        }
        else
        {
            enabled = false;
        }
        return enabled && totalSelectedCount == 1;
    }
    
    function GetOrderStatusDropDownOptions(orderCountByStatus)
    {
        var editNextOrderStatusDropDownOptions = null;
        if (orderCountByStatus != null)
        {
            //find the next set of statuses to populate the dropdown.
            var i = 0;
            for (i = 0; i < orderCountByStatus.length; i++)
            {
                if (orderCountByStatus[i].SelectedOrderCount > 0)
                {
                    if (editNextOrderStatusDropDownOptions == null)
                    {
                        //set to populate the edit status drop down with next statuses of
                        //first status found to have selected orders.
                        editNextOrderStatusDropDownOptions = orderCountByStatus[i].NextOrderStatuses;
                    }
                    else
                    {
                        //this condition will not be hit, if there is only one order status
                        //with more than one selected orders.                
                        //This condition is hit because, there are selected orders with a different order status.
                        editNextOrderStatusDropDownOptions = null;
                        break;
                    }
                }
            }
        }
        return editNextOrderStatusDropDownOptions;
    }
    
    function RowDeselecting(sender, args, gridHelper) {
        if (args._domEvent.type != null) {
            var items = gridHelper.GetSelectedKeys();
            if (items != null)
            {
                updateToolbar(items.length);  
            }
            else {
                updateToolbar(0);  
            }
            SetEditOrderStatusDropDown(sender, args, gridHelper, false);
        }
        else {
            if (cancelDeselect) {
                args.set_cancel(true);
            }
        }
    }

    //populate the Edit order status drop down.
    function PopulateEditOrderStatusDropDown(itemList)
    {  
        c_menuEditStatus.get_items().clear();
         <%if(Master.WriteAccess)
 {%>
        if ((itemList != null) && (itemList.length > 0))
        {
            var i = 0;
            for (i = 0; i < itemList.length; i++)
            {
                c_menuEditStatus.get_items().add(getStatesMenuItem(itemList[i].OrderStatusID, itemList[i].Translation));
            }
            setToolbarButtonEnabled('c_toolbarItemEditStatus', true);
        }
        else
        {
            setToolbarButtonEnabled('c_toolbarItemEditStatus', false);
        }
        <%
 }%>
    }

    function UpdateEditDeleteButtonStatus(enableEdit, enableDelete) {
    <%if(Master.WriteAccess)
 {%>
        setCommonToolbarButtonEnabled("c_toolbarItemEdit", enableEdit);
        setCommonToolbarButtonEnabled("c_toolbarItemDelete", enableDelete);
        <%
 }%>
    }

    function RowDeselected(sender, args, gridHelper)
    {
        $get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = false;
    }

    function DateSelectedFrom(sender, eventArgs) {
        var date = '';
        if (eventArgs.get_newValue() != null) {
            date = eventArgs.get_newValue();
        }
        $get('<%= c_hiddenOrderFromDate.ClientID %>').value = date;
        ClearSelectedOrders();
        updateGrid(true);

    }

    function DateSelectedTo(sender, eventArgs) {
        var date = '';
        if (eventArgs.get_newValue() != null) {
            date = eventArgs.get_newValue();
        }
        $get('<%= c_hiddenOrderToDate.ClientID %>').value = date;
        var tableView = $find("<%= c_ordersGrid.ClientID %>").get_masterTableView();
        ClearSelectedOrders();
        updateGrid(true);
    }

    function ChangeOrderStatusFilter() {
        $get('<%= c_hiddenOrderStatus.ClientID %>').value = $get('<%= ddlStatuses.ClientID %>').value;
        ClearSelectedOrders();
        updateGrid(false);
   }

    function updateGrid(clearOrderIDs) {
        var tableView = $find("<%= c_ordersGrid.ClientID %>").get_masterTableView();
        if (clearOrderIDs) {
            $get('<%= c_hiddenOrderIDs.ClientID %>').value = '';
        }
        tableView.rebind();
    }
    
    function onClearFilters() {
        $find("<%= c_calendarFromDate.ClientID %>").clear();
        $find("<%= c_calendarToDate.ClientID %>").clear();
        
        $get('<%= c_hiddenOrderFromDate.ClientID %>').value = '';       
        $get('<%= c_hiddenOrderToDate.ClientID %>').value = '';

        $get('<%= ddlStatuses.ClientID %>').selectedIndex = 0;
        $get('<%= c_hiddenOrderStatus.ClientID %>').value = '-1';

        $get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = false;

        ClearSelectedOrders();
        updateGrid(true);
    }
</script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
    <div style="float:left;" runat="server">	   
	<ComponentArt:ToolBar ID="c_toolbarOrders" OnItemCommand="c_toolbarOrders_ItemCommand"
		runat="server"
		CssClass="litToolbar"
		DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver"
		DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled"
		ImagesBaseUrl="~/LitiumStudio/Images/"
		DefaultItemExpandedCssClass="litToolbarItemOnMouseDown"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16">
		<Items runat="server">
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemEditStatus" ImageUrl="icons_standard/pencil.png"
				ItemType="DropDown" DropDownId="c_menuEditStatus" DropDownImageUrl="toolbar/dropdown.gif"
				DropDownImageWidth="16" DropDownImageHeight="16"  ClientTemplateId="c_toolbarLeftTreeItemButtonsDropDownTemplate">
			</ComponentArt:ToolBarItem>
			
			<ComponentArt:ToolBarItem ID="ToolBarItem2" runat="server" ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif"
				ImageHeight="16" ImageWidth="2" />
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemExport" ImageUrl="icons_standard/export.png"
				AutoPostBackOnSelect="true"  ClientTemplateId="c_toolbarLeftTreeItemButtonsTemplate"/>
			<ComponentArt:ToolBarItem ID="ToolBarItem3" runat="server" ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif"
				ImageHeight="16" ImageWidth="2" />
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemPageNavigation" ImageUrl="icons_standard/view.png"
				ItemType="DropDown" DropDownId="c_menuNavigation" DropDownImageUrl="toolbar/dropdown.gif"
				DropDownImageWidth="16" DropDownImageHeight="16" ClientTemplateId="c_toolbarLeftTreeItemButtonsDropDownTemplate" />
		</Items>
		<ClientEvents>
			<ItemSelect EventHandler="onToolbarItemSelect" />
			<%-- <ItemBeforeSelect EventHandler="onToolbarItemBeforeSelect" />            --%>
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
		    <ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemButtonsDropDownTemplate">
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
	
	<ComponentArt:Menu runat="server" ID="c_menuEditStatus" ImagesBaseUrl="~/LitiumStudio/Images/"
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
		<ClientEvents>
		    <ItemSelect EventHandler="onEditOrderStatus" />
		</ClientEvents>
	</ComponentArt:Menu>
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
	<img src="Images/transparent.gif" style="vertical-align: middle; margin-right: 5px;"
		class="litIconDocumentAdd2" alt="" />
	<Foundation:ModuleString ID="ModuleString1" Name="ToolbarViewOrders" runat="server" />
	<asp:Label runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="LitiumStudioFilterArea" ContentPlaceHolderID="LitiumStudioFilterArea"
	runat="server">
	<LS:FilterAreaSetting ID="FilterAreaSetting1" runat="server" FilterAreaState="Open"  />
	<div style="padding-bottom: 3px;" >
	    <span class="lsFilterItem">
		    <Foundation:ModuleString Name="OrderFilterStartDate" runat="server" ID="c_moduleStringDateSelection" />
		    <LS:DateTimeHelper ID="DateTimeHelper2" AssociatedControlID="c_calendarFromDate"
			    runat="server" />
		    <Telerik:RadDatePicker runat="server" Width="160" ID="c_calendarFromDate" AutoPostBack="false"
			    EnableTyping="false">
			    <ClientEvents OnDateSelected="DateSelectedFrom" />
		    </Telerik:RadDatePicker>
		</span>
		<span class="lsFilterItem">
		    <Foundation:ModuleString Name="OrderFilterEndDate" runat="server" ID="ModuleString2" />
		    <LS:DateTimeHelper ID="DateTimeHelper3" AssociatedControlID="c_calendarToDate" runat="server" />
		    <Telerik:RadDatePicker runat="server" ID="c_calendarToDate" Width="160" AutoPostBack="false"
			    EnableTyping="false">
			    <ClientEvents OnDateSelected="DateSelectedTo" />
		    </Telerik:RadDatePicker>
		</span>
		<span class="lsFilterItem">
		    <Foundation:ModuleString Name="OrderFilterStatus" runat="server" ID="ModuleString3" />
		    <asp:DropDownList ID="ddlStatuses" runat="server" Style="vertical-align: middle;"
			    onchange="ChangeOrderStatusFilter()" />		
		</span>
		<span class="lsFilterItem">
		    <asp:HyperLink runat="server" ID="c_hyperLinkClearFilter" Text="Clear filters" onclick="onClearFilters()" />
		    <asp:CompareValidator ID="c_dateCompareValidator" runat="server" ControlToValidate="c_calendarToDate"
			    ControlToCompare="c_calendarFromDate" Operator="GreaterThanEqual" Type="Date" style="width:auto;">
		    </asp:CompareValidator>
	    </span>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" class="noScroll" runat="Server">
    <div class="lsContentNoScroll" id="div_GridPlaceHolder" runat="server">
<%--        RadGrid and Ajax helper is created in OnInit because of additional order info dynamic columns
--%>        
	    <asp:HiddenField ID="c_hiddenFieldGridCustomParameter" runat="server" />
	    <asp:HiddenField ID="c_hiddenFieldGridFilter" runat="server" />
	    <asp:HiddenField ID="c_hiddenOrderStatus" value="-1" runat="server" />
	    <asp:HiddenField ID="c_hiddenOrderFromDate" value="" runat="server" />
	    <asp:HiddenField ID="c_hiddenOrderToDate" value="" runat="server" />
	    <asp:HiddenField ID="c_hiddenOrderIDs" value="" runat="server" />
	    <asp:HiddenField ID="c_hiddenSelectAllClientID" value="" runat="server" />
	    <div  style="display:none;">
	        <asp:UpdatePanel runat="server">
	        <ContentTemplate>
	            <asp:HiddenField ID="c_hiddenOrderCountByStatus" value="" runat="server" />
	        </ContentTemplate>
	        </asp:UpdatePanel>
	    </div>
	</div>
</asp:Content>
