<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_Foundation_WebUserControl_ModuleEditGeneralControl, Litum.Studio.Web" %>
<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>
<div class="lsTabContent">
    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString2" Name="ModuleName" runat="server" /><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</td>
	    </tr>
	    <tr>
		    <td><asp:TextBox cssclass="litInputText200" id="c_textBoxModuleName" runat="server"/></td>
		    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorModuleName" runat="server" ControlToValidate="c_textBoxModuleName" OnServerValidate="ValidateModuleName" cssClass="error"/></td>
	    </tr>
    </table><br />
    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString4" Name="AssemblyName" runat="server" /><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</td>
	    </tr>
	    <tr>
		    <td><asp:TextBox cssclass="litInputText" id="c_textBoxAssemblyName" runat="server"/></td>
		    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorAssemblyName" runat="server" ControlToValidate="c_textBoxAssemblyName" OnServerValidate="ValidateAssemblyName" cssClass="error"/></td>
	    </tr>
    </table><br />
    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString5" Name="ClassName" runat="server" /><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</td>
	    </tr>
	    <tr>
		    <td><asp:TextBox cssclass="litInputText" id="c_textBoxClassName" runat="server"/></td>
		    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorClassName" runat="server" ControlToValidate="c_textBoxClassName" OnServerValidate="ValidateClassName" cssClass="error"/></td>
	    </tr>
    </table><br />
    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString6" Name="LargeIconPath" runat="server" />:</td>
	    </tr>
	    <tr>
		    <td><asp:TextBox cssclass="litInputText" id="c_textBoxLargeIconPath" runat="server"/></td>
		    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorLargeIconPath" runat="server" ControlToValidate="c_textBoxLargeIconPath" OnServerValidate="ValidateLargeIconPath" cssClass="error"/></td>
	    </tr>
    </table><br />
    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString13" Name="MediumIconPath" runat="server" />:</td>
	    </tr>
	    <tr>
		    <td><asp:TextBox cssclass="litInputText" id="c_textBoxMediumIconPath" runat="server"/></td>
		    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="LitCustomValidator1" runat="server" ControlToValidate="c_textBoxMediumIconPath" OnServerValidate="ValidateMediumIconPath" cssClass="error"/></td>
	    </tr>
    </table><br />
    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString7" Name="SmallIconPath" runat="server" />:</td>
	    </tr>
	    <tr>
		    <td><asp:TextBox cssclass="litInputText" id="c_textBoxSmallIconPath" runat="server"/></td>
		    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorSmallIconPath" runat="server" ControlToValidate="c_textBoxSmallIconPath" OnServerValidate="ValidateSmallIconPath" cssClass="error"/></td>
	    </tr>
    </table><br />
    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString8" Name="StartPagePath" runat="server" />:</td>
	    </tr>
	    <tr>
		    <td><asp:TextBox cssclass="litInputText" id="c_textBoxStartPagePath" runat="server"/></td>
		    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorStartPagePath" runat="server" ControlToValidate="c_textBoxStartPagePath" OnServerValidate="ValidateStartPagePath" cssClass="error"/></td>
	    </tr>
    </table><br />
    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString9" Name="SettingsPagePath" runat="server" />:</td>
	    </tr>
	    <tr>
		    <td><asp:TextBox cssclass="litInputText" id="c_textBoxSettingsPagePath" runat="server"/></td>
		    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorSettingsPagePath" runat="server" ControlToValidate="c_textBoxSettingsPagePath" OnServerValidate="ValidateSettingsPagePath" cssClass="error"/></td>
	    </tr>
    </table><br />
    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		    <td colspan="2" class="litBoldText"><Foundation:SystemString Name="ErrorPagePath" runat="server" ID="Systemstring10"/>:</td>
	    </tr>
	    <tr>
		    <td><asp:TextBox cssclass="litInputText" id="c_textBoxErrorPagePath" runat="server"/></td>
		    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorErrorPagePath" runat="server" ControlToValidate="c_textBoxErrorPagePath" OnServerValidate="ValidateErrorPagePath" cssClass="error"/></td>
	    </tr>
    </table>
    
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_textBoxModuleName.ClientID.ToString()); %>");
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</div>
