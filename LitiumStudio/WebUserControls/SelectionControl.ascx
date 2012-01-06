<%@ control language="C#" autoeventwireup="true" inherits="Modules_Common_WebUserControls_SelectionControl, Litum.Studio.Web" %>
<table border="0" cellspacing="0" >
    <tr>
	    <td style="padding: 10px; padding-left:0px;" valign="top">
	        <span class="litBoldText"><Foundation:ModuleString ID="ModuleString1" Name="AvailableFields" runat="server" />:<br /></span>
	        <asp:ListBox Runat="server" ID="mc_listBoxExistingItems" style="width:230px;" Rows="20" SelectionMode="Multiple" CssClass="litInputSelect"/>
	    </td>
	    <td>
	        <input id="mc_buttonAdd" runat="server" type="button" class="litInputButton litInputButtonAdd" /><br /><br />
		    <input id="mc_buttonRemove" runat="server" type="button" class="litInputButton litInputButtonRemove" />
		    <input id="mc_hiddenSelectedItems" runat="server" type="hidden" />
	    </td>
	    <td valign="top" style="padding: 10px; padding-left:0px;">
	        <span class="litBoldText"><Foundation:ModuleString ID="ModuleString2" Name="FieldsInTheList" runat="server" />:<br /></span>
	        <asp:ListBox Runat="server" ID="mc_listBoxSelectedItems" style="width:230px;" Rows="20" SelectionMode="Multiple" CssClass="litInputSelect" />
	    </td>
	    <td>
	        <input id="mc_buttonUp" runat="Server" type="button" class="litInputButton" style="width:30px;" /><br /><br />
	        <input id="mc_buttonDown" runat="Server" type="button" class="litInputButton" style="width:30px;" />
	    </td>
    </tr>
</table><br />
<Telerik:RadCodeBlock runat="server">
    <script type="text/javascript">
        addEvent(window, "load", function () {
            SortField('<%=mc_listBoxExistingItems.ClientID%>');
        });
    </script>
</Telerik:RadCodeBlock>