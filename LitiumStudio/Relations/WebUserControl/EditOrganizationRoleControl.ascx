<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_Relations_WebUserControl_EditOrganizationRoleControl, Litum.Studio.Web" %>
<div style="margin-top: 15px;" class="lsTabContent">
	<div class="litText" style="margin-bottom: 30px;"><Foundation:ModuleString ID="ModuleString4" Name="AssignRoleDescriptionForOrganization" runat="server" /></div>
	<table border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="litBoldText"><Foundation:ModuleString ID="ModuleString3" Name="AvailablePersons" runat="server" />:</td>
			<td class="litBoldText"><Foundation:ModuleString ID="ModuleString1" Name="AvailableRoles" runat="server" />:</td>
			<td>&nbsp;</td>
			<td class="litBoldText"><Foundation:ModuleString ID="ModuleString2" Name="RolesOfTheOrganization" runat="server" />:</td>
		</tr>
		<tr>
			<td style="padding-right:5px;"><asp:ListBox Runat="server" ID="c_listBoxExistingPersons" Rows="13" CssClass="litInputSelect"/></td>
			<td><asp:ListBox Runat="server" ID="c_listBoxExistingRoles" Rows="13" CssClass="litInputSelect340"/></td>
			<td><input id="c_buttonAdd" runat="server" type="button" class="litInputButton litInputButtonAdd" /><br /><br />
				<input id="c_buttonRemove" runat="server" type="button" class="litInputButton litInputButtonRemove" />
				<input id="c_hiddenSelectedItems" runat="server" type="hidden" />
				<input id="c_hiddenExistingItems" runat="server" type="hidden" />
			</td>
			<td><asp:ListBox Runat="server" ID="c_listBoxSelectedRoles" Rows="13" CssClass="litInputSelect340"/></td>
		</tr>
	</table>
</div>
<Telerik:RadCodeBlock runat="server">
    <script type="text/javascript">
        addEvent(window, "load", function () {
            SortField('<%=c_listBoxExistingPersons.ClientID%>');
            SortField('<%=c_listBoxExistingRoles.ClientID%>');
            SortField('<%=c_listBoxSelectedRoles.ClientID%>');
        });
    </script>
</Telerik:RadCodeBlock>