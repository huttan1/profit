<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_Relations_WebUserControl_EditGeneralControl, Litum.Studio.Web" %>
<%@ Register TagPrefix="FieldDefinition" Namespace="Litium.Studio.UI.Relations.FieldTemplates.WebControls"
	Assembly="Litium.Studio.UI" %>
<script type="text/javascript">
	function GetGeneralAddressInformation() {
		this.address = GetAddressFieldValue("<%=c_address.ClientID %>");
		this.address2 = GetAddressFieldValue("<%=c_address2.ClientID %>");
		this.city = GetAddressFieldValue("<%=c_city.ClientID %>");
		this.phone = GetAddressFieldValue("<%=c_phoneHome.ClientID %>");
		this.mobile = GetAddressFieldValue("<%=c_phoneMobile.ClientID %>");
		this.email = GetAddressFieldValue("<%=c_email.ClientID %>");
		this.country = GetAddressFieldValue(<%=c_country.ClientID %>);
		this.zip = GetAddressFieldValue("<%=c_zipCode.ClientID %>");
		return this;
	}
	function GetAddressFieldValue(field){
		if (typeof(field) !== "string" && field.get_selectedIndex) {
			return field.get_selectedIndex();
		} else {
			var obj = $get(field);
            if (obj)
            {
                if (obj.type == "select-one") {
				    return obj.options[obj.selectedIndex].value;
			    }
			    else if (obj.type == "select-multiple") {
				    var retStr = "";
				    for (var i = 0; i < obj.options.length; i++) {
					    if (obj.options[i].selected) {
						    retStr += ((retStr.length == 0) ? "" : ", ") + obj.options[i].value;
					    }
				    }
				    return retStr;
			    }
			    else if (obj.type == "text" || obj.type == "textarea" || obj.type == "hidden" || obj.type == "password") {
				    return obj.value;
			    }
			    else if (obj.type == "checkbox" || obj.type == "radio") {
				    if (obj.checked) {
					    return obj.value;
				    }
			    }
            }
            return null;
		}
		return null;
	}
</script>
<div class="lsTabContent">

