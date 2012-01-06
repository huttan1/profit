<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_WebUserControls_CategoryEditPermissionControl, Litum.Studio.Web" %>
<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>

<%@ Register TagPrefix="MediaArchive" Namespace="Litium.Studio.UI.MediaArchive.WebControls" Assembly="Litium.Studio.UI"%>
<div class="lsTabContent">
		        <table cellpadding="0" cellspacing="0" border="0" class="litModuleContentWithTreeMainTabSizeV2">
				    <tr>
					    <td valign="top" class="litInputArea">
				            <table cellpadding="0" cellspacing="0" border="0">
					            <tr>
						            <td valign="top">
							            <asp:ListBox Runat="server" ID="c_listBoxGroup" Rows="7" AutoPostBack="True" OnSelectedIndexChanged="SelectGroup_Changed" CssClass="litInputSelect"/>
						            </td>
						            <td valign="top" style="padding-left:10px;width:200px;" class="litText">
							            <asp:Repeater id="c_repeaterGroupPermission" runat="server">
								            <ItemTemplate>
									            <asp:CheckBox CssClass="litInputCheckbox" runat="server" ID="Checkbox1"/><br />
								            </ItemTemplate>
							            </asp:Repeater>
							        </td>
							    </tr>
							    <tr>
							        <td colspan="2" class="litText"><hr /><input id="m_checkboxRecursive" Cssclass="litInputCheckbox" type="checkbox" NAME="permission3" runat="server"/><asp:Label id="Label1" runat="server" AssociatedControlID="m_checkboxRecursive"><Foundation:ModuleString Name="PermissionRecursive" runat="server" ID="Modulestring3"/></asp:Label></td>
					            </tr>
					            <tr>
							        <td colspan="2" class="litText"><input id="m_checkboxPermissionIncludeFiles" Cssclass="litInputCheckbox" type="checkbox" NAME="permission4" runat="server"/><asp:Label id="Label2" runat="server" AssociatedControlID="m_checkboxPermissionIncludeFiles"><Foundation:ModuleString Name="PermissionIncludeFiles" runat="server" ID="Modulestring1"/></asp:Label></td>
					            </tr>
				            </table>
			            </td>
			        </tr>
		        </table>
</div>