<%@ page title="" language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_ECommerce_Settings, Litum.Studio.Web" enableeventvalidation="false" %>

<%@ Register TagName="Selector" TagPrefix="CC" Src="~/LitiumStudio/WebUserControls/SelectionControl.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<ComponentArt:ToolBar ID="c_toolbarSettings" OnItemCommand="c_toolbarSettings_ItemCommand"
		runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16">
		<Items runat="server">
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemSave" ImageUrl="icons_standard/floppy_disk_blue.png"
			    AutoPostBackOnSelect="true" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
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
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconECommerce" />
	<Foundation:ModuleString ID="c_moduleStringOrders" Name="TabSettings" runat="server" />	
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
			<asp:Panel ID="c_panelOkMessage" Visible="False" runat="server">
				<fieldset class="litOkFieldset">
					<legend class="litOkFieldsetMsg">
						<img src="images/transparent.gif" style="vertical-align: middle;" class="litIconOk"
							alt="" /><b><Foundation:SystemString Name="Ok" runat="server" ID="Systemstring4" />
							</b></legend>
					<img src="images/transparent.gif" width="5" alt="" /><br />
					<asp:Label ID="c_labelOk" runat="server" />
				</fieldset>
			</asp:Panel>

			<div class="litBoldHeader"><Foundation:ModuleString runat="server" Name="OrderListColumns" /></div>
			<CC:Selector runat="server" ID="c_orderListColumnsSelector" />
			<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString1" runat="server" Name="DeliveryListColumns" /></div>
			<CC:Selector runat="server" ID="c_deliveryListColumnsSelector" />
	</div>
</asp:Content>
