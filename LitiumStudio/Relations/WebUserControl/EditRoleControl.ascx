<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_Relations_WebUserControl_EditRoleControl, Litum.Studio.Web" %>
<div style="margin-top: 15px;" class="lsTabContent">
	<table border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="litBoldHeader"><Foundation:ModuleString ID="ModuleString3" Name="AvailableOrganizations" runat="server" />:</td>
			<td class="litBoldHeader"><Foundation:ModuleString ID="ModuleString1" Name="AvailableRoles" runat="server" />:</td>
			<td>&nbsp;</td>
			<td class="litBoldHeader"><Foundation:ModuleString ID="ModuleString2" Name="RolesOfThePerson" runat="server" />:</td>
		</tr>
		<tr>
			<td style="padding-right:5px;"><asp:ListBox Runat="server" ID="c_listBoxExistingOrgs" Rows="13" CssClass="litInputSelect340"/></td>
			<td><asp:ListBox Runat="server" ID="c_listBoxExistingRoles" Rows="13" CssClass="litInputSelect"/></td>
			<td><input id="c_buttonAdd" runat="server" type="button" class="litInputButton litInputButtonAdd" /><br /><br />
				<input id="c_buttonRemove" runat="server" type="button" class="litInputButton litInputButtonRemove" />
				<input id="c_hiddenSelectedItems" runat="server" type="hidden" />
				<input id="c_hiddenExistingItems" runat="server" type="hidden" />
			</td>
			<td><asp:ListBox Runat="server" ID="c_listBoxSelectedRoles" Rows="13" CssClass="litInputSelect"/></td>
		</tr>
	</table>
	<div class="litText"><Foundation:ModuleString ID="ModuleString4" Name="AssignRoleDescription" runat="server" /></div>
</div>
<Telerik:RadCodeBlock runat="server">
    <script type="text/javascript">
        addEvent(window, "load", function () {
            SortField('<%=c_listBoxExistingOrgs.ClientID%>');
            SortField('<%=c_listBoxExistingRoles.ClientID%>');
            SortField('<%=c_listBoxSelectedRoles.ClientID%>');
        });
    </script>
</Telerik:RadCodeBlock>