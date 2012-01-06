<%@ page language="C#" masterpagefile="~/LitiumStudio/ECommerce/Framework/Base1.master" enableeventvalidation="false" validaterequest="false" autoeventwireup="true" inherits="LitiumStudio_ECommerce_ViewOrder, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ECommerce/Framework/Base1.master" %>

<%@ Register TagPrefix="Pages" TagName="PaymentInformationView" Src="~/LitiumStudio/ECommerce/WebUserControls/PaymentInfoView.ascx" %>

<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" Runat="Server">

	<script type="text/javascript">
	    // Populates the status menu on page load.
	    window.onload = onViewOrderLoad;

	    // ChangeOrderStatus method internally calls the GetSelectedOrderInfo method and returns
	    // the order info neccessary to change the toolbar and populate the states menu.
	    // This is implemented that way to avoid a callback deadlock.
	    function onStatusMenuSelect(sender, eventArgs) {
	        var menuItem = eventArgs.get_item().get_id();
	        var menuItem = eventArgs.get_item().get_id();
	        // State id is appended at the end of the menu item.
	        var stateId = menuItem.substring(menuItem.lastIndexOf('_') + 1, menuItem.length);
	        PageMethods.ChangeOrderStatus(
            document.getElementById("<% Response.Write(c_hiddenFieldOrderId.ClientID.ToString()); %>").value,
            stateId, callMethod_Success, callMethod_Failure);
	    }

	    function onViewOrderLoad() {
	        PageMethods.GetSelectedOrderInfo(
                document.getElementById("<% Response.Write(c_hiddenFieldOrderId.ClientID.ToString()); %>").value,
                callMethod_Success, callMethod_Failure);
	    }

	    function getStatesMenuItem(stateId, stateName) {
	        var newItem = new ComponentArt.Web.UI.MenuItem();
	        newItem.set_text(stateName);
	        // Id later will be used to get the selected state.
	        newItem.set_id('c_menuStatus_' + stateId);
	        return newItem;
	    }

	    function setToolbarButtonEnabled(id, enabled) {
	        c_toolbarViewOrder.get_items().getItemById(id).set_enabled(enabled);
	    }

	    // After changing the state, we need to call the get order info to populate the form again. 
	    // so the return value is same for both page method calls.
	    function callMethod_Success(results, userContext, methodName) {
	        var orderInfo = new Array();
	        orderInfo = results.split('|');

	        // Enable or disable the edit button
	        var isEditable = (orderInfo[0] == 'True')
	        setCommonToolbarButtonEnabled('c_toolbarItemEdit', isEditable);

	        // Enable or disable the delete button
	        var isDeletable = (orderInfo[1] == 'True')
	        setCommonToolbarButtonEnabled('c_toolbarItemDelete', isDeletable);

	        c_menuEditStatus.get_items().clear();
	        if (orderInfo[2] != '') {
	            var state = new Array();

	            if (orderInfo[2].indexOf('-') != -1) {
	                var stateInfo = new Array();
	                stateInfo = orderInfo[2].split('-');

	                var i = 0;
	                for (i = 0; i < stateInfo.length; i++) {
	                    state = stateInfo[i].split(',');
	                    c_menuEditStatus.get_items().add(getStatesMenuItem(state[0], state[1]));
	                }
	            }
	            else {
	                // Only one state. so no need to split it by - character.
	                state = orderInfo[2].split(',');
	                c_menuEditStatus.get_items().add(getStatesMenuItem(state[0], state[1]));
	            }
	            c_menuEditStatus.add_itemSelect(onStatusMenuSelect);
	            setToolbarButtonEnabled('c_toolbarItemEditStatus', true);
	        }
	        else {
	            // No states. so disable the edit status menu.
	            setToolbarButtonEnabled('c_toolbarItemEditStatus', false);
	        }
	        if (orderInfo.length = 4)
	        {
	            document.getElementById("<% Response.Write(c_labelOrderStatus.ClientID.ToString()); %>").innerHTML = orderInfo[3];
	        }	        
	    }

	    function callMethod_Failure(errors, userContext, methodName) {
	        alert(errors.get_message());
	    }

	    function PrintPage() {
	        window.print();
	    }

	    function onToolbarItemSelect(sender, eventArgs) {
	        var toolbarItem = eventArgs.get_item().get_id();
	        if (toolbarItem == 'c_toolbarItemPrint') {
	            //PrintPage()
	            //ShowPrintPopup()
	            var url = document.getElementById('<%=c_hiddenPrinterFriendlyUrl.ClientID%>').value;
	            window.open(url, 'myPrintwindow', 'width=400,height=200');
	            eventArgs.set_cancel(true);
	        }
	    }

	    function OrderRowItemSelect(sender, eventArgs) {
	        var checked = eventArgs.get_item().get_cells()[0].get_value();
	        __doPostBack('OrderRowSelected', checked);
	    }

	    function EncodeValue() {
	        document.getElementById('<%=c_hiddenPrinterFriendlyUrl.ClientID%>').value = escape(document.getElementById('<%=c_hiddenPrinterFriendlyUrl.ClientID%>').value);
	    }

	    function Grid_onLoad(sender, e) {
	        sender.set_pageSize(sender.get_recordCount());
	        sender.render();
	    }
        
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" Runat="Server">

    <ComponentArt:ToolBar ID="c_toolbarViewOrder"
        OnItemCommand="c_toolbarViewOrder_ItemCommand" runat="server" 
        CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew" 
        DefaultItemHoverCssClass="litToolbarItemOnMouseOver" 
        DefaultItemActiveCssClass="litToolbarItemOnMouseDown" 
        DefaultItemDisabledCssClass="litToolbarItemDisabled" 
        ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false" 
        Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16" AutoPostBackOnSelect="true">
        <Items runat="server">
            <ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemBack" ImageUrl="icons_standard/arrow_left_blue_16px.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem ID="ToolBarItem1" runat="server" ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif" ImageHeight="16" ImageWidth="2" />
            <ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemEditStatus" ImageUrl="icons_standard/pencil.png" ItemType="DropDown" DropDownId="c_menuEditStatus"
                DropDownImageUrl="toolbar/dropdown.gif" DropDownImageWidth="16" DropDownImageHeight="16" ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate"/>
            <ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemPrint" ImageUrl="icons_standard/printer2.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemExport" ImageUrl="icons_standard/export.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemPageNavigation" ImageUrl="icons_standard/view.png"
				ItemType="DropDown" DropDownId="c_menuNavigation" DropDownImageUrl="toolbar/dropdown.gif"
				DropDownImageWidth="16" DropDownImageHeight="16" ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate" />

        </Items>
		<ClientEvents>
			<ItemBeforeSelect EventHandler="onToolbarItemSelect" />
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
    <ComponentArt:Menu runat="server" ID="c_menuEditStatus" ImagesBaseUrl="~/LitiumStudio/Images/" CssClass="litNavMenuGroup" DefaultItemLookID="DefaultItemLook" DefaultGroupItemSpacing="1" DefaultItemTextAlign="Left" DefaultItemTextWrap="false" DefaultGroupExpandOffsetX="0" DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto" TopGroupExpandDirection="BelowLeft" TopGroupExpandOffsetY="0" CollapseDuration="100" CollapseSlide="ExponentialDecelerate" ExpandDuration="100" ExpandSlide="ExponentialDecelerate" ExpandDelay="0" ExpandOnClick="false" CascadeCollapse="true" CollapseDelay="10000" HideSelectElements="false" HighlightExpandedPath="true" KeyboardEnabled="true" OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true" ShadowOffset="2" Orientation="Vertical" ContextMenu="Custom">
        <ItemLooks>
            <ComponentArt:ItemLook LookID="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
            <ComponentArt:ItemLook LookID="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
        </ItemLooks>
    </ComponentArt:Menu>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <div id="divHeader" runat="server" class="printHeader">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td align="left" valign="middle" style="height:34px;" class="litPageStatusHeaderV2">
                <span class="litContentTopHeader">
                <Foundation:ModuleString ID="c_moduleStringHeader" Name="Order" runat="server" />:<asp:Label runat="server" ID="c_labelHeader" class="litPageStatusHeaderV2"/></span>
            </td>
        </tr>
    </table>  
    </div>  
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    
    <asp:HiddenField runat="server" ID="c_hiddenFieldOrderId"/>
     <asp:HiddenField runat="server" ID="c_hiddenPrintPageContent" />
     <asp:HiddenField runat="server" ID="c_hiddenPrinterFriendlyUrl"/>
    <div class="lsContentScroll">
                <asp:Panel ID = "c_panelContent" runat = "server">
                
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">        
	                    <tr>
	                        <td valign="top" class="lsViewOrderRightPadding">
	                            <div class="printBorder">
                                    <!-- Order Totals -->
                                    <Foundation:InformationGroup runat="server" ID="c_informationGroupOrderTotals">
                                        <asp:Panel runat="server" ID="c_panelOrderTotals" Visible="true"   style="min-height:150px;">
                                            <table border="0" cellspacing="0" cellpadding="0" width="310px">
			                                    <tr id = "c_rowOrderTotalsOrderTotal" runat = "server" visible = "false" >
				                                    <td style="padding-top:10px;" class="litBoldText lsOrderViewInfoCaption" valign="top" width = "40%"><Foundation:ModuleString ID="c_moduleStringOrderTotal" Name="OrderTotal" runat="server" />:</td>
				                                    <td style="padding-top:10px;text-align: right;" class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelOrderTotal" /></td>
			                                    </tr>	
			                                    <tr id = "c_rowOrderDeliveryCost" runat = "server" visible = "true">
				                                    <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringDeliveryCost" Name="DeliveryCost" runat="server" />:</td>
				                                    <td style="text-align: right;" class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelDeliveryCost" /></td>
			                                    </tr>
			                                    <tr id = "c_rowOrderTotalsFees" runat = "server" visible = "false">
				                                    <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringFees" Name="Fees" runat="server" />:</td>
				                                    <td style="text-align: right;" class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelFees" /></td>
			                                    </tr>	
			                                    <tr id = "c_rowOrderTotalsTotalDiscount" runat = "server" visible = "false">
				                                    <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringTotalDiscount" Name="TotalDiscount" runat="server" />:</td>
				                                    <td style="text-align: right;" class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelTotalDiscount" /></td>
			                                    </tr>
			                                     <tr id = "c_rowOrderTotalsTotalCampaignDiscount" runat = "server" visible = "false">
				                                    <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringTotalCampaignDiscount" Name="TotalCampaignDiscount" runat="server" />:</td>
				                                    <td style="text-align: right;" class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelTotlaCampaignDiscount" /></td>
			                                    </tr>			                        
            			                        
			                                    <%--<tr id = "c_rowOrderTotalsLevelDiscount" runat = "server" visible = "false">
				                                    <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="c_moduleStringLevelDiscount" Name="LevelDiscount" runat="server" />:</td>
				                                    <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_labelLevelDiscount" /></td>
			                                    </tr>
			                                    <tr id = "c_rowOrderTotalsFeesVat" runat = "server" visible = "false">
				                                    <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="c_moduleStringFeesVat" Name="FeesVat" runat="server" />:</td>
				                                    <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_labelFeesVat" /></td>
			                                    </tr>--%>
			                                    <tr>
			                                        <td>
			                                        </td>
			                                    </tr>
			                                    <tr id = "c_rowOrderTotalsGrandTotal" runat = "server" style="font-size: 130%;" visible = "false">
				                                    <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringGrandTotal" Name="GrandTotal" runat="server" />:</td>
				                                    <td style="text-align: right;" class="litText lsOrderViewInfo"><b><asp:label runat="server" id="c_labelGrandTotal" /></b></td>
			                                    </tr>
			                                    <tr id = "c_rowOrderTotalsVat" runat = "server" visible = "false">
				                                    <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringVat" Name="Vat" runat="server" />:</td>
				                                    <td style="text-align: right;" class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelVat" /></td>
			                                    </tr>
                                            </table>
			                                    <table border="0" cellspacing="0" cellpadding="0" width="288px" style="visibility: hidden; margin-top: -40px;">
			                                    <asp:Repeater ID="c_repeaterFalseAdditionalInfo1" runat="server">
                                                <ItemTemplate>
                                                
			                                        <tr >
				                                        <td class="litBoldText lsOrderViewInfoCaption"  width="40%">
				                                            <asp:Label ID="c_labelAdditionalInfoKey" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Key")%>'></asp:Label>:
                                                        </td>
                                                        <td class="litText lsOrderViewInfo">
                                                            <asp:Label ID="c_labelAdditionalInfoValue" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Value")%>'></asp:Label></div>
                                                        </td>
                                                    </tr>                                    
                                                    
                                                </ItemTemplate>
                                            </asp:Repeater> 
                                            </table>
                                        </asp:Panel>
                                    </Foundation:InformationGroup>  
                                </div>
                                </td>
		                    <td valign="top" class="lsViewOrderRightPadding">
		                        <div class="printBorder">
                                    <!-- General --> 
                                    <Foundation:InformationGroup runat="server" ID="c_informationGroupGeneral">
		                                <asp:Panel runat="server" ID="c_panelGeneral" Visible="true"   style="min-height:150px;">
                                            <table border="0" cellspacing="0" cellpadding="0" width="310px">
                                                <tr id = "c_rowGeneralOrderStatus" runat = "server" visible = "false">
				                                    <td style="padding-top:10px;" class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringOrderStatus" Name="OrderStatus" runat="server" />:</td>
				                                    <td style="padding-top:10px;" class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelOrderStatus" /></td>
			                                    </tr>	
			                                    <tr id = "c_rowGeneralOrderDate" runat = "server" visible = "false">
				                                    <td class="litBoldText lsOrderViewInfoCaption" valign="top" width = "40%"><Foundation:ModuleString ID="c_moduleStringOrderDate" Name="OrderDate" runat="server" />:</td>
				                                    <td class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelOrderDate" Text = "test" /></td>
			                                    </tr>
			                                    <tr id = "c_rowGeneralOrderPaymentStatus" runat = "server" visible = "false">
				                                    <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleOrderStringPaymentStatus" Name="PaymentStatus" runat="server" />:</td>
				                                    <td class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelOrderPaymentStatus" /></td>
			                                    </tr>
			                                    <tr id = "c_rowGeneralDeliveryStatus" runat = "server" visible = "false">
				                                    <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringDeliveryStatus" Name="DeliveryStatus" runat="server" />:</td>
				                                    <td class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelDeliveryStatus" /></td>
			                                    </tr>
			                                    <tr id = "c_rowGeneralOrigin" runat = "server" visible = "false">
				                                    <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringOrigin" Name="Origin" runat="server" />:</td>
				                                    <td class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelOrigin" Text = "test" /></td>
			                                    </tr>
			                                    <tr id = "c_rowGeneralComment" runat = "server" visible = "false">
				                                    <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringComment" Name="Comment" runat="server" />:</td>
				                                    <td class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelComment" /></td>
			                                    </tr>
			                                    <tr id = "c_rowGeneralVoucherCode" runat = "server" visible = "false">
				                                    <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringVoucherCode" Name="VoucherCode" runat="server" />:</td>
				                                    <td class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelVoucherCode" /></td>
			                                    </tr>
			                                    <asp:Repeater ID="c_repeaterAdditionalInfo" runat="server">
                                                <ItemTemplate>
                                                
			                                        <tr>
				                                        <td class="litBoldText lsOrderViewInfoCaption">
				                                            <asp:Label ID="c_labelAdditionalInfoKey" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Key")%>'></asp:Label>:
                                                        </td>
                                                        <td class="litText lsOrderViewInfo">
                                                            <asp:Label ID="c_labelAdditionalInfoValue" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Value")%>'></asp:Label></div>
                                                        </td>
                                                    </tr>                                    
                                                    
                                                </ItemTemplate>
                                            </asp:Repeater>    
                                            </table>
                                        </asp:Panel>
                                    </Foundation:InformationGroup>
                	            </div>
                            </td>
                            <td valign="top" class="lsViewOrderRightPadding">
                                    <div class="printBorder">
                                    <!-- Customer Info -->  
                                    <Foundation:InformationGroup runat="server" ID="c_informationGroupCustomerInfo">
	                                <asp:Panel runat="server" ID="c_panelCustomerInfo" Visible="true"   style="min-height:150px;">
                                            <table border="0" cellspacing="0" cellpadding="0" width="310px">
			                                    <tr id = "c_rowCustomerInfoCustomerNumber" runat = "server" visible = "false">
				                                    <td style="padding-top:10px;" class="litBoldText lsOrderViewInfoCaption" valign="top" width = "40%"><Foundation:ModuleString ID="c_moduleStringCustomerNumber" Name="CustomerNumber" runat="server" />:</td>
				                                    <td style="padding-top:10px;" class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelCustomerNumber" /></td>
			                                    </tr>
			                                    <tr id = "c_rowCustomerInfoCustomerName" runat = "server" visible = "false">
				                                    <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringCustomerName" Name="CustomerName" runat="server" />:</td>
				                                    <td class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelCustomerName" /></td>
			                                    </tr>
			                                    <tr id = "c_rowCustomerInfoOrganization" runat = "server" visible = "false">
				                                    <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringOrganization" Name="Organization" runat="server" />:</td>
				                                    <td class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelOrganization" /></td>
			                                    </tr>
			                                    <tr id = "c_rowCustomerInfoMobilePhone" runat = "server" visible = "false">
				                                    <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringMobilePhone" Name="MobilePhone" runat="server" />:</td>
				                                    <td class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelMobilePhone" /></td>
			                                    </tr>
			                                    <tr id = "c_rowCustomerInfoHomePhone" runat = "server" visible = "false">
				                                    <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringHomePhone" Name="HomePhone" runat="server" />:</td>
				                                    <td class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelHomePhone" /></td>
			                                    </tr>
			                                    <tr id = "c_rowCustomerInfoWorkPhone" runat = "server" visible = "false">
				                                    <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringWorkPhone" Name="WorkPhone" runat="server" />:</td>
				                                    <td class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelWorkPhone" /></td>
			                                    </tr>
			                                    <tr id = "c_rowCustomerInfoEmail" runat = "server" visible = "false">
				                                    <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringEmail" Name="Email" runat="server" />:</td>
				                                    <td class="litText lsOrderViewInfo"><asp:HyperLink id="c_linkCustomerEmail" runat="server" class="lsMailLink"><asp:label runat="server" id="c_labelEmial" /></asp:HyperLink>
				                                    </td>
			                                    </tr>
                                            	</table>
			                                    <table border="0" cellspacing="0" cellpadding="0" width="288px" style="visibility: hidden; margin-top: -38px;">
			                                    <asp:Repeater ID="c_repeaterFalseAdditionalInfo2" runat="server">
                                                <ItemTemplate>
                                                
			                                        <tr>
				                                        <td class="litBoldText lsOrderViewInfoCaption" width="40%">
				                                            <asp:Label ID="c_labelAdditionalInfoKey" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Key")%>'></asp:Label>:
                                                        </td>
                                                        <td class="litText lsOrderViewInfo">
                                                            <asp:Label ID="c_labelAdditionalInfoValue" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Value")%>'></asp:Label></div>
                                                        </td>
                                                    </tr>                                    
                                                    
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            </table>
                                        </asp:Panel>
                                    </Foundation:InformationGroup>
                                    </div>
                                    <br />
                            </td>
                        </tr>
                    </table>
                   
                    
                    <div class="printBorder"> 
                        <div class="MidGrid">
                            <!-- Items Orderd -->          
                            <Foundation:InformationGroup runat="server" ID="c_informationGroupItemsOrdered" HeaderText = "" Width="100%">
                            <div class = "PrintHeadShow"><Foundation:ModuleString ID="c_moduleStringOrderRowsPrintHeader" Name="OrderRows" runat="server" /></div>
                                <asp:Panel runat="server" ID="c_panelItemsOrdered" Visible="true">
                                        <ComponentArt:Grid id="c_gridItemsOrdered" runat="server" AllowPaging = "false"
	                                        RunningMode="Client"
	                                        EnableViewState = "false"
	                                        ClientTarget ="Auto"  
                                            CssClass="Grid"
                                            ShowHeader="true"
                                            ShowFooter="false"
                                            ShowSearchBox="false"                                        
                                            AllowMultipleSelect="false"
                                            AllowHtmlContent = "true"
                                            HeaderCssClass="GridHeader OrderGridHeader" 
                                            KeyboardEnabled="false"
                                            FooterCssClass="GridFooter" 
                                            GroupByCssClass="GroupByCell"
                                            GroupByTextCssClass="GroupByText"                                         
                                            PreExpandOnGroup="true"
                                            ImagesBaseUrl="~/LitiumStudio/Images/grid/" 
                                            PagerStyle="Slider" 
                                            PagerPosition="BottomLeft"
                                            PagerInfoPosition="BottomRight"
                                            PagerInfoClientTemplateId="PagerInfoTemplate"
                                            PagerTextCssClass="litContentInfo"
                                            PagerButtonWidth="18"
                                            PagerButtonHeight="18"
                                            SliderHeight="18"
                                            SliderWidth="150" 
                                            SliderGripWidth="9" 
                                            SliderPopupOffsetX="20"
                                            SliderPopupClientTemplateId="SliderTemplateClient" 
                                            PagerImagesFolderUrl="~/LitiumStudio/Images/grid/pager/"
                                            TreeLineImageWidth="22" 
                                            TreeLineImageHeight="19" 
                                            IndentCellWidth="22" 
                                            GroupingNotificationTextCssClass="litContentTopHeader"
                                            GroupBySortAscendingImageUrl="sort_ascending.png"
                                            GroupBySortDescendingImageUrl="sort_descending.png"
                                            GroupBySortImageWidth="16"
                                            GroupBySortImageHeight="16"
                                            LoadingPanelClientTemplateId="LoadingFeedbackTemplate"
                                            LoadingPanelPosition="MiddleCenter"
                                            LoadingPanelEnabled="true"
                                            ManualPaging="false"
                                            Width = "100%"
                                            Visible = "true"
                                            >
                                            <Levels>
                                                <ComponentArt:GridLevel
                                                     AllowSorting="false"
                                                    DataKeyField="ID"
                                                    ShowTableHeading="false" 
                                                    ShowSelectorCells="false" 
                                                    RowCssClass="Row" 
                                                    ColumnReorderIndicatorImageUrl="reorder.gif"
                                                    DataCellCssClass="DataCell" 
                                                    HeadingCellCssClass="HeadingCell" 
                                                    HeadingCellHoverCssClass="HeadingCellHover" 
                                                    HeadingCellActiveCssClass="HeadingCellActive" 
                                                    HeadingRowCssClass="HeadingRow" 
                                                    HeadingTextCssClass="HeadingCellTextNoSorting"
                                                    SelectedRowCssClass="SelectedRow"
                                                    HoverRowCssClass="Row"
                                                    GroupHeadingCssClass="GroupHeading" 
                                                    SortAscendingImageUrl="sort_ascending.png" 
                                                    SortDescendingImageUrl="sort_descending.png" 
                                                    SortedHeadingCellCssClass="HeadingCellSorted"
                                                    SortImageWidth="16" 
                                                    SortImageHeight="10">
                                                    <Columns>
                                                    <ComponentArt:GridColumn DataField="ID" Visible="false" Width = "0" DataCellCssClass = "hiddenData" HeadingCellCssClass = "hiddenHeader" />
                                                    <ComponentArt:GridColumn HeadingText="" DataField="ArticleNumber" Width="100" />
                                                    <ComponentArt:GridColumn HeadingText="" DataField="OrderRowDescription" Width="120" DataCellCssClass="DataCellTextInCoupleLines"/>
                                                    <ComponentArt:GridColumn HeadingText="" DataField="UnitListPrice" FormatString="N" Align="Right"  Width="100" DataCellCssClass = "currencyStyle" />
                                                    <ComponentArt:GridColumn HeadingText="" DataField="UnitCampaignPrice" FormatString="N" Align="Right"  Width="100" DataCellCssClass = "currencyStyle" />
                                                    <ComponentArt:GridColumn HeadingText="" DataField="Quantity" Align="Right"  Width="30" />                                                                                                        
                                                    <ComponentArt:GridColumn HeadingText="" DataField="TotalDiscountAmount" FormatString="N" Align="Right"  Width="100" DataCellCssClass = "currencyStyle" />
                                                    <ComponentArt:GridColumn HeadingText="" DataField="VATPercentage" FormatString="N" Align="Right" DataCellCssClass = "currencyStyle"  Width="50" />                                                    
                                                    <ComponentArt:GridColumn HeadingText="" DataField="TotalVATAmount" FormatString="N" Align="Right"  DataCellCssClass = "currencyStyle"  Width="100" />
                                                    <ComponentArt:GridColumn HeadingText="" DataField="TotalPrice" FormatString="N" Align="Right" DataCellCssClass = "currencyStyle GridRowTotal"  Width="100" />
                                                    </Columns>
                                                </ComponentArt:GridLevel>
                                            </Levels>
                                            <ClientTemplates>
                                                <ComponentArt:ClientTemplate Id="SliderTemplateClient">
                                                    <table class="SliderPopup" cellspacing="0" cellpadding="0" border="0">
                                                        <tr>
                                                            <td valign="top" style="padding:5px;">
                                                                <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                                                    <tr>
                                                                        <td>
                                                                            <table cellspacing="0" cellpadding="2" border="0" style="width:255px;">
                                                                                <tr>
                                                                                    <td><div style="overflow:hidden;width:115px;" class="litText"><nobr>## 
                                                                                        DataItem.GetMember(2).Value ##</nobr></div></td>
                                                                                    <td><div style="overflow:hidden;width:135px;" class="litText"><nobr>## 
                                                                                        DataItem.GetMember(3).Value ##</nobr></div></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                       <tr>
                                                            <td class="SliderBottom">
                                                                <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                                                    <tr>
                                                                        <td>@Page&nbsp;<b>## DataItem.PageIndex + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridItemsOrdered.PageCount ##</b></td>
                                                                        <td align="right">@Post&nbsp;<b>## DataItem.Index + 1 ##</b>&nbsp;@Of&nbsp;<b>## 
                                                                            c_gridItemsOrdered.RecordCount ##</b></td>
                                                                    </tr>
                                                                </table>  
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ComponentArt:ClientTemplate>
                                                <ComponentArt:ClientTemplate ID="PagerInfoTemplate">
                                                    <table cellspacing="0" cellpadding="0" border="0">
                                                        <tr>
                                                            <td class="GridFooterText">@Page <b>## c_gridItemsOrdered.CurrentPageIndex + 1 ##</b> @Of <b>
                                                                ## c_gridItemsOrdered.PageCount ##</b> (## c_gridItemsOrdered.RecordCount ## @Items)</td>
                                                        </tr>
                                                    </table>
                                                </ComponentArt:ClientTemplate>                                           
                                            </ClientTemplates>
                                            <ClientEvents>
                                                <ItemSelect EventHandler = "OrderRowItemSelect" />
                                                <Load EventHandler="Grid_onLoad" />

                                            </ClientEvents>
                                        </ComponentArt:Grid>
                                    <br />
                                </asp:Panel>
                                
                                <asp:Panel ID = "c_panelOrderRowComments" runat = "server">
                                <div class = "PrintHeadShow"><Foundation:ModuleString ID="c_moduleStringOrderRowCommentsPrintHeader" Name="OrderRowComments" runat="server" /></div>
                                <div class="MidGrid">
                                    <ComponentArt:Grid id="c_gridOrderRowComments" runat="server" AllowPaging = "false"
	                                                RunningMode="Client"
	                                                EnableViewState = "false"
	                                                ClientTarget ="Auto"  
                                                    CssClass="Grid"
                                                    ShowHeader="true"
                                                    ShowFooter="false"
                                                    ShowSearchBox="false"                                        
                                                    AllowMultipleSelect="false"
                                                    AllowHtmlContent = "true"
                                                    HeaderCssClass="GridHeaderNoIcon" 
                                                    KeyboardEnabled="false"
                                                    FooterCssClass="GridFooter" 
                                                    GroupByCssClass="GroupByCell"
                                                    GroupByTextCssClass="GroupByText"                                         
                                                    PreExpandOnGroup="true"
                                                    ImagesBaseUrl="~/LitiumStudio/Images/grid/" 
                                                    PagerStyle="Slider" 
                                                    PagerPosition="BottomLeft"
                                                    PagerInfoPosition="BottomRight"
                                                    PagerInfoClientTemplateId="PagerInfoTemplate"
                                                    PagerTextCssClass="litContentInfo"
                                                    PagerButtonWidth="18"
                                                    PagerButtonHeight="18"
                                                    SliderHeight="18"
                                                    SliderWidth="150" 
                                                    SliderGripWidth="9" 
                                                    SliderPopupOffsetX="20"
                                                    SliderPopupClientTemplateId="SliderTemplateClient" 
                                                    PagerImagesFolderUrl="~/LitiumStudio/Images/grid/pager/"
                                                    TreeLineImageWidth="22" 
                                                    TreeLineImageHeight="19" 
                                                    IndentCellWidth="22" 
                                                    GroupingNotificationTextCssClass="litContentTopHeader"
                                                    GroupBySortAscendingImageUrl="sort_ascending.png"
                                                    GroupBySortDescendingImageUrl="sort_descending.png"
                                                    GroupBySortImageWidth="16"
                                                    GroupBySortImageHeight="16"
                                                    LoadingPanelClientTemplateId="LoadingFeedbackTemplate"
                                                    LoadingPanelPosition="MiddleCenter"
                                                    LoadingPanelEnabled="true"
                                                    ManualPaging="false"
                                                    Width = "100%"
                                                    Visible = "true"
                                                    >
                                                    <Levels>
                                                        <ComponentArt:GridLevel
                                                            DataKeyField="ID"
                                                            ShowTableHeading="false" 
                                                            ShowSelectorCells="false" 
                                                            RowCssClass="Row" 
                                                            ColumnReorderIndicatorImageUrl="reorder.gif"
                                                            DataCellCssClass="DataCell" 
                                                            HeadingCellCssClass="HeadingCell" 
                                                            HeadingCellHoverCssClass="HeadingCellHover" 
                                                            HeadingCellActiveCssClass="HeadingCellActive" 
                                                            HeadingRowCssClass="HeadingRow" 
                                                            HeadingTextCssClass="HeadingCellTextNoSorting"
                                                            SelectedRowCssClass="Row"
                                                            HoverRowCssClass="Row"
                                                            GroupHeadingCssClass="GroupHeading" 
                                                            SortAscendingImageUrl="sort_ascending.png" 
                                                            SortDescendingImageUrl="sort_descending.png" 
                                                            SortedHeadingCellCssClass="HeadingCellSorted"
                                                            SortImageWidth="16" 
                                                            SortImageHeight="10">
                                                            <Columns>
                                                            <ComponentArt:GridColumn DataField="ID" Visible="false" Width = "0" DataCellCssClass = "hiddenData" HeadingCellCssClass = "hiddenHeader" />
                                                            <ComponentArt:GridColumn HeadingText="" DataField="ArticleNumber"  Width = "250"/>
                                                            <ComponentArt:GridColumn HeadingText="" DataField="Comments" />                                                                                   
                                                            </Columns>
                                                        </ComponentArt:GridLevel>
                                                    </Levels>         
                                                    <ClientEvents>
                                                        <Load EventHandler="Grid_onLoad" />
                                                    </ClientEvents>                               
                                                </ComponentArt:Grid>
                                </div>
                                <br />
                                </asp:Panel>
                            </Foundation:InformationGroup>
                            <br />
                        </div>
                    </div>
                    
                    <asp:Repeater ID="c_repeaterPaymentInfo" runat="server" OnItemDataBound="c_repeaterPaymentInfo_ItemDataBound">
                         <ItemTemplate>
                            <Pages:PaymentInformationView ID="c_paymentInfo" runat="server" />
                         </ItemTemplate>
                    </asp:Repeater>
                                       
                    <div class="printBorder">
                        <div class="MidGrid2">
                            <div runat="server" id="c_divRepeaterDeliveries">
                                <asp:Repeater ID="c_repeaterDeliveries" runat="server" OnItemDataBound="c_repeaterDeliveries_ItemDataBound">
                                <ItemTemplate>
                                      
                                <!-- Repeater Content -->

                                <div> 
                                    <!-- Shipping Address --> 
                                    <Foundation:InformationGroup runat="server" ID="c_informationGroupShippingAddress" HeaderText = "" Width="100%" >
                                        <asp:Panel runat="server" ID="c_panelShippingAddress" Visible="true">
                                        
                                        <div>
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="innerTable">
                                                <tr>
                                                    <td valign="top">   
                                                        <table cellspacing="0" cellpadding="0" width="310px">
                                                            <tr id = "c_rowDeliveryCostTotalExcludingVAT" runat = "server" visible="true">
                                                                <td class="litFormLeft litBoldText" style="padding-top: 10px;"><Foundation:ModuleString ID="c_moduleStringDeliveryCostTotalExcludingVAT" Name="DeliveryCostTotalExcludingVAT" runat="server" />:</td>
                                                                <td class="litFormRight litText" style="text-align: right;"><asp:label runat="server" id="c_labelDeliveryCostTotalExcludingVAT" /></td>
                                                            </tr>
                                                            <tr id = "c_rowDeliveryCostVAT" runat = "server" visible="true">
                                                                <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringDeliveryCostVAT" Name="DeliveryCostVAT" runat="server" />:</td>
                                                                <td class="litFormRight litText" style="text-align: right;"><asp:label runat="server" id="c_labelDeliveryCostVAT" Text = '<%#DataBinder.Eval(Container.DataItem, "VATAmount", "{0:f}") %>' /></td>
                                                            </tr>
                                                            <tr id = "c_rowDeliveryCostTotalIncludingVAT" runat = "server" visible="true">
                                                                <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringDeliveryCost" Name="DeliveryCostTotalIncludingVAT" runat="server" />:</td>
                                                                <td class="litFormRight litText" style="text-align: right;"><asp:label runat="server" id="c_labelDeliveryCostTotalIncludingVAT" Text = '<%#DataBinder.Eval(Container.DataItem, "TotalDeliveryCostWithVAT", "{0:f}") %>' /></td>
                                                            </tr>
                                                            <tr id = "c_rowDeliveryStatus" runat = "server" visible="false">
                                                                <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringDeliveryStatus" Name="DeliveryStatus" runat="server" />:</td>
                                                                <td class="litFormRight litText" style="text-align: right;"><asp:label runat="server" id="c_labelDeliveryStatus" /></td>
                                                            </tr>
                                                            <tr id = "c_rowDeliveryMethod" runat="server">
                                                                <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringDeliveryMethod" Name="DeliveryMethod" runat="server" />:</td>
                                                                <td class="litFormRight litText" style="text-align: right;"><asp:label runat="server" id="c_labelDeliveryMethod" /></td>
                                                            </tr>   
                                                            <tr id = "c_rowDeliveryDate" runat="server">
                                                                <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringDeliveryDate" Name="DeliveryDate" runat="server" />:</td>
                                                                <td class="litFormRight litText" style="text-align: right;"><asp:label runat="server" id="c_labelDeliveryDate" /></td>
                                                            </tr>                                      
                                                             <tr id = "c_rowDeliveryComment" runat="server">
                                                                <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringDeliveryComment" Name="DeliveryComments" runat="server" />:</td>
                                                                <td class="litFormRight litText" style="text-align: right;"><asp:label runat="server" id="c_labelDeliveryComment" /></td>
                                                            </tr>    
                                                            
                                                             <asp:Repeater ID="c_repeaterAdditionalDeliveryInfo" runat="server">
                                                                <ItemTemplate>
                                                                   
			                                                        <tr>
				                                                        <td class="litFormLeft litBoldText">
				                                                            <asp:Label ID="c_labelAdditionalInfoKey" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Key")%>'></asp:Label>:
                                                                        </td>
                                                                        <td class="litFormRight litText" style="text-align: right;">
                                                                            <asp:Label ID="c_labelAdditionalInfoValue" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Value")%>'></asp:Label>
                                                                        </td>
                                                                    </tr>                                    
                                                                    
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </table> 
                                                    </td>
                                                    <td style="padding-left: 29px;" class="printBlock" valign="top">        
                                                        <table cellspacing="0" cellpadding="0"  border="0" width="310px">
                                                            <tr id="c_rowShippingCustomerName" runat="server" visible="false">
                                                                <td class="litFormLeft litBoldText" style="padding-top: 10px;"><Foundation:ModuleString ID="c_moduleStringShippingCustomerName" Name="CustomerName" runat="server" />:</td>
                                                                <td class="litFormRight litText"><asp:label runat="server" id="c_labelCustomerNameShipping" Text='<%#DataBinder.Eval(Container.DataItem, "Address.FirstName")%>'/></td>
                                                            </tr>
                                         
                                                            <tr id = "c_rowShippingAddressEmail" runat = "server" visible="false">
                                                                <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringEmailShipping" Name="Email" runat="server" />:</td>
                                                                <td class="litFormRight litText"><a href='mailto:<%#DataBinder.Eval(Container.DataItem, "Address.Email")%>' class="lsMailLink"><asp:label runat="server" id="c_labelEmailShipping" Text='<%#DataBinder.Eval(Container.DataItem, "Address.Email")%>'/></a></td>
                                                            </tr>
                                                            
                                                            <tr id="c_rowShippingAddressRow1" runat="server" visible="false">
                                                                <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringAddressRow1Shipping" Name="AddressRow1" runat="server" />:</td>
                                                                <td class="litFormRight litText"><asp:label runat="server" id="c_labelAddressRow1Shipping" Text='<%#DataBinder.Eval(Container.DataItem, "Address.Address")%>'/></td>
                                                            </tr>
                                                            
                                                            <tr id="c_rowShippingAddressRow2" runat="server" visible="false">
                                                                <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringAddressRow2Shipping" Name="AddressRow2" runat="server" />:</td>
                                                                <td class="litFormRight litText"><asp:label runat="server" id="c_labelAddressRow2Shipping" Text='<%#DataBinder.Eval(Container.DataItem, "Address.Address2")%>'/></td>
                                                            </tr>
                                                            
                                                            <tr id = "c_rowShippingAddressZip" runat = "server" visible="false">
                                                                <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringZipShipping" Name="Zip" runat="server" />:</td>
                                                                <td class="litFormRight litText"><asp:label runat="server" id="c_labelZipShipping" Text='<%#DataBinder.Eval(Container.DataItem, "Address.Zip")%>'/></td>
                                                            </tr>
                                                            <tr id = "c_rowShippingAddressCity" runat = "server" visible="false">
                                                                <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringCityShipping" Name="City" runat="server" />:</td>
                                                                <td class="litFormRight litText"><asp:label runat="server" id="c_labelCityShipping" Text='<%#DataBinder.Eval(Container.DataItem, "Address.City")%>'/></td>
                                                            </tr>
                                                            <tr id = "c_rowShippingAddressState" runat = "server" visible="false">
                                                                <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringStateShipping" Name="State" runat="server" />:</td>
                                                                <td class="litFormRight litText"><asp:label runat="server" id="c_labelStateShipping" Text='<%#DataBinder.Eval(Container.DataItem, "Address.State")%>'/></td>
                                                            </tr>
                                                            <tr id = "c_rowShippingAddressCountry" runat = "server" visible="false">
                                                                <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringCountyShipping" Name="Country" runat="server" />:</td>
                                                                <td class="litFormRight litText"><asp:label runat="server" id="c_labelCountyShipping" Text='<%#DataBinder.Eval(Container.DataItem, "Address.Country")%>'/></td>
                                                            </tr>
                                                        
                                                        </table>                       
                                                    </td>
                                                    <td valign="top"  class="printBlock" style="padding-left: 29px;">      
                                                        <table  cellspacing="0" cellpadding="0" width="310px">
                                                            <tr id = "c_rowShippingAddressMobilePhone" runat = "server" visible="true">
                                                                <td class="litFormLeft litBoldText" style="padding-top: 10px;"><Foundation:ModuleString ID="c_moduleStringMobilePhoneShipping" Name="MobilePhone" runat="server" />:</td>
                                                                <td class="litFormRight litText"><asp:label runat="server" id="c_labelMobilePhoneShipping" Text='<%#DataBinder.Eval(Container.DataItem, "Address.MobilePhone")%>'/></td>
                                                            </tr>
                                                            
                                                            <tr id = "c_rowShippingAddressPhone" runat = "server" visible="false">
                                                                <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringHomePhoneShipping" Name="HomePhone" runat="server" />:</td>
                                                                <td class="litFormRight litText"><asp:label runat="server" id="c_labelHomePhoneShipping" Text='<%#DataBinder.Eval(Container.DataItem, "Address.Phone")%>'/></td>
                                                            </tr>
                                                            
                                                            <tr id = "c_rowShippingAddressFax" runat = "server" visible="false">
                                                                <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringDeliveryFax" Name="Fax" runat="server" />:</td>
                                                                <td class="litFormRight litText"><asp:label runat="server" id="c_labelDeliveryFax" Text='<%#DataBinder.Eval(Container.DataItem, "Address.Fax")%>'/></td>
                                                            </tr>
                                                        </table>                             
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>                    
                                    </asp:Panel>
                                    <div style="padding-top:6px;" class="printMove2">
                                      <div class = "PrintHeadShow"><Foundation:ModuleString ID="c_moduleStringDeliveryPrintHeader" Name="DeliveryRows" runat="server" /></div>
                                    </div>
                                    <asp:Panel runat="server" ID="c_panelDeliveryRows" Visible="true">                                   
                                                <ComponentArt:Grid id="c_gridDeliveryRows" Visible = "true" runat="server" AllowPaging = "false"
                                                    RunningMode="Client" 
                                                    EnableViewState = "false"
                                                    CssClass="Grid"
                                                    ClientTarget ="Auto" 
                                                    ShowHeader="true"
                                                    ShowFooter="false"
                                                    ShowSearchBox="false"                                        
                                                    AllowMultipleSelect="false"
                                                    HeaderCssClass="GridHeaderNoIcon" 
                                                    KeyboardEnabled="false"
                                                    FooterCssClass="GridFooter" 
                                                    GroupByCssClass="GroupByCell"
                                                    GroupByTextCssClass="GroupByText"                                         
                                                    PreExpandOnGroup="true"
                                                    ImagesBaseUrl="~/LitiumStudio/Images/grid/" 
                                                    PagerStyle="Slider" 
                                                    PagerPosition="BottomLeft"
                                                    PagerInfoPosition="BottomRight"
                                                    PagerInfoClientTemplateId="PagerInfoTemplate"
                                                    PagerTextCssClass="litContentInfo"
                                                    PagerButtonWidth="18"
                                                    PagerButtonHeight="18"
                                                    SliderHeight="18"
                                                    SliderWidth="150" 
                                                    SliderGripWidth="9" 
                                                    SliderPopupOffsetX="20"
                                                    SliderPopupClientTemplateId="SliderTemplateClient" 
                                                    PagerImagesFolderUrl="~/LitiumStudio/Images/grid/pager/"
                                                    TreeLineImageWidth="22" 
                                                    TreeLineImageHeight="19" 
                                                    IndentCellWidth="22" 
                                                    GroupingNotificationTextCssClass="litContentTopHeader"
                                                    GroupBySortAscendingImageUrl="sort_ascending.png"
                                                    GroupBySortDescendingImageUrl="sort_descending.png"
                                                    GroupBySortImageWidth="16"
                                                    GroupBySortImageHeight="16"
                                                    LoadingPanelClientTemplateId="LoadingFeedbackTemplate"
                                                    LoadingPanelPosition="MiddleCenter"
                                                    LoadingPanelEnabled="true"
                                                    ManualPaging="false"
                                                    Width = "100%"
                                                    >
                                                    <Levels>
                                                        <ComponentArt:GridLevel
                                                            AllowSorting="false"
                                                            DataKeyField="ID"
                                                            ShowTableHeading="false" 
                                                            ShowSelectorCells="false" 
                                                            RowCssClass="Row" 
                                                            ColumnReorderIndicatorImageUrl="reorder.gif"
                                                            DataCellCssClass="DataCell" 
                                                            HeadingCellCssClass="HeadingCell" 
                                                            HeadingCellHoverCssClass="HeadingCellHover" 
                                                            HeadingCellActiveCssClass="HeadingCellActive" 
                                                            HeadingRowCssClass="HeadingRow" 
                                                            HeadingTextCssClass="HeadingCellTextNoSorting"
                                                            SelectedRowCssClass="Row"
                                                            HoverRowCssClass="Row"
                                                            GroupHeadingCssClass="GroupHeading" 
                                                            SortAscendingImageUrl="sort_ascending.png" 
                                                            SortDescendingImageUrl="sort_descending.png" 
                                                            SortedHeadingCellCssClass="HeadingCellSorted"
                                                            SortImageWidth="16" 
                                                            SortImageHeight="10">
                                                            <Columns>
                                                                <ComponentArt:GridColumn DataField="ID" Visible="false" Width = "0" DataCellCssClass = "hiddenData" HeadingCellCssClass = "hiddenHeader" />
                                                                <ComponentArt:GridColumn DataField="ArticleNumber" Width = "100" />
                                                                <ComponentArt:GridColumn DataField="OrderRowDescription" Width = "200" DataCellCssClass="DataCellTextInCoupleLines"/>
                                                                <ComponentArt:GridColumn DataField="SKUCode" Width = "70" AllowSorting="False" />
                                                                <ComponentArt:GridColumn DataField="Quantity" Width = "30" Align ="Right" />
                                                            </Columns>
                                                        </ComponentArt:GridLevel>
                                                    </Levels>
                                                    <ClientTemplates>
                                                        <ComponentArt:ClientTemplate Id="SliderTemplateClient">
                                                            <table class="SliderPopup" cellspacing="0" cellpadding="0" border="0">
                                                                <tr>
                                                                    <td valign="top" style="padding:5px;">
                                                                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                                                            <tr>
                                                                                <td>
                                                                                    <table cellspacing="0" cellpadding="2" border="0" style="width:255px;">
                                                                                        <tr>
                                                                                            <td><div style="overflow:hidden;width:115px;" class="litText"><nobr>## 
                                                                                                DataItem.GetMember(2).Value ##</nobr></div></td>
                                                                                            <td><div style="overflow:hidden;width:135px;" class="litText"><nobr>## 
                                                                                                DataItem.GetMember(3).Value ##</nobr></div></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                               <tr>
                                                                    <td class="SliderBottom">
                                                                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                                                            <tr>
                                                                                <td>@Page&nbsp;<b>## DataItem.PageIndex + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridDeliveryRows.PageCount ##</b></td>
                                                                                <td align="right">@Post&nbsp;<b>## DataItem.Index + 1 ##</b>&nbsp;@Of&nbsp;<b>## 
                                                                                    c_gridDeliveryRows.RecordCount ##</b></td>
                                                                            </tr>
                                                                        </table>  
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ComponentArt:ClientTemplate>
                                                        <ComponentArt:ClientTemplate ID="PagerInfoTemplate">
                                                            <table cellspacing="0" cellpadding="0" border="0">
                                                                <tr>
                                                                    <td class="GridFooterText">@Page <b>## c_gridDeliveryRows.CurrentPageIndex + 1 ##</b> @Of <b>
                                                                        ## c_gridDeliveryRows.PageCount ##</b> (## c_gridDeliveryRows.RecordCount ## @Items)</td>
                                                                </tr>
                                                            </table>
                                                        </ComponentArt:ClientTemplate>
                                                    </ClientTemplates>
                                                    <ClientEvents>
                                                            <Load EventHandler="Grid_onLoad" />
                                                    </ClientEvents>
                                                </ComponentArt:Grid>                                    
                                        </asp:Panel>
                                    </Foundation:InformationGroup>                             
                                </div>
                                    
                                
                            
                                <!-- Repeater Content -->
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div style="clear: both;"></div>
                    </div>
                    <asp:Panel id="c_panelError" runat="server" visible="false"> 
			            <span class="litErrorMsg"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><asp:Label id="c_labelError" runat="server"/></span>
		            </asp:Panel>
    </asp:Panel>
    </div>
</asp:Content>
