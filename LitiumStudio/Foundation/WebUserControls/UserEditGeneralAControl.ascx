<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_Foundation_WebUserControl_UserEditGeneralAControl, Litum.Studio.Web" %>
<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>
<div class="lsTabContent">
    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		    <td style="width:70px;" class="litBoldText"><Foundation:SystemString Name="Active" runat="server" ID="Systemstring2"/>:</td>
		    <td style="width:50px;" class="litText"><asp:RadioButton CssClass="litInputRadio" GroupName="UserStatus" id="c_radioButtonEnabled" runat="server"/><Foundation:SystemString Name="Yes" runat="server" ID="Systemstring6"/></td>
		    <td style="width:100px;" class="litText"><asp:RadioButton CssClass="litInputRadio" GroupName="UserStatus" id="c_radioButtonDisabled" runat="server"/><Foundation:SystemString Name="No" runat="server" ID="Systemstring7"/></td>
	    </tr>
    </table><br />
    
    <asp:Panel runat="server" ID="c_lockedOutPanel">
    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		    <td style="width:70px;" class="litBoldText"><Foundation:SystemString Name="LockedOut" runat="server" ID="Systemstring11" />:</td>
		    <td style="width:50px;" class="litText"><asp:RadioButton CssClass="litInputRadio" GroupName="LockedOut" id="c_LockedOutYes" runat="server"/><Foundation:SystemString Name="Yes" runat="server" ID="Systemstring13"/></td>
		    <td style="width:100px;" class="litText"><asp:RadioButton CssClass="litInputRadio" GroupName="LockedOut" id="c_LockedOutNo" runat="server"/><Foundation:SystemString Name="No" runat="server" ID="Systemstring14"/></td>
	    </tr>
    </table>
    <br />
    </asp:Panel>

    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		    <td colspan="2" class="litBoldText"><Foundation:SystemString Name="UserName" runat="server" ID="Systemstring3"/><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</td>
	    </tr>
	    <tr>
		    <td><asp:TextBox cssclass="litInputText200" id="c_textBoxUserName" runat="server"/></td>
		    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorUserName" runat="server" ControlToValidate="c_textBoxUserName" OnServerValidate="ValidateUserName" cssClass="error"/></td>
	    </tr>
    </table><br />
    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		    <td colspan="2" class="litBoldText"><Foundation:SystemString Name="Name" runat="server" ID="Systemstring4"/>:</td>
	    </tr>
	    <tr>
		    <td><asp:TextBox cssclass="litInputText200" id="c_textBoxUserDisplayName" runat="server"/></td>
		    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorUserDisplayName" runat="server" ControlToValidate="c_textBoxUserDisplayName" OnServerValidate="ValidateUserDisplayName" cssClass="error"/></td>
	    </tr>
    </table><br />
    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		    <td colspan="2" class="litBoldText"><Foundation:SystemString Name="Password" runat="server" ID="Systemstring8"/>:</td>
	    </tr>
	    <tr>
		    <td><asp:TextBox TextMode="Password" cssclass="litInputText200" id="c_textBoxPasswordUser" runat="server"/></td>
		    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorPassword" runat="server" ControlToValidate="c_textBoxPasswordUser" OnServerValidate="ValidatePassword" CssClass="error" Display="Dynamic" /><asp:CustomValidator runat="server" ID="c_validatorPasswordComplexity" ControlToValidate="c_textBoxPasswordUser" OnServerValidate="ValidatePasswordComplexity"/></td>
	    </tr>
    </table><br />
    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		    <td colspan="2" class="litBoldText"><Foundation:SystemString Name="ConfirmPassword" runat="server" ID="Systemstring9"/>:</td>
	    </tr>
	    <tr>
		    <td><asp:TextBox TextMode="Password" cssclass="litInputText200" id="c_textBoxConfirmPassword" runat="server"/></td>
		    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorConfirmPassword" runat="server" ControlToValidate="c_textBoxConfirmPassword" OnServerValidate="ValidateConfirmPassword" cssClass="error"/></td>
	    </tr>
	    <tr id="tr_needToChangePassword" runat="server">
	        <td colspan="2"><br /><div class="litBoldText"><asp:CheckBox runat="server" ID="c_NeedToChangePassword" /><Foundation:SystemString Name="NeedToChangePassword" runat="server" ID="Systemstring15"/></div><div class="litText"><Foundation:SystemString Name="NeedToChangePasswordInfo" runat="server" ID="Systemstring16"/></div></td>
	    </tr>
    </table><br />
    
    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		    <td colspan="2" class="litBoldText"><Foundation:SystemString Name="Email" runat="server" ID="Systemstring10"/>:</td>
	    </tr>
	    <tr>
		    <td><asp:TextBox cssclass="litInputText200" id="c_textBoxEmail" runat="server"/></td>
		    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorEmail" runat="server" ControlToValidate="c_textBoxEmail" OnServerValidate="ValidateEmail" cssClass="error"/></td>
	    </tr>
    </table>
</div>