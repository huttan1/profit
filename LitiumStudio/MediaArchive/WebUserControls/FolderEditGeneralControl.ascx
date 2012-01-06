<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_WebUserControls_FolderEditGeneralControl, Litum.Studio.Web" %>
<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>

<%@ Register TagPrefix="MediaArchive" Namespace="Litium.Studio.UI.MediaArchive.WebControls" Assembly="Litium.Studio.UI"%>
<div class="lsTabContent">
		        <table cellpadding="0" cellspacing="0" border="0" class="litModuleContentWithTreeMainTabSize">
			        <tr>
			            <td valign="top" class="litInputArea">
			                <span class="litText"><b><Foundation:ModuleString Name="Name" runat="server" ID="Modulestring1"/>:</b></span><br />
    			            <asp:TextBox CssClass="litInputText200" ID="mc_textBoxCategoryName" Runat="server"></asp:TextBox>
    			            <asp:RequiredFieldValidator ID="mc_validatorRequiredCategoryName" CssClass="litErrorMsg" ControlToValidate="mc_textBoxCategoryName" Runat="server" Display="Dynamic"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString Name="RequiredField" runat="server" ID="Systemstring2"/></asp:RequiredFieldValidator><asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorCategoryName" ControlToValidate="mc_textBoxCategoryName" ValidationExpression="[^<>\']*"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString Name="MessageMaliciousInput" runat="server" ID="Modulestring6"/></asp:RegularExpressionValidator><br /><br />    			            
			            </td>
			        </tr>
		        </table>
</div>