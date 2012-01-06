<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" validaterequest="false" autoeventwireup="true" inherits="LitiumStudio_CMS_WebSitesCreate, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<%@ Register TagPrefix="Pages" Namespace="Litium.Studio.UI.CMS.Pages.WebControls" Assembly="Litium.Studio.UI"%>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
	    <toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
	    <toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">	
	<Foundation:ModuleString ID="ModuleString4" Name="WebSiteCreatePageSubHeader1" runat="server" /><span class="litContentTopGuide">&nbsp;(<Foundation:ModuleString Name="WebSiteCreatePageSubHeader2" runat="server" ID="ModuleString5"/>)</span>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
     <div class="lsContentScroll">
            <table border="0" cellspacing="0" cellpadding="0">
	            <tr>
		            <td colspan="2" class="litBoldText"><Foundation:ModuleString ID="ModuleString1" Name="DefaultWebSite" runat="server"/>:</td>
	            </tr>
	            <tr>
		            <td><asp:CheckBox cssclass="litInputCheckbox" id="c_checkBoxDefaultWebSite" runat="server"/></td>
		            <td style="padding-left:10px;" class="litErrorMsg"></td>
	            </tr>
            </table><br />
            <table border="0" cellspacing="0" cellpadding="0">
	            <tr>
		            <td colspan="2" class="litBoldText"><Foundation:SystemString Name="SelectLanguage" runat="server" ID="Systemstring1"/>:</td>
	            </tr>
	            <tr>
		            <td>  <ComponentArt:ComboBox
                                    Id="c_comboBoxLanguage"
                                    RunAt="Server"
                                    Width="385"
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
                                    DropDownWidth="400"
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
                            </ComponentArt:ComboBox>
                    </td>
		            <td style="padding-left:10px;" class="litErrorMsg"></td>
	            </tr>
            </table><br />
            <table border="0" cellspacing="0" cellpadding="0">
	            <tr>
		            <td colspan="2" class="litBoldText"><Foundation:ModuleString Name="WebSiteName" runat="server" ID="Modulestring2"/><img src="images/transparent.gif" style="vertical-align: middle;" class="litIconRequired" alt="" />: </td>
	            </tr>
	            <tr>
		            <td><asp:TextBox cssclass="litInputText" id="c_textBoxWebSiteName" runat="server"/></td>
		            <td style="padding-left:10px;"><Pages:LitCustomValidator ID="c_validatorWebSiteName" runat="server" ControlToValidate="c_textBoxWebSiteName" OnServerValidate="ValidateWebSiteName" ValidateEmptyText="true" cssClass="litErrorMsg"/></td>
	            </tr>
            </table><br />
            <table border="0" cellspacing="0" cellpadding="0">
	            <tr>
		            <td colspan="2" class="litBoldText"><Foundation:SystemString Name="Currency" runat="server" ID="Modulestring9"/>:</td>
	            </tr>
	            <tr>
		            <td><asp:DropDownList cssclass="litInputText" id="c_currency" runat="server"/></td>
		            <td style="padding-left:10px;"></td>
	            </tr>
            </table><br />
            <table border="0" cellspacing="0" cellpadding="0">
	            <tr>
		            <td colspan="2" class="litBoldText"><Foundation:ModuleString ID="ModuleString3" Name="WebSiteBaseTemplate" runat="server" />:</td>
	            </tr>
	            <tr>
		            <td><asp:TextBox cssclass="litInputText" id="c_textBoxWebSiteBaseTemplate" runat="server"/></td>
		            <td style="padding-left:10px;"><Pages:LitCustomValidator ID="c_validatorWebSiteBaseTemplate" runat="server" ControlToValidate="c_textBoxWebSiteBaseTemplate" OnServerValidate="ValidateWebSiteBaseTemplate" ValidateEmptyText="true" cssClass="litErrorMsg"/></td>
	            </tr>
            </table><br />
            <table border="0" cellspacing="0" cellpadding="0">
	            <tr>
		            <td colspan="2" class="litBoldText"><Foundation:ModuleString Name="DomainName" runat="server" ID="Modulestring6"/><img src="images/transparent.gif" style="vertical-align: middle;" class="litIconRequired" alt="" />:</td>
	            </tr>
	            <tr>
		            <td><asp:TextBox cssclass="litInputText" id="c_textBoxDomainName" runat="server"/></td>
		            <td style="padding-left:10px;"><Pages:LitCustomValidator ID="c_validatorWebSiteDomainName" runat="server" ControlToValidate="c_textBoxDomainName" OnServerValidate="ValidateWebSiteDomainName" ValidateEmptyText="true" cssClass="litErrorMsg"/></td>
	            </tr>
            </table><br />
            <table border="0" cellspacing="0" cellpadding="0">
	            <tr>
		            <td colspan="2" class="litBoldText"><Foundation:ModuleString Name="GoogleAnalyticsAccountID" runat="server" ID="Modulestring7"/>:</td>
	            </tr>
	            <tr>
		            <td><asp:TextBox cssclass="litInputText" id="c_textBoxGoogleAnalyticsAccountID" runat="server"/></td>
			        <td style="padding-left:10px;" class="litErrorMsg"><Pages:LitCustomValidator ID="c_validatorGoogleAnalyticsAccountID" runat="server" ControlToValidate="c_textBoxGoogleAnalyticsAccountID" OnServerValidate="ValidateGoogleAnalyticsAccountID" cssClass="litErrorMsg"/></td>
	            </tr>
            </table><br />
            <table border="0" cellspacing="0" cellpadding="0">
	            <tr>
		            <td colspan="2" class="litBoldText"><asp:CheckBox cssclass="litInputCheckbox" id="c_pageResponsibleUser" runat="server"/><asp:Label id="c_pageResponsibleUserLabel" AssociatedControlID="c_pageResponsibleUser" runat="server"><Foundation:ModuleString ID="ModuleString8" Name="ResponsibleUser" runat="server"/></asp:Label></td>
	            </tr>
            </table><br />
            <table border="0" cellspacing="0" cellpadding="0">
	            <tr>
		            <td colspan="2" class="litBoldText"><asp:CheckBox cssclass="litInputCheckbox" id="c_permissionsActive" runat="server"/><asp:Label id="c_permissionsActiveLabel" AssociatedControlID="c_permissionsActive" runat="server"><Foundation:ModuleString ID="ModuleString10" Name="PagePermissionStepActive" runat="server"/></asp:Label></td>
	            </tr>
            </table><br />
            <Foundation:InformationGroup ID="c_informationGroupProspectFinder" runat="server" Width="400px" HeaderTextName="ProspectFinder">
				<p style="float: left; margin-top: 15px; margin-right: 15px;">
					<Foundation:SystemString ID="SystemString3" runat="server" Name="Username" CssClass="litText"/><br />
					<asp:TextBox runat="server" ID="c_prospectFinderUsername" CssClass="litInputText150" autocomplete="off" />
				</p>
				<p style="float: left; margin-top: 15px; margin-right: 15px;">
					<Foundation:SystemString ID="SystemString4" runat="server" Name="Password" CssClass="litText"/><br />
					<asp:TextBox runat="server" TextMode="Password" CssClass="litInputText150" ID="c_prospectFinderPassword" autocomplete="off" />
				</p>
            </Foundation:InformationGroup>
        </div>
    <script type="text/javascript">
        var disableSubmitObject = document.getElementById("<% Response.Write(c_textBoxGoogleAnalyticsAccountID.ClientID.ToString()); %>")
        var focusObject = document.getElementById("<% Response.Write(c_checkBoxDefaultWebSite.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var srcElmnt=(window.event)?window.event.srcElement:e.target; var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13 && srcElmnt!=disableSubmitObject) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>