<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_WebUserControls_ImageEditVersionControl, Litum.Studio.Web" %>
<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>

<%@ Register TagPrefix="MediaArchive" Namespace="Litium.Studio.UI.MediaArchive.WebControls" Assembly="Litium.Studio.UI"%>

<div class="lsTabContent">
<asp:Panel ID="mc_panelList" runat="server">
        <table cellpadding="0" cellspacing="0" border="0" class="litModuleContentWithTreeMainTabSizeV2">
		    <tr>
			    <td valign="top" class="litInputArea">
			        <div class="litListAreaV2" style="width:630px;">
		                <asp:Table runat="server" ID="mc_tableEmpty" Visible="false" CellSpacing="0" style="width:630px; border:1px solid #CFCDCC;" CssClass="litListContent">
			                <asp:TableRow ID="TableRow1" Runat="server">
				                <asp:TableHeaderCell Width="300" CssClass="lsListHeader" style="text-align:left"><Foundation:ModuleString Name="Name" runat="server" ID="Modulestring10"/></asp:TableHeaderCell>
				                <asp:TableHeaderCell Width="80" CssClass="lsListHeader"><Foundation:ModuleString Name="Size" runat="server" ID="Modulestring11"/></asp:TableHeaderCell>
                                <asp:TableHeaderCell Width="100" CssClass="lsListHeader"></asp:TableHeaderCell>
				                <asp:TableHeaderCell Width="50" CssClass="lsListHeader"><Foundation:ModuleString Name="Show" runat="server" ID="Modulestring1"/></asp:TableHeaderCell>
				                <asp:TableHeaderCell Width="50" CssClass="lsListHeader"><Foundation:ModuleString Name="Edit" runat="server" ID="Modulestring2"/></asp:TableHeaderCell>
				                <asp:TableHeaderCell Width="50" CssClass="lsListHeader"><Foundation:ModuleString Name="Delete" runat="server" ID="Modulestring3"/></asp:TableHeaderCell>
			                </asp:TableRow>
			                <asp:TableRow ID="TableRow2" Runat="server">
				                <asp:TableCell ColSpan="5"><Foundation:ModuleString ID="ModuleString5" Name="MissingVersions" runat="server"/></asp:TableCell>
			                </asp:TableRow>
		                </asp:Table>
		                <asp:DataList ID="mc_dataListVersions" Runat="server" OnItemDataBound="mc_dataListVersions_ItemDataBound" style="width:630px;margin-top:2px;border:1px solid #CFCDCC;" CssClass="litListContent" ExtractTemplateRows="True" OnItemCommand="mc_dataListVersions_ItemCommand">
			                <HeaderTemplate>
				                <asp:Table ID="Table1" Runat="server" style="width:630px;margin-top:2px;border:1px solid #CFCDCC;">
					                <asp:TableRow ID="TableRow3" Runat="server">
						                <asp:TableHeaderCell style="text-align:left; width:300px;" CssClass="lsListHeader"><Foundation:ModuleString Name="Name" runat="server" ID="Modulestring6"/></asp:TableHeaderCell>
						                <asp:TableHeaderCell style="padding-right:5px;" CssClass="lsListHeader"><Foundation:ModuleString Name="Size" runat="server" ID="Modulestring7"/></asp:TableHeaderCell>
                                        <asp:TableHeaderCell style="padding-right:5px;" CssClass="lsListHeader">&nbsp;</asp:TableHeaderCell>
						                <asp:TableHeaderCell style="padding-right:5px;Width:50px;text-align:center;" CssClass="lsListHeader"><Foundation:ModuleString Name="Show" runat="server" ID="Modulestring8"/></asp:TableHeaderCell>
						                <asp:TableHeaderCell style="padding-right:5px;Width:50px;text-align:center;" CssClass="lsListHeader"><Foundation:ModuleString Name="Edit" runat="server" ID="Modulestring9"/></asp:TableHeaderCell>
						                <asp:TableHeaderCell style="padding-right:5px;Width:50px;text-align:center;" CssClass="lsListHeader"><Foundation:ModuleString Name="Delete" runat="server" ID="Modulestring12"/></asp:TableHeaderCell>
					                </asp:TableRow>
				                </asp:Table>
			                </HeaderTemplate>
			                <ItemTemplate>
				                <asp:Table Runat="server" style="width:630px;margin-top:2px;border:1px solid #CFCDCC;" ID="Table1">
					                <asp:TableRow Runat="server" ID="Tablerow1" NAME="Tablerow1">
						                <asp:TableCell><asp:Label Runat="server" ID="mc_labelVersionName" /></asp:TableCell>
						                <asp:TableCell style="text-align:left;"><MediaArchive:FileVersionFileSize runat="server" ShowKilobyte="true" ID="mc_imageFileSize" /> kB</asp:TableCell>
                                        <asp:TableCell style="text-align:left;"><MediaArchive:FileVersionDimensions runat="server" ID="mc_imageFileDim" /></asp:TableCell>
						                <asp:TableCell style="text-align:center;Width:50px"><asp:ImageButton ImageUrl="~/LitiumStudio/Images/transparent.gif" CommandName="Show" style="vertical-align:middle; border:none;" CssClass="litIconView" alt="0" Runat="server"/></asp:TableCell>
						                <asp:TableCell style="text-align:center;Width:50px"><asp:ImageButton CommandName="Edit" ImageUrl="~/LitiumStudio/Images/transparent.gif" Runat="server" ID="Imagebutton1" CausesValidation="False" CssClass="litIconPencil" BorderWidth="0" /></asp:TableCell>
						                <asp:TableCell style="text-align:center;Width:50px"><img type="image" src="~/LitiumStudio/Images/transparent.gif" Runat="server" ID="mc_buttonDelete" Class="litIconDelete2" style="cursor:pointer;" BorderWidth="0" /></asp:TableCell>
					                </asp:TableRow>
				                </asp:Table>
			                </ItemTemplate>
			                <EditItemTemplate>
				                <asp:Table Runat="server" style="width:630px;margin-top:2px;border:1px solid #CFCDCC;" ID="Table2">
					                <asp:TableRow Runat="server" ID="Tablerow2" NAME="Tablerow1">
						                <asp:TableCell style="padding-right:0px;"><asp:TextBox Runat="server" CssClass="litText" Size="23" ID="mc_textBoxVersionName" />&nbsp;<asp:ImageButton CommandName="Update" ImageUrl="~/LitiumStudio/Images/transparent.gif" Runat="server" ID="Imagebutton5" align="AbsMiddle" CssClass="litIconDiskBlue" BorderWidth="0" /><asp:ImageButton CommandName="Cancel" ImageUrl="~/LitiumStudio/Images/transparent.gif" Runat="server" ID="Imagebutton6" CausesValidation="False" align="AbsMiddle" CssClass="litIconStop" BorderWidth="0" /></asp:TableCell>
						                <asp:TableCell style="text-align:left;"><MediaArchive:FileVersionDimensions runat="server" ID="mc_imageFileDim" /> <MediaArchive:FileVersionFileSize runat="server" ShowKilobyte="true" ID="mc_imageFileSize" /> kB</asp:TableCell>						                <asp:TableCell style="text-align:center;"><MediaArchive:FileVersionFileSize runat="server" ShowKilobyte="true" ID="FileVersionFileSize1" /> kB</asp:TableCell>
                                        <asp:TableCell style="text-align:left;"><MediaArchive:FileVersionDimensions runat="server" ID="FileVersionDimensions1" /></asp:TableCell>
						                <asp:TableCell style="text-align:center;Width:50px"><asp:ImageButton ImageUrl="~/LitiumStudio/Images/transparent.gif" CommandName="Show" style="vertical-align:middle; border:none;" CssClass="litIconView" alt="0" Runat="server"/></asp:TableCell>
						                <asp:TableCell style="text-align:center;Width:50px"><asp:ImageButton CommandName="Edit" ImageUrl="~/LitiumStudio/Images/transparent.gif" Runat="server" ID="Imagebutton2" CausesValidation="False" CssClass="litIconPencil" BorderWidth="0"/></asp:TableCell>
						                <asp:TableCell style="text-align:center;Width:50px"><img type="image" src="~/LitiumStudio/Images/transparent.gif" Runat="server" ID="mc_buttonDelete" Class="litIconDelete2"  BorderWidth="0" style="cursor:pointer;" /></asp:TableCell>
					                </asp:TableRow>
				                </asp:Table>
			                </EditItemTemplate>
		                </asp:DataList>
		            </div><br />
	                <div class="litText" style="width:500px;" id="c_divNewVersions" runat="server"><Foundation:ModuleString Name="EditImageVersionsPageDescription1" runat="server" ID="Modulestring13"/> <a href="" runat="server" id="mc_linkCreateVersion" onserverclick="mc_linkCreateVersion_click"><Foundation:ModuleString Name="EditImageVersionsPageDescription2" runat="server" ID="Modulestring14"/></a> <Foundation:ModuleString Name="EditImageVersionsPageDescription3" runat="server" ID="Modulestring15"/><br /><br /></div>	                
	            </td>
	        </tr>
        </table>
