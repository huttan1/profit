<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ECommerce_WebUserControls_CustomerInfo, Litum.Studio.Web" %>

<div class="lsTabContent">
<Foundation:InformationGroup runat="server" ID="c_relationsHeader" Width="450px">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width:175px;">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringPerson" Name="Person" Runat="server"/>:</div>
	            <asp:TextBox CssClass="litInputText175" runat="server" ID="c_textBoxPerson" onchange='GetPersonInfo()'></asp:TextBox>	            
	            <%--<img src="Images/transparent.gif" style="vertical-align:middle; margin-right:5px;" class="litIconShoppingBag" alt="" />--%>
	        </td>
	        <td align="left" style="width:18px; padding-top:18px;"><asp:Image CssClass="litIconPopUp" imageurl="~/LitiumStudio/Images/icons_standard/businesswoman.png" runat="server" id="c_imageButtonPerson" /></td>
            <td style="width:15px;">&nbsp;</td>
            <td>
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringOrganization" Name="Organization" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageRequiredOrganizationName" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
                <asp:DropDownList ID="c_dropDownListOrganization" AppendDataBoundItems = "true" style="display:none" runat="server" CssClass="litInputText200" onchange = 'GetOrganizationForCustomerInfo()'>
                </asp:DropDownList>
                <asp:TextBox CssClass="litInputText175" runat="server" ID="c_textboxOrganizationName"></asp:TextBox>
                <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorOrganizationName" ControlToValidate="c_textboxOrganizationName" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                <%--<asp:TextBox runat="server" ID="c_textBoxOrganization"></asp:TextBox>--%>
	            <%--<asp:Image ImageUrl="~/LitiumStudio/Images/icons_standard/find.png" onclick ="toggleOrganization();" runat="server" id="c_imageOrganization" borderwidth="0" style="vertical-align:middle; margin-top:4px;" /> --%>
            </td>
        </tr>
    </table>
</Foundation:InformationGroup>
<table border="0" cellpadding="0" cellspacing="0" style="width: 450px;">
    <tr>
        <td>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringFirstName" Name="FirstName" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageRequiredFirstName" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	        <asp:TextBox CssClass="litInputText200" runat="server"  MaxLength = "255" ID="c_textBoxFirstName"></asp:TextBox>
	        <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorFirstName" ControlToValidate = "c_textBoxFirstName" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
        </td>
        <td>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringLastName" Name="LastName" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredLastName" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	        <asp:TextBox CssClass="litInputText200" runat="server"  MaxLength = "255" ID="c_textBoxLastName"></asp:TextBox>
            <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorLastName" ControlToValidate = "c_textBoxLastName" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
        </td>
    </tr>
       <tr>
        <td>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringCustomerNumber" Name="CustomerNumber" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredCustomerNumber" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	        <asp:TextBox CssClass="litInputText200" runat="server" MaxLength = "255" ID="c_textBoxCustomerNumber"></asp:TextBox>
	        <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorCustomerNumber" ControlToValidate = "c_textBoxCustomerNumber" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
        </td>
        <td>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringEmail" Name="Email" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredEmail" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	        <asp:TextBox CssClass="litInputText200" runat="server"  MaxLength = "250" ID="c_textBoxEmail"></asp:TextBox>
	        <asp:HiddenField ID="c_hiddenCustomerNumber" runat="server" />
	        <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorEmail" ControlToValidate = "c_textBoxEmail" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator Display="Dynamic" ID="c_validatorEmailPattern" ControlToValidate = "c_textBoxEmail" ValidationExpression = "\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ErrorMessage="*pattern" ValidationGroup="CustomerInfo"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringMobilePhone" Name="MobilePhone" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredMobilePhone" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	        <asp:TextBox CssClass="litInputText200" runat="server"  MaxLength = "50" ID="c_textBoxMobilePhone"></asp:TextBox>
	        <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorMobilePhone" ControlToValidate = "c_textBoxMobilePhone" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
	        <asp:RegularExpressionValidator Display="Dynamic" ID="c_validatorMobilePhoneValue" runat="server" ControlToValidate="c_textBoxMobilePhone" ErrorMessage="*" Text="*" ValidationGroup="CustomerInfo"></asp:RegularExpressionValidator>
        </td>
        <td>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringHomePhone" Name="HomePhone" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredHomePhone" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	        <asp:TextBox CssClass="litInputText200" runat="server" MaxLength = "50" ID="c_textBoxHomePhone"></asp:TextBox>
	        <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorHomePhone" ControlToValidate = "c_textBoxHomePhone" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
	        <asp:RegularExpressionValidator Display="Dynamic" ID="c_validatorHomePhoneValue" runat="server" ControlToValidate="c_textBoxHomePhone" ErrorMessage="*" Text="*" ValidationGroup="CustomerInfo" ></asp:RegularExpressionValidator>
        </td>
    </tr>
     <tr>
        <td>
           <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringFax" Name="Fax" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredFax" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	        <asp:TextBox CssClass="litInputText200" runat="server" MaxLength = "50" ID="c_textBoxFax"></asp:TextBox>
	        <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorFax" ControlToValidate = "c_textBoxFax" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
	        <asp:RegularExpressionValidator Display="Dynamic" ID="c_validatorFaxValue" runat="server" ControlToValidate="c_textBoxFax" ErrorMessage="*" ValidationGroup="CustomerInfo" Text="*"></asp:RegularExpressionValidator>
        </td>
        <td>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringAddress1" Name="Address1" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredAddress1" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	        <asp:TextBox CssClass="litInputText200" runat="server" MaxLength = "200" ID="c_textBoxAddress1"></asp:TextBox>
	        <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorAddress1" ControlToValidate = "c_textBoxAddress1" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
        </td>
    </tr>
       <tr>
        <td>
             <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringAddress2" Name="Address2" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredAddress2" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	        <asp:TextBox CssClass="litInputText200" runat="server" MaxLength = "200" ID="c_textBoxAddress2"></asp:TextBox>
	        <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorAddress2" ControlToValidate = "c_textBoxAddress2" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
        </td>
        <td>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringZip" Name="Zip" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredZip" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	        <asp:TextBox CssClass="litInputText200" runat="server" MaxLength = "15" ID="c_textBoxZip"></asp:TextBox>
	        <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorZip" ControlToValidate = "c_textBoxZip" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
           <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringCity" Name="City" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredCity" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	        <asp:TextBox CssClass="litInputText200" runat="server" MaxLength = "100" ID="c_textBoxCity"></asp:TextBox>
	        <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorCity" ControlToValidate = "c_textBoxCity" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
        </td>
        <td>
             <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringState" Name="State" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredState" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	        <asp:TextBox CssClass="litInputText200" runat="server" MaxLength = "50" ID="c_textBoxState"></asp:TextBox>
	        <asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorState" ControlToValidate = "c_textBoxState" runat="server" ErrorMessage="*" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringCountry" Name="Country" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredCountry" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	        <%--<asp:TextBox CssClass="litInputText200" runat="server" MaxLength = "50" ID="c_textBoxCountry"></asp:TextBox>--%>
	        <asp:DropDownList CssClass="litInputText200" ID="c_dropDownListCountries" runat="server"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td colspan = "2">            
            <asp:HiddenField ID="c_hiddenPersonId" runat="server" OnValueChanged = "c_hiddenPersonId_ValueChanged" />
            <asp:HiddenField ID="c_hiddenOrganizationId" runat="server" />                         
        </td>
    </tr>
</table>
</div>