<asp:Panel runat="server" ID="c_panelPerson" Visible="false">    
    <asp:Panel runat="server" ID="c_panelFirstName" style="float:left; margin-right:10px;">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString12" Name="FirstName" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredFirstName" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
        <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="100" id="c_firstName" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_firstName" id="c_validatorFirstName" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
    </asp:Panel>
    <asp:Panel runat="server" ID="c_panelMiddleName" style="float:left; margin-right:10px;">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString16" Name="MiddleName" runat="server" /><img runat="server" id="c_imageRequiredMiddleName" src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
        <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="255" id="c_middleName" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_middleName" id="c_validatorMiddleName" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
    </asp:Panel>
    <asp:Panel runat="server" ID="c_panelLastName" style="float:left; margin-right:10px;">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString13" Name="LastName" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredLastName" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
        <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="200" id="c_lastName" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_lastName" id="c_validatorLastName" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
    </asp:Panel>
    <div style="clear:both;"></div>
                                    
    <asp:Panel runat="server" ID="c_panelCustomerNr" style="float:left; margin-right:10px;">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString14" Name="CustomerNumber" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredCustomerNr" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
        <div class="litText"><asp:TextBox runat="server" MaxLength="50" cssclass="litInputText200" id="c_customerNumber" /></div><asp:CustomValidator SetFocusOnError="true" ControlToValidate="c_customerNumber" id="c_validatorCustomerNr" CssClass="litErrorMsg" Enabled="true" Display="Dynamic" runat="server" OnServerValidate="CustomerNumber_Validate" />
    </asp:Panel>
    <asp:Panel runat="server" ID="c_panelTitle" style="float:left; margin-right:10px;">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString17" Name="Title" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredTitle" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
        <asp:TextBox runat="server" CssClass="litInputText200" MaxLength="50" id="c_title" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_title" id="c_validatorTitle" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
    </asp:Panel>
    <asp:Panel runat="server" ID="c_panelGender" style="float:left; margin-right:10px; width: 208px;">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString18" Name="Gender" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredGender" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
        <div class="litText"><asp:RadioButton ID="c_radioButtonFemale" runat="server" GroupName="Gender" />&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="c_radioButtonMale" runat="server" GroupName="Gender" /></div><asp:Label runat="server" ID="c_labelValidateGender" Visible="false" cssClass="litErrorMsg" />
    </asp:Panel>
    <div style="clear:both;"></div>
    
    <asp:Panel runat="server" ID="c_panelEmail" style="float:left; margin-right:10px;">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString15" Name="Email" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredEmail" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
        <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="200" id="c_email" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_email" id="c_validatorRequiredEmail" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/><asp:CustomValidator SetFocusOnError="true" ID="c_validatorEmail" runat="server" Display="Dynamic" ControlToValidate="c_email" OnServerValidate="ValidateEmail" CssClass="litErrorMsg" />
    </asp:Panel>
    <asp:Panel runat="server" ID="c_panelCompany" style="float:left; margin-right:10px;">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString2" Name="Company" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredCompany" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
        <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="200" id="c_company" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_company" id="c_validatorCompany" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
    </asp:Panel>
    <div style="clear:both;"></div>
   
    <asp:Panel runat="server" ID="c_panelAdress" style="float:left; margin-right:10px;">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString3" Name="Address" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredAddress" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
        <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="100" id="c_address" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_address" id="c_validatorAddress1" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/><br />
        <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="100" id="c_address2" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_address2" id="c_validatorAddress2" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
    </asp:Panel>
    <div style="clear:both;"></div>
    
    <asp:Panel runat="server" ID="c_panelZipCode" style="float:left; margin-right:10px;">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString4" Name="ZipCode" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredZipCode" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
        <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="10" id="c_zipCode" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_zipCode" id="c_validatorZipCode" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
    </asp:Panel>
    <asp:Panel runat="server" ID="c_panelCity" style="float:left; margin-right:10px;">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString5" Name="City" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredCity" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
        <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="50" id="c_city" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_city" id="c_validatorCity" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
    </asp:Panel>
    <asp:Panel runat="server" ID="c_panelCountry" style="float:left; margin-right:10px;">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString9" Name="Country" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredCountry" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" />&nbsp;<asp:Label ID="c_labelCountryUpdate" CssClass="litErrorMsg" Visible="false" runat="server"/>&nbsp;<Foundation:ModuleString ID="c_moduleStringCountryUpdate" Name="CountryHasToBeUpdated" visible="false" CssClass="litErrorMsg" runat="server" /></div>
		<ComponentArt:ComboBox TextBoxEnabled = "false" 
			Id="c_country"
			RunAt="Server"
			Width="200"
			Height="20"
			AutoHighlight="false"
			AutoComplete="true"
			AutoFilter="true"
			ItemClientTemplateId="LanguageItemTemplate"
			ItemCssClass="ddn-item"
			ItemHoverCssClass="ddn-item-hover"
			CssClass="cmb"
			HoverCssClass="cmb-hover"
			TextBoxCssClass="txt"
			DropHoverImageUrl="../../LitiumStudio/Images/combobox/ddn-hover.png"
			DropImageUrl="../../LitiumStudio/Images/combobox/ddn.png"
			DropDownResizingMode="bottom"
			DropDownWidth="200"
			DropDownHeight="160"
			DropDownCssClass="ddn"
			DropDownContentCssClass="ddn-con">
		  <ClientTemplates>
				<ComponentArt:ClientTemplate ID="LanguageItemTemplate">
					<img src="../../LitiumStudio/Images/icons_standard/flags/##DataItem.get_id()##.png" class="icon" width="16" height="16" alt="##DataItem.get_id()##" title="##DataItem.get_id()##" />
					## DataItem.get_text() ##
				</ComponentArt:ClientTemplate>
		   </ClientTemplates>
		<DropDownFooter><div class="ddn-ftr"></div></DropDownFooter>
	</ComponentArt:ComboBox><asp:CustomValidator SetFocusOnError="true" ControlToValidate="c_country" id="c_validatorCountry" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
    </asp:Panel>
    <div style="clear:both;"></div>
    
    <asp:Panel runat="server" ID="c_panelPhoneHome" style="float:left; margin-right:10px;">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString6" Name="HomePhone" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredPhoneHome" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
        <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="50" id="c_phoneHome" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_phoneHome" id="c_validatorPhoneHome" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
    </asp:Panel>
    <asp:Panel runat="server" ID="c_panelPhoneWork" style="float:left; margin-right:10px;">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString7" Name="WorkPhone" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredPhoneWork" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
        <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="50" id="c_phoneWork" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_phoneWork" id="c_validatorPhoneWork" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
    </asp:Panel>
    <asp:Panel runat="server" ID="c_panelPhoneMobile" style="float:left; margin-right:10px;">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString8" Name="CellPhone" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredPhoneMobile" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
        <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="50" id="c_phoneMobile" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_phoneMobile" id="c_validatorPhoneMobile" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
    </asp:Panel>
    <div style="clear:both;"></div>
    
    <asp:Panel runat="server" ID="c_panelImage" style="margin-top:15px;"><span class="litBoldText"><Foundation:ModuleString ID="ModuleString10" Name="Image" runat="server" /></span><img src="../images/transparent.gif" runat="server" id="c_imageRequiredPicture" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></asp:Panel>
    
    <div runat="server" visible="false" id="c_existingImageDiv" style="text-align:center; float:left;">
        <div style="margin-right:10px; border:1px solid #7F9DB9; padding:5px; background-color:white; float:left;"><img runat="server" id="c_existingImage" src="" alt=""/></div><div style="clear:both;"></div>
        <div class="litText" style="margin-top:2px;"><asp:Label runat="server" ID="c_labelImageDescription" /> <a href="#" id="c_linkDownloadImage" runat="server"><img src="../Images/transparent.gif" style="vertical-align:middle; border:none;" class="litIconDownload" alt="<Foundation:ModuleString Name=DownloadImage runat=Server />" title="<Foundation:ModuleString Name=DownloadImage runat=Server />" /></a></div>
    </div>
    <div style="float:left;">
        <div><asp:Label runat="server" ID="c_labelReplaceExistingImage" Visible="false" CssClass="litText"/><asp:FileUpload runat="server" CssClass="litInputFile" id="c_image" /><asp:CustomValidator SetFocusOnError="true" id="c_validatorPicture" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/></div>
        <div><asp:Checkbox runat="server" id="c_existingImageDelete" CssClass="litText" visible="false" /></div>
    </div>
    <div style="clear:both;"></div>
    
    <asp:Panel runat="server" ID="c_panelComments" CssClass="litBoldHeader"><Foundation:ModuleString ID="ModuleString11" Name="Comments" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredComments" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></asp:Panel>
    <asp:TextBox runat="server" cssclass="litInputTextArea" TextMode="MultiLine" Rows="5" id="c_comments" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_comments" id="c_validatorComments" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
