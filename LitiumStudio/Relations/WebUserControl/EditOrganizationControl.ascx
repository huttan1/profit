<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_Relations_WebUserControl_EditOrganizationControl, Litum.Studio.Web" %>
<div style="margin-top: 15px;" class="lsTabContent">
	<table border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="litBoldHeader"><Foundation:ModuleString ID="ModuleString1" Name="AvailableOrganizations" runat="server" />:</td>
			<td>&nbsp;</td>
			<td class="litBoldHeader"><Foundation:ModuleString ID="ModuleString2" Name="OrganizationsOfThePerson" runat="server" />:</td>
		</tr>
		<tr>
			<td><asp:ListBox Runat="server" ID="c_listBoxExistingItems" Rows="13" SelectionMode="Multiple" CssClass="litInputSelect340"/></td>
			<td><input id="c_buttonAdd" runat="server" type="button" class="litInputButton litInputButtonAdd" /><br /><br />
				<input id="c_buttonRemove" runat="server" type="button" class="litInputButton litInputButtonRemove" />
				<input id="c_hiddenSelectedItems" runat="server" type="hidden" />
			</td>
			<td><asp:ListBox Runat="server" ID="c_listBoxSelectedItems" Rows="13" SelectionMode="Multiple" CssClass="litInputSelect340"/></td>
		</tr>
		<tr>
			<td><asp:Label runat="server" CssClass="litText" ID="c_existsingNotify" /></td>
			<td>&nbsp;</td>
			<td><asp:Label runat="server" CssClass="litText" ID="c_selectedNotify" /></td>
		</tr>
	</table>
</div>
<Telerik:RadCodeBlock runat="server">
    <script type="text/javascript">
        addEvent(window, "load", function () {
            SortField('<%=c_listBoxExistingItems.ClientID%>');
            SortField('<%=c_listBoxSelectedItems.ClientID%>');
        });
    </script>
</Telerik:RadCodeBlock>