</asp:Panel>
<asp:Panel ID="mc_panelShow" runat="server" Visible="false">
        <script type="text/javascript"> 
                toolbarItemAction("activate", "1_2");
        </script>

	    <table cellpadding="0" cellspacing="0" border="0" class="litModuleContentWithTreeMainTabSizeV2">
		    <tr>
			    <td valign="top" class="litInputArea">
		            <table border="0" cellspacing="0" cellpadding="10" width="100%" ID="Table1">
			            <tr>
				            <td align="center" class="litText"><MediaArchive:FileVersion runat="Server" id="mc_imageVersion" CssClass="litImageBorder" MaxHeight="540" MaxWidth="720" vspace="5"></MediaArchive:FileVersion><br /><b><MediaArchive:FileVersionFileName runat="server" id="mc_imageFileName" /></b> (<asp:Label Runat="server" ID="mc_labelImageVersionDimensions" /><MediaArchive:FileVersionFileSize runat="server" ShowKilobyte="true" ID="mc_imageFileSize" /> kB)&nbsp;<a href="#" id="mc_linkDownload" runat="server"><img src="Images/transparent.gif" style="vertical-align:middle; border:none;" class="litIconDownload" alt="<Foundation:ModuleString Name=DownloadImage runat=Server />" title="<Foundation:ModuleString Name=DownloadImage runat=Server />" /></a><asp:Panel visible="false" id="mc_panelImageResized" runat="server" style="padding-top:5px; color:black!important;"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconWarning" alt="" /><asp:Label runat="server" id="mc_labelImageResized" CssClass="litText" /></asp:Panel></td>
			            </tr>
		            </table>
	            </td>
	        </tr>
        </table>
</asp:Panel>
</div>
