<%@ Page Language="C#" AutoEventWireup="false" CodeFile="LoginPage1.aspx.cs" Inherits="Site.CMS.Templates.LoginPage1" %>

<asp:Content ContentPlaceHolderID="Content" runat="Server">

	<h1><asp:Literal ID="c_title" runat="server" /></h1>

	<div class="grid_5 suffix_4 alpha omega">

		<web:ValueExists ID="c_valueExistsIntroduction" Name="Introduction" runat="server">
			<OnTrue>
				<web:Text Name="Introduction" runat="server" />
			</OnTrue>
		</web:ValueExists>
	
		<asp:Panel ID="c_panelLogin" runat="server">

			<fieldset class="common login" runat="server">
				<label><web:Text Name="LoginUserNameLabel" runat="server" />
				<asp:TextBox ID="c_textBoxLoginName" runat="server" /></label>
				<label><web:Text Name="LoginPasswordLabel" runat="server" />
				<asp:TextBox ID="c_textBoxPassword" TextMode="Password" runat="server" /></label>
				<asp:PlaceHolder ID="c_placeHolderLoginError" runat="server">
					<p class="message error"><asp:Label ID="c_labelError" runat="server" /></p>
				</asp:PlaceHolder>
				<asp:Button ID="c_buttonLogin" OnClick="c_buttonLogin_Click" runat="server" />
				<asp:PlaceHolder ID="c_placeHolderForgottenPasswordLink" runat="server">
					<a ID="c_forgottenPasswordLink" class="password" OnPreRender="ForgottenPasswordLink_PreRender" runat="server" />
				</asp:PlaceHolder>
			</fieldset>

		</asp:Panel>

		<asp:PlaceHolder ID="c_placeHolderLoggedIn" runat="server">
		    <fieldset id="loggedin" class="common login">
			    <p ID="c_labelLoggedIn" runat="server" />
			    <web:LogOutButton runat="server" ReturnURL="~" TitleKey="LoginLogOutButton"><web:WebSiteString runat="server" Name="LoginLogOutButton" /></web:LogOutButton>
			</fieldset>
		</asp:PlaceHolder>

		<asp:PlaceHolder ID="c_placeHolderForgottenPassword" runat="server">

			<fieldset ID="c_fieldsetForgottenPassword" class="common" runat="server">
				<legend></legend>
				<label><web:Text Name="EmailLabel" runat="server" />
				<asp:TextBox ID="c_textBoxEmail" runat="server" /></label>
				<asp:PlaceHolder ID="c_placeHolderForgottenPasswordError" runat="server">
					<p class="message error"><asp:Literal ID="c_literalForgottenPasswordError" runat="server" /></p>
				</asp:PlaceHolder>
				<input ID="c_buttonSend" type="button" OnServerClick="c_buttonSend_Click" runat="server" />			
			</fieldset>

			<asp:PlaceHolder ID="c_placeHolderForgottenPasswordMessage" runat="server">
				<p class="message notice"><asp:Literal ID="c_literalForgottenPasswordMessage" runat="server" /></p>
			</asp:PlaceHolder>

		</asp:PlaceHolder>

		<asp:PlaceHolder ID="c_placeholderChangePassword" Visible="false" runat="server">

			<web:ValueExists Name="ChangePasswordInfo" runat="server">
				<OnTrue>
					<p class="intro"><web:Text Name="ChangePasswordInfo" runat="server" /></p>
				</OnTrue>
			</web:ValueExists>

			<fieldset class="common">

				<label><web:Text Name="NewPasswordLabel" runat="server" />
				<asp:TextBox ID="c_textBoxNewPassword" TextMode="Password" runat="server" /></label>

				<label><web:Text Name="RetypeNewPasswordLabel" runat="server" />
				<asp:TextBox ID="c_textBoxNewPassword2" TextMode="Password" runat="server" /></label>

				<asp:PlaceHolder ID="c_trErrorChangePassword" Visible="false" runat="server">
					<asp:Label ID="c_labelErrorChangePassword" runat="server" />
				</asp:PlaceHolder>

				<input ID="c_buttonNewPassword" type="button" OnServerClick="buttonChangePassword_Click" runat="server" />

			</fieldset>

		</asp:PlaceHolder>

	</div>

</asp:Content>