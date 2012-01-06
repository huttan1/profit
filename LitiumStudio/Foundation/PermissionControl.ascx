<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_Foundation_PermissionControl, Litum.Studio.Web" %>
<asp:UpdatePanel runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
	<ContentTemplate>
		<div style="width: 500px;">
			<Foundation:InformationGroup runat="server" HeaderTextName="Overall">
				<asp:Repeater ID="c_repeaterSolutionPermission" runat="server">
					<ItemTemplate>
						<asp:CheckBox ID="CheckBox1" CssClass="litInputCheckbox litBoldText" runat="server" /><br />
						<asp:Panel ID="Panel1" runat="server" CssClass="litText" Style="margin-bottom: 5px;" />
					</ItemTemplate>
				</asp:Repeater>
			</Foundation:InformationGroup>
			<br />
			<Foundation:InformationGroup runat="server" HeaderTextName="Modules">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td valign="top">
							<asp:ListBox runat="server" ID="c_listBoxModule" Rows="12" AutoPostBack="True" OnSelectedIndexChanged="SelectModule_Changed"
								CssClass="litInputSelect" />
						</td>
						<td valign="top" style="padding-left: 10px;">
							<asp:Repeater ID="c_repeaterModulePermission" runat="server">
								<ItemTemplate>
									<asp:CheckBox ID="CheckBox2" CssClass="litInputCheckbox litBoldText" runat="server" /><br>
									<asp:Panel ID="Panel1" runat="server" CssClass="litText" Style="margin-bottom: 5px;" />
								</ItemTemplate>
							</asp:Repeater>
						</td>
					</tr>
				</table>
			</Foundation:InformationGroup>
		</div>
	</ContentTemplate>
</asp:UpdatePanel>
