<%@ page language="C#" masterpagefile="~/LitiumStudio/Relations/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_Relations_Add2, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Relations/Framework/Base.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
        <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
        <toolbar:DividerItem ID="DividerItem2" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
		<toolbar:ToolbarItem OnClick="ToolbarItemPrevious_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemPrevious" runat="server"/>
	    <toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
   	    <toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemNext" runat="server"/>
	</toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
         <img src="Images/transparent.gif" alt="" runat="server" id="c_imageHeaderIcon" /><asp:Label runat="server" ID="c_labelAddPageHeader" /><span class="litTextNormalWeight">&nbsp;(<asp:Label runat="server" ID="c_labelAddPageSubHeader" />)</span>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <div class="litDescriptionText"><asp:Label ID="c_labelPageDescription" runat="server" /></div>
        <asp:Panel runat="server" ID="c_panelPerson" Visible="false">
            <asp:Panel runat="server" ID="c_panelFirstName" style="float:left; margin-right:10px;">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString12" Name="FirstName" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredFirstName" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
                <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="100" id="c_firstName" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_firstName" id="c_validatorFirstName" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
            </asp:Panel>
            <asp:Panel runat="server" ID="c_panelMiddleName" style="float:left; margin-right:10px;">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString16" Name="MiddleName" runat="server" /><img runat="server" id="c_imageRequiredMiddleName" src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
                <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="255" id="c_middleName" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_middleName" id="c_validatorMiddleName" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
            </asp:Panel>
            <asp:Panel runat="server" ID="c_panelLastName" style="float:left; margin-right:10px;">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString13" Name="LastName" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredLastName" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
                <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="200" id="c_lastName" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_lastName" id="c_validatorLastName" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
            </asp:Panel>
            <div style="clear:both;"></div>
            
            <asp:Panel runat="server" ID="c_panelCustomerNr" style="float:left; margin-right:10px;">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString14" Name="CustomerNumber" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredCustomerNr" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
                <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="50" id="c_customerNumber" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_customerNumber" id="c_validatorCustomerNr" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/><asp:CustomValidator SetFocusOnError="true" ControlToValidate="c_customerNumber" id="c_validatorCustomerNr2" CssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server" OnServerValidate="CustomerNumber_Validate" />
            </asp:Panel>
            <asp:Panel runat="server" ID="c_panelTitle" style="float:left; margin-right:10px;">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString17" Name="Title" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredTitle" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
                <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="50" id="c_title" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_title" id="c_validatorTitle" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
            </asp:Panel>
            <asp:Panel runat="server" ID="c_panelGender" style="float:left; margin-right:10px;">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString18" Name="Gender" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredGender" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
                <div class="litText"><asp:RadioButton ID="c_radioButtonFemale" runat="server" GroupName="Gender" />&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="c_radioButtonMale" runat="server" GroupName="Gender" /></div><asp:Label runat="server" ID="c_labelValidateGender" Visible="false" cssClass="litErrorMsg" />
            </asp:Panel>
            <div style="clear:both;"></div>
            
            <asp:Panel runat="server" ID="c_panelEmail" style="float:left; margin-right:10px;">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString15" Name="Email" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredEmail" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
                <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="200" id="c_email" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_email" id="c_validatorRequiredEmail" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/><asp:CustomValidator ID="c_validatorEmail" runat="server" Display="Dynamic" ControlToValidate="c_email" OnServerValidate="ValidateEmail" CssClass="litErrorMsg" />
            </asp:Panel>
            <asp:Panel runat="server" ID="c_panelCompany" style="float:left; margin-right:10px;">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString2" Name="Company" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredCompany" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
                <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="200" id="c_company" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_company" id="c_validatorCompany" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
            </asp:Panel>
            <div style="clear:both;"></div>
           
            <asp:Panel runat="server" ID="c_panelAdress" style="float:left; margin-right:10px;">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString3" Name="Address" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredAddress" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
                <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="100" id="c_address" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_address" id="c_validatorAddress1" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/><br />
                <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="100" id="c_address2" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_address2" id="c_validatorAddress2" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
            </asp:Panel>
            <div style="clear:both;"></div>
            
            <asp:Panel runat="server" ID="c_panelZipCode" style="float:left; margin-right:10px;">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString4" Name="ZipCode" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredZipCode" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
                <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="10" id="c_zipCode" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_zipCode" id="c_validatorZipCode" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
            </asp:Panel>
            <asp:Panel runat="server" ID="c_panelCity" style="float:left; margin-right:10px;">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString5" Name="City" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredCity" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
                <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="50" id="c_city" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_city" id="c_validatorCity" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
            </asp:Panel>
            <asp:Panel runat="server" ID="c_panelCountry" style="float:left; margin-right:10px;">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString9" Name="Country" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredCountry" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
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
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString6" Name="HomePhone" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredPhoneHome" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
                <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="50" id="c_phoneHome" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_phoneHome" id="c_validatorPhoneHome" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
            </asp:Panel>
            <asp:Panel runat="server" ID="c_panelPhoneWork" style="float:left; margin-right:10px;">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString7" Name="WorkPhone" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredPhoneWork" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
                <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="50" id="c_phoneWork" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_phoneWork" id="c_validatorPhoneWork" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
            </asp:Panel>
            <asp:Panel runat="server" ID="c_panelPhoneMobile" style="float:left; margin-right:10px;">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString8" Name="CellPhone" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredPhoneMobile" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
                <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="50" id="c_phoneMobile" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_phoneMobile" id="c_validatorPhoneMobile" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
            </asp:Panel>
            <div style="clear:both;"></div>
            
            <asp:Panel runat="server" ID="c_panelImage" style="margin-top:15px;"><span class="litBoldText"><Foundation:ModuleString ID="ModuleString10" Name="Image" runat="server" /></span><img src="images/transparent.gif" runat="server" id="c_imageRequiredPicture" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></asp:Panel>
            
            <div runat="server" visible="false" id="c_existingImageDiv" style="text-align:center; float:left;">
                <div style="margin-right:10px; border:1px solid #7F9DB9; padding:5px; background-color:white; float:left;"><img runat="server" id="c_existingImage" src="" alt=""/></div><div style="clear:both;"></div>
                <div class="litText" style="margin-top:2px;"><asp:Label runat="server" ID="c_labelImageDescription" /> <a href="#" id="c_linkDownloadImage" runat="server"><img src="Images/transparent.gif" style="vertical-align:middle; border:none;" class="litIconDownload" alt="<Foundation:ModuleString Name=DownloadImage runat=Server />" title="<Foundation:ModuleString Name=DownloadImage runat=Server />" /></a></div>
            </div>
            <div style="float:left;">
                <div><asp:Label runat="server" ID="c_labelReplaceExistingImage" Visible="false" CssClass="litText"/><asp:FileUpload runat="server" CssClass="litInputFile" id="c_image" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_image" id="c_validatorPicture" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/></div>
            </div>
            <div style="clear:both;"></div>
            
            <asp:Panel runat="server" ID="c_panelComments" CssClass="litBoldHeader"><Foundation:ModuleString ID="ModuleString11" Name="Comments" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredComments" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></asp:Panel>
            <asp:TextBox runat="server" cssclass="litInputTextArea" TextMode="MultiLine" Rows="5" id="c_comments" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_comments" id="c_validatorComments" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
        </asp:Panel>
        <asp:Panel runat="server" ID="c_panelGroup" Visible="false">
            <asp:Panel runat="server" ID="c_panelGroupName">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString20" Name="Name" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredGroupName" style="vertical-align:middle;" class="litIconRequired" alt="" /></div>
                <asp:TextBox runat="server" cssclass="litInputText200" MaxLength="100" id="c_groupName" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_groupName" id="c_validatorGroupName" cssClass="litErrorMsg" Display="Dynamic" runat="server"/><asp:Label runat="server" cssClass="litErrorMsg" ID="c_validatorGroupNameUnique" Visible="false" />
            </asp:Panel>
            <asp:Panel runat="server" ID="c_panelGroupDescription">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString19" Name="Description" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredGroupDescription" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
                <asp:TextBox runat="server" CssClass="litInputTextArea" TextMode="MultiLine" Rows="5" id="c_groupDescription" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_groupDescription" id="c_validatorGroupDescription" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
            </asp:Panel>
        </asp:Panel>
        <asp:Panel runat="server" ID="c_panelOrganization" Visible="false">
            <asp:Panel runat="server" ID="c_panelOrganizationName">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString21" Name="Name" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredOrganizationName" style="vertical-align:middle;" class="litIconRequired" alt="" /></div>
                <asp:TextBox runat="server" cssclass="litInputText200"  MaxLength="255" id="c_organizationName" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_organizationName" id="c_validatorOrganizationName" cssClass="litErrorMsg" Display="Dynamic" runat="server"/>
            </asp:Panel>
			<asp:Panel runat="server" ID="c_panelOrganizationCustumerNr">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString1" Name="CustomerNumber" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredCustomerNr2" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
                <asp:TextBox runat="server" cssclass="litInputText200" id="c_organizationCustomerNr" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_organizationCustomerNr" id="c_validatorOrganizationCustomerNr" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/><asp:CustomValidator SetFocusOnError="true" ControlToValidate="c_organizationCustomerNr" id="c_validatorOrganizationCustomerNr2" CssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server" OnServerValidate="CustomerNumber_Validate" />
            </asp:Panel>
            <asp:Panel runat="server" ID="c_panelOrganizationDescription">
                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString22" Name="Description" runat="server" /><img src="images/transparent.gif" runat="server" id="c_imageRequiredOrganizationDescription" style="vertical-align:middle;" class="litIconRequired" alt="" visible="false" /></div>
                <asp:TextBox runat="server" CssClass="litInputTextArea" TextMode="MultiLine" Rows="5" id="c_organizationDescription" /><asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="c_organizationDescription" id="c_validatorOrganizationDescription" cssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server"/>
            </asp:Panel>
        </asp:Panel>
    </div>
</asp:Content>