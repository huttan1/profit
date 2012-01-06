<%@ page language="C#" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_PriceListImport, Litum.Studio.Web" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>

<%@ Import Namespace="Litium.Studio.UI.ProductCatalog.Common.Constants" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<ComponentArt:ToolBar ID="ImportToolbar" 
		OnItemCommand="ToolBar_ItemCommand" runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16" AutoPostBackOnSelect="true">
		<Items runat="server">
			<ComponentArt:ToolBarItem ID="ImportAbort" runat="server" ImageUrl="icons_standard/sign_stop.png"
				CausesValidation="False" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="ImportFile" runat="server" ImageUrl="icons_standard/import.png" 
			    ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
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
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" height="16px" class="litIconBarcode" alt="" /><Foundation:ModuleString
		ID="ModuleString6" runat="server" Name="PriceListImport" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
		<Foundation:InformationGroup runat="server" ID="c_informationGroup1" Width="440px" >
		<div class="litText">
			<Foundation:ModuleString ID="ModuleString3" runat="server" Name="SettingsImportDescription1" />
			<br />
			<br />
			<Foundation:ModuleString ID="ModuleString4" runat="server" Name="SettingsImportDescription2" />
			<br />
			<br />
		</div>
		<div class="litText">
			<asp:CheckBox runat="server" ID="c_importArticle" /><Foundation:ModuleString ID="ModuleString2"
				runat="server" Name="PriceListImportArticle" />
			<br />
			<br />
		</div>
		<div style="float: left;">
			<asp:FileUpload runat="server" ID="c_importFile" CssClass="litInputText" size="63" /></div>
		<div style="float: left; padding-left: 10px; padding-top: 2px;">
			<asp:RequiredFieldValidator runat="server" ID="c_validatorImportFile" ControlToValidate="c_importFile"
				Display="Dynamic" />
		</div>
		<div style="clear: both;">
		</div>
		</Foundation:InformationGroup>
	</div>
</asp:Content>
