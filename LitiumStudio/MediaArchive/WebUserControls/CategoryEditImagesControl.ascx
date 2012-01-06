<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_WebUserControls_CategoryEditImageControl, Litum.Studio.Web" %>
<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>

<%@ Register TagPrefix="MediaArchive" Namespace="Litium.Studio.UI.MediaArchive.WebControls" Assembly="Litium.Studio.UI"%>
<div class="lsTabContent">
        <table cellpadding="0" cellspacing="0" border="0" class="litModuleContentWithTreeMainTabSizeV2">
	        <tr>
	            <td valign="top" class="litInputArea">
	                <div class="litListArea" style="width:400px;">
	                    <table border="0" cellspacing="0" cellpadding="0" style="width:400px;margin-top:2px;border:1px solid #BFBCC0;" ID="Table1">
		                    <tr>
			                    <th style="width:30px;" class="lsListHeader">&nbsp;</th>
			                    <th style="width:94px;" align="left" class="lsListHeader"><Foundation:ModuleString Name="Image" runat="server" ID="Modulestring1"/></th>
			                    <th style="width:40%;" align="left" class="lsListHeader"><Foundation:ModuleString Name="Name" runat="server" ID="Modulestring2"/></th>
			                    <th style="width:60%;" align="left" class="lsListHeader"><Foundation:ModuleString Name="FileName" runat="server" ID="Modulestring3"/></th>
		                    </tr>
		                    <asp:Repeater Runat="server" ID="mc_repeaterImages" OnItemDataBound="mc_repeaterImages_ItemDataBound" >
			                    <ItemTemplate>
				                    <tr>
					                    <td class="litListContent" align="center"><asp:CheckBox Runat="server" ID="mc_checkboxMarkedImage" CssClass="litInputCheckbox"></asp:CheckBox></td>
					                    <td class="litListContent" align="center"><MediaArchive:File runat="server" id="mc_image" MaxWidth="94" MaxHeight="94" CssClass="litImageBorder" vspace="5" /></td>
					                    <td class="litListContent" style="color:Black!important;"><asp:Label Runat="server" ID="mc_labelImageName"></asp:Label>&nbsp;</td>
					                    <td class="litListContent" style="color:Black!important;"><MediaArchive:FileName runat="server" id="mc_imageFileName" /></td>
				                    </tr>
			                    </ItemTemplate>
		                    </asp:Repeater>
	                    </table>
	                </div>
	            </td>
	        </tr>
        </table>
</div>