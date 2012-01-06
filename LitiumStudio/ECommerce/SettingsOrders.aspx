<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_ECommerce_SettingsOrders, Litum.Studio.Web" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<ComponentArt:ToolBar ID="c_toolbarSettingsOrders" OnItemCommand="c_toolbarSettingsOrders_ItemCommand"
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
		</ClientTemplates> 
	</ComponentArt:ToolBar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconECommerce" />
	<Foundation:ModuleString ID="c_moduleStringOrders" Name="TabOrders" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
		<p class="litText">
			<asp:CheckBox runat="server" ID="c_checkBoxEnableEditing" CssClass="litInputCheckbox" />
		</p>
		<p class="litText">
			<asp:CheckBox runat="server" ID="c_checkBoxEnableCreating" CssClass="litInputCheckbox" />
		</p>
		<p class="litText">
			<asp:CheckBox runat="server" ID="c_checkBoxEnableOrderExportXslt" CssClass="litInputCheckbox" />
		</p>
	</div>
</asp:Content>
