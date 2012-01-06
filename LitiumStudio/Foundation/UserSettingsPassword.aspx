<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_UserSettingsPassword, Litum.Studio.Web" %>

<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls"  Assembly="Litium.Studio.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="mc_toolbar" runat="server">		   
		    <toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../../LitiumStudio/Images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
	    <table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2" class="litBoldText"><Foundation:SystemString Name="OldPassword" runat="server" ID="Systemstring1"/>:</td>
			</tr>
			<tr>
				<td><asp:TextBox TextMode="Password" cssclass="litInputText" id="c_textBoxOldPassword" runat="server" autocomplete="off" /></td>
			</tr>
		</table><br />
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2" class="litBoldText"><Foundation:SystemString Name="NewPassword" runat="server" ID="Systemstring2"/>:</td>
			</tr>
			<tr>
				<td><asp:TextBox TextMode="Password" cssclass="litInputText" id="c_textBoxNewPassword" runat="server"/></td>
				<td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorNewPassword" runat="server" ControlToValidate="c_textBoxNewPassword" OnServerValidate="ValidateNewPassword" cssClass="error"/></td>
			</tr>
		</table><br />
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2" class="litBoldText"><Foundation:SystemString Name="ConfirmNewPassword" runat="server" ID="Systemstring9"/>:</td>
			</tr>
			<tr>
				<td><asp:TextBox TextMode="Password" cssclass="litInputText" id="c_textBoxConfirmNewPassword" runat="server"/></td>
				<td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorConfirmNewPassword" runat="server" ControlToValidate="c_textBoxConfirmNewPassword" OnServerValidate="ValidateConfirmNewPassword" cssClass="error"/></td>
			</tr>
		</table>
	</div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<%=c_textBoxNewPassword.ClientID%>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>