</asp:Panel>
<asp:Panel runat="server" ID="c_panelGroup" Visible="false">
    <asp:Panel runat="server" ID="c_panelGroupName">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString20" Name="Name" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredGroupName" style="vertical-align:middle;" class="litIconRequired" alt="" /></div>
        <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="100" id="c_groupName" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_groupName" id="c_validatorGroupName" cssClass="litErrorMsg" Display="Dynamic" runat="server"/><asp:CustomValidator SetFocusOnError="true" ID="c_validatorGroupNameUnique" runat="server" Display="Dynamic" ControlToValidate="c_groupName" OnServerValidate="ValidateGroupName" CssClass="litErrorMsg" />
    </asp:Panel>
    <asp:Panel runat="server" ID="c_panelGroupDescription">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString19" Name="Description" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredGroupDescription" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
        <asp:TextBox runat="server" CssClass="litInputTextArea" TextMode="MultiLine" Rows="5" id="c_groupDescription" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_groupDescription" id="c_validatorGroupDescription" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
    </asp:Panel>
</asp:Panel>
<asp:Panel runat="server" ID="c_panelOrganization" Visible="false">
    <asp:Panel runat="server" ID="c_panelOrganizationName">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString21" Name="Name" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredOrganizationName" style="vertical-align:middle;" class="litIconRequired" alt="" /></div>
        <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="255" id="c_organizationName" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_organizationName" id="c_validatorOrganizationName" cssClass="litErrorMsg" Display="Dynamic" runat="server"/>
    </asp:Panel>
    <asp:Panel runat="server" ID="c_panelOrganizationCustomerNr">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString1" Name="CustomerNumber" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredCustomerNr2" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
        <asp:TextBox runat="server" cssclass="litInputText200" id="c_organizationCustomerNumber" /><asp:CustomValidator SetFocusOnError="true" ControlToValidate="c_organizationCustomerNumber" id="c_validatorOrganizationCustomerNumber" CssClass="litErrorMsg" Enabled="true" Display="Dynamic" runat="server" OnServerValidate="CustomerNumber_Validate" />
    </asp:Panel>
    <asp:Panel runat="server" ID="c_panelOrganizationDescription">
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString22" Name="Description" runat="server" /><img src="../images/transparent.gif" runat="server" id="c_imageRequiredOrganizationDescription" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
        <asp:TextBox runat="server" CssClass="litInputTextArea" TextMode="MultiLine" Rows="5" id="c_organizationDescription" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_organizationDescription" id="c_validatorOrganizationDescription" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
    </asp:Panel>
