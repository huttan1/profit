<%@ page language="C#" masterpagefile="~/LitiumStudio/ECommerce/Framework/Base1.master" enableeventvalidation="false" validaterequest="false" autoeventwireup="true" inherits="LitiumStudio_ECommerce_AddDelivery, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ECommerce/Framework/Base1.master" %>
<%@ Register TagPrefix="Pages" TagName="RelationsPopup" src="~/LitiumStudio/WebUserControls/RelationsDialog.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    
    <script type="text/javascript">

    	var checkBoxClicked = false;
    	var callbackSet = false;

    	function GetPersonForDelivery() 
        {
        	if (callbackSet) return;
			
			var personId = document.getElementById("<% Response.Write(c_hiddenPersonId.ClientID.ToString()); %>").value;
			PageMethods.GetPersonForDelivery(personId, callMethod_Success, callMethod_Failure); 
        }
        
        function GetOrganizationForDelivery()
        {
        	if (callbackSet) return;
            
            var organizationId = document.getElementById("<% Response.Write(c_dropDownListShippingOrganization.ClientID.ToString()); %>").value;
            PageMethods.GetOrganizationForDelivery(organizationId, callMethod_Success, callMethod_Failure);            
        }
        
        function GetDeliveryCost()
        {
        	if (callbackSet) return; 
        	
        	if (document.getElementById("<% Response.Write(c_checkBoxIsDefaultDeliveryCost.ClientID.ToString()); %>").checked)
            {
                var orderId = getControlValue("<% Response.Write(c_hiddenFieldOrderID.ClientID.ToString()); %>"); 
                var deliveryMethodId = getControlValue("<% Response.Write(c_dropDownListDeliveryMethod.ClientID.ToString()); %>"); 
                var culture = getControlValue("<% Response.Write(c_hiddenFieldCulture.ClientID.ToString()); %>"); 
                var orderRows = getSelectedOrderRows();                
                var address = getShippingAddress();
                
                PageMethods.GetDefaultDeliveryCost(orderId, deliveryMethodId, orderRows, address, culture, 
                                                    callMethod_Success, callMethod_Failure); 
            }            
        }

        function getShippingAddress()
        {
            var address = '';
            address = getControlValue("<% Response.Write(c_textBoxShippingAddressRow1.ClientID.ToString()); %>") + 
                      '<% Response.Write(OUTPUT_STRING_SEPERATOR1); %>' +
                      getControlValue("<% Response.Write(c_textBoxShippingAddressRow2.ClientID.ToString()); %>") + 
                      '<% Response.Write(OUTPUT_STRING_SEPERATOR1); %>' +
                      getControlValue("<% Response.Write(c_textBoxShippingCity.ClientID.ToString()); %>") +             
                      '<% Response.Write(OUTPUT_STRING_SEPERATOR1); %>' +
                      getControlValue("<% Response.Write(c_dropDownListShippingCountries.ClientID.ToString()); %>") +             
                      '<% Response.Write(OUTPUT_STRING_SEPERATOR1); %>' +
                      getControlValue("<% Response.Write(c_textBoxShippingFirstName.ClientID.ToString()); %>") +             
                      '<% Response.Write(OUTPUT_STRING_SEPERATOR1); %>' +
                      getControlValue("<% Response.Write(c_textBoxShippingLastName.ClientID.ToString()); %>") +             
                      '<% Response.Write(OUTPUT_STRING_SEPERATOR1); %>' +
                      getControlValue("<% Response.Write(c_textBoxShippingMobile.ClientID.ToString()); %>") +             
                      '<% Response.Write(OUTPUT_STRING_SEPERATOR1); %>' +
                      getControlValue("<% Response.Write(c_textBoxShippingPhone.ClientID.ToString()); %>") +             
                      '<% Response.Write(OUTPUT_STRING_SEPERATOR1); %>' +
                      getControlValue("<% Response.Write(c_textBoxShippingZip.ClientID.ToString()); %>") +
                      '<% Response.Write(OUTPUT_STRING_SEPERATOR1); %>' +
                       getControlValue("<% Response.Write(c_textBoxShippingAddressEmail.ClientID.ToString()); %>") +
                      '<% Response.Write(OUTPUT_STRING_SEPERATOR1); %>' +
                      getControlValue("<% Response.Write(c_textBoxShippingFax.ClientID.ToString()); %>") +
                      '<% Response.Write(OUTPUT_STRING_SEPERATOR1); %>' +
                      getControlValue("<% Response.Write(c_textBoxShippingState.ClientID.ToString()); %>") +
                      '<% Response.Write(OUTPUT_STRING_SEPERATOR1); %>';
                      
            address  = address.substring(0, address.length - 1)
            return address;
        }
        
        function getSelectedOrderRows()
        {
            var orderRows = '';
            var i = 0;
            for (i = 0; i < c_gridOrderRows.get_table().getRowCount(); i++) 
            {
                if (c_gridOrderRows.get_table().getRow(i).get_cells()[0].get_value())
                {
                    orderRows = orderRows + 
                            c_gridOrderRows.get_table().getRow(i).getMember('ID').get_text() + 
                            '<% Response.Write(OUTPUT_STRING_SEPERATOR1); %>' +
                            c_gridOrderRows.get_table().getRow(i).getMember('Quantity').get_text() + 
                            '<% Response.Write(OUTPUT_STRING_SEPERATOR1); %>' +
                            c_gridOrderRows.get_table().getRow(i).getMember('SKUCode').get_text() + 
                            '<% Response.Write(OUTPUT_STRING_SEPERATOR2); %>';
                }
            }
            orderRows  = orderRows.substring(0, orderRows.length - 1)
            return orderRows;
        }
        
        function callMethod_Success(results, userContext, methodName) 
        {
        	callbackSet = true;

            if (methodName == 'GetPersonForDelivery')
            {
                setPersonForDelivery(results);
            }
            else if (methodName == 'GetOrganizationForDelivery')
            {
                setOrganization(results);
            }
            else if (methodName == 'GetDefaultDeliveryCost')
            {
                setDeliveryCost(results);
            }

            callbackSet = false;
        }

        function callMethod_Failure(errors, userContext, methodName) 
        {
        	alert(errors.get_message()); 
        }  

        function deliveryCostChanged()
        {
            document.getElementById("<% Response.Write(c_checkBoxIsDefaultDeliveryCost.ClientID.ToString()); %>").checked = false;
        }
        
        function deliveryMethodChanged()
        {
            document.getElementById("<% Response.Write(c_checkBoxIsDefaultDeliveryCost.ClientID.ToString()); %>").checked = true;
            GetDeliveryCost();
        }
        
        function setPersonForDelivery(results)
        {
            if(results != '')
            {
                var organizationInfo = new Array();
                var orderInfo = new Array();
                var tempArray = new Array();
                
                tempArray = results.split('<% Response.Write(OUTPUT_STRING_SEPERATOR2); %>');
                orderInfo = tempArray[0].split('<% Response.Write(OUTPUT_STRING_SEPERATOR1); %>'); 
                organizationInfo = tempArray[1].split('<% Response.Write(OUTPUT_STRING_SEPERATOR1); %>'); 
                
                fillDeliveryAddress(orderInfo);       
                                
                if(organizationInfo.length > 0)
                {
                    var organizationListBox = document.getElementById("<% Response.Write(c_dropDownListShippingOrganization.ClientID.ToString()); %>");
                    organizationListBox.style.display = "inline"; 
                    fillOrganizationDropdown(organizationListBox,organizationInfo);
                }
            }                       
        }
        
        function setOrganization(results) 
        {
            if(results != '')
            {
                var tempArrayDelivery = new Array();
                tempArrayDelivery = results.split('<% Response.Write(OUTPUT_STRING_SEPERATOR1); %>');
                fillDeliveryAddress(tempArrayDelivery);
            }
            else
            {
                clearDeliveryAddress();
            }
        }

        function setDeliveryCost(results) 
        {
            var deliveryCost = '', vatPercentage = '';
            var promisedDate = new Date();

            if(results != '')
            {
                var tempArray = new Array();
                tempArray = results.split('<% Response.Write(OUTPUT_STRING_SEPERATOR1); %>');
                deliveryCost = tempArray[0];
                //promisedDate = new Date(ValidatorConvert(tempArray[1], "Date", {}));

                var dateString = new Array();
                dateString = tempArray[1].split('-');
                var y = parseInt(dateString[0]);
                var m = parseInt(dateString[1]);
                var d = parseInt(dateString[2]);
                
                promisedDate = new Date(y, m-1, d);
                vatPercentage = tempArray[2];
            }

            document.getElementById("<% Response.Write(c_textBoxDeliveryCost.ClientID.ToString()); %>").value = deliveryCost;
            //c_calendarPromisedDeliveryDate.setSelectedDate(promisedDate);
        }

        function fillDeliveryAddress(itemsArray)
        {
            setControlValue("<% Response.Write(c_textBoxShippingFirstName.ClientID.ToString()); %>", itemsArray[0]);
            setControlValue("<% Response.Write(c_textBoxShippingLastName.ClientID.ToString()); %>", itemsArray[1]);
            setControlValue("<% Response.Write(c_textBoxShippingAddressEmail.ClientID.ToString()); %>", itemsArray[2]);
            setControlValue("<% Response.Write(c_textBoxShippingAddressRow1.ClientID.ToString()); %>", itemsArray[3]);
            setControlValue("<% Response.Write(c_textBoxShippingAddressRow2.ClientID.ToString()); %>", itemsArray[4]);
            setControlValue("<% Response.Write(c_textBoxShippingCity.ClientID.ToString()); %>", itemsArray[5]);
            setControlValue("<% Response.Write(c_dropDownListShippingCountries.ClientID.ToString()); %>", itemsArray[6]);
            setControlValue("<% Response.Write(c_textBoxShippingState.ClientID.ToString()); %>", itemsArray[7]);
            setControlValue("<% Response.Write(c_textBoxShippingZip.ClientID.ToString()); %>", itemsArray[8]);
            setControlValue("<% Response.Write(c_textBoxShippingPhone.ClientID.ToString()); %>", itemsArray[9]);
            setControlValue("<% Response.Write(c_textBoxShippingMobile.ClientID.ToString()); %>", itemsArray[10]);
            setControlValue("<% Response.Write(c_textBoxShippingFax.ClientID.ToString()); %>", itemsArray[11]);
        }

        function setControlValue(id, value)
        {
            if(document.getElementById(id).disabled == false)
            {
                document.getElementById(id).value = value;
            }
        }
        
        function getControlValue(id)
        {
            return document.getElementById(id).value;
        }
        
        function clearDeliveryAddress()
        {
            setControlValue("<% Response.Write(c_textBoxShippingFirstName.ClientID.ToString()); %>", '');
            setControlValue("<% Response.Write(c_textBoxShippingLastName.ClientID.ToString()); %>", '');
            setControlValue("<% Response.Write(c_textBoxShippingAddressRow1.ClientID.ToString()); %>", '');
            setControlValue("<% Response.Write(c_textBoxShippingAddressRow2.ClientID.ToString()); %>", '');
            setControlValue("<% Response.Write(c_textBoxShippingZip.ClientID.ToString()); %>", '');
            setControlValue("<% Response.Write(c_textBoxShippingCity.ClientID.ToString()); %>", '');
            setControlValue("<% Response.Write(c_textBoxShippingPhone.ClientID.ToString()); %>", '');
            setControlValue("<% Response.Write(c_textBoxShippingMobile.ClientID.ToString()); %>", '');
            setControlValue("<% Response.Write(c_textBoxShippingState.ClientID.ToString()); %>", '');
            setControlValue("<% Response.Write(c_textBoxShippingFax.ClientID.ToString()); %>", '');
            setControlValue("<% Response.Write(c_textBoxShippingAddressEmail.ClientID.ToString()); %>", '');
            setControlValue("<% Response.Write(c_dropDownListShippingCountries.ClientID.ToString()); %>", 'AL');
        }

        function GetDeliveryDataFromCustomerInfo()
        {
            if(document.getElementById("<% Response.Write(c_checkBoxSameAsCustomerInfo.ClientID.ToString()); %>").checked)
            {
                setControlValue("<% Response.Write(c_textBoxShippingFirstName.ClientID.ToString()); %>", 
                    getControlValue("<% Response.Write(c_custShippingFirstName.ClientID.ToString()); %>"));
                    
                setControlValue("<% Response.Write(c_textBoxShippingLastName.ClientID.ToString()); %>", 
                    getControlValue("<% Response.Write(c_custShippingLastName.ClientID.ToString()); %>"));
                    
                setControlValue("<% Response.Write(c_textBoxShippingAddressRow1.ClientID.ToString()); %>", 
                    getControlValue("<% Response.Write(c_custShippingAddressRow1.ClientID.ToString()); %>"));
                    
                setControlValue("<% Response.Write(c_textBoxShippingAddressRow2.ClientID.ToString()); %>", 
                    getControlValue("<% Response.Write(c_custShippingAddressRow2.ClientID.ToString()); %>"));
                    
                setControlValue("<% Response.Write(c_textBoxShippingZip.ClientID.ToString()); %>", 
                    getControlValue("<% Response.Write(c_custShippingZip.ClientID.ToString()); %>"));
                    
                setControlValue("<% Response.Write(c_textBoxShippingCity.ClientID.ToString()); %>", 
                    getControlValue("<% Response.Write(c_custShippingCity.ClientID.ToString()); %>"));
                    
                setControlValue("<% Response.Write(c_textBoxShippingPhone.ClientID.ToString()); %>", 
                    getControlValue("<% Response.Write(c_custShippingPhone.ClientID.ToString()); %>"));
                    
                setControlValue("<% Response.Write(c_textBoxShippingMobile.ClientID.ToString()); %>", 
                    getControlValue("<% Response.Write(c_custShippingMobile.ClientID.ToString()); %>"));
                    
                setControlValue("<% Response.Write(c_dropDownListShippingCountries.ClientID.ToString()); %>",
                    getControlValue("<% Response.Write(c_custCountry.ClientID.ToString()); %>"));

                setControlValue("<% Response.Write(c_textBoxShippingAddressEmail.ClientID.ToString()); %>",
                    getControlValue("<% Response.Write(c_custShippingEmail.ClientID.ToString()); %>"));

                setControlValue("<% Response.Write(c_textBoxShippingFax.ClientID.ToString()); %>",
                    getControlValue("<% Response.Write(c_custShippingFax.ClientID.ToString()); %>"));

                setControlValue("<% Response.Write(c_textBoxShippingState.ClientID.ToString()); %>",
                    getControlValue("<% Response.Write(c_custShippingState.ClientID.ToString()); %>"));
            }
            else
            {
                clearDeliveryAddress();
            }
        }
        

        function fillOrganizationDropdown(organizationListBox, organizationInfo)
        {
            organizationListBox.options.length = 0;
            
            var optn = document.createElement("OPTION");
            optn.text = document.getElementById('<% Response.Write(c_hiddenOrganizationDefaultItemCaption.ClientID.ToString()); %>').value;
            optn.value ='00000000-0000-0000-0000-000000000000';
            organizationListBox.options.add(optn);
            if(organizationInfo != '')
            {
                for (var i=0; i < organizationInfo.length; i++)
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

        function onCheckChange(sender, eventArgs)
        {
            checkBoxClicked = true;
        }
        
        function onItemSelect(sender, eventArgs)
        {
            var checked = eventArgs.get_item().get_cells()[0].get_value();
            if (!checkBoxClicked) 
            {
                c_gridOrderRows.beginUpdate();
                eventArgs.get_item().SetValue(0, ! checked);
                c_gridOrderRows.endUpdate();
            } 
            else 
            {
                checkBoxClicked = false;
            }
            
            GetDeliveryCost();
        }
        
    </script>

   

	<ComponentArt:ToolBar ID="c_toolbarAddEditRow"
		OnItemCommand="c_toolbarAddDelivery_ItemCommand" runat="server" 
		CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew" 
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" 
		DefaultItemActiveCssClass="litToolbarItemOnMouseDown" 
		DefaultItemDisabledCssClass="litToolbarItemDisabled" 
		ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false" 
		Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
		<Items>
			<ComponentArt:ToolBarItem ID="c_toolbarItemCancel" ImageUrl="icons_standard/sign_stop.png" AutoPostBackOnSelect="true" CausesValidation="False" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="c_toolbarItemSave" ImageUrl="icons_standard/floppy_disk_blue.png" AutoPostBackOnSelect="true" CausesValidation="True" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td valign="middle" style="height:34px;" class="litPageStatusHeaderV2">
                <span class="litContentTopHeader"><img src="Images/transparent.gif" alt="" runat="server" id="c_imageHeaderIcon" />
			    <Foundation:ModuleString ID="c_moduleStringAddEditRowHeader" Name="AddRow" runat="server" /></span>  
            </td>
        </tr>    
    </table>    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
<div class="lsContentScroll">
    <table cellpadding="15" cellspacing="0" border="0">
        <tr>       
            <td valign="top">   
                 <div style="float: left; width: 375px; padding-right: 10px;" class="TopLeft">       
                   <Foundation:InformationGroup runat="server" ID="c_informationGroupShipping" Width="375px" HeaderText="Delivery Address"> 
                   
                    <table border="0" cellpadding="0" cellspacing="0" style="height:250px;">
                        <tr>
                            <td colspan="3">
                                <asp:Panel ID= "c_panelPersonInfo" runat="server">
                                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                        <tr>
                                            <td>
                                                <div class="litBoldHeader">
                                                    <Foundation:ModuleString ID="ModuleStringShippingPerson" Name="Person" Runat="server"/>:
                                                </div>   
                                                <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                <td><asp:TextBox CssClass="litInputText150" runat="server" ID="c_textBoxPerson" Enabled = "false"></asp:TextBox></td>
                                                <td>&nbsp;<asp:Image imageurl="~/LitiumStudio/Images/icons_standard/businesswoman.png" runat="server" id="c_imageButtonPerson" /></td>
                                                </tr>
                                                </table>                                    
                                            </td>
                                            <td>&nbsp;</td>
                                            <td>
                                                <div class="litBoldHeader">
                                                    <Foundation:ModuleString ID="ModuleStringShippingOrganization" Name="Organization" Runat="server"/>:
                                                </div>
                                                <asp:DropDownList CssClass="litInputText150" ID="c_dropDownListShippingOrganization" runat="server" onchange = 'GetOrganizationForDelivery()'>                                                
                                                </asp:DropDownList>
                                            </td>
                                        </tr>                        
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <div class="litBoldHeader"><asp:CheckBox runat="server" Text="Same as customer info" CssClass="litCheckbox" ID="c_checkBoxSameAsCustomerInfo" TextAlign="Right" onclick = "GetDeliveryDataFromCustomerInfo()"/></div>
                            </td>
                        </tr>
                        
                         <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleShippingFirstName" Name="FirstName" Runat="server"/>
                                <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredFirstName" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                                <asp:TextBox CssClass="litInputText150" runat="server" MaxLength = "200" ID="c_textBoxShippingFirstName" ></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorShippingFirstName" ControlToValidate="c_textBoxShippingFirstName" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td style="width:32px;">&nbsp;</td>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringShippingLastName" Name="LastName" Runat="server"/>
                                <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredLastName" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                                <asp:TextBox CssClass="litInputText150" runat="server" MaxLength = "100" ID="c_textBoxShippingLastName" ></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorShippingLastName" ControlToValidate="c_textBoxShippingLastName" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr> 
                                
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringShippingAddressEmail" Name="Email" Runat="server"/>
                                <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredEmail" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                                <asp:TextBox CssClass="litInputText150" runat="server" MaxLength = "250" ID="c_textBoxShippingAddressEmail" ></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorShippingAddressEmail" ControlToValidate="c_textBoxShippingAddressEmail" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator Display="Dynamic" ID="c_validatorEmailPattern" ControlToValidate = "c_textBoxShippingAddressEmail" ValidationExpression = "\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ErrorMessage="*pattern"></asp:RegularExpressionValidator>
                            </td>
                            <td style="width:32px;">&nbsp;</td>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringShippingAddressRow1" Name="AddressRow1" Runat="server"/>
                                <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredAddress1" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                                <asp:TextBox CssClass="litInputText150" runat="server" MaxLength = "200" ID="c_textBoxShippingAddressRow1" ></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorShippingAddressRow1" ControlToValidate="c_textBoxShippingAddressRow1" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            
                        </tr>                    
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringShippingAddressRow2" Name="AddressRow2" Runat="server"/>
                                <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredAddress2" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                                <asp:TextBox CssClass="litInputText150" runat="server" MaxLength = "200" ID="c_textBoxShippingAddressRow2" ></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorShippingAddressRow2" ControlToValidate="c_textBoxShippingAddressRow2" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>                            
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringShippingCity" Name="City" Runat="server"/>
                                <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredCity" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                                <asp:TextBox CssClass="litInputText150" runat="server" MaxLength = "100" ID="c_textBoxShippingCity" ></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorShippingCity" ControlToValidate="c_textBoxShippingCity" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                           
                        </tr>    
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringShippingCountry" Name="Country" Runat="server"/>
                                <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredCountry" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                                <%--<asp:TextBox CssClass="litInputText150" runat="server" MaxLength = "50" ID="c_textBoxShippingCountry" ></asp:TextBox>
        	                    <asp:RequiredFieldValidator Display="Dynamic" ID="c_validatorShippingCountry" ControlToValidate="c_textBoxShippingCountry" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>--%>	                
        	                    <asp:DropDownList CssClass="litInputText150" ID="c_dropDownListShippingCountries" runat="server"></asp:DropDownList>	                
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringShippingState" Name="State" Runat="server"/>
                                <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredState" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                                <asp:TextBox CssClass="litInputText150" runat="server" MaxLength = "50" ID="c_textBoxShippingState" ></asp:TextBox>
	                            <asp:RequiredFieldValidator Display="Dynamic" ID="c_validatorShippingState" ControlToValidate="c_textBoxShippingState" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
	                            
                            </td>
                        </tr>                
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringShippingZip" Name="Zip" Runat="server"/>
                                <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredZip" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                                <asp:TextBox CssClass="litInputText150" runat="server" MaxLength = "15" ID="c_textBoxShippingZip" ></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorShippingZip" ControlToValidate="c_textBoxShippingZip" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>	                   
        	                </td>
        	                <td>&nbsp;</td>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringShippingPhone" Name="Phone" Runat="server"/>
                                <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredPhone" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                                <asp:TextBox CssClass="litInputText150" runat="server" MaxLength = "50" ID="c_textBoxShippingPhone" ></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorShippingPhone" ControlToValidate="c_textBoxShippingPhone" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>	                	                
	                            <asp:RegularExpressionValidator Display="Dynamic" ID="c_validatorShippingPhoneValue" runat="server" ControlToValidate="c_textBoxShippingPhone" ErrorMessage="*" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
	                            <asp:HiddenField ID="c_hiddenPersonId" runat="server" />
                            </td>
                        </tr>    
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringShippingMobile" Name="MobilePhone" Runat="server"/>
                                <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredMobile" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                                <asp:TextBox CssClass="litInputText150" runat="server" MaxLength = "50" ID="c_textBoxShippingMobile" ></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorShippingMobile" ControlToValidate="c_textBoxShippingMobile" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>	                	                
	                            <asp:RegularExpressionValidator Display="Dynamic" ID="c_validatorShippingMobileValue" runat="server" ControlToValidate="c_textBoxShippingMobile" ErrorMessage="*" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
        	                </td>
        	                <td>&nbsp;</td>
        	                <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringShippingFax" Name="Fax" Runat="server"/>
                                <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredFax" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                                <asp:TextBox CssClass="litInputText150" runat="server" MaxLength = "50" ID="c_textBoxShippingFax" ></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorShippingFax" ControlToValidate="c_textBoxShippingFax" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>	                	                
	                            
        	                </td>
                        </tr>                
                    </table>
                </Foundation:InformationGroup>
                </div>    
            
                <div style="float: left; width: 380px;" class="TopRight"> 
                    <Foundation:InformationGroup runat="server" ID="InformationGroup1" Width="380px" HeaderText="Delivery Info"> 
                    
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">           
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringDeliveryMethod" Name="DeliveryMethod" Runat="server"/>
                                <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredDeliveryMethod" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                                <asp:DropDownList id="c_dropDownListDeliveryMethod" cssclass="litInputText150" runat="server" onchange="deliveryMethodChanged()"/>                        
                            </td>
                            <td style="width:32px;">&nbsp;</td>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringPromisedDeliveryDate" Name="PromisedDeliveryDate" Runat="server"/>
                                <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredPromissedDeliveryDate" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
								<LS:DateTimeHelper runat="server" ID="radDatehelper" AssociatedControlID="c_calendarPromisedDeliveryDate" />
								<Telerik:RadDatePicker runat="server" ID="c_calendarPromisedDeliveryDate" />
                            </td>
                        </tr>
                        <tr>
							<td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringDeliveryCost" Name="DeliveryCost" Runat="server"/>
                                <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredDeliveryCost" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                                <asp:TextBox CssClass="litInputText150" runat="server" ID="c_textBoxDeliveryCost" MaxLength = "18" onchange="deliveryCostChanged()" ></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorShippingDeliveryCost" ControlToValidate="c_textBoxDeliveryCost" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>	                	                
                                <asp:CompareValidator Display="Dynamic" ID="c_validatorShippingDeliveryCostValue" runat="server" ControlToValidate="c_textBoxDeliveryCost" Operator="DataTypeCheck" Type="Currency" ErrorMessage="CompareValidator" CultureInvariantValues="false" ></asp:CompareValidator>
                                <asp:RangeValidator ID="c_validatorDeliveryCostRange" Type ="Currency" runat="server" MinimumValue = 0 MaximumValue = 9999999999999999.99 CultureInvariantValues="false" ControlToValidate = "c_textBoxDeliveryCost" ErrorMessage="*"></asp:RangeValidator>
							</td>
                            <td style="width:32px;">&nbsp;</td>
							<td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringDeliveryComments" Name="DeliveryComments" Runat="server"/>
                                <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredDeliveryComments" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                                <asp:TextBox CssClass="litInputText150" TextMode="MultiLine"  runat="server" ID="c_textBoxDeliveryComments" ></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorDeliveryComments" ControlToValidate="c_textBoxDeliveryComments" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
						</tr>
                        <tr>
                            <td colspan="3">
                                <asp:CheckBox ID="c_checkBoxIsDefaultDeliveryCost" runat="server" CssClass="litBoldHeader litCheckbox" Text="Set Default Delivery Cost" TextAlign="Right" onclick = "GetDeliveryCost()" />
                            </td>                            
                        </tr>
                    </table>
                    </Foundation:InformationGroup>
                </div>  
                
                <div style="clear: both;"></div>   
                
                <div class="MidGrid"></div>      
            </td>
        </tr>
    </table>
    </div>
    <div class="lsContentGridTab">
    <table cellpadding="0" cellspacing="0" border="0" style="height: 100%; width: 100%;">
        <tr>
	        <td valign="top"><!-- Column indexes is used in codebehind, remember to update them if column is changed -->
               <ComponentArt:Grid id="c_gridOrderRows" runat="server"
	                RunningMode="Client" 
                    CssClass="Grid"
                    ShowHeader="false"
                    ShowFooter="false"
                    ShowSearchBox="false"
                    SearchTextCssClass="SearchText"
                    SearchBoxPosition="TopRight"
                    SearchBoxCssClass="SearchBox"
                    SearchOnKeyPress="true"
                    AllowMultipleSelect="false"
                    HeaderCssClass="GridHeader" 
                    KeyboardEnabled="false"
                    FooterCssClass="GridFooter" 
                    GroupByCssClass="GroupByCell"
                    GroupByTextCssClass="GroupByText"
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
                    PreExpandOnGroup="true"
                    ImagesBaseUrl="~/LitiumStudio/Images/grid/" 
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
                    Width="100%"
                    Height="50" 
                    ScrollBar="Auto"
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
                            HeadingTextCssClass="HeadingCellText"
                            SelectedRowCssClass="SelectedRow"
                            HoverRowCssClass="HoverRow"
                            GroupHeadingCssClass="GroupHeading" 
                            SortAscendingImageUrl="sort_ascending.png" 
                            SortDescendingImageUrl="sort_descending.png" 
                            SortedHeadingCellCssClass="HeadingCellSorted"
                            SortImageWidth="16" 
                            SortImageHeight="10">
                            <Columns>
                            <ComponentArt:GridColumn 
                                AllowSorting="False" 
                                DataType="System.Boolean" 
                                DataField="Selecter" 
                                FixedWidth="true" 
                                AllowReordering="False" 
                                ColumnType="CheckBox"
                                AllowEditing="True"
                                HeadingText=" "
                                Width="25"
                                />
                                <ComponentArt:GridColumn DataField="ID" Visible="false" />
                                <ComponentArt:GridColumn DataField="OrderRowDescription" Width = "100" />
                                <ComponentArt:GridColumn DataField="ArticleNumber" Width = "110" />
                                <ComponentArt:GridColumn DataField="SKUCode" Width = "125" />
                                <ComponentArt:GridColumn DataField="UnitListPrice" Width = "75" FormatString="N" Align="Right" />
                                <ComponentArt:GridColumn DataField="Quantity" Width = "65" FormatString="N"  />
                                <ComponentArt:GridColumn DataField="TotalVATAmount" Width = "70" FormatString="N" Align="Right"  />
                                <ComponentArt:GridColumn DataField="TotalDiscountAmount" Width = "70" FormatString="N" Align="Right" />
                                <ComponentArt:GridColumn DataField="RowTotal" Width = "75" FormatString="N" Align="Right" />

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
                                                <td>@Item&nbsp;<b>## DataItem.PageIndex + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridOrderRows.PageCount ##</b></td>
                                                <td align="right">@Post&nbsp;<b>## DataItem.Index + 1 ##</b>&nbsp;@Of&nbsp;<b>## 
                                                    c_gridOrderRows.RecordCount ##</b></td>
                                            </tr>
                                        </table>  
                                    </td>
                                </tr>
                            </table>
                        </ComponentArt:ClientTemplate>
                        <ComponentArt:ClientTemplate ID="PagerInfoTemplate">
                            <table cellspacing="0" cellpadding="0" border="0">
                                <tr>
                                    <td class="GridFooterText">@Page <b>## c_gridOrderRows.CurrentPageIndex + 1 ##</b> @Of <b>
                                        ## c_gridOrderRows.PageCount ##</b> (## c_gridOrderRows.RecordCount ## @Items)</td>
                                </tr>
                            </table>
                        </ComponentArt:ClientTemplate>
                    </ClientTemplates>
                    <ClientEvents>
                        <ItemSelect EventHandler = "onItemSelect" />
                        <ItemCheckChange EventHandler="onCheckChange" />
                    </ClientEvents>
                </ComponentArt:Grid>
                <div style="height:60px;">&nbsp;</div>
	        </td>
        </tr>
    </table>
    </div>

<asp:HiddenField ID="c_hiddenOrganizationDefaultItemCaption" runat="server" />
<asp:HiddenField id="c_hiddenFieldCurrencyCode" runat="server"/>
<asp:HiddenField id="c_hiddenFieldOrderID" runat="server"/>
<asp:HiddenField id="c_hiddenFieldCulture" runat="server"/>
<asp:HiddenField id="c_custShippingFirstName" runat="server"/>
<asp:HiddenField id="c_custShippingLastName" runat="server"/>
<asp:HiddenField id="c_custShippingAddressRow1" runat="server"/>
<asp:HiddenField id="c_custShippingAddressRow2" runat="server"/>
<asp:HiddenField id="c_custShippingZip" runat="server"/>
<asp:HiddenField id="c_custShippingCity" runat="server"/>
<asp:HiddenField id="c_custShippingPhone" runat="server"/>
<asp:HiddenField id="c_custShippingMobile" runat="server"/>
<asp:HiddenField id="c_custCountry" runat="server"/>
<asp:HiddenField id="c_custShippingEmail" runat="server"/>
<asp:HiddenField id="c_custShippingFax" runat="server"/>
<asp:HiddenField id="c_custShippingState" runat="server"/>

 <Pages:RelationsPopup ID="relationsPopupPage" runat="server" />

</asp:Content>


