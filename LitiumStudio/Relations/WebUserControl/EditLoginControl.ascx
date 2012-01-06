<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_Relations_WebUserControl_EditLoginControl, Litum.Studio.Web" %>
<%@ Register TagName="PermissionControl" TagPrefix="Foundation" Src="~/LitiumStudio/Foundation/PermissionControl.ascx" %>
<asp:UpdatePanel runat="server" ID="LoginUpdatePanel" ChildrenAsTriggers="true" UpdateMode="Conditional">
	<ContentTemplate>
	<div class="lsTabContent">
		<div style="float: left; margin-right: 10px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString1020" Name="UserName" runat="server" />
			</div>
			<asp:TextBox runat="server" autocomplete="off" CssClass="litInputText200" ID="c_personUserName" /><br />
			<asp:CustomValidator SetFocusOnError="true" ControlToValidate="c_personUserName"
				OnServerValidate="ValidateUserName" ID="c_validatorUserName" Display="Dynamic"
				CssClass="litErrorMsg" runat="server" />
		</div>
		<div style="float: left; margin-right: 10px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString230" Name="Password" runat="server" />:</div>
			<asp:TextBox runat="server" autocomplete="off" CssClass="litInputText200" ID="c_personPassword"
				TextMode="Password" OnTextChanged="PersonPassword_Changed" /><br />
			<asp:CustomValidator SetFocusOnError="true" ControlToValidate="c_personPassword"
				OnServerValidate="ValidatePassword" ID="c_validatorPassword" Display="Dynamic"
				ValidateEmptyText="true" CssClass="litErrorMsg" runat="server" /><asp:CustomValidator
					runat="server" ID="c_validatorPasswordComplexity" ControlToValidate="c_personPassword"
					OnServerValidate="ValidatePasswordComplexity" />
		</div>
		<div style="float: left; margin-top: 29px;">
			<asp:Button runat="server" ID="c_buttonEditLogin" CssClass="litInputButton" OnClick="ButtonEditLogin_OnClick" />
		</div>
		<div style="clear: both;">
		</div>
		<table border="0" cellspacing="0" cellpadding="0" runat="server" id="tbl_lockedOut">
			<tr>
				<td style="width: 170px;" class="litBoldText">
					<Foundation:ModuleString Name="AccountLockedOut" runat="server" ID="Systemstring11" />:<br />
				</td>
				<td style="width: 50px;" class="litText">
					<asp:RadioButton CssClass="litInputRadio" GroupName="LockedOut" ID="c_LockedOutYes"
						runat="server" /><Foundation:SystemString Name="Yes" runat="server" ID="Systemstring13" />
				</td>
				<td style="width: 100px;" class="litText">
					<asp:RadioButton CssClass="litInputRadio" GroupName="LockedOut" ID="c_LockedOutNo"
						runat="server" /><Foundation:SystemString Name="No" runat="server" ID="Systemstring14" />
				</td>
			</tr>
		</table>
		<asp:Panel runat="server" ID="c_changePasswordPanel">
			<br />
			<div class="litText">
				<asp:CheckBox runat="server" ID="c_NeedToChangePassword" /></div>
			<br />
		</asp:Panel>
		<div style="clear: both;">
		</div>
	</div>
	</ContentTemplate>
</asp:UpdatePanel>
<Foundation:PermissionControl runat="server" ID="c_permissionControl" />