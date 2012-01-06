<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_ModuleStringExport1, Litum.Studio.Web" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
        <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>		    
		    <toolbar:ToolbarItem DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconExport2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemExport" runat="server" />
	    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconModules" />
	<Foundation:SystemString ID="SystemString1" Name="ModuleStringExportPageSubHeader1" runat="server"/> "<asp:Label id="c_labelModuleName" Runat="server"/>"<span class="litContentTopGuide">&nbsp;(<Foundation:SystemString ID="SystemString2" Name="ModuleStringExportPageSubHeader2" runat="server" />)</span>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <span class="litText"><Foundation:SystemString ID="SystemString3" Name="ModuleStringExportPage1Description1" runat="server"/><br /><br /><Foundation:SystemString ID="SystemString4" Name="ModuleStringExportPage1Description2" runat="server"/><br /><br /></span>
	    <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td colspan="2" class="litBoldText"><Foundation:SystemString Name="SelectLanguage" runat="server" ID="Systemstring5"/>:</td>
		    </tr>
		    <tr>
			    <td><asp:DropDownList cssclass="litInputSelect" id="c_dropDownListLanguage" runat="server"/></td>
			    <td style="padding-left:10px;" class="litErrorMsg"></td>
		    </tr>
	    </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_dropDownListLanguage.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemExport.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>