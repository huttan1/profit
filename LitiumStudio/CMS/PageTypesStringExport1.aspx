<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PageTypesStringExport1, Litum.Studio.Web" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <Toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
	    <Toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem"
	        LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
	        ImageURL="images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>
	    <Toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
	    <Toolbar:ToolbarItem DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink"
	        ImageClass="litIconExport2" SelectedClass="litToolbarItem litToolbarItemSelected"
	        ImageURL="images/transparent.gif" ID="c_toolbarItemExport" runat="server"/>
    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconPageType" />
	<Foundation:ModuleString ID="ModuleString1" Name="PageTypeStringExportPageSubHeader1" runat="server"/> "<asp:Label id="c_labelPageTypeName" runat="server"/>"<span class="litContentTopGuide">&nbsp;(<Foundation:ModuleString ID="ModuleString2" Name="PageTypeStringExportPageSubHeader2" runat="server" />)</span>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
        <div class="lsContentScroll">
            <span class="litText"><Foundation:ModuleString ID="ModuleString3" Name="PageTypeStringExportPage1Description1" runat="server"/><br /><br /><Foundation:ModuleString ID="ModuleString4" Name="PageTypeStringExportPage1Description2" runat="server"/><br /><br /></span>
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td colspan="2" class="litBoldText"><Foundation:SystemString Name="SelectLanguage" runat="server" ID="Systemstring1"/>:</td>
				</tr>
				<tr>
					<td><asp:DropDownList cssclass="litInputSelect" id="c_dropDownListLanguage" runat="server"/></td>
					<td style="padding-left:10px;" class="litErrorMsg"></td>
				</tr>
			</table><br />
			<asp:Panel id="c_panelError" runat="server"> 
				<span class="litErrorMsg"><img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError"/><asp:Label id="c_labelError" runat="server"/></span>
			</asp:Panel>
        </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_dropDownListLanguage.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemExport.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>