<%@ page language="C#" masterpagefile="~/LitiumStudio/ECommerce/Framework/Base1.master" enableeventvalidation="false" validaterequest="false" autoeventwireup="true" inherits="LitiumStudio_ECommerce_AddEditOrder, Litum.Studio.Web" %>
<%@ Import Namespace="Litium.Studio.UI.ECommerce.Common.Constants"%>
<%@ MasterType VirtualPath="~/LitiumStudio/ECommerce/Framework/Base1.master" %>
<%@ Register TagPrefix="Pages" TagName="GeneralPage" Src="~/LitiumStudio/ECommerce/WebUserControls/General.ascx" %>
<%@ Register TagPrefix="Pages" TagName="CustomerInfoPage" Src="~/LitiumStudio/ECommerce/WebUserControls/CustomerInfo.ascx" %>
<%@ Register TagPrefix="Pages" TagName="BillingPage" Src="~/LitiumStudio/ECommerce/WebUserControls/Billing.ascx" %>
<%@ Register TagPrefix="Pages" TagName="DeliveryPage" Src="~/LitiumStudio/ECommerce/WebUserControls/Delivery.ascx" %>
<%@ Register TagPrefix="Pages" TagName="OrderTotalPage" Src="~/LitiumStudio/ECommerce/WebUserControls/OrderTotal.ascx" %>
<%@ Register TagPrefix="Pages" TagName="ItemsOrderedPage" Src="~/LitiumStudio/ECommerce/WebUserControls/ItemsOrdered.ascx" %>
<%@ Register TagPrefix="Pages" TagName="RelationsPopup" src="~/LitiumStudio/WebUserControls/RelationsDialog.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
    
   <script type="text/javascript">  
        var checkBoxClicked = false;
        var checkCount = 0;
        var buttonAddRowID = 'c_toolbarItemAddRow';
        var buttonViewRowID = 'c_toolbarItemViewRow';
        var buttonEditRowID = 'c_toolbarItemEditRow';
        var buttonDeleteID = 'c_toolbarItemDelete';   
        
        var addOrderRowText = "<%=m_currentModule.Strings[Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.ADD_ROW, this.FoundationContext.LanguageID] %>";
        var addDeliveryRowText = "<%=m_currentModule.Strings[Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.DELIVERY_ROW_ADD, this.FoundationContext.LanguageID] %>";
        var viewOrderRowText = "<%=m_currentModule.Strings[Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.VIEW_ROW, this.FoundationContext.LanguageID] %>";
        var viewDeliveryRowText = "<%=m_currentModule.Strings[Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.VIEW_DELIVERY_ROW, this.FoundationContext.LanguageID] %>";

        function onTabSelect(sender, eventArgs) {
            var orderID = '';
            var tabId = eventArgs._tab.get_value();
            setToolbarButtonVisible(buttonAddRowID, false);
            setToolbarButtonVisible(buttonViewRowID, false);
            setToolbarButtonVisible(buttonEditRowID, false);
            setToolbarButtonVisible(buttonDeleteID, false);

            if (tabId == '<%=ModuleStringConstants.ORDER_ROWS %>')
            {
                c_toolbarAddEditOrder.get_items().getItemById(buttonAddRowID).set_text(addOrderRowText);
                c_toolbarAddEditOrder.get_items().getItemById(buttonViewRowID).set_text(viewOrderRowText);
                setToolbarButtonVisible(buttonAddRowID, true);
                setToolbarButtonVisible(buttonViewRowID, true);
                setToolbarButtonVisible(buttonEditRowID, true);
                document.getElementById("<% Response.Write(c_hiddenSelectedTab.ClientID.ToString()); %>").value = 'ItemsOrdered';
            }
            else if (tabId == '<%=ModuleStringConstants.CUSTOMER_INFO%>')
            {
               document.getElementById("<% Response.Write(c_hiddenSelectedTab.ClientID.ToString()); %>").value = 'CustomerInfo';
            }
            else if (tabId == '<%=ModuleStringConstants.DELIVERIES%>')
            {
                document.getElementById("<% Response.Write(c_hiddenSelectedTab.ClientID.ToString()); %>").value = 'Delivery';
                
                c_toolbarAddEditOrder.get_items().getItemById(buttonAddRowID).set_text(addDeliveryRowText);
                c_toolbarAddEditOrder.get_items().getItemById(buttonViewRowID).set_text(viewDeliveryRowText);
                setToolbarButtonVisible(buttonAddRowID, true);
                setToolbarButtonVisible(buttonViewRowID, true);
                setToolbarButtonVisible(buttonDeleteID, true);
            }
            else if (tabId == '<%=ModuleStringConstants.BILLING%>')
            {
               document.getElementById("<% Response.Write(c_hiddenSelectedTab.ClientID.ToString()); %>").value = 'Billing';
            }
            else
            {
                document.getElementById("<% Response.Write(c_hiddenSelectedTab.ClientID.ToString()); %>").value = '';
            }
            
            if(isToolbarButtonVisible(buttonViewRowID))
            {
                setToolbarButtonEnabled(buttonViewRowID, false);
            }
            if(isToolbarButtonVisible(buttonEditRowID))
            {
                setToolbarButtonEnabled(buttonEditRowID, false);
            }
            if(isToolbarButtonVisible(buttonDeleteID))
            {
                setToolbarButtonEnabled(buttonDeleteID, false);
            }
            enableDisableAddRowButton();

        }
        
        function enableDisableAddRowButton()
        {
            if(isToolbarButtonVisible('c_toolbarItemAddRow'))
            {        
				orderID = document.getElementById("<% Response.Write(c_hiddenOrderId.ClientID); %>").value;
				var selectedTab = document.getElementById("<% Response.Write(c_hiddenSelectedTab.ClientID); %>").value;
				PageMethods.GetOrderEditability(orderID, (selectedTab == 'Delivery'), callMethodOrderEditability_Success, callMethod_Failure);
			}
        }
        
        function callMethodOrderEditability_Success(results, userContext, methodName) 
        {
            if (results == 'true')
                setToolbarButtonEnabled(buttonAddRowID, true);
            else
                setToolbarButtonEnabled(buttonAddRowID, false);
        }        
        
        function callMethodDeliveryRemovability_Success(results, userContext, methodName) {
        	if (results == 'true')
                setToolbarButtonEnabled(buttonDeleteID, true);
            else
                setToolbarButtonEnabled(buttonDeleteID, false);
        }        
        
        function onCheckChange(sender, eventArgs)
        {
            checkBoxClicked = true;
        }
        
        function updateDeliveryChecks(sender, eventArgs)
        {
            var orderID = '';
            var checked = eventArgs.get_item().get_cells()[0].get_value();
            if (!checkBoxClicked) 
            {
                c_gridDeliveries.beginUpdate();
                eventArgs.get_item().SetValue(0, ! checked);
                c_gridDeliveries.endUpdate();
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

            setToolbarButtonEnabled(buttonViewRowID, checkCount > 0 && checkCount == 1);
            setToolbarButtonEnabled(buttonEditRowID, false);
            setToolbarButtonEnabled(buttonDeleteID, checkCount > 0);

            var selectedDeliveries = getSelectedDeliveryIds();
            if (selectedDeliveries == '')
            {
            	setToolbarButtonEnabled(buttonViewRowID, false);
                setToolbarButtonEnabled(buttonEditRowID, false);
                setToolbarButtonEnabled(buttonDeleteID, false);
            }
            else
            {
                if (isToolbarButtonEnabled(buttonDeleteID))
                {
                    orderID = document.getElementById("<% Response.Write(c_hiddenOrderId.ClientID.ToString()); %>").value;
                    selectedDeliveries = orderID + '^' + selectedDeliveries;
                    PageMethods.GetDeliveryRemovability(selectedDeliveries, callMethodDeliveryRemovability_Success, callMethod_Failure);
                }
            }
        
        }
        
        function getSelectedDeliveryIds()
        {
            var deliveryIds = '';
            var i=0;
            for (i=0; i<c_gridDeliveries.get_table().getRowCount(); i++)
            {
                if (c_gridDeliveries.get_table().getRow(i).get_cells()[0].get_value())
                {
                    deliveryIds = deliveryIds + 
                    c_gridDeliveries.get_table().getRow(i).getMember('<%=DELIVERIES_GRID_ITEM_KEY_NAME%>').get_text() + '|';
                }
            }
            if (deliveryIds != '')
                deliveryIds  = deliveryIds.substring(0, deliveryIds.length - 1);
                
            return deliveryIds;
        }

        function setToolbarButtonEnabled(id, enabled)
        {
            c_toolbarAddEditOrder.get_items().getItemById(id).set_enabled(enabled);
        }
        
        function isToolbarButtonEnabled(id)
        {
            return c_toolbarAddEditOrder.get_items().getItemById(id).get_enabled();
        }
        
        function setToolbarButtonVisible(id, visible)
        {
            c_toolbarAddEditOrder.get_items().getItemById(id).set_visible(visible);
        }
        
        function isToolbarButtonVisible(id)
        {
            return c_toolbarAddEditOrder.get_items().getItemById(id).get_visible();
        }

        function onItemSelect(sender, eventArgs)
        {
     
            var tabName = document.getElementById("<% Response.Write(c_hiddenSelectedTab.ClientID.ToString()); %>").value;

            if (tabName == '<%=DELIVERY_TAB_IDENTIFIER%>')
            {
                updateDeliveryChecks(sender, eventArgs);
            }
            else
            {
                setToolbarButtonEnabled(buttonViewRowID, isToolbarButtonVisible(buttonViewRowID));
                setToolbarButtonEnabled(buttonEditRowID, isToolbarButtonVisible(buttonEditRowID));
            }
        }
        
        var selected;

        function togglePerson()
        {
          if(c_dialogPersonPopup.get_isShowing())
          {
            c_dialogPersonPopup.Close();
          }
          else
          {
            c_dialogPersonPopup.Show();
          }
        }
        
        function toggleOrganization()
        {
          if(c_dialogOrganizationPopup.get_isShowing())
          {
            c_dialogOrganizationPopup.Close();
          }
          else
          {
            c_dialogOrganizationPopup.Show();
          }
        }
        
        function GetBillingDataFromCustomerInfo()
        {
            if(document.getElementById("<% Response.Write(BillingPageCheckboxSameAsCustomerInfoClientId); %>").checked)
            {
                if(document.getElementById("<% Response.Write(BillingPageTextBoxFirstNameClientId); %>").disabled == false)
                {
                    document.getElementById("<% Response.Write(BillingPageTextBoxFirstNameClientId); %>").value = document.getElementById("<% Response.Write(CustomerInfoPageTextBoxFirstNameClientId); %>").value;
                }
                if(document.getElementById("<% Response.Write(BillingPageTextBoxLastNameClientId); %>").disabled == false)
                {
                    document.getElementById("<% Response.Write(BillingPageTextBoxLastNameClientId); %>").value = document.getElementById("<% Response.Write(CustomerInfoPageTextBoxLastNameClientId); %>").value;
                }                
                if(document.getElementById("<% Response.Write(BillingPageTextBoxAddressRow1ClientId); %>").disabled == false)
                {
                    document.getElementById("<% Response.Write(BillingPageTextBoxAddressRow1ClientId); %>").value = document.getElementById("<% Response.Write(CustomerInfoPageTextBoxAddressRow1ClientId); %>").value;
                }
                if(document.getElementById("<% Response.Write(BillingPageTextBoxAddressRow2ClientId); %>").disabled == false)
                {
                    document.getElementById("<% Response.Write(BillingPageTextBoxAddressRow2ClientId); %>").value = document.getElementById("<% Response.Write(CustomerInfoPageTextBoxAddressRow2ClientId); %>").value;
                }
                if(document.getElementById("<% Response.Write(BillingPageTextBoxZipClientId); %>").disabled == false)
                {
                    document.getElementById("<% Response.Write(BillingPageTextBoxZipClientId); %>").value = document.getElementById("<% Response.Write(CustomerInfoPageTextBoxZipClientId); %>").value;
                }
                if(document.getElementById("<% Response.Write(BillingPageTextBoxCityClientId); %>").disabled == false)
                {
                    document.getElementById("<% Response.Write(BillingPageTextBoxCityClientId); %>").value = document.getElementById("<% Response.Write(CustomerInfoPageTextBoxCityClientId); %>").value;
                }
                if(document.getElementById("<% Response.Write(BillingPageDropdownListCountryClientId); %>").disabled == false)
                {
                    document.getElementById("<% Response.Write(BillingPageDropdownListCountryClientId); %>").value = document.getElementById("<% Response.Write(CustomerInfoPageDropdownListCountryClientId); %>").value;
                }
                if(document.getElementById("<% Response.Write(BillingPageTextBoxPhoneClientId); %>").disabled == false)
                {
                    document.getElementById("<% Response.Write(BillingPageTextBoxPhoneClientId); %>").value = document.getElementById("<% Response.Write(CustomerInfoPageTextBoxHomePhoneClientId); %>").value;
                }

                if (document.getElementById("<% Response.Write(BillingPageTextBoxMobilePhoneClientId); %>").disabled == false) {
                    document.getElementById("<% Response.Write(BillingPageTextBoxMobilePhoneClientId); %>").value = document.getElementById("<% Response.Write(CustomerInfoPageTextBoxMobilePhoneClientId); %>").value;
                }
                if (document.getElementById("<% Response.Write(BillingPageTextBoxFaxClientId); %>").disabled == false) {
                    document.getElementById("<% Response.Write(BillingPageTextBoxFaxClientId); %>").value = document.getElementById("<% Response.Write(CustomerInfoPageTextBoxFaxClientId); %>").value;
                }
                if (document.getElementById("<% Response.Write(BillingPageTextBoxStateClientId); %>").disabled == false) {
                    document.getElementById("<% Response.Write(BillingPageTextBoxStateClientId); %>").value = document.getElementById("<% Response.Write(CustomerInfoPageTextBoxStateClientId); %>").value;
                }
                if (document.getElementById("<% Response.Write(BillingPageTextBoxEmailClientId); %>").disabled == false) {
                    document.getElementById("<% Response.Write(BillingPageTextBoxEmailClientId); %>").value = document.getElementById("<% Response.Write(CustomerInfoPageTextBoxEmailClientId); %>").value;
                }
            }            
            else
            {
                if(document.getElementById("<% Response.Write(BillingPageTextBoxFirstNameClientId); %>").disabled == false)
                {
                    document.getElementById("<% Response.Write(BillingPageTextBoxFirstNameClientId); %>").value = '';
                }
                if(document.getElementById("<% Response.Write(BillingPageTextBoxLastNameClientId); %>").disabled == false)
                {
                    document.getElementById("<% Response.Write(BillingPageTextBoxLastNameClientId); %>").value = '';
                }                
                if(document.getElementById("<% Response.Write(BillingPageTextBoxAddressRow1ClientId); %>").disabled == false)
                {
                    document.getElementById("<% Response.Write(BillingPageTextBoxAddressRow1ClientId); %>").value = '';
                }
                if(document.getElementById("<% Response.Write(BillingPageTextBoxAddressRow2ClientId); %>").disabled == false)
                {
                    document.getElementById("<% Response.Write(BillingPageTextBoxAddressRow2ClientId); %>").value = '';
                }
                if(document.getElementById("<% Response.Write(BillingPageTextBoxZipClientId); %>").disabled == false)
                {
                    document.getElementById("<% Response.Write(BillingPageTextBoxZipClientId); %>").value = '';
                }
                if(document.getElementById("<% Response.Write(BillingPageTextBoxCityClientId); %>").disabled == false)
                {
                    document.getElementById("<% Response.Write(BillingPageTextBoxCityClientId); %>").value = '';
                }
                if(document.getElementById("<% Response.Write(BillingPageDropdownListCountryClientId); %>").disabled == false)
                {
                    document.getElementById("<% Response.Write(BillingPageDropdownListCountryClientId); %>").value = 'AF';
                }
                if(document.getElementById("<% Response.Write(BillingPageTextBoxPhoneClientId); %>").disabled == false)
                {
                    document.getElementById("<% Response.Write(BillingPageTextBoxPhoneClientId); %>").value = '';
                }

                if (document.getElementById("<% Response.Write(BillingPageTextBoxMobilePhoneClientId); %>").disabled == false) {
                    document.getElementById("<% Response.Write(BillingPageTextBoxMobilePhoneClientId); %>").value = '';
                }
                if (document.getElementById("<% Response.Write(BillingPageTextBoxFaxClientId); %>").disabled == false) {
                    document.getElementById("<% Response.Write(BillingPageTextBoxFaxClientId); %>").value = '';
                }
                if (document.getElementById("<% Response.Write(BillingPageTextBoxStateClientId); %>").disabled == false) {
                    document.getElementById("<% Response.Write(BillingPageTextBoxStateClientId); %>").value = '';
                }
                if (document.getElementById("<% Response.Write(BillingPageTextBoxEmailClientId); %>").disabled == false) {
                    document.getElementById("<% Response.Write(BillingPageTextBoxEmailClientId); %>").value = '';
                }
            }            
        }
        
        function GetPersonForCustomerInfo()
        {          
           var personId = document.getElementById("<% Response.Write(CustomerInfoPageHiddenFieldPersonIdClientId); %>").value;
           PageMethods.GetPersonForCustomerInfo(personId, callMethod_Success, callMethod_Failure);  
        }
        
        function GetPersonForBilling()
        {
           var personId = document.getElementById("<% Response.Write(BillingPageHiddenFieldPersonIdClientId); %>").value;
           PageMethods.GetPersonForBilling(personId, callMethod_Success, callMethod_Failure);
        }
        
        function GetOrganizationForCustomerInfo()
        {
            document.getElementById("<% Response.Write(CustomerInfoPageHiddenFieldOrganizationIdClientId); %>").value = document.getElementById("<% Response.Write(CustomerInfoPageDropdownListOrganizations); %>").value;
            // call the page method from here once this is implemented.
        }
        
        function GetOrganizationForBilling()
        {
            var organizationId = document.getElementById("<% Response.Write(BillingPageDropdownListOrganizationClientId); %>").value;
            PageMethods.GetOrganizationForBilling(organizationId, callMethod_Success_Organization, callMethod_Failure);            
        }
        
        function callMethod_Success(results, userContext, methodName) 
        {
            if(results != '')
            {
                var organizationInfo = new Array();
                var orderInfo = new Array();
                var tempArray = new Array();
                
                tempArray = results.split('^');
                orderInfo = tempArray[0].split('|'); 
                organizationInfo = tempArray[1].split('|'); 
                
                if(methodName == 'GetPersonForCustomerInfo')
                {
                    if(document.getElementById("<% Response.Write(CustomerInfoPageTextBoxFirstNameClientId); %>").disabled == false)
                    {
                        document.getElementById("<% Response.Write(CustomerInfoPageTextBoxFirstNameClientId); %>").value = orderInfo[0];
                    }
                    if(document.getElementById("<% Response.Write(CustomerInfoPageTextBoxLastNameClientId); %>").disabled == false)
                    {
                        document.getElementById("<% Response.Write(CustomerInfoPageTextBoxLastNameClientId); %>").value = orderInfo[1];
                    }
                    if(document.getElementById("<% Response.Write(CustomerInfoPageTextBoxCustomerNumberClientId); %>").disabled == false)
                    {
                        document.getElementById("<% Response.Write(CustomerInfoPageTextBoxCustomerNumberClientId); %>").value = orderInfo[2];
                        document.getElementById("<% Response.Write(CustomerInfoPageHiddenFieldCustomerNumberClientId); %>").value = orderInfo[2];
                    }
                    if(document.getElementById("<% Response.Write(CustomerInfoPageTextBoxEmailClientId); %>").disabled == false)
                    {
                        document.getElementById("<% Response.Write(CustomerInfoPageTextBoxEmailClientId); %>").value = orderInfo[3];
                    }
                    if(document.getElementById("<% Response.Write(CustomerInfoPageTextBoxMobilePhoneClientId); %>").disabled == false)
                    {
                        document.getElementById("<% Response.Write(CustomerInfoPageTextBoxMobilePhoneClientId); %>").value = orderInfo[4];
                    }
                    if(document.getElementById("<% Response.Write(CustomerInfoPageTextBoxHomePhoneClientId); %>").disabled == false)
                    {
                        document.getElementById("<% Response.Write(CustomerInfoPageTextBoxHomePhoneClientId); %>").value = orderInfo[5];
                    }
                    if(document.getElementById("<% Response.Write(CustomerInfoPageTextBoxFaxClientId); %>").disabled == false)
                    {
                        document.getElementById("<% Response.Write(CustomerInfoPageTextBoxFaxClientId); %>").value = orderInfo[6];
                    }
                    if(document.getElementById("<% Response.Write(CustomerInfoPageTextBoxAddressRow1ClientId); %>").disabled == false)
                    {
                        document.getElementById("<% Response.Write(CustomerInfoPageTextBoxAddressRow1ClientId); %>").value = orderInfo[7];
                    }
                    if(document.getElementById("<% Response.Write(CustomerInfoPageTextBoxAddressRow2ClientId); %>").disabled == false)
                    {
                        document.getElementById("<% Response.Write(CustomerInfoPageTextBoxAddressRow2ClientId); %>").value = orderInfo[8];
                    }
                    if(document.getElementById("<% Response.Write(CustomerInfoPageTextBoxZipClientId); %>").disabled == false)
                    {
                        document.getElementById("<% Response.Write(CustomerInfoPageTextBoxZipClientId); %>").value = orderInfo[9];
                    }
                    if(document.getElementById("<% Response.Write(CustomerInfoPageTextBoxCityClientId); %>").disabled == false)
                    {
                        document.getElementById("<% Response.Write(CustomerInfoPageTextBoxCityClientId); %>").value = orderInfo[10];
                    }
                    if(document.getElementById("<% Response.Write(CustomerInfoPageTextBoxStateClientId); %>").disabled == false)
                    {
                        document.getElementById("<% Response.Write(CustomerInfoPageTextBoxStateClientId); %>").value = orderInfo[11];
                    }
                    if(document.getElementById("<% Response.Write(CustomerInfoPageDropdownListCountryClientId); %>").disabled == false)
                    {
                        document.getElementById("<% Response.Write(CustomerInfoPageDropdownListCountryClientId); %>").value = orderInfo[12];
                    }
                    var organizationListBox = document.getElementById("<% Response.Write(CustomerInfoPageDropdownListOrganizations); %>");
                    var organizationTextBox = document.getElementById("<% Response.Write(CustomerInfoPageTextboxOrganizationName); %>");
                    
                    if(organizationInfo.length > 0 && organizationInfo[0] != '')
                    {                       
                        organizationTextBox.style.visibility="hidden";
                        organizationListBox.style.display = "inline";                            
                        organizationTextBox.style.display = "none";
                        fillOrganizationDropdown(organizationListBox,organizationInfo);                        
                    }
                    else
                    {                 
                        organizationTextBox.style.visibility="visible"; 
                        organizationTextBox.style.display = "inline";
                        organizationListBox.style.display = "none";
                        // Clear the organization id value for persons who does not have an organizations
                        document.getElementById("<% Response.Write(CustomerInfoPageHiddenFieldOrganizationIdClientId); %>").value = '';
                    }
                }
                else if(methodName == 'GetPersonForBilling')
                { 
                    fillBillingAddress(orderInfo); 
                   
                    if(organizationInfo.length > 0)
                    {
                        var organizationListBox = document.getElementById("<% Response.Write(BillingPageDropdownListOrganizationClientId); %>");
                        organizationListBox.style.display = "inline"; 
                        
                        fillOrganizationDropdown(organizationListBox,organizationInfo);
                    }
                }
            }                       
        }
        
        function callMethod_Success_Organization(results, userContext, methodName) 
        {
            if(methodName == 'GetOrganizationForBilling')
            {
                var tempArrayBilling = new Array();
                if(results != '')
                {
                    tempArrayBilling = results.split('|');
                    fillBillingAddress(tempArrayBilling);
                }
                else
                {
                    clearBillingAddress();
                }
            }            
        }
        
        function callMethod_Failure(errors, userContext, methodName) 
        {    
            alert(errors.get_message()); 
        }  
        
        function fillBillingAddress(itemsArray)
        {
            if(document.getElementById("<% Response.Write(BillingPageTextBoxFirstNameClientId); %>").disabled == false)
            {
                document.getElementById("<% Response.Write(BillingPageTextBoxFirstNameClientId); %>").value = itemsArray[0];
            }
            if(document.getElementById("<% Response.Write(BillingPageTextBoxLastNameClientId); %>").disabled == false)
            {
                document.getElementById("<% Response.Write(BillingPageTextBoxLastNameClientId); %>").value = itemsArray[1];
            }            
            if(document.getElementById("<% Response.Write(BillingPageTextBoxAddressRow1ClientId); %>").disabled == false)
            {
                document.getElementById("<% Response.Write(BillingPageTextBoxAddressRow1ClientId); %>").value = itemsArray[2];
            }
            if(document.getElementById("<% Response.Write(BillingPageTextBoxAddressRow2ClientId); %>").disabled == false)
            {
                document.getElementById("<% Response.Write(BillingPageTextBoxAddressRow2ClientId); %>").value = itemsArray[3];
            }
            if(document.getElementById("<% Response.Write(BillingPageTextBoxZipClientId); %>").disabled == false)
            {
                document.getElementById("<% Response.Write(BillingPageTextBoxZipClientId); %>").value = itemsArray[4];
            }
            if(document.getElementById("<% Response.Write(BillingPageTextBoxCityClientId); %>").disabled == false)
            {
                document.getElementById("<% Response.Write(BillingPageTextBoxCityClientId); %>").value = itemsArray[5];
            }
            if(document.getElementById("<% Response.Write(BillingPageDropdownListCountryClientId); %>").disabled == false)
            {
                document.getElementById("<% Response.Write(BillingPageDropdownListCountryClientId); %>").value = itemsArray[6];
            }
            if(document.getElementById("<% Response.Write(BillingPageTextBoxPhoneClientId); %>").disabled == false)
            {
                document.getElementById("<% Response.Write(BillingPageTextBoxPhoneClientId); %>").value = itemsArray[7];
            }
        }
        
        function clearBillingAddress()
        {
             if(document.getElementById("<% Response.Write(BillingPageTextBoxFirstNameClientId); %>").disabled == false)
            {
                document.getElementById("<% Response.Write(BillingPageTextBoxFirstNameClientId); %>").value = '';
            }
            if(document.getElementById("<% Response.Write(BillingPageTextBoxLastNameClientId); %>").disabled == false)
            {
                document.getElementById("<% Response.Write(BillingPageTextBoxLastNameClientId); %>").value = '';
            }            
            if(document.getElementById("<% Response.Write(BillingPageTextBoxAddressRow1ClientId); %>").disabled == false)
            {
                document.getElementById("<% Response.Write(BillingPageTextBoxAddressRow1ClientId); %>").value = '';
            }
            if(document.getElementById("<% Response.Write(BillingPageTextBoxAddressRow2ClientId); %>").disabled == false)
            {
                document.getElementById("<% Response.Write(BillingPageTextBoxAddressRow2ClientId); %>").value = '';
            }
            if(document.getElementById("<% Response.Write(BillingPageTextBoxZipClientId); %>").disabled == false)
            {
                document.getElementById("<% Response.Write(BillingPageTextBoxZipClientId); %>").value = '';
            }
            if(document.getElementById("<% Response.Write(BillingPageTextBoxCityClientId); %>").disabled == false)
            {
                document.getElementById("<% Response.Write(BillingPageTextBoxCityClientId); %>").value = '';
            }
            if(document.getElementById("<% Response.Write(BillingPageDropdownListCountryClientId); %>").disabled == false)
            {
                document.getElementById("<% Response.Write(BillingPageDropdownListCountryClientId); %>").value = 'AL';
            }
            if(document.getElementById("<% Response.Write(BillingPageTextBoxPhoneClientId); %>").disabled == false)
            {
                document.getElementById("<% Response.Write(BillingPageTextBoxPhoneClientId); %>").value = '';
            }
        }
        
        function fillOrganizationDropdown(organizationListBox, organizationInfo)
        {
            organizationListBox.options.length = 0;
            
            var optn = document.createElement("OPTION");
            optn.text = document.getElementById("<% Response.Write(c_hiddenOrganizationDefaultItemCaption.ClientID.ToString()); %>").value;
            optn.value ='00000000-0000-0000-0000-000000000000';
            organizationListBox.options.add(optn);
            for (var i=0; i < organizationInfo.length; i++)
            {
                if(organizationInfo[i] != '')
                {
                    var tempOrganization = new Array();
                    tempOrganization = organizationInfo[i].split(',');
                    
                    var optn = document.createElement("OPTION");
                    optn.text = tempOrganization[1];
                    optn.value =tempOrganization[0];
                    organizationListBox.options.add(optn);
                }
            }
        }
        
        function ValidateCommentLength()
        {
            var textBox = document.getElementById("<% Response.Write(GeneralPageTextBoxCommentClientId); %>");
            var commentLength = textBox.value.length;
            
            if(commentLength >= 255)
            {
                textBox.value = textBox.value.substring(0,254);
            }
        }
        
        function UpdatePaymentMethod()
        {
            var paymentMethodIndex = document.getElementById("<% Response.Write(BillingPageDropdownListPaymentMethodClientId); %>").selectedIndex;
            var paymentMethod = document.getElementById("<% Response.Write(BillingPageDropdownListPaymentMethodClientId); %>").options[paymentMethodIndex].value;
            document.getElementById("<% Response.Write(BillingPageHiddenFieldPaymentMethodIdClientId); %>").value = paymentMethod;           
        }
        
        
        // Called from the billing tab. 
        function GetPaymentMethods()
        {
            var orderId = document.getElementById("<% Response.Write(c_hiddenOrderId.ClientID.ToString()); %>").value;
            var hiddenPaymentProvider = document.getElementById("<% Response.Write(c_hiddenPaymentProvider.ClientID.ToString()); %>");
            var paymentProviderIndex = document.getElementById("<% Response.Write(BillingPageDropdownListPaymentProviderClientId); %>").selectedIndex;
            var paymentProvider = document.getElementById("<% Response.Write(BillingPageDropdownListPaymentProviderClientId); %>").options[paymentProviderIndex].value;
            var languageId = '<%= CurrentLanguageId %>';
            
            hiddenPaymentProvider.value = paymentProvider;
            PageMethods.GetPaymentMethods(orderId, paymentProvider, languageId, callMethod_Success_PaymentMethod, callMethod_Failure_PaymentMethod);
        }
        
        function callMethod_Success_PaymentMethod(results, userContext, methodName) 
        {
            if(methodName == 'GetPaymentMethods')
            {
                var paymentMethodsArray = new Array();
                var paymentMethodsDropdown = document.getElementById("<% Response.Write(BillingPageDropdownListPaymentMethodClientId); %>");
                paymentMethodsDropdown.options.length = 0;
                paymentMethodsDropdown.disabled = false;
                if(results != 'dummyItem')
                {   
                    paymentMethodsArray = results.split('|');
                    for (var i=0; i < paymentMethodsArray.length - 1; i++)
                    {
                        
                        var tempPaymentMethod = new Array();
                        tempPaymentMethod = paymentMethodsArray[i].split(',');
                        var optn = document.createElement("OPTION");
                        optn.text = tempPaymentMethod[1];
                        optn.value =tempPaymentMethod[0];
                        paymentMethodsDropdown.options.add(optn);
                        if(i == 0)
                        {
                            // The first payment method value is set by default. 
                            // c_hiddenPaymentMethodId is updated only when the on chage even of the payment methods dropdown is fired. 
                            // therefore if the user doesnt change the value in the dropdown at least once, this is not updated correctly.
                            // because of this reason we assign the first value as the default here.
                            document.getElementById("<% Response.Write(BillingPageHiddenFieldPaymentMethodIdClientId); %>").value = tempPaymentMethod[0];  
                        }
                    }
                }               
            }           
        }
        
        function callMethod_Failure_PaymentMethod(errors, userContext, methodName) 
        {    
            var toolbar = document.getElementById("<% Response.Write(c_toolbarAddEditOrder.ClientID.ToString()); %>");
            var paymentMethodsDropdown = document.getElementById("<% Response.Write(BillingPageDropdownListPaymentMethodClientId); %>");
            paymentMethodsDropdown.options.length = 0;
            paymentMethodsDropdown.disabled = true;
        }

        function toolbarItemSelected(sender, eventArgs) {
            var toolbarItem = eventArgs.get_item().get_id();
            if (toolbarItem == 'c_toolbarItemDelete') {
                var confirmationMessage = "<%=m_currentModule.Strings[Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.DELETE_DELIVERY_CONFIRMATION, FoundationContext.LanguageID] %>";
                var confirmed = confirm(confirmationMessage);
                if (confirmed) {
                    __doPostBack('delete', '');
                }
            }
            if (toolbarItem == 'c_toolbarItemCancel')
            {
                __doPostBack('cancel', '');
//                PageMethods.Cancel(callCancelMethod_Success, callCancelMethod_Failure);
//                document.location = '<%= ResolveUrl(UrlConstants.ORDERS) %>';
           }
            if (toolbarItem == 'c_toolbarItemSave') {
                __doPostBack('save', '');
            }
            if (toolbarItem == 'c_toolbarItemSaveAndExit') {

                __doPostBack('saveexit', '');
            }
        }



        function callCancelMethod_Success(results, userContext, methodName)
        {
        
        }

        function callCancelMethod_Failure(errors, userContext, methodName)
        {
            // alert(errors.getMessage());
           setToolbarButtonEnabled(buttonAddRowID, false);
        }
     
    </script>

    <Pages:RelationsPopup ID="relationsPopupPage" runat="server" />
    
    <ComponentArt:ToolBar ID="c_toolbarAddEditOrder" OnItemCommand="c_toolbarAddEditOrder_ItemCommand"
        runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
        DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
        DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
        ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
        DefaultItemImageHeight="16">
        <Items runat="server" >
            <ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemCancel" ImageUrl="icons_standard/sign_stop.png" CausesValidation="False" AutoPostBackOnSelect = "false" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemSave" ImageUrl="icons_standard/floppy_disk_blue.png" AutoPostBackOnSelect="false" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
            <ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemSaveAndExit" ImageUrl="icons_standard/floppy_disk_blue.png" AutoPostBackOnSelect="false" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
            <ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemAddRow" ImageUrl="icons_standard/add.png" Visible="false" CausesValidation="False" AutoPostBackOnSelect = "true" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
            <ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemViewRow" ImageUrl="icons_standard/view.png" Visible="false" CausesValidation="False" AutoPostBackOnSelect = "true" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
            <ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemEditRow" ImageUrl="icons_standard/pencil.png" Visible="false" CausesValidation="False" AutoPostBackOnSelect = "true" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
            <ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemDelete" ImageUrl="icons_standard/delete.png" Visible="false" CausesValidation="False" AutoPostBackOnSelect = "false" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
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
        <ClientEvents>
            <ItemSelect EventHandler="toolbarItemSelected" />
        </ClientEvents> 
    </ComponentArt:ToolBar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <div class="UIMove">
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td valign="middle" style="height:34px;" class="litPageStatusHeaderV2">
                    <img id="c_headerImage" runat="server" src="Images/transparent.gif" style="vertical-align:middle; margin-right:5px;" class="litIconShoppingBag" alt="" />
                    <asp:Label ID="c_headerLabel" runat="server"></asp:Label>
                </td>
            </tr> 
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
<div class="lsContentTabScroll" style="padding-bottom:0px;height: 94%;" >
    <asp:HiddenField ID="c_hiddenSelectedTab" runat="server" />
    <asp:HiddenField ID="c_hiddenOrganizationDefaultItemCaption" runat="server" />
    <asp:HiddenField ID="c_hiddenOrderId" runat="server" />    
    <asp:HiddenField ID="c_hiddenPaymentProvider" runat="server" Value="PayEx" />
    <asp:HiddenField ID="c_hiddenPaymentStatus" runat="server" Value="init" />
    
    <asp:HiddenField ID="c_hiddenSSN" runat="server" />
    <asp:HiddenField ID="c_hiddenAnnualIncome" runat="server" />
    <asp:HiddenField ID="c_hiddenCampeignCode" runat="server" />
    <asp:HiddenField ID="c_hiddenCountryCode" runat="server" />
    
    <asp:HiddenField ID="c_hiddenIsChargeEnabled" runat="server" Value="false" />
    <asp:HiddenField ID="c_hiddenIsReserveEnabled" runat="server" Value="false" />
    <asp:HiddenField ID="c_hiddenIsCancelEnabled" runat="server" Value="false" />   
    
    
        
    <LS:TabContainer ID="m_tabs" runat="server" OnClientTabSelected="onTabSelect"></LS:TabContainer>
</div>  
    <script language="javascript" type="text/javascript">
	    enableDisableAddRowButton();    
    </script>
</asp:Content>
