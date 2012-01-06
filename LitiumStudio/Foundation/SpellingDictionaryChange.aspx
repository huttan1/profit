<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_CMS_SpellingDictionaryChange, Litum.Studio.Web" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="c_toolbar" runat="server">
		<Toolbar:ToolbarItem OnClick="ToolbarItemAbort_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="../Images/transparent.gif" ID="c_toolbarItemAbort" runat="server" />
		<Toolbar:DividerItem ImageURL="../Images/transparent.gif" Class="litToolbarDivider"
			runat="server" ID="Divideritem1" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../Images/transparent.gif"
			ID="c_toolbarItemSave" CausesValidation="true" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<Foundation:SystemString ID="ModuleString5" runat="server" Name="SpellingDictionary" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
		<span class="litText">
			<Foundation:SystemString Name="SpellingDictionaryChangeInfo" runat="server" ID="Systemstring1" />
		</span>
		<br />
		<br />
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2" class="litBoldText">
					<Foundation:SystemString Name="SpellingDictionaryLanguage" runat="server" ID="Systemstring3" />
					:
				</td>
			</tr>
			<tr>
				<td>
					<asp:DropDownList runat="server" ID="c_language" CssClass="litInputSelect" />
				</td>
				<td style="padding-left: 10px;">
				</td>
			</tr>
		</table>
		<br />
		<asp:UpdatePanel ID="c_versionUpdatePanel" runat="server" UpdateMode="Conditional"
			ChildrenAsTriggers="false">
			<ContentTemplate>
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" class="litBoldText">
							<Foundation:SystemString runat="server" ID="SpellingDictionaryVersion" Name="SpellingDictionaryVersion" />
							:
						</td>
					</tr>
					<tr>
						<td class="litText">
							<asp:RadioButtonList runat="server" ID="c_version" AutoPostBack="true" RepeatDirection="Horizontal"
								OnSelectedIndexChanged="Version_Changed" RepeatLayout="Flow">
								<asp:ListItem Value="v2" Text="2" style="margin-right: 7px;" />
								<asp:ListItem Value="v3" Text="3" Selected="True" />
							</asp:RadioButtonList>
						</td>
						<td style="padding-left: 10px;">
						</td>
					</tr>
				</table>
				<br />
				<asp:PlaceHolder runat="server" ID="oov3">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="2" class="litBoldText">
								<Foundation:SystemString Name="SpellingDictionaryWordlistV3" runat="server" ID="ModuleString4" />
								:
							</td>
						</tr>
						<tr>
							<td>
								<asp:FileUpload runat="server" ID="c_wordlistV3" CssClass="litInputFile" />
							</td>
							<td style="padding-left: 10px;">
								<asp:RequiredFieldValidator ID="c_valWordlistV3" ControlToValidate="c_wordlistV3"
									runat="server" />
							</td>
						</tr>
					</table>
				</asp:PlaceHolder>
				<asp:PlaceHolder runat="server" ID="oov2" Visible="false">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="2" class="litBoldText">
								<Foundation:SystemString Name="SpellingDictionaryWordlist" runat="server" ID="ModuleString1" />
								:
							</td>
						</tr>
						<tr>
							<td>
								<asp:FileUpload runat="server" ID="c_wordlist" CssClass="litInputFile" />
							</td>
							<td style="padding-left: 10px;">
								<asp:RequiredFieldValidator ID="c_valWordlist" ControlToValidate="c_wordlist" runat="server" />
							</td>
						</tr>
					</table>
					<br />
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="2" class="litBoldText">
								<Foundation:SystemString Name="SpellingDictionaryAffix" runat="server" ID="ModuleString2" />
								:
							</td>
						</tr>
						<tr>
							<td>
								<asp:FileUpload runat="server" ID="c_affix" CssClass="litInputFile" />
							</td>
							<td style="padding-left: 10px;">
								<asp:RequiredFieldValidator ID="c_valAffix" ControlToValidate="c_affix" runat="server" />
							</td>
						</tr>
					</table>
					<asp:PlaceHolder runat="server" Visible="false">
						<br />
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td colspan="2" class="litBoldText">
									<Foundation:SystemString Name="SpellingDictionaryPhonetic" runat="server" ID="ModuleString3" />
									:
								</td>
							</tr>
							<tr>
								<td>
									<asp:FileUpload runat="server" ID="c_phonetic" CssClass="litInputFile" />
								</td>
								<td style="padding-left: 10px;">
								</td>
							</tr>
						</table>
						<br />
					</asp:PlaceHolder>
				</asp:PlaceHolder>
			</ContentTemplate>
		</asp:UpdatePanel>
	</div>
</asp:Content>
