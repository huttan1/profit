<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_WebUserControls_ImageEditGeneralAControl, Litum.Studio.Web" %>
<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>

<%@ Register TagPrefix="MediaArchive" Namespace="Litium.Studio.UI.MediaArchive.WebControls" Assembly="Litium.Studio.UI"%>
<div class="lsTabContent">
    <table cellpadding="0" cellspacing="0" border="0" class="litModuleContentWithTreeMainTabSizeV2">
	    <tr>
		    <td valign="top" class="litInputArea">
	            <table border="0" cellspacing="0" cellpadding="0" ID="Table1">
		            <tr>
			            <td align="center" valign="top" style="padding-right:10px; width:104px;" class="litText"><MediaArchive:File MaxHeight="94" MaxWidth="94" runat="Server" id="mc_imageImage" CssClass="litImageBorder" UseStaticThumbnail="true"></MediaArchive:File><br /><asp:Label ID="mc_labelFileName" Runat="server"></asp:Label><br /><asp:Label ID="mc_labelFileSize" Runat="server"></asp:Label> kB</td>
			            <td colspan="2" valign="top">
				            <table border="0" cellspacing="0" cellpadding="0" ID="Table2">
					            <tr>
						            <td colspan="2" class="litText"><b><Foundation:ModuleString Name="Name" runat="server" ID="Modulestring7"/>:</b></td>
					            </tr>
					            <tr>
						            <td valign="top"><asp:TextBox ID="mc_textBoxImageName" Runat="server" CssClass="litInputText200" /></td>
						            <td style="padding-left:10px;" class="litErrorMsg"><asp:RequiredFieldValidator Runat="server" ID="mc_validatorRequiredName" Display="Dynamic" ControlToValidate="mc_textBoxImageName"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString Name="RequiredField" runat="server" ID="Modulestring2"/></asp:RequiredFieldValidator><asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorImageName" ControlToValidate="mc_textBoxImageName" ValidationExpression="[^<>\']*" ><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString Name="MessageMaliciousInput" runat="server" ID="Modulestring6"/></asp:RegularExpressionValidator></td>
					            </tr>
					            <tr height="3">
                                    <td colspan="2" height="3">&nbsp;</td>								                
					            </tr>
					            <tr>
						            <td colspan="2" class="litText"><b><Foundation:ModuleString Name="NewImage" runat="server" ID="Modulestring4" />:</b></td>
					            </tr>
					            <tr>
						            <td valign="top"><asp:FileUpload runat="server" ID="mc_uploadNewFile" CssClass="litInputFile" Width="275" /></td>
						            <td style="padding-left:10px;" class="litErrorMsg">&nbsp;</td>
					            </tr>
				            </table><br />
			            </td>
		            </tr>
	            </table>
            </td>
        </tr>
    </table>
</div>
