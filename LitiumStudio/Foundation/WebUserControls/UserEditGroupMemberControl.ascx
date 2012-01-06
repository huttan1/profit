<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_Foundation_WebUserControl_UserEditGroupsControl, Litum.Studio.Web" %>
<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>
<div class="lsTabContent">
<table border="0" cellspacing="0" cellpadding="0">
    <tr>
	    <td class="litBoldText"><Foundation:SystemString Name="SystemGroups" runat="server" ID="Systemstring3"/>:</td>
	    <td>&nbsp;</td>
	    <td class="litBoldText"><Foundation:SystemString Name="GroupsOfTheUser" runat="server" ID="Systemstring4"/>:</td>
    </tr>
    <tr>
	    <td style="padding: 10px; padding-left:0px;" valign="top"><asp:ListBox Runat="server" ID="c_listBoxExistingItems" Rows="13" SelectionMode="Multiple" CssClass="litInputSelect340"/></td>
	    <td><input id="c_buttonAdd" runat="server" type="button" class="litInputButton litInputButtonAdd" name="c_buttonAdd" /><br /><br />
		    <input id="c_buttonRemove" runat="server" type="button" class="litInputButton litInputButtonRemove" name="c_buttonRemove" />
		    <input id="c_hiddenSelectedItems" runat="server" type="hidden" name="m_hiddenSelectedItems" />
	    </td>
	    <td valign="top" style="padding: 10px; padding-left:0px;"><asp:ListBox Runat="server" ID="c_listBoxSelectedItems" Rows="13" SelectionMode="Multiple" CssClass="litInputSelect340"/></td>
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
