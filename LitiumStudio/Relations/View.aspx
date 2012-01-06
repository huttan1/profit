
<%@ page language="C#" masterpagefile="~/LitiumStudio/Relations/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_Relations_View, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Relations/Framework/Base.master" %>


<%@ Register TagPrefix="FieldDefinition" Namespace="Litium.Studio.UI.Relations.FieldTemplates.WebControls" Assembly="Litium.Studio.UI" %>
<%@ Register Src="WebUserControl/AddressInformation.ascx" TagName="AddressInformation"
    TagPrefix="uc2" %>
    
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
        <toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemBack" runat="server"/>
	    <toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarDivider" runat="server" />	   
	</toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
	<img src="Images/transparent.gif" alt="" runat="server" id="c_imageHeaderIcon" /><asp:Label runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <script type="text/javascript" src="Scripts/listBoxSelection.js"></script>
    <div class="lsContentScroll">
        <div style="float: left; width: 515px; padding-right: 15px;">   
        <Foundation:InformationGroup runat="server" ID="c_generalGroup" Width="515"><br />
        <asp:Panel runat="server" ID="c_panelPerson" Visible="false">
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr runat="server" id="c_tableRowCustomerNumber">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString4" Name="CustomerNumber" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_personCustomerNumber" /></td>
                </tr>
                <tr runat="server" id="c_tableRowTitle">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString14" Name="Title" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_personTitle" /></td>
                </tr>
                <tr runat="server" id="c_tableRowGender">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString17" Name="Gender" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_personGender" /></td>
                </tr>
                <tr runat="server" id="c_tableRowEmail">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString6" Name="Email" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_personEmail" /></td>
                </tr>
                <tr runat="server" id="c_tableRowCompany">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString1" Name="Company" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_personCompany" /></td>
                </tr>

                <tr runat="server" id="c_tableRowComments">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString9" Name="Comments" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_personComments" /></td>
                </tr>
                <tr runat="server" id="c_tableRowUserName" visible="false">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString12" Name="UserName" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_personUserName" /></td>
                </tr>
                <tr runat="server" id="c_tableRowPassword" visible="false">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString13" Name="Password" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText">*****</td>
                </tr>
                <tr runat="server" id="c_tableRowLastLogin" visible="true">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString24" Name="LastLoginDate" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:Label runat="server" ID="c_labelLastLogin"/></td>
                </tr>
                
                <tr runat="server" id="c_tableRowAccountSpace" visible="false">
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString10" Name="Groups" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_personGroups" /></td>
                </tr>
                <tr>
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString20" Name="Organizations" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_personOrganizations" /></td>
                </tr>
                <tr>
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString21" Name="Roles" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_personRoles" /></td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" ID="c_panelGroup" Visible="false">
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr runat="server" id="c_tableRowGroupDescription">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString18" Name="Description" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_groupDescription" /></td>
                </tr>
                <tr>
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString22" Name="Persons" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_groupPersons" /></td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" ID="c_panelOrganization" Visible="false">
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr runat="server" id="c_tableRowOrganizationCustomerNR">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString25" Name="CustomerNumber" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_organizationCustomerNR" /></td>
                </tr>
                <tr runat="server" id="c_tableRowOrganizationDescription">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString19" Name="Description" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_organizationDescription" /></td>
                </tr>
                <tr>
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString23" Name="Persons" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_organizationPersons" /></td>
                </tr>
            </table>
        </asp:Panel>
        </Foundation:InformationGroup>
    	</div>		
        <div style="float: left; width: 250px;" runat="server" id="c_tableRowPicture">   
            <Foundation:InformationGroup runat="server" ID="c_imageGroup"><br />
            <div style="text-align:center; float:left;">
                <div runat="server" style="margin-top:5px; border:1px solid #7F9DB9; padding:5px; background-color:white; float:left;" id="c_divPicture" visible="false"><img runat="server" id="c_personPicture" visible="false" /></div><div style="clear:both;"></div>
                <div class="litText" style="margin-top:2px;"><asp:Label runat="server" ID="c_labelImageDescription" /> <a href="#" id="c_linkDownloadImage" runat="server" visible="false"><img src="Images/transparent.gif" style="vertical-align:middle; border:none;" class="litIconDownload" alt="<Foundation:ModuleString Name=DownloadImage runat=Server />" title="<Foundation:ModuleString Name=DownloadImage runat=Server />" /></a></div>
            </div>
            </Foundation:InformationGroup>
        </div>
        <div style="clear: both;"></div>
        <div style="float: left; width: 250px; padding-right: 15px;" runat="server" id="c_addressPanel">   
            <br />
            <Foundation:InformationGroup runat="server" ID="c_addressGroup"><br />
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
             <tr runat="server" id="c_tableRowAddress">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString7" Name="Address" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_personAddress" /></td>
                </tr>
                <tr runat="server" id="c_tableRowZipCode">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString15" Name="ZipCode" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_personZipCode" /></td>
                </tr>
                <tr runat="server" id="c_tableRowCity">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString16" Name="City" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_personCity" /></td>
                </tr>
                <tr runat="server" id="c_tableRowCountryUpdate">
                    <td style="padding-bottom:5px; white-space:nowrap;" colspan="2" class="litText" valign="middle"><Foundation:ModuleString Name="CountryHasToBeUpdated" CssClass="litErrorMsg" runat="server" /></td>
                </tr>
                <tr runat="server" id="c_tableRowCountry">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString8" Name="Country" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_personCountry" /></td>
                </tr>
                <tr runat="server" id="c_tableRowPhoneHome">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString2" Name="HomePhone" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_personPhoneHome" /></td>
                </tr>
                <tr runat="server" id="c_tableRowPhoneWork">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString3" Name="WorkPhone" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_personPhoneWork" /></td>
                </tr>
                <tr runat="server" id="c_tableRowPhoneMobile">
	                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString5" Name="CellPhone" runat="server" />:</td>
	                <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_personPhoneMobile" /></td>
                </tr>
            </table>
            </Foundation:InformationGroup>
            <br />
        </div>

        <div style="float: left; width: 250px; margin-right: 15px;" runat="server" id="c_billingPanel">   
            <br />
            <uc2:AddressInformation ID="c_billingAddressInformation" runat="server" />    
            <br />
        </div>
        <div style="float: left; width: 250px;" runat="server" id="c_deliveryPanel">        
            <br />
            <uc2:AddressInformation ID="c_deliveryAddressInformation" runat="server" />        
            <br />
        </div>
        <div style="clear: both;"></div>

        <Foundation:InformationGroup runat="server" ID="c_customFieldsLine" Width="515" ><br />
        <table border="0" cellspacing="0" cellpadding="0">
            <FieldDefinition:FieldDefinitionListControl id="c_fieldDefinitionList" runat="server">
                <StringFieldDefinitionTemplate>
                    <FieldDefinition:StringFieldDefinitionControl ID="StringFieldDefinitionControl1" runat="server" >
                        <StringFieldDefinitionItemTemplate>
                            <tr>
                                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><asp:Label ID="labelTextBoxFieldDefinition" Runat="server"/>:</td>
                                <td style="padding-bottom:5px;padding-left:5px;" class="litText"><asp:Label id="labelTextBoxFieldDefinitionInputValue" runat="server"/></td>
                            </tr>
                         </StringFieldDefinitionItemTemplate>
                    </FieldDefinition:StringFieldDefinitionControl>
                </StringFieldDefinitionTemplate>
                <NumberFieldDefinitionTemplate>
                   <FieldDefinition:NumberFieldDefinitionControl ID="NumberFieldDefinitionControl1"  runat="server" >
                    <NumberFieldDefinitionItemTemplate>
                            <tr>
                                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><asp:Label ID="labelTextBoxFieldDefinition" Runat="server"/>:</td>
                                <td style="padding-bottom:5px;padding-left:5px;" class="litText"><asp:Label id="labelTextBoxFieldDefinitionInputValue" runat="server"/></td>
                            </tr>
                    </NumberFieldDefinitionItemTemplate>
                   </FieldDefinition:NumberFieldDefinitionControl>
                </NumberFieldDefinitionTemplate>
                <FileFieldDefinitionTemplate>
                   <FieldDefinition:FileFieldDefinitionControl ID="FileFieldDefinitionControl1" runat="server" >
                    <FileFieldDefinitionItemTemplate>
                            <tr>
                                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><asp:Label ID="labelUploadFieldDefinition" Runat="server"/>:</td>
                                <td style="padding-bottom:5px;padding-left:5px;" class="litText"><asp:Panel cssclass="frmUploadFile" ID="panelFileUploadFieldDefinitionInputValue" Runat="server"><asp:HyperLink id="hyperLinkFileUploadFieldDefinitionInputValue" cssclass="litText" runat="server"/></asp:Panel></td>
                            </tr>
                    </FileFieldDefinitionItemTemplate>
                   </FieldDefinition:FileFieldDefinitionControl>
                </FileFieldDefinitionTemplate>
                <ImageFieldDefinitionTemplate>
                   <FieldDefinition:ImageFieldDefinitionControl ID="ImageFieldDefinitionControl1" runat="server" >
                    <ImageFieldDefinitionItemTemplate>
                            <tr>
                                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><asp:Label ID="labelUploadFieldDefinition" Runat="server"/>:</td>
                                <td style="padding-bottom:5px;padding-left:5px;" class="litText">
                                    <asp:Panel runat="server" ID="panelImageUploadFieldDefinitionInputValue" style="text-align:center; float:left; width: 210px;">
                                        <div style="margin-top:5px; border:1px solid #7F9DB9; padding:5px; background-color:white; float:left;"><img runat="server" id="imgUploadFieldDefinitionInputValue" /></div><div style="clear:both;"></div>
				                        <div class="litText" style="margin-top:2px;"><asp:Label runat="server" ID="c_labelImageDescription" /> <a href="#" id="c_linkDownloadImage" runat="server"><img src="Images/transparent.gif" style="vertical-align:middle; border:none;" class="litIconDownload" alt="<Foundation:ModuleString Name=DownloadImage runat=Server />" title="<Foundation:ModuleString Name=DownloadImage runat=Server />" /></a></div>
	                                </asp:Panel>
                                </td>
                            </tr>
                    </ImageFieldDefinitionItemTemplate>
                   </FieldDefinition:ImageFieldDefinitionControl>
                </ImageFieldDefinitionTemplate>
                <BooleanFieldDefinitionTemplate>
                   <FieldDefinition:BooleanFieldDefinitionControl ID="StringFieldDefinitionControl1" runat="server" >
                    <BooleanFieldDefinitionItemTemplate>
                            <tr>
                                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><asp:Label ID="labelBooleanFieldDefinition" Runat="server"/>:</td>
                                <td style="padding-bottom:5px;padding-left:5px;" class="litText"><asp:Label id="labelBooleanFieldDefinitionInputValue" visible="false" runat="server"/></td>
                            </tr>
                    </BooleanFieldDefinitionItemTemplate>
                   </FieldDefinition:BooleanFieldDefinitionControl>
                </BooleanFieldDefinitionTemplate>      
                <DateTimeFieldDefinitionTemplate>
                    <FieldDefinition:DateTimeFieldDefinitionControl ID="StringFieldDefinitionControl1" runat="server" >
                        <DateTimeFieldDefinitionItemTemplate>
                            <tr>
                                <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><asp:Label ID="labelDateTimeFieldDefinition" Runat="server"/>:</td>
                                <td style="padding-bottom:5px;padding-left:5px;" class="litText"><asp:Label id="labelDateTimeFieldDefinitionInputValue" runat="server"/></td>
                            </tr>
                        </DateTimeFieldDefinitionItemTemplate>
                    </FieldDefinition:DateTimeFieldDefinitionControl>
                </DateTimeFieldDefinitionTemplate>
                <MultiSelectFieldDefinitionTemplate>
                    <FieldDefinition:MultiSelectFieldDefinitionControl ID="MultiSelectFieldDefinitionControl1" runat="server" >
                          <MultiSelectFieldDefinitionItemTemplate>
                            <tr>
                                <td style="padding-bottom:5px;" valign="top" colspan="2">
                                    <div style="white-space:nowrap;"><asp:Label ID="labelMultiSelectFieldDefinition" CssClass="litBoldText" Runat="server"/>:</div>
                                    
                                    <div style=""><asp:Label id="labelMultiSelectFieldDefinitionInputValue" CssClass="litText" runat="server"/></div>
                                    
                                    <!--
                                    <div class="litText"><asp:CheckBoxList cssclass="litInputSelect" style="width:auto;" Visible="False" ID="checkboxListMultiSelectFieldDefinition" Runat="server"/></div>
                                    -->
                                </td>
                             </tr>
                        </MultiSelectFieldDefinitionItemTemplate>
                    </FieldDefinition:MultiSelectFieldDefinitionControl>
                </MultiSelectFieldDefinitionTemplate>
            </FieldDefinition:FieldDefinitionListControl>
        </table>
        </Foundation:InformationGroup>
    </div>
</asp:Content>