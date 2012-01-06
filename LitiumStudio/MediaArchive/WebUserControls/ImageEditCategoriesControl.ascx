<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_WebUserControls_ImageEditCategoryControl, Litum.Studio.Web" %>
<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>

<%@ Register TagPrefix="MediaArchive" Namespace="Litium.Studio.UI.MediaArchive.WebControls" Assembly="Litium.Studio.UI"%>
<div class="lsTabContent">
		        <table cellpadding="0" cellspacing="0" border="0" class="litModuleContentWithTreeMainTabSizeV2">
				    <tr>
					    <td valign="top" class="litInputArea">
        				    <span class="litBoldText"><Foundation:ModuleString ID="ModuleString1" Name="ImageToCategories" runat="server"/></span><br /><br />
				            <asp:Repeater id="mc_repeaterCategoriesList" runat="server" OnItemDataBound="mc_repeaterCategoriesList_ItemDataBound">
					            <ItemTemplate>
						            <asp:CheckBox Cssclass="litInputCheckbox litText" runat="server" ID="categoryCheckbox"/><br />
					            </ItemTemplate>
				            </asp:Repeater>
			            </td>
			        </tr>
		        </table>
</div>