<%@ page language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_ShowImage, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/MediaArchive/Framework/Base.master" %>


<%@ Register TagPrefix="MediaArchive" Namespace="Litium.Studio.UI.MediaArchive.WebControls" Assembly="Litium.Studio.UI"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
<script type="text/javascript">

        function VersionsMenu_onItemSelect(sender, eventArgs)
        {
            var selectedItem = eventArgs.get_item();
            var selectedItemId = selectedItem.getProperty('ID');
            if(selectedItemId == "c_menuItemCreateNewVersion")
            {
                __doPostBack('new', '');
            }
            else if(selectedItemId == "c_menuItemCreatePredefinedVersions")
            {
                __doPostBack('predefined', '');
            }
            else if (selectedItemId == "c_menuItemRemoveResizeVersions") 
            {
                __doPostBack('removeresize', '');
            }
        }

</script>

     <ComponentArt:ToolBar ID="c_toolbarShowImage" 
        OnItemCommand="c_toolbarShowImage_ItemCommand" runat="server" 
        CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew" 
        DefaultItemHoverCssClass="litToolbarItemOnMouseOver" 
        DefaultItemActiveCssClass="litToolbarItemOnMouseDown" 
        DefaultItemDisabledCssClass="litToolbarItemDisabled" 
        ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false" 
        Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
        <Items runat="server">
            <ComponentArt:ToolBarItem ID="c_toolbarItemVersions" runat="server"
                AutoPostBackOnSelect = "false" ImageUrl="icons_standard/add.png" ItemType="DropDown"
                DropDownId="c_menuVersions" DropDownImageUrl="toolbar/dropdown.gif" DropDownImageWidth="16"
                DropDownImageHeight="16" ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate"/>          
            <ComponentArt:ToolBarItem ID="c_toolbarItemBack" runat="server" AutoPostBackOnSelect = "true"
                ImageUrl="icons_standard/arrow_left_blue_16px.png"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <%--<ComponentArt:ToolBarItem ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif" ImageHeight="16" ImageWidth="2" />--%>
        </Items>
        <ClientTemplates>
		    <ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemButtonTemplate">
		        <table cellspacing="0" cellpadding="0" border="0" style="margin: 0px; margin-right: auto;">
		            <tbody>
		                <tr>
		                    <td class="ToolbarItemLeft">
		                        &nbsp;
		                    </td>
		                    <td class="ca_tb_img ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##" alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
		                    </td>
		                    <td class="ca_tb_txt ToolbarItemMain">
		                        <nobr>## DataItem.get_text() ##</nobr>
		                    </td>
		                    <td class="ToolbarItemRight">
		                        &nbsp;
		                    </td>
		                </tr>
		            </tbody>
		         </table>			       
		    </ComponentArt:ClientTemplate>
		    <ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemButtonDropDownTemplate">
		        <table cellspacing="0" cellpadding="0" border="0" style="margin: 0px; margin-right: auto;">
		            <tbody>
		                <tr>
		                    <td class="ToolbarItemLeft">
		                        &nbsp;
		                    </td>
		                    <td class="ca_tb_img ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##" alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
		                    </td>
		                    <td class="ca_tb_txt ToolbarItemMain">
		                        <nobr>## DataItem.get_text() ##</nobr>
		                    </td>
		                    <td rowspan="1" class="ca_tb_ddn ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_dropDownImageUrl() ##" alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
		                    </td>
		                    <td class="ToolbarItemRight">
		                        &nbsp;
		                    </td>
		                 </tr>
		             </tbody>
		         </table>
		    </ComponentArt:ClientTemplate>
		</ClientTemplates>
    </ComponentArt:ToolBar>
    <ComponentArt:Menu runat="server" ID="c_menuVersions" ImagesBaseUrl="~/LitiumStudio/Images/" CssClass="litNavMenuGroup" DefaultItemLookID="DefaultItemLook" DefaultGroupItemSpacing="1" DefaultItemTextAlign="Left" DefaultItemTextWrap="false" DefaultGroupExpandOffsetX="0" DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto" TopGroupExpandDirection="BelowLeft" TopGroupExpandOffsetY="0" CollapseDuration="100" CollapseSlide="ExponentialDecelerate" ExpandDuration="100" ExpandSlide="ExponentialDecelerate" ExpandDelay="0" ExpandOnClick="false" CascadeCollapse="true" CollapseDelay="10000" HideSelectElements="false" HighlightExpandedPath="true" KeyboardEnabled="true" OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true" ShadowOffset="2" Orientation="Vertical" ContextMenu="Custom">
        <ClientEvents>
          <ItemSelect EventHandler="VersionsMenu_onItemSelect" />
        </ClientEvents>
        <ItemLooks>
            <ComponentArt:ItemLook LookID="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
            <ComponentArt:ItemLook LookID="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
        </ItemLooks>
        <Items runat="server">
          <ComponentArt:MenuItem ID = "c_menuItemCreateNewVersion" runat="server" Text="Create New Version" />
          <ComponentArt:MenuItem ID = "c_menuItemCreatePredefinedVersions" runat="server" Text="Create Predefined Versions" />
          <ComponentArt:MenuItem ID = "c_menuItemRemoveResizeVersions" runat="server" Text="Remove Resize Versions" />
        </Items>
    </ComponentArt:Menu>



    <%--<toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbarRight" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemAddNewVersion_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconAdd2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemAddNewVersion" runat="server"/>
	    <toolbar:DividerItem ID="DividerItem1" ImageURL="Images/transparent.gif" Class="litToolbarDivider" runat="server" />
	    <toolbar:ToolbarItem OnClick="ToolbarItemEdit_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemEdit" runat="server"/>
	    <toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
	    <toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemDelete" runat="server"/>
	    <toolbar:DividerItem ID="DividerItem3" ImageURL="Images/transparent.gif" Class="litToolbarDivider" runat="server" />
	    <toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemBack" runat="server"/>
    </toolbar:HorizontalToolbar>--%>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">   
    <asp:Label Runat="server" ID="mc_labelImageHeader" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr>
				<td align="center" style="border:0px; color:black!important;" class="litText">
					<MediaArchive:File runat="Server" id="m_controlImage" CssClass="litImageBorder" MaxHeight="540" MaxWidth="720" vspace="5"></MediaArchive:File><br /><b><asp:Label Runat="server" ID="m_labelImageName" /></b> (<asp:Label Runat="server" ID="mc_labelImageFileName" />, <asp:Label Runat="server" ID="mc_labelImageDimensions" /><asp:Label Runat="server" ID="mc_labelImageFileSize" /> kB) <a href="#" id="mc_linkDownload" runat="server"><img src="Images/transparent.gif" style="vertical-align:middle; border:none;" class="litIconDownload" alt="<Foundation:ModuleString Name=DownloadImage runat=Server />" title="<Foundation:ModuleString Name=DownloadImage runat=Server />" /></a><br /><b><Foundation:ModuleString ID="ModuleString4" Name="Folder" runat="server" /></b>: <a href="#" runat="server" id="mc_linkFolder" /><asp:Label id="mc_labelFolderName" Runat="server"/><asp:Panel visible="false" id="mc_panelImageResized" runat="server" style="padding-top:5px; color:black!important;"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconWarning" alt="" /><asp:Label runat="server" id="mc_labelImageResized" CssClass="litText" /></asp:Panel>
				</td>
			</tr>
			<tr>
				<td style="border:none; color:black!important;"><span class="litText"><b><Foundation:ModuleString ID="ModuleString1" Name="Metadata" runat="Server" /></b></span>
					<div class="litListArea">
						<table border="0" cellspacing="0" cellpadding="0" width="100%" style="margin-top:2px; border-top:1px solid #CFCDCC;">
							<tr>
								<td class="litListContent" style="line-height:150%;">
									<asp:Label Runat="server" ID="mc_labelImageMetadata" />
								</td>
							</tr>
						</table>
					</div><br /><br />
				</td>
			</tr>
			<tr>
				<td style="border:none;"><span class="litText"><b><Foundation:ModuleString ID="ModuleString2" Name="Versions" runat="Server" /></b></span>
					<div class="litListArea">
						<asp:Table runat="server" ID="mc_tableEmpty" Visible="false" CellSpacing="0" style="width:100%;" CssClass="litListContent">
							<asp:TableRow ID="TableRow1" Runat="server">
								<asp:TableHeaderCell style="text-align:left;" CssClass="lsListHeader"><Foundation:ModuleString Name="Name" runat="server" ID="Modulestring10"/></asp:TableHeaderCell>
								<asp:TableHeaderCell Width="60" CssClass="lsListHeader"><Foundation:ModuleString Name="Size" runat="server" ID="Modulestring11"/></asp:TableHeaderCell>
								<asp:TableHeaderCell Width="50" CssClass="lsListHeader"><Foundation:ModuleString Name="Show" runat="server" ID="Modulestring3"/></asp:TableHeaderCell>
							</asp:TableRow>
							<asp:TableRow ID="TableRow2" Runat="server">
								<asp:TableCell ColSpan="3"><Foundation:ModuleString ID="ModuleString5" Name="MissingVersions" runat="server"/></asp:TableCell>
							</asp:TableRow>
						</asp:Table>
						<asp:DataList ID="mc_dataListVersions" Runat="server" OnItemDataBound="mc_dataListVersions_ItemDataBound" style="width:100%;" CssClass="litListContent" ExtractTemplateRows="True">
							<HeaderTemplate>
								<asp:Table ID="Table2" Runat="server" style="width:100%;" CssClass="litListContent">
									<asp:TableRow ID="TableRow3" Runat="server">
										<asp:TableHeaderCell style="text-align:left;" CssClass="lsListHeader"><Foundation:ModuleString Name="Name" runat="server" ID="Modulestring12"/></asp:TableHeaderCell>
										<asp:TableHeaderCell Width="150" CssClass="lsListHeader"><Foundation:ModuleString Name="Size" runat="server" ID="Modulestring13"/></asp:TableHeaderCell>
										<asp:TableHeaderCell Width="50" CssClass="lsListHeader"><Foundation:ModuleString Name="Show" runat="server" ID="Modulestring1"/></asp:TableHeaderCell>
									</asp:TableRow>
								</asp:Table>
							</HeaderTemplate>
							<ItemTemplate>
								<asp:Table Runat="server" style="width:100%;" CssClass="litListContent" ID="Table1">
									<asp:TableRow Runat="server" ID="Tablerow1" NAME="Tablerow1">
										<asp:TableCell><asp:Label Runat="server" ID="mc_labelVersionName" /></asp:TableCell>
										<asp:TableCell><asp:Label Runat="server" ID="mc_imageDimensions" /><MediaArchive:FileVersionFileSize runat="server" ShowKilobyte="true" ID="mc_imageFileSize" /> kB</asp:TableCell>
										<asp:TableCell CssClass="litListContent" align="center"><a href="#" id="mc_linkView" runat="server"><img src="Images/transparent.gif" style="vertical-align:middle; border:none;" class="litIconView" alt="" /></a></asp:TableCell>
									</asp:TableRow>
								</asp:Table>
							</ItemTemplate>
						</asp:DataList>
					</div>
				</td>
			</tr>
		</table>
    </div>
</asp:Content>