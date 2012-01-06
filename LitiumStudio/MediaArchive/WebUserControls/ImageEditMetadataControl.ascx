<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_WebUserControls_ImageEditMetadataControl, Litum.Studio.Web" %>
<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>

<%@ Register TagPrefix="MediaArchive" Namespace="Litium.Studio.UI.MediaArchive.WebControls" Assembly="Litium.Studio.UI"%>
<div class="lsTabContent">
        <table cellpadding="0" cellspacing="0" border="0" class="litModuleContentWithTreeMainTabSizeV2">
		    <tr>
			    <td valign="top" class="litInputArea">
		            <asp:Panel runat="server" ID="c_panelCreate" Visible="false"><asp:LinkButton CssClass="litText" runat="server" ID="c_linkCreate" OnClick="c_linkCreate_Click"><Foundation:ModuleString ID="ModuleString1" Name="MetaDataCreatePageSubHeader1" runat="server" /></asp:LinkButton></asp:Panel>
		            <asp:Repeater Runat="server" ID="mc_repeaterMetadataValues" OnItemDataBound="mc_repeaterMetadataValues_ItemDataBound" OnItemCommand="mc_repeaterMetadataValues_ItemCommand">
			            <ItemTemplate>
				            <table border="0" cellspacing="0" cellpadding="0">
					            <tr>
						            <td colspan="3" class="litText"><b><asp:Label Runat="server" id="mc_labelKeyName" />:</b></td>
					            </tr>
					            <tr>
						            <td valign="top">
							            <asp:panel id="panelMetadataKeyName" runat="server" Visible="False"><asp:RequiredFieldValidator runat="server" id="validator1" ControlToValidate="mc_textBoxMetadataKeyName" Display="Dynamic" CssClass="litErrorMsg"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString Name="RequiredField" runat="server" ID="Modulestring2"/><br /></asp:RequiredFieldValidator><asp:CustomValidator ControlToValidate="mc_textBoxMetadataKeyName" runat="server" id="mc_validatorDuplicateKeys" Display="Dynamic" CssClass="litErrorMsg" onServerValidate="mc_validatorDuplicateKeys_ServerValidate"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString Name="ErrorDuplicateKey" runat="server" ID="Modulestring16"/><br /></asp:CustomValidator><asp:TextBox CssClass="litInputText200" id="mc_textBoxMetadataKeyName" runat="server" /><span class="litBoldText"><br /><Foundation:ModuleString ID="ModuleString1" Name="NewMetadataValue" runat="server" />:</span></asp:Panel><asp:TextBox CssClass="litInputText200" ID="mc_textBoxMetadataValue" Runat="server"></asp:TextBox>
						            </td>
						            <td style="width:16px;" valign="top">
							            <asp:panel id="panelMetadataKeyRemove" CssClass="litBlankAddDelete" runat="server"><asp:ImageButton id="mc_imageButtonMetadataKeyRemove" src="Images/transparent.gif" align="AbsMiddle" border="0" cssclass="litIconDelete" runat="server" CommandName="remove" CausesValidation="false" /></asp:Panel>
						            </td>
						            <td style="width:16px;" valign="top">
							            <asp:panel id="panelMetadataKeyAdd" CssClass="litBlankAddDelete" runat="server" Visible="False"><asp:ImageButton id="mc_imageButtonMetadataKeyAdd" src="Images/transparent.gif" align="AbsMiddle" border="0" cssclass="litIconAdd" runat="server" CommandName="add" /></asp:Panel>
						            </td>
					            </tr>
					            <tr>
						            <td colspan="3" style="padding-left:2px;" class="litErrorMsg"><asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorMetadataValue" ControlToValidate="mc_textBoxMetadataValue" ValidationExpression="[^<>\']*" ><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString Name="MessageMaliciousInput" runat="server" ID="Modulestring6"/></asp:RegularExpressionValidator></td>										
					            </tr>
				            </table><br />
			            </ItemTemplate>
		            </asp:Repeater>
	            </td>
	        </tr>
        </table>
</div>
