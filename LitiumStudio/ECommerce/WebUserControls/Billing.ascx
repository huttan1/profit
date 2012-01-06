<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ECommerce_WebUserControls_ShippingAndBilling, Litum.Studio.Web" %>

<div class="lsTabContent">
<table cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td valign = "top">
             <Foundation:InformationGroup runat="server" ID="c_informationGroupPayments" Width="250" HeaderText="Payment Details" Visible = "true">
                <table border = "0" cellpadding = "0" cellspacing = "5">
                    <tr>
                        <td>
                            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringPayemntStatus" Name="PaymentStatus" Runat="server"/>:
                                &nbsp;<asp:Label ID="c_labelPaymentStatus" runat="server" Text="Init"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringPaymentProvider" Name="PaymentProvider" Runat="server"/>:</div>
                            <asp:DropDownList CssClass="litInputText200" ID="c_dropdownListPaymentProvider" runat="server" onchange="GetPaymentMethods()"></asp:DropDownList>            
                        </td>
                    </tr>                    
                    <tr>
                        <td>
                            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringPaymentMethod" Name="PaymentMethod" Runat="server"/>:</div>
                            <asp:DropDownList CssClass="litInputText200" ID="c_dropdownListPaymentMethod" runat="server" onchange = "UpdatePaymentMethod()"></asp:DropDownList>            
                        </td>
                    </tr>                    
                </table>                
            </Foundation:InformationGroup> 
        </td>
        <td valign = "top" style="padding-left: 15px;">           
            <Foundation:InformationGroup runat="server" ID="c_informationGroupBilling" Width="250" HeaderText="Billing Address123">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td>
                            <asp:Panel ID = "c_panelPersonInfo" runat = "server">
                                <table cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td>
                                            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringPerson" Name="Person" Runat="server"/>:</div>
                                            <asp:TextBox CssClass="litInputText175" runat="server" ID="c_textBoxPerson" Enabled = "false"></asp:TextBox>
                                            <asp:Image CssClass="litIconPopUp" imageurl="~/LitiumStudio/Images/icons_standard/businesswoman.png" onclick ="togglePerson();" runat="server" id="c_imagePerson" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringOrganization" Name="Organization" Runat="server"/>:</div>
                                            <asp:DropDownList CssClass="litInputText200" ID="c_dropDownListOrganization" runat="server" onchange = 'GetOrganizationForBilling()'>                                                
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="litBoldHeader"><asp:CheckBox runat="server" Text="Same as customer info" ID="c_checkBoxSameAsCustomerInfo" TextAlign="Right" onclick = "GetBillingDataFromCustomerInfo()" CssClass="litCheckbox" /></div>
                        </td>
                    </tr>
                    <!-- **************** -->
                    
                    <tr>
                        <td>
                            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringFirstName" Name="FirstName" Runat="server"/>
                            <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredFirstName" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                            <asp:TextBox CssClass="litInputText200" runat="server" MaxLength = "200" ID="c_textBoxFirstName"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorFirstName" ControlToValidate = "c_textBoxFirstName" runat="server" ErrorMessage="*" Text="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleLastName" Name="LastName" Runat="server"/>
                            <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredLastName" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                            <asp:TextBox CssClass="litInputText200"  MaxLength = "200" runat="server" ID="c_textBoxLastName"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorLastName" ControlToValidate = "c_textBoxLastName" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringEmail" Name="Email" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredEmail" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	                        <asp:TextBox CssClass="litInputText200" runat="server"  MaxLength = "250" ID="c_textBoxEmail"></asp:TextBox>
	                        <asp:HiddenField ID="c_hiddenCustomerNumber" runat="server" />
	                        <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorEmail" ControlToValidate = "c_textBoxEmail" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator Display="Dynamic" ID="c_validatorEmailPattern" ControlToValidate = "c_textBoxEmail" ValidationExpression = "\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ErrorMessage="*pattern" ValidationGroup="CustomerInfo"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <!-- **************** -->
                    <tr>
                        <td>
                            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringAddressRow1" Name="AddressRow1" Runat="server"/>
                            <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredAddress1" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                            <asp:TextBox CssClass="litInputText200" runat="server" MaxLength = "200" ID="c_textBoxAddressRow1"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorAddressRow1" ControlToValidate = "c_textBoxAddressRow1" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringAddressRow2" Name="AddressRow2" Runat="server"/>
                            <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredAddress2" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                            <asp:TextBox CssClass="litInputText200"  MaxLength = "200" runat="server" ID="c_textBoxAddressRow2"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorAddressRow2" ControlToValidate = "c_textBoxAddressRow2" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringZip" Name="Zip" Runat="server"/>
                            <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredZip" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                            <asp:TextBox CssClass="litInputText200"  MaxLength = "15" runat="server" ID="c_textBoxZip"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorZip" ControlToValidate = "c_textBoxZip" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>	                
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringCity" Name="City" Runat="server"/>
                            <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredCity" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                            <asp:TextBox CssClass="litInputText200" runat="server"  MaxLength = "100" ID="c_textBoxCity"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorCity" ControlToValidate = "c_textBoxCity" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>	                
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringState" Name="State" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredState" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	                        <asp:TextBox CssClass="litInputText200" runat="server" MaxLength = "50" ID="c_textBoxState"></asp:TextBox>
	                        <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorState" ControlToValidate = "c_textBoxState" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringCountry" Name="Country" Runat="server"/>
                            <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredCountry" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                            <%--<asp:TextBox CssClass="litInputText200"  MaxLength = "50" runat="server" ID="c_textBoxCountry"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="c_validatorCountry" ControlToValidate = "c_textBoxCountry" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                            <asp:DropDownList CssClass="litInputText200" ID="c_dropDownListCountries" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringMobilePhone" Name="MobilePhone" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredMobilePhone" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	                        <asp:TextBox CssClass="litInputText200" runat="server"  MaxLength = "50" ID="c_textBoxMobilePhone"></asp:TextBox>
	                        <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorMobilePhone" ControlToValidate = "c_textBoxMobilePhone" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
	                        <asp:RegularExpressionValidator Display="Dynamic" ID="c_validatorMobilePhoneValue" runat="server" ControlToValidate="c_textBoxMobilePhone" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RegularExpressionValidator>
                        </td>
                    </tr>                    
                    <tr>
                        <td>
                            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringPhone" Name="Phone" Runat="server"/>
                            <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredPhone" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                            <asp:TextBox CssClass="litInputText200" runat="server"  MaxLength = "50" ID="c_textBoxPhone"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorPhone" ControlToValidate = "c_textBoxPhone" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>	                	                
	                        <asp:RegularExpressionValidator Display="Dynamic" ID="c_validatorPhoneValue" runat="server" ControlToValidate="c_textBoxPhone" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RegularExpressionValidator>	                        
                            <asp:HiddenField ID="c_hiddenPersonId" runat="server"  OnValueChanged = "c_hiddenPersonId_ValueChanged" />  
                            <asp:HiddenField ID="c_hiddenPaymentMethod" runat="server" />                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringFax" Name="Fax" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredFax" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	                        <asp:TextBox CssClass="litInputText200" runat="server" MaxLength = "50" ID="c_textBoxFax"></asp:TextBox>
	                        <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorFax" ControlToValidate = "c_textBoxFax" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
	                        <asp:RegularExpressionValidator Display="Dynamic" ID="c_validatorFaxValue" runat="server" ControlToValidate="c_textBoxFax" ErrorMessage="*" ValidationGroup="CustomerInfo" ></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>                
                <%--<asp:TextBox runat="server" ID="c_textBoxOrganization"></asp:TextBox>
                <asp:Image ImageUrl="~/LitiumStudio/Images/icons_standard/find.png" onclick ="toggleOrganization();" runat="server" id="c_imageOrganization" borderwidth="0" style="vertical-align:middle; margin-top:4px;" /> --%>
            </Foundation:InformationGroup>           
        </td>
    </tr>
</table>
</div>
