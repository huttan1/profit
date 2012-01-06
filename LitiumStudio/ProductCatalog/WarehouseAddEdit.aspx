<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="LitiumStudio_ProductCatalog_WarehouseAddEdit, Litum.Studio.Web" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<%@ Import Namespace="Litium.Studio.UI.ProductCatalog.Common.Constants"%>

<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
  
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
  <script type="text/javascript">
  	function toolbarItemSelected(sender, eventArgs) {
  		var toolbarItem = eventArgs.get_item().get_id();

  		if (toolbarItem == 'c_toolbarItemAbort') {
  			document.location = '<%= ResolveUrl(UrlConstants.STOCK_BALANCE) %>';
  		}
  		if (toolbarItem == 'c_toolbarItemSave') {
  			__doPostBack("itemsave");
  		}
  	}
        </script>
	<ComponentArt:ToolBar ID="c_toolbarMain" AutoPostBackOnSelect="false" OnItemCommand="ToolBar_ItemCommand"
		runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16">
		<Items runat="server">
			<ComponentArt:ToolBarItem ID="c_toolbarItemAbort" AutoPostBackOnSelect="false"
			    runat="server" ImageUrl="icons_standard/sign_stop.png" CausesValidation="False"
			    ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="c_toolbarItemSave" AutoPostBackOnSelect="false"
			    runat="server" ImageUrl="icons_standard/floppy_disk_blue.png"
			    ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
		</Items>
		 <ClientEvents>
			<ItemSelect EventHandler="toolbarItemSelected" />
		</ClientEvents>
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
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
		<img src="Images/transparent.gif" class="litIconShelf" alt="" />
		<asp:Label runat="server" ID="c_header" />       
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">    
    
    <!-- Start Page Body -->
    <div class="lsContentScroll">
		<Foundation:InformationGroup runat="server" ID="c_informationGroup1" Width="235px" >
			<table cellpadding="15" cellspacing="0" border="0" class="litModuleContentWithTreeMainSizeV2">
				<tr>
					<td valign="top">
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString1" runat="server" Name="WarehouseName" />
							<img src="images/transparent.gif" style="vertical-align: middle;" class="litIconRequired"
								alt="" />:
						</div>
						<div>
							<asp:TextBox ID="c_name" runat="server" CssClass="litInputSelect" />&nbsp;
							<asp:RequiredFieldValidator ID="c_reqName" runat="server" Display="Dynamic" ControlToValidate="c_name" />
							<asp:CustomValidator ID="c_custName" runat="server" Display="Dynamic" ControlToValidate="c_name"
								OnServerValidate="NameDuplicateCheck" />
						</div>
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString2" runat="server" Name="WarehouseDescription" />:
						</div>
						<div>
							<asp:TextBox ID="c_description" runat="server" CssClass="litInputSelect" />&nbsp;
						</div>
						<div class="litBoldHeader">
							<asp:CheckBox ID="c_isDefault" runat="server" TextAlign="Right" />
							<Foundation:ModuleString ID="ModuleString3" runat="server" Name="IsDefaultWarehouse" />
						</div>
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString4" Name="WarehouseAddress1" runat="server" />:
						</div>
						<div>
							<asp:TextBox ID="c_warehouseAddress1" runat="server" MaxLength="200" CssClass="litInputSelect" />
						</div>
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString5" Name="WarehouseAddress2" runat="server" />:
						</div>
						<div>
							<asp:TextBox ID="c_warehouseAddress2" runat="server" MaxLength="200" CssClass="litInputSelect" />
						</div>
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString6" Name="WarehouseZip" runat="server" />:
						</div>
						<div>
							<asp:TextBox ID="c_warehouseZip" runat="server" MaxLength="15" CssClass="litInputSelect" />
						</div>
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString7" runat="server" Name="WarehouseCity" />:
						</div>
						<div>
							<asp:TextBox ID="c_warehouseCity" runat="server" MaxLength="100" CssClass="litInputSelect" />
						</div>
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString8" runat="server" Name="WarehouseState" />:
						</div>
						<div>
							<asp:TextBox ID="c_warehouseState" runat="server" MaxLength="100" CssClass="litInputSelect" />
						</div>
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString9" Name="WarehouseCountry" runat="server" />:
						</div>
						<div>
							 <ComponentArt:ComboBox TextBoxEnabled = "false" 
						Id="c_dropDownListCountries"
						RunAt="Server"
						Width="200"
						Height="20"
						AutoHighlight="false"
						AutoComplete="true"
						AutoFilter="true"
						ItemClientTemplateId="LanguageItemTemplate"
						ItemCssClass="ddn-item"
						ItemHoverCssClass="ddn-item-hover"
						CssClass="cmb"
						HoverCssClass="cmb-hover"
						TextBoxCssClass="txt"
						DropHoverImageUrl="../../LitiumStudio/Images/combobox/ddn-hover.png"
						DropImageUrl="../../LitiumStudio/Images/combobox/ddn.png"
						DropDownResizingMode="bottom"
						DropDownWidth="200"
						DropDownHeight="170"
						DropDownCssClass="ddn"
						DropDownContentCssClass="ddn-con">
					  <ClientTemplates>
							<ComponentArt:ClientTemplate ID="LanguageItemTemplate">
								<img src="../../LitiumStudio/Images/icons_standard/flags/##DataItem.get_id()##.png" class="icon" width="16" height="16" alt="##DataItem.get_id()##" title="##DataItem.get_id()##" />
								## DataItem.get_text() ##
							</ComponentArt:ClientTemplate>
					   </ClientTemplates>
					<DropDownFooter><div class="ddn-ftr"></div></DropDownFooter>
				</ComponentArt:ComboBox>
						</div>
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString10" Name="WarehousePhone" runat="server" />:
						</div>
						<div>
							<asp:TextBox ID="c_warehousePhone" runat="server" MaxLength="50" CssClass="litInputSelect" />
							<asp:RegularExpressionValidator ID="c_validatorPhoneValue" runat="server" Display="Dynamic"
								ControlToValidate="c_warehousePhone" ErrorMessage="*" ValidationExpression="^\d+$" />
						</div>
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString11" Name="WarehouseMobilePhone" runat="server" />:
						</div>
						<div>
							<asp:TextBox ID="c_warehouseMobilePhone" runat="server" MaxLength="50" CssClass="litInputSelect" />
							<asp:RegularExpressionValidator ID="c_validatorMobilePhoneValue" runat="server" Display="Dynamic"
								ControlToValidate="c_warehouseMobilePhone" ErrorMessage="*" ValidationExpression="^\d+$" />
						</div>
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString12" Name="WarehouseFax" runat="server" />:
						</div>
						<div>
							<asp:TextBox ID="c_warehouseFax" runat="server" MaxLength="50" CssClass="litInputSelect" />
							<asp:RegularExpressionValidator ID="c_validatorFaxValue" runat="server" Display="Dynamic"
								ControlToValidate="c_warehouseFax" ErrorMessage="*" ValidationExpression="^\d+$" />
						</div>
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString13" Name="WarehouseEmail" runat="server" />:
						</div>
						<div>
							<asp:TextBox ID="c_warehouseEmail" runat="server" MaxLength="250" CssClass="litInputSelect" />
							<asp:RegularExpressionValidator ID="c_validatorEmailValue" runat="server" Display="Dynamic"
								ControlToValidate="c_warehouseEmail" ErrorMessage="*" 
								ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
						</div>
	                    
						<asp:HiddenField ID="c_addressID" runat="server" />
						<asp:HiddenField ID="c_warehouseID" runat="server" />
					</td>
				</tr>
			</table>
		</Foundation:InformationGroup>
    </div>
    <!-- End Page Body -->

</asp:Content>
