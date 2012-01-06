<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_Relations_FieldTemplateAddEdit, Litum.Studio.Web" validaterequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		<toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
	<asp:Label runat="server" ID="c_labelTopHeader" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString1" Name="Name" Runat="server"/><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
        <div style="float:left;"><asp:TextBox ID="c_textBoxTemplateName" CssClass="litInputText200" runat="server"/></div>
        <div style="float:left; padding-left:10px; padding-top:2px;"><asp:CustomValidator ValidateEmptyText="true" Display="Dynamic" SetFocusOnError="true" OnServerValidate="ValidateTemplateName" runat="server" ID="c_requiredFieldValidatorTemplateName" CssClass="litErrorMsg" ControlToValidate="c_textBoxTemplateName" /></div>
        <div style="float:left; padding-left:10px; padding-top:2px;"><asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorFolderName" ControlToValidate="c_textBoxTemplateName" ValidationExpression="[^<>\']*"><img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" /><Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="Modulestring18"/></asp:RegularExpressionValidator></div>
        <div style="float:left; padding-left:10px; padding-top:2px;">
            <asp:RegularExpressionValidator ID="c_lengthFieldValidatorName" runat="server"
                                    ControlToValidate="c_textBoxTemplateName"     
                                    ValidationExpression="^.{1,100}$" />  
        </div>
        <div style="clear:both;"></div>
        
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString2" Name="TemplateType" Runat="server"/></div>
        <asp:DropDownList id="c_dropDownListTemplateType" CssClass="litInputSelect" AutoPostBack="true" OnSelectedIndexChanged="DropDownListTemplateType_SelectedIndexChanged" runat="server" style="width:206px;"/>

		<asp:Panel ID="c_panelTemplateDescription" Visible="false" runat="server">
			<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString3" Name="Description" Runat="server"/></div>
			<div style="float:left;"><asp:TextBox ID="c_textBoxTemplateDescription" CssClass="litInputText" TextMode="MultiLine" Rows="5" runat="server"/></div>
			<div style="float:left; padding-left:10px; padding-top:2px;"><asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="c_textBoxTemplateDescriptionValidator" ControlToValidate="c_textBoxTemplateDescription" ValidationExpression="[^<>\']*"><img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" /><Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="SystemString1"/></asp:RegularExpressionValidator></div>
			<div style="clear:both;"></div>
		</asp:Panel>

		<asp:Panel ID="c_panelCotactOptions" Visible="false" runat="server" style="margin-bottom:30px;">
		    <div style="clear:both;"></div>
			<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString4" Name="DescriptionSettingsForFields" Runat="server"/></div>
			<div style="float:left; margin-right:29px;">
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsFirstName" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownSettingsFirstName" CssClass="litInputSelect" style="width:auto;" /></div>
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsMiddleName" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownSettingsMiddleName" CssClass="litInputSelect" style="width:auto;" /></div>
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsLastName" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownSettingsLastName" CssClass="litInputSelect" style="width:auto;" /></div>
			</div>
			<div style="float:left; margin-right:29px;">
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsEmail" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownSettingsEmail" CssClass="litInputSelect" style="width:auto;" /></div>
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsAddress1" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownSettingsAddress1" CssClass="litInputSelect" style="width:auto;" /></div>
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsAddress2" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownSettingsAddress2" CssClass="litInputSelect" style="width:auto;" /></div>
			</div>
			<div style="float:left; margin-right:29px;">
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsZipCode" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownSettingsZipCode" CssClass="litInputSelect" style="width:auto;" /></div>
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsCity" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownSettingsCity" CssClass="litInputSelect" style="width:auto;" /></div>
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsCountry" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownSettingsCountry" CssClass="litInputSelect" style="width:auto;" /></div>
			</div>
			<div style="float:left; margin-right:29px;">
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsPhoneHome" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownSettingsPhoneHome" CssClass="litInputSelect" style="width:auto;" /></div>
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsPhoneWork" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownSettingsPhoneWork" CssClass="litInputSelect" style="width:auto;" /></div>
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsPhoneMobile" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownSettingsPhoneMobile" CssClass="litInputSelect" style="width:auto;" /></div>
			</div>
			<div style="float:left; margin-right:29px;">
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsComments" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownSettingsComments" CssClass="litInputSelect" style="width:auto;" /></div>
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsCompany" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownSettingsCompany" CssClass="litInputSelect" style="width:auto;" /></div>
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsPicture" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownSettingsPicture" CssClass="litInputSelect" style="width:auto;" /></div>
			</div>
			<div style="float:left; margin-right:29px;">
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsGender" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownSettingsGender" CssClass="litInputSelect" style="width:auto;" /></div>
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsTitle" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownSettingsTitle" CssClass="litInputSelect" style="width:auto;" /></div>
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsCustomerNr" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownSettingsCustomerNr" CssClass="litInputSelect" style="width:auto;" /></div>
			</div>
			<div style="float:left; margin-right:29px;">
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsBillingAddress" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownBillingAddress" CssClass="litInputSelect" style="width:auto;" /></div>
			</div>
			<div style="float:left; margin-right:29px;">
			    <div style="margin-top:5px;"><asp:Label runat="server" ID="c_labelSettingsDeliveryAddress" CssClass="litBoldText"/><br /><asp:DropDownList runat="server" ID="c_dropDownDeliveryAddress" CssClass="litInputSelect" style="width:auto;" /></div>
			</div>
		</asp:Panel>
		<asp:Panel ID="c_panelGroupOptions" Visible="false" runat="server" style="margin-bottom:30px;">
		    <div style="clear:both;"></div>
			<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString6" Name="DescriptionSettingsForFieldDescription" Runat="server"/></div>
			<div><asp:DropDownList runat="server" ID="c_dropDownSettingsGroupDescription" CssClass="litInputSelect" style="width:206px;" /></div>
		</asp:Panel>
		<asp:Panel ID="c_panelOrganizationOptions" Visible="false" runat="server" style="margin-bottom:30px;">
		    <div style="clear:both;"></div>
			<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString7" Name="DescriptionSettingsForFieldDescription" Runat="server"/></div>
			<div><asp:DropDownList runat="server" ID="c_dropDownSettingsOrganizationDescription" CssClass="litInputSelect" style="width:206px;" /></div>
		    <div style="clear:both;"></div>
			<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString14" Name="DescriptionSettingsForFieldCustomerNumber" Runat="server"/></div>
			<div><asp:DropDownList runat="server" ID="c_dropDownSettingsOrganizationCustomerNumber" CssClass="litInputSelect" style="width:206px;" /></div>
			
		    <div style="clear:both;"></div>
			<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString15" Name="BillingAddressHeader" Runat="server"/></div>
			<div><asp:DropDownList runat="server" ID="c_dropDownOrganizationBillingAddress" CssClass="litInputSelect" style="width:206px;" /></div>


		    <div style="clear:both;"></div>
			<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString16" Name="DeliveryAddressHeader" Runat="server"/></div>
			<div><asp:DropDownList runat="server" ID="c_dropDownOrganizationDeliveryAddress" CssClass="litInputSelect" style="width:206px;" /></div>
		</asp:Panel>
	    
		<asp:Panel ID="c_panelFields" Visible="false" runat="server" style="margin-bottom:30px; padding-top:30px;">
			<div style="clear:both;"></div>
			<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString5" Name="AddDefinitionField" Runat="server"/></div>
			<asp:DropDownList id="c_dropDownListTemplateFields" CssClass="litInputSelect" runat="server" style="width:206px;float:left; margin-right:5px"/>
			<asp:Button runat="server" onClick="ButtonAddField_onClick" ID="c_buttonAddField" CssClass="litInputButton" style="float:left; width:auto; margin-top:-2px" />

			<div style="clear:both; height:5px;"></div>
			<asp:Repeater ID="c_repeaterTemplates" runat="server" OnItemCommand="RepeaterTemplates_OnItemCommand" OnItemDataBound="RepeaterTemplates_ItemDataBound">
				<HeaderTemplate>
					<table cellpadding="0" cellspacing="0" border="0" style="width:950px;">
						<tr>
							<th class="lsListHeader" align="left" style="width:50px;"><Foundation:ModuleString ID="ModuleString21" Name="FieldTemplateFieldIndex" Runat="server"/></th>
							<th class="lsListHeader" align="left" style="width:50px;"><Foundation:ModuleString ID="ModuleString22" Name="FieldTemplateFieldGroup" Runat="server"/></th>
							<th class="lsListHeader" align="left" style="width:150px;"><Foundation:ModuleString ID="ModuleString8" Name="Name" Runat="server"/></th>
							<th class="lsListHeader" align="left" style="width:120px;"><Foundation:ModuleString ID="ModuleString9" Name="FieldType" Runat="server"/></th>
							<th class="lsListHeader" align="left" style="width:180px;"><Foundation:ModuleString ID="ModuleString10" Name="LabelAdminGUIStatus" Runat="server"/></th>
							<th class="lsListHeader" align="left" style="width:200px;"><Foundation:ModuleString ID="ModuleString11" Name="LabelGUIStatus" Runat="server"/></th>
							<th class="lsListHeader" style="width:130px;"><Foundation:ModuleString ID="ModuleString12" Name="LabelMandatory" Runat="server"/></th>
							<th style="width:16px;">&nbsp;</th>
						</tr>
				</HeaderTemplate>
				<ItemTemplate>
					<tr>
						<td class="litListContent"><asp:TextBox id="textboxSort" style="width:50px;" cssclass="litInputText200" runat="server"/></td>
						<td class="litListContent"><asp:TextBox id="textboxGroup" style="width:50px;" cssclass="litInputText200" runat="server"/></td>
						<td class="litListContent"><asp:Label runat="server" ID="labelFieldName" /><asp:HiddenField runat="server" ID="c_hiddenFieldId" Value='<%#DataBinder.Eval(Container.DataItem, "FieldDefinitionID")%>' /></td>
						<td class="litListContent"><asp:Label runat="server" ID="labelFieldType" /></td>
						<td class="litListContent"><asp:Label runat="server" ID="labelAdminGUIStatus" /></td>
						<td class="litListContent"><asp:Label runat="server" ID="labelGUIStatus" /></td>
						<td class="litListContent" align="center"><asp:Label runat="server" ID="labelMandatory" /></td>
						<td style="padding:0px;"><asp:ImageButton ImageUrl="Images/transparent.gif" Runat="server" ID="c_buttonDelete" CausesValidation="False" align="AbsMiddle" CssClass="litIconDelete" BorderWidth="0" /></td>
					</tr>
					<asp:Repeater runat="server" ID="c_repeaterDefaultValues" OnItemDataBound="RepeaterDefaultValues_ItemDataBound">
						<ItemTemplate>
							<tr>
							    <td colspan="2" class="litListContent">&nbsp;</td>
								<td colspan="6" class="litListContent"><img alt="" src="Images/node.gif" />&nbsp;<asp:Label runat="server" ID="labelDefaultValue" /></td>
							</tr>
						</ItemTemplate>
					</asp:Repeater>
				</ItemTemplate>
				<FooterTemplate>
					</table>
				</FooterTemplate>
			</asp:Repeater>
			<div style="clear:both;"></div>
			<div class="litText" style="margin-top:5px;"><Foundation:ModuleString ID="ModuleString17" Name="DefinitionFieldsDescription" Runat="server"/></div>
        </asp:Panel>
        
    	<asp:Panel ID="c_panelCustomTemplates" Visible="false" runat="server" style="padding-bottom:50px;"  >
		    <div style="clear:both;"></div>
			<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString13" Name="DescriptionSettingsForCustomTemplates" Runat="server"/></div>
			<div class="litText" style="width: 600px;"><Foundation:ModuleString ID="DescriptionSettingsForCustomTemplatesDescription" Name="DescriptionSettingsForCustomTemplatesDescription" Runat="server"/></div>
			<div class="litText" style="width: 600px; margin-top:5px; margin-bottom:5px;"><Foundation:ModuleString ID="DescriptionSettingsForCustomTemplatesPath" Name="DescriptionSettingsForCustomTemplatesPath" Runat="server"/></div>
			<div style="float:left; margin-right:29px;">
			    <div style="margin-top:5px;"><Foundation:ModuleString ID="DescriptionSettingsForCustomAddTemplate" Name="DescriptionSettingsForCustomAddTemplate" Runat="server" CssClass="litBoldText"/><br /><asp:TextBox ID="c_AddTemplateName" CssClass="litInputText200" runat="server"/></div>
			</div>
			<div style="float:left; margin-right:29px;">
			    <div style="margin-top:5px;"><Foundation:ModuleString ID="DescriptionSettingsForCustomViewTemplate" Name="DescriptionSettingsForCustomViewTemplate" Runat="server" CssClass="litBoldText"/><br /><asp:TextBox ID="c_ViewTemplateName" CssClass="litInputText200" runat="server"/></div>
			</div>
            <div style="float:left; margin-right:29px;">
			    <div style="margin-top:5px;"><Foundation:ModuleString ID="DescriptionSettingsForCustomEditTemplate" Name="DescriptionSettingsForCustomEditTemplate" Runat="server" CssClass="litBoldText"/><br /><asp:TextBox ID="c_EditTemplateName" CssClass="litInputText200" runat="server"/></div>
			</div>
	    </asp:Panel>
     </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_textBoxTemplateName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>