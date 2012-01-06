<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PageTypesStringImport, Litum.Studio.Web" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <Toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
	    <Toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem"
	        LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
	        ImageURL="images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>
	    <Toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
	    <Toolbar:ToolbarItem OnClick="ToolbarItemImport_Click" DisabledClass="litToolbarItem" Class="litToolbarItem"
	        LinkClass="litToolbarLink" ImageClass="litIconImport2" SelectedClass="litToolbarItem litToolbarItemSelected"
	        ImageURL="images/transparent.gif" ID="c_toolbarItemImport" runat="server"/>
    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconPageType" />
	<Foundation:ModuleString ID="ModuleString5" Name="PageTypeStringImportPageSubHeader1" runat="server"/> "<asp:Label id="c_labelPageTypeName" runat="server"/>"<span class="litContentTopGuide">&nbsp;(<Foundation:ModuleString ID="ModuleString6" Name="PageTypeStringImportPageSubHeader2" runat="server" />)</span>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
        <div class="lsContentScroll">
		    <span class="litText"><Foundation:ModuleString ID="ModuleString7" Name="PageTypeStringImportPage1Description1" runat="server"/><br /><br /><Foundation:ModuleString ID="ModuleString8" Name="PageTypeStringImportPage1Description2" runat="server"/><br /><br /></span>
	        <table border="0" cellspacing="0" cellpadding="0">
		        <tr>
			        <td colspan="2" class="litBoldText"><Foundation:SystemString Name="SelectLanguage" runat="server" ID="Systemstring1"/>:</td>
		        </tr>
		        <tr>
			        <td><asp:DropDownList cssclass="litInputSelect" id="c_dropDownListLanguage" runat="server"/></td>
			        <td style="padding-left:10px;" class="litErrorMsg"></td>
		        </tr>
	        </table><br />
	        <table border="0" cellspacing="0" cellpadding="0">
		        <tr>
			        <td><input class="litInputFile" id="c_inputFile" type="file" size="63" runat="server" /></td>
		        </tr>
	        </table>
        </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_dropDownListLanguage.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemImport.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>