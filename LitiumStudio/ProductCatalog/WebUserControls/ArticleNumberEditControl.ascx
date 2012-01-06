<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_WebUserControls_ArticleNumberEditControl, Litum.Studio.Web" %>
<table cellpadding="0" cellspacing="0" border="0" style="">
	<tr>
		<td style="width: 16px; border-bottom: none; padding: 0;" valign="top" runat="server">
			<asp:Image runat="server" ImageUrl="../images/transparent.gif" Style="vertical-align: middle;"
				class="litIconRequired" alt="" />
		</td>
		<td valign="top" style="border-bottom: none; padding: 0;">
			<div>
				<asp:TextBox runat="server" ID="textbox" CssClass="litInputText770" Width="150" />
				<asp:Label runat="server" ID="label" Visible="false" />
			</div>
			<asp:RequiredFieldValidator Display="dynamic" ControlToValidate="textbox" SetFocusOnError="true"
				runat="server" CssClass="litErrorMsg" ID="requiredvalidator">
				<img src='images/transparent.gif' style='vertical-align: middle;' class='litIconError'
					alt='' /><Foundation:SystemString ID="SystemString1" Name="RequiredField" runat="server" />
			</asp:RequiredFieldValidator>
			<asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="textbox"
				OnServerValidate="OnControlValidate" ValidateEmptyText="true">
				<img src='images/transparent.gif' style='vertical-align: middle;' class='litIconError'
					alt='' /><Foundation:ModuleString ID="ModuleString5" Name="ValidatorNotUniqeValue"
						runat="server" />
			</asp:CustomValidator>
		</td>
	</tr>
</table>
