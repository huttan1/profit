<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PageTypesStringCreate, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<%@ Register TagPrefix="Pages" Namespace="Litium.Studio.UI.CMS.Pages.WebControls" Assembly="Litium.Studio.UI"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <Toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
        <Toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem"
            LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
            ImageURL="images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>
            	
        <Toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
        
        <Toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem" Class="litToolbarItem"
            LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected"
            ImageURL="images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>	
    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconPageType" />
	<Foundation:ModuleString ID="ModuleString1" Name="PageTypeStringCreatePageSubHeader1" runat="server" /> "<asp:Label id="c_labelPageTypeName" runat="server"/>"<span class="litContentTopGuide">&nbsp;(<Foundation:ModuleString Name="PageTypeStringCreatePageSubHeader2" runat="server" ID="Systemstring2"/>)</span>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server"> 
        <div class="lsContentScroll">
            <div class="litGuideStarsV2"></div>
	        <table border="0" cellspacing="0" cellpadding="0">
		        <tr>
			        <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString1" Name="SelectLanguage" runat="server" />:</td>
		        </tr>
		        <tr>
			        <td><asp:DropDownList cssclass="litInputSelect" OnSelectedIndexChanged="SelectLanguage_Changed" AutoPostBack="True" id="c_dropDownListLanguage" runat="server"/></td>
			        <td style="padding-left:10px;" class="litErrorMsg"></td>
		        </tr>
	        </table><br />
	        <table border="0" cellspacing="0" cellpadding="0">
		        <tr>
			        <td colspan="2" class="litBoldText"><Foundation:ModuleString ID="ModuleString2" Name="PageTypeStringName" runat="server" />:</td>
		        </tr>
		        <tr>
			        <td><asp:TextBox cssclass="litInputText200" id="c_textBoxPageTypeStringName" runat="server"/></td>
			        <td style="padding-left:10px;"><Pages:LitCustomValidator ID="c_validatorPageTypeStringName" runat="server" ControlToValidate="c_textBoxPageTypeStringName" OnServerValidate="ValidatePageTypeStringName" cssClass="litErrorMsg"/></td>
		        </tr>
	        </table><br />
	        <table border="0" cellspacing="0" cellpadding="0">
		        <tr>
			        <td colspan="2" class="litBoldText"><Foundation:ModuleString Name="PageTypeString" runat="server" ID="Systemstring3"/>:</td>
		        </tr>
		        <tr>
			        <td><asp:TextBox cssclass="litInputText" id="c_textBoxPageTypeStringValue" runat="server"/></td>
			        <td style="padding-left:10px;"><Pages:LitCustomValidator ID="c_validatorPageTypeStringValue" runat="server" ControlToValidate="c_textBoxPageTypeStringValue" OnServerValidate="ValidatePageTypeStringValue" cssClass="litErrorMsg"/></td>
		        </tr>
	        </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_dropDownListLanguage.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>