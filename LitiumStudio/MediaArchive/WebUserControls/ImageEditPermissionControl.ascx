<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_WebUserControls_ImageEditPermissionControl, Litum.Studio.Web" %>
<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>

<%@ Register TagPrefix="MediaArchive" Namespace="Litium.Studio.UI.MediaArchive.WebControls" Assembly="Litium.Studio.UI"%>
<div class="lsTabContent">
    <table cellpadding="0" cellspacing="0" border="0" class="litModuleContentWithTreeMainTabSizeV2">
	    <tr>
		    <td valign="top" class="litInputArea">
	            <table cellpadding="0" cellspacing="0" border="0" width="100%" ID="Table2">
		            <tr>
			            <td valign="top">
				            <asp:ListBox Runat="server" ID="mc_listBoxGroup" Rows="7" AutoPostBack="True" OnSelectedIndexChanged="SelectGroup_Changed" CssClass="litInputSelect"/>
			            </td>
			            <td valign="top" style="padding-left:10px; width:100%;" class="litText">
				            <asp:Repeater id="mc_repeaterGroupPermission" runat="server">
					            <ItemTemplate>
						            <asp:CheckBox Cssclass="litInputCheckbox" runat="server" ID="Checkbox1"/><br />
					            </ItemTemplate>
				            </asp:Repeater> 
			            </td>
		            </tr>
	            </table>
            </td>
        </tr>
    </table>
</div>