</asp:Panel>

<FieldDefinition:FieldDefinitionListControl id="c_fieldDefinitionList" runat="server">
    <StringFieldDefinitionTemplate>
        <FieldDefinition:StringFieldDefinitionControl ID="StringFieldDefinitionControl1" runat="server" >
            <StringFieldDefinitionItemTemplate>
                <div class="litBoldHeader"><asp:Label ID="labelTextBoxFieldDefinition" Runat="server"/><asp:Label id="labelTextBoxFieldDefinitionMandatory" runat="server"><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></asp:Label></div>
                <asp:TextBox cssclass="litInputText200" Visible="False" ID="textBoxFieldDefinition" Runat="server"/><asp:Label id="labelTextBoxFieldDefinitionInputValue" runat="server" CssClass="litText"/><asp:Label id="labelTextBoxFieldDefinitionNoValue" runat="server" CssClass="litText"/>
                <asp:DropDownList cssclass="litInputSelect" style="width:auto;" Visible="False" ID="dropDownListTextBoxFieldDefinition" Runat="server"/> <asp:CustomValidator SetFocusOnError="true" id="validatorMandatoryTextBoxFieldDefinition" Display="Dynamic" runat="server"/>
            </StringFieldDefinitionItemTemplate>
        </FieldDefinition:StringFieldDefinitionControl>
    </StringFieldDefinitionTemplate>
    <NumberFieldDefinitionTemplate>
        <FieldDefinition:NumberFieldDefinitionControl ID="NumberFieldDefinitionControl1"  runat="server" >
            <NumberFieldDefinitionItemTemplate>
                <div class="litBoldHeader"><asp:Label ID="labelTextBoxFieldDefinition" Runat="server"/><asp:Label id="labelTextBoxFieldDefinitionMandatory" runat="server"><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></asp:Label></div>
                <asp:TextBox cssclass="litInputText200" Visible="False" ID="textBoxFieldDefinition" Runat="server"/><asp:Label id="labelTextBoxFieldDefinitionInputValue" runat="server" CssClass="litText"/><asp:Label id="labelTextBoxFieldDefinitionNoValue" runat="server" CssClass="litText"/>
                <asp:DropDownList cssclass="litInputSelect" style="width:auto;" Visible="False" ID="dropDownListTextBoxFieldDefinition" Runat="server"/> <asp:CustomValidator SetFocusOnError="true" id="validatorMandatoryTextBoxFieldDefinition" Display="Dynamic" runat="server"/>
            </NumberFieldDefinitionItemTemplate>
        </FieldDefinition:NumberFieldDefinitionControl>
    </NumberFieldDefinitionTemplate>
    <FileFieldDefinitionTemplate>
        <FieldDefinition:FileFieldDefinitionControl ID="FileFieldDefinitionControl1" runat="server" >
            <FileFieldDefinitionItemTemplate>
                <div class="litBoldHeader"><strong><asp:Label ID="labelUploadFieldDefinition" Runat="server"/></strong><asp:Label id="labelUploadFieldDefinitionMandatory" runat="server"><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></asp:Label></div>
                <asp:Panel ID="panelFileUploadFieldDefinitionInputValue" Runat="server"><asp:HyperLink id="hyperLinkFileUploadFieldDefinitionInputValue" runat="server" CssClass="litText"/></asp:Panel><asp:Label id="labelUploadFieldDefinitionNoValue" runat="server" CssClass="litText"/>
                <asp:Label runat="server" ID="labelReplaceExistingFile" CssClass="litText" /><input type="file" class="litInputFile" id="inputFileUpload" runat="server" size="54" style="width: auto;"/>
                <div runat="server" id="panelMediaArchiveFiles" visible="false" style="clear:both;">
                    <input type="text" runat="server" readonly="readonly" id="textBoxMediaArchiveFileDispName" class="litInputText100" style="width:276px;"/>
                    <input type="button" runat="server" id="buttonFromMediaArchive" class="litInputText" style="width:auto;margin-left:-2px;" visible="true" />
                    <input type="hidden" runat="server" id="inputHiddenMediaArchiveFileID"/>
                    <input type="hidden"  runat="server" id="inputHiddenMediaArchiveFileVersionID"/>
                </div>
                <asp:CustomValidator SetFocusOnError="true" id="validatorMandatoryUploadFieldDefinition" Display="Dynamic" runat="server"/>
                <asp:Panel id="panelMediaArchiveMessage1" style="display:none" runat="server"><div class="litText"><img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" alt="" class="litIconWarning" /><Foundation:ModuleString ID="ModuleString5" Name="WarningFileFromMediaArchive1" runat="server"/></div></asp:Panel>
            </FileFieldDefinitionItemTemplate>
        </FieldDefinition:FileFieldDefinitionControl>
    </FileFieldDefinitionTemplate>
    <ImageFieldDefinitionTemplate>
        <FieldDefinition:ImageFieldDefinitionControl ID="ImageFieldDefinitionControl1" runat="server" >
            <ImageFieldDefinitionItemTemplate>
                <div class="litBoldHeader"><asp:Label ID="labelUploadFieldDefinition" Runat="server"/><asp:Label id="labelUploadFieldDefinitionMandatory" runat="server"><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></asp:Label></div>
                <asp:panel runat="server" id="panelImageUploadFieldDefinitionInputValue" style="text-align:center; float:left;">
                    <div style="margin-right:10px; border:1px solid #7F9DB9; padding:5px; background-color:white; float:left;"><img runat="server" id="imgUploadFieldDefinitionInputValue" /></div><div style="clear:both;"></div>
                    <div class="litText" style="margin-top:2px;"><asp:Label runat="server" ID="c_labelImageDescription" /> <a href="#" id="c_linkDownloadImage" runat="server"><img src="../images/transparent.gif" style="vertical-align:middle; border:none;" class="litIconDownload" alt="<Foundation:ModuleString Name=DownloadImage runat=Server />" title="<Foundation:ModuleString Name=DownloadImage runat=Server />" /></a></div>
                </asp:panel>
                <asp:Label id="labelUploadFieldDefinitionNoValue" runat="server" CssClass="litText"/>
                <div style="float:left;">
                    <div><asp:Label runat="server" ID="labelReplaceExistingFile" CssClass="litText" /><input type="file" class="litInputFile" id="inputFileUpload" runat="server" size="54" style="width: auto;"/> <asp:CustomValidator SetFocusOnError="true" id="validatorMandatoryUploadFieldDefinition" Display="Dynamic" CssClass="litErrorMsg" runat="server"/></div>
                    <div runat="server" id="panelMediaArchiveFiles" visible="false" style="clear:both;">
                        <input type="text" runat="server" readonly="readonly" id="textBoxMediaArchiveFileDispName" class="litInputText100" style="width:276px;"/>
                        <input type="button" runat="server" id="buttonFromMediaArchive" class="litInputText" style="width:auto;margin-left:-2px;" visible="true" />
                        <input type="hidden" runat="server" id="inputHiddenMediaArchiveFileID"/>
                        <input type="hidden"  runat="server" id="inputHiddenMediaArchiveFileVersionID"/>
                    </div>
                    <div><asp:Checkbox runat="server" id="checkBoxUploadFieldDefinition" CssClass="litText" visible="false" /></div>
                    <asp:Panel id="panelMediaArchiveMessage1" style="display:none" runat="server"><div class="litText"><img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" alt="" class="litIconWarning" /><Foundation:ModuleString ID="ModuleString5" Name="WarningFileFromMediaArchive1" runat="server"/></div></asp:Panel>
                </div>
                <div style="clear:both;"></div>
            </ImageFieldDefinitionItemTemplate>
        </FieldDefinition:ImageFieldDefinitionControl>
    </ImageFieldDefinitionTemplate>
    <BooleanFieldDefinitionTemplate>
        <FieldDefinition:BooleanFieldDefinitionControl ID="BooleanFieldDefinitionControl1" runat="server" >
            <BooleanFieldDefinitionItemTemplate>
                <div class="litBoldHeader"><asp:Label ID="labelBooleanFieldDefinition" Runat="server"/><asp:Label id="labelBooleanFieldDefinitionMandatory" runat="server"><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></asp:Label></div>
                <asp:CheckBox cssclass="litText" Visible="False" ID="checkboxBooleanDefinitionValue" Runat="server"/><asp:Label id="labelBooleanFieldDefinitionInputValue" visible="false" runat="server" CssClass="litText"/><asp:Label id="labelBooleanFieldDefinitionNoValue" visible="false" runat="server" CssClass="litText"/> <asp:CustomValidator SetFocusOnError="true" id="validatorMandatoryBooleanFieldDefinition" Display="Dynamic" runat="server"/>
            </BooleanFieldDefinitionItemTemplate>
        </FieldDefinition:BooleanFieldDefinitionControl>
    </BooleanFieldDefinitionTemplate>      
    <DateTimeFieldDefinitionTemplate>
        <FieldDefinition:DateTimeFieldDefinitionControl ID="DateFieldDefinitionControl1" runat="server" >
            <DateTimeFieldDefinitionItemTemplate>
                <div class="litBoldHeader"><asp:Label ID="labelDateTimeFieldDefinition" Runat="server"/><asp:Label id="labelDateTimeFieldDefinitionMandatory" runat="server"><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></asp:Label></div>
                <table cellspacing="0" cellpadding="0" border="0" id="tableDateTimeDefinitionValue" runat="server" visible="false" style="float:left;">
                    <tr>
                        <td>
							<LS:DateTimeHelper ID="dateTimeHelper" runat="server" AssociatedControlID="radPickerDate" />
							<Telerik:RadDatePicker runat="server" ID="radPickerDate" Visible="false" MinDate="1754-01-01" />
						</td>
                        <td style="font-size:10px;">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
				<asp:Label ID="labelTextField" Runat="server" CssClass="litText"/> <asp:Label id="labelDateTimeFieldDefinitionInputValue" runat="server" CssClass="litText"/> <asp:Label id="labelDateTimeFieldDefinitionNoValue" runat="server" CssClass="litText"/>
                <asp:DropDownList CssClass="litInputSelect" ID="dropDownListDateTimeFieldDefinition" Runat="server"/> <asp:CustomValidator SetFocusOnError="true" id="validatorMandatoryDateTimeFieldDefinition" Display="Dynamic" runat="server"/>
                <div style="clear:both;"></div>
            </DateTimeFieldDefinitionItemTemplate>
        </FieldDefinition:DateTimeFieldDefinitionControl>
    </DateTimeFieldDefinitionTemplate>
    <MultiSelectFieldDefinitionTemplate>
        <FieldDefinition:MultiSelectFieldDefinitionControl ID="MultiSelectFieldDefinitionControl1" runat="server" >
              <MultiSelectFieldDefinitionItemTemplate>
                <div class="litBoldHeader"><asp:Label ID="labelMultiSelectFieldDefinition" Runat="server"/><asp:Label id="labelMultiSelectFieldDefinitionMandatory" runat="server"><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></asp:Label></div>
                <asp:CheckBoxList cssclass="litInputSelect" style="width:auto;" Visible="False" ID="checkboxListMultiSelectFieldDefinition" Runat="server"/> <asp:CustomValidator SetFocusOnError="true" id="validatorMandatoryMultiSelectFieldDefinition" Display="Dynamic" runat="server"/>
            </MultiSelectFieldDefinitionItemTemplate>
        </FieldDefinition:MultiSelectFieldDefinitionControl>
    </MultiSelectFieldDefinitionTemplate>
</FieldDefinition:FieldDefinitionListControl>
</div>