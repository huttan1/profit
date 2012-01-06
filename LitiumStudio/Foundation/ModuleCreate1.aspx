<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_ModuleCreate1, Litum.Studio.Web" %>

<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
        <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
		    <toolbar:DividerItem ID="DividerItem1" ImageURL="../images/transparent.gif" Class="litToolbarSpace" runat="server" />
		    <toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>	
	    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconModules" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">    
    <div class="lsContentScroll">
	    <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString4" Name="ModuleName" runat="server" /><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</td>
		    </tr>
		    <tr>
			    <td><asp:TextBox cssclass="litInputText200" id="c_textBoxModuleName" runat="server"/></td>
			    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorModuleName" runat="server" ControlToValidate="c_textBoxModuleName" OnServerValidate="ValidateModuleName" cssClass="error"/></td>
		    </tr>
	    </table><br />
	    <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString6" Name="AssemblyName" runat="server" /><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</td>
		    </tr>
		    <tr>
			    <td><asp:TextBox cssclass="litInputText" id="c_textBoxAssemblyName" runat="server"/></td>
			    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorAssemblyName" runat="server" ControlToValidate="c_textBoxAssemblyName" OnServerValidate="ValidateAssemblyName" cssClass="error"/></td>
		    </tr>
	    </table><br />
	    <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString7" Name="ClassName" runat="server" /><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</td>
		    </tr>
		    <tr>
			    <td><asp:TextBox cssclass="litInputText" id="c_textBoxClassName" runat="server"/></td>
			    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorClassName" runat="server" ControlToValidate="c_textBoxClassName" OnServerValidate="ValidateClassName" cssClass="error"/></td>
		    </tr>
	    </table><br />
	    <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString8" Name="LargeIconPath" runat="server" />:</td>
		    </tr>
		    <tr>
			    <td><asp:TextBox cssclass="litInputText" id="c_textBoxLargeIconPath" runat="server"/></td>
			    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorLargeIconPath" runat="server" ControlToValidate="c_textBoxLargeIconPath" OnServerValidate="ValidateLargeIconPath" cssClass="error"/></td>
		    </tr>
	    </table><br />
	    <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString14" Name="MediumIconPath" runat="server" />:</td>
		    </tr>
		    <tr>
			    <td><asp:TextBox cssclass="litInputText" id="c_textBoxMediumIconPath" runat="server"/></td>
			    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorMediumIconPath" runat="server" ControlToValidate="c_textBoxMediumIconPath" OnServerValidate="ValidateLargeIconPath" cssClass="error"/></td>
		    </tr>
	    </table><br />
	    <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString9" Name="SmallIconPath" runat="server" />:</td>
		    </tr>
		    <tr>
			    <td><asp:TextBox cssclass="litInputText" id="c_textBoxSmallIconPath" runat="server"/></td>
			    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorSmallIconPath" runat="server" ControlToValidate="c_textBoxSmallIconPath" OnServerValidate="ValidateSmallIconPath" cssClass="error"/></td>
		    </tr>
	    </table><br />
	    <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString10" Name="StartPagePath" runat="server" />:</td>
		    </tr>
		    <tr>
			    <td><asp:TextBox cssclass="litInputText" id="c_textBoxStartPagePath" runat="server"/></td>
			    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorStartPagePath" runat="server" ControlToValidate="c_textBoxStartPagePath" OnServerValidate="ValidateStartPagePath" cssClass="error"/></td>
		    </tr>
	    </table><br />
	    <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td colspan="2" class="litBoldText"><Foundation:SystemString Name="SettingsPagePath" runat="server" ID="Systemstring11"/>:</td>
		    </tr>
		    <tr>
			    <td><asp:TextBox cssclass="litInputText" id="c_textBoxSettingsPagePath" runat="server"/></td>
			    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorSettingsPagePath" runat="server" ControlToValidate="c_textBoxSettingsPagePath" OnServerValidate="ValidateSettingsPagePath" cssClass="error"/></td>
		    </tr>
	    </table><br />
	    <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString12" Name="ErrorPagePath" runat="server" />:</td>
		    </tr>
		    <tr>
			    <td><asp:TextBox cssclass="litInputText" id="c_textBoxErrorPagePath" runat="server"/></td>
			    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorErrorPagePath" runat="server" ControlToValidate="c_textBoxErrorPagePath" OnServerValidate="ValidateErrorPagePath" cssClass="error"/></td>
		    </tr>
	    </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_textBoxModuleName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>