<%@ page language="C#" masterpagefile="~/LitiumStudio/ECommerce/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_ECommerce_AddCampaign2, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ECommerce/Framework/Base1.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
	<ComponentArt:ToolBar ID="c_toolbarAddCampaign" AutoPostBackOnSelect="true" 
			OnItemCommand="c_toolbarAddCampaign_ItemCommand" runat="server" 
			CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew" 
			DefaultItemHoverCssClass="litToolbarItemOnMouseOver" 
			DefaultItemActiveCssClass="litToolbarItemOnMouseDown" 
			DefaultItemDisabledCssClass="litToolbarItemDisabled" 
			ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false" 
			Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
			<Items runat="server">
				<ComponentArt:ToolBarItem ID="c_toolbarItemCancel" runat="server" ImageUrl="icons_standard/sign_stop.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
				<ComponentArt:ToolBarItem ID="c_toolbarItemBack" runat="server" ImageUrl="icons_standard/arrow_left_blue_16px.png"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
				<ComponentArt:ToolBarItem ID="c_toolbarItemSave" runat="server" ImageUrl="icons_standard/floppy_disk_blue.png"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
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
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##" alt="" style="display: block;"/>
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
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##" alt="" style="display: block;"/>
		                    </td>
		                    <td class="ca_tb_txt ToolbarItemMain">
		                        <nobr>## DataItem.get_text() ##</nobr>
		                    </td>
		                    <td rowspan="1" class="ca_tb_ddn ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_dropDownImageUrl() ##" alt="" style="display: block;"/>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td valign="middle" style="height:34px;" class="litPageStatusHeaderV2">
                <span class="litContentTopHeader"><img src="Images/transparent.gif" alt="" runat="server" id="c_imageHeaderIcon" class="litIconShoppingBag" />
			    <Foundation:ModuleString ID="c_moduleStringAddCampaign" Name="AddCampaign2" runat="server" /></span>  
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
<div class="lsContentScroll">
	<table border="0" cellspacing="0" >
		<tr valign="top">
			<td>
				<Foundation:InformationGroup runat="server" ID="c_informationGroupUserControl">
					<table border="0" cellspacing="0" cellpadding="0" width="100%">
						<tr>
							<td><div class="litContentTopHeader"><asp:Label ID="c_labelName" runat="server"></asp:Label></div></td>
						</tr>
						<tr>
							<td><div class="litBoldHeader"><asp:Label ID="c_labelDescription" runat="server"></asp:Label></div></td>
						</tr>
						<tr>
							<td>
								<Foundation:ModuleString ID="m_moduleStringControlLoadError" Name="CampaignUserControlError" runat="server" />							
								<asp:PlaceHolder ID="c_placeHolderUserControl" runat="server"></asp:PlaceHolder>
							</td>
						</tr>		
					</table>
				</Foundation:InformationGroup>
			</td>
		</tr>
	</table>
	</div>
</asp:Content>

