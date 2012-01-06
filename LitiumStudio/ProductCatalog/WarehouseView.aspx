<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="LitiumStudio_ProductCatalog_WarehouseView, Litum.Studio.Web" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>

<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<ComponentArt:ToolBar ID="c_toolbarMain" AutoPostBackOnSelect="true" OnItemCommand="ToolBar_ItemCommand"
		runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16">
		<Items runat="server">
			<ComponentArt:ToolBarItem ID="c_toolbarItemBack" runat="server"
			ImageUrl="icons_standard/arrow_left_blue_16px.png" CausesValidation="False" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>            
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
						<div >
							<span class="litBoldHeader">
							   <Foundation:ModuleString ID="ModuleString1" runat="server" Name="WarehouseName" />:&nbsp;
							</span>
							<span class="litText">
								<asp:Label ID="c_name" runat="server" />
							</span>
						</div>
						<div class="litBoldHeader"></div>
						<div>
							<span class="litBoldHeader">
								<Foundation:ModuleString ID="ModuleString2" runat="server" Name="WarehouseDescription" />:&nbsp;
							</span>
							<span class="litText">
								<asp:Label ID="c_description" runat="server" />
							</span>
						</div>
						<div class="litBoldHeader"></div>
						<div>
							<span class="litBoldHeader">
								<Foundation:ModuleString ID="ModuleString3" runat="server" Name="IsDefaultWarehouse" />:&nbsp;
							</span>
							<span class="litText">
								<asp:Label ID="c_isDefault" runat="server" />
							</span>
						</div>
						<div class="litBoldHeader"></div>
						<div>
							<span class="litBoldHeader">
								<Foundation:ModuleString ID="ModuleString4" Name="WarehouseAddress1" runat="server" />:&nbsp;
							</span>
							<span class="litText">
								<asp:Label ID="c_warehouseAddress1" runat="server" />
							</span>
						</div>
						<div class="litBoldHeader"></div>
						<div>
							<span class="litBoldHeader">
								<Foundation:ModuleString ID="ModuleString5" Name="WarehouseAddress2" runat="server" />:&nbsp;
							</span>
							<span class="litText">
								<asp:Label ID="c_warehouseAddress2" runat="server" />
							</span>
						</div>
						<div class="litBoldHeader"></div>
						<div>
							<span class="litBoldHeader">
								<Foundation:ModuleString ID="ModuleString6" Name="WarehouseZip" runat="server" />:&nbsp;
							</span>
							<span class="litText">
								<asp:Label ID="c_warehouseZip" runat="server" />
							</span>
						</div>
						<div class="litBoldHeader"></div>
						<div>
							<span class="litBoldHeader">
								<Foundation:ModuleString ID="ModuleString7" runat="server" Name="WarehouseCity" />:&nbsp;
							</span>
							<span class="litText">
								<asp:Label ID="c_warehouseCity" runat="server" />
							</span>
						</div>
						<div class="litBoldHeader"></div>
						<div>
							<span class="litBoldHeader">
								<Foundation:ModuleString ID="ModuleString8" runat="server" Name="WarehouseState" />:&nbsp;
							</span>
							<span class="litText">
								<asp:Label ID="c_warehouseState" runat="server" />
							</span>
						</div>
						<div class="litBoldHeader"></div>
						<div>
							<span class="litBoldHeader">
								<Foundation:ModuleString ID="ModuleString9" Name="WarehouseCountry" runat="server" />:&nbsp;
							</span>
							<span class="litText">
								<asp:Label ID="c_warehouseCountry" runat="server" />
							</span>
						</div>
						<div class="litBoldHeader"></div>
						<div>
							<span class="litBoldHeader">
								<Foundation:ModuleString ID="ModuleString10" Name="WarehousePhone" runat="server" />:&nbsp;
							</span>
							<span class="litText">
								<asp:Label ID="c_warehousePhone" runat="server" />
							</span>
						</div>
						<div class="litBoldHeader"></div>
						<div>
							<span class="litBoldHeader">
								<Foundation:ModuleString ID="ModuleString11" Name="WarehouseMobilePhone" runat="server" />:&nbsp;
							</span>
							<span class="litText">
								<asp:Label ID="c_warehouseMobilePhone" runat="server" />
							</span>
						</div>
						<div class="litBoldHeader"></div>
						<div>
							<span class="litBoldHeader">
								<Foundation:ModuleString ID="ModuleString12" Name="WarehouseFax" runat="server" />:&nbsp;
							</span>
							<span class="litText">
								<asp:Label ID="c_warehouseFax" runat="server" />
							</span>
						</div>
						<div class="litBoldHeader"></div>
						<div>
							<span class="litBoldHeader">
								<Foundation:ModuleString ID="ModuleString13" Name="WarehouseEmail" runat="server" />:&nbsp; 
							</span>
							<span class="litText">
								<asp:Label ID="c_warehouseEmail" runat="server" />
							</span>
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
