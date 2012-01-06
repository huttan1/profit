<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_ECommerce_SettingsTranslations, Litum.Studio.Web" %>

<asp:Content ID="c_toolbarContent" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<ComponentArt:ToolBar ID="c_toolbarSettingsTranslations" OnItemCommand="c_toolbarSettingsTranslations_ItemCommand"
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
	<Foundation:ModuleString ID="c_moduleStringTranslations" Name="TabTranslationsTitle"
		runat="server" />
</asp:Content>
<asp:Content ID="c_ecommerceContent" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll" id="c_mainContainer" runat="server" >
		<table border="0" cellpadding="3" cellspacing="0" id="EcommerceTranslations">
			<tr id="c_orderStatusesRow" runat="server">
				<td>
					<Foundation:InformationGroup runat="server" ID="c_informationGroupOrderStatuses"
						HeaderTextName="OrderStatuses">
						<br />
						<asp:PlaceHolder ID="c_orderStatusPlaceHolder" runat="server">
							<asp:Table ID="c_orderStatusTable" runat="server" CellPadding="3" class="lsSettingTable">
							</asp:Table>
						</asp:PlaceHolder>
					</Foundation:InformationGroup>
					<br />
				</td>
			</tr>
			<tr id="c_orderRowStatusesRow" runat="server" visible="false">
				<td>
					<Foundation:InformationGroup runat="server" ID="c_informationGroupOrderRowStatuses"
						HeaderTextName="OrderRowStatuses">
						<br />
						<asp:PlaceHolder ID="c_orderRowStatusPlaceHolder" runat="server">
							<asp:Table ID="c_orderRowStatusTable" runat="server" CellPadding="3" class="lsSettingTable">
							</asp:Table>
						</asp:PlaceHolder>
					</Foundation:InformationGroup>
					<br />
				</td>
			</tr>
			<tr id="c_orderPaymentStatusesRow" runat="server">
				<td>
					<Foundation:InformationGroup runat="server" ID="c_informationGroupOrderPaymentStatuses"
						HeaderTextName="OrderPaymentStatuses">
						<br />
						<asp:PlaceHolder ID="c_orderPaymentStatusPlaceHolder" runat="server">
							<asp:Table ID="c_orderPaymentStatusTable" runat="server" CellPadding="3" class="lsSettingTable">
							</asp:Table>
						</asp:PlaceHolder>
					</Foundation:InformationGroup>
					<br />
				</td>
			</tr>
			<tr id="c_orderDeliveryStatusesRow" runat="server" visible="false">
				<td>
					<Foundation:InformationGroup runat="server" ID="c_informationGroupOrderDeliveryStatuses"
						HeaderTextName="OrderDeliveryStatuses">
						<br />
						<asp:PlaceHolder ID="c_orderDeliveryStatusPlaceHolder" runat="server">
							<asp:Table ID="c_orderDeliveryStatusTable" runat="server" CellPadding="3" class="lsSettingTable">
							</asp:Table>
						</asp:PlaceHolder>
					</Foundation:InformationGroup>
					<br />
				</td>
			</tr>
			<tr id="c_paymentMethodsRow" runat="server">
				<td>
					<Foundation:InformationGroup runat="server" ID="c_informationGroupPaymentMethods"
						HeaderTextName="PaymentMethods">
						<br />
						<asp:PlaceHolder ID="c_paymentMethodPlaceHolder" runat="server">
							<asp:Table ID="c_paymentMethodTable" runat="server" CellPadding="3" class="lsSettingTable">
							</asp:Table>
						</asp:PlaceHolder>
					</Foundation:InformationGroup>
					<br />
				</td>
			</tr>
			<tr id="c_paymentStatusesRow" runat="server">
				<td>
					<Foundation:InformationGroup runat="server" ID="c_informationGroupPaymentStatuses"
						HeaderTextName="PaymentStatuses">
						<br />
						<asp:PlaceHolder ID="c_paymentStatusPlaceHolder" runat="server">
							<asp:Table ID="c_paymentStatusTable" runat="server" CellPadding="3" class="lsSettingTable">
							</asp:Table>
						</asp:PlaceHolder>
					</Foundation:InformationGroup>
					<br />
				</td>
			</tr>
			<tr id="c_deliveryMethodsRow" runat="server">
				<td>
					<Foundation:InformationGroup runat="server" ID="c_informationGroupDeliveryMethods"
						HeaderTextName="DeliveryMethods">
						<br />
						<asp:PlaceHolder ID="c_deliveryMethodPlaceHolder" runat="server">
							<asp:Table ID="c_deliveryMethodTable" runat="server" CellPadding="3" class="lsSettingTable">
							</asp:Table>
						</asp:PlaceHolder>
					</Foundation:InformationGroup>
					<br />
				</td>
			</tr>
			<tr id="c_deliveryStatusesRow" runat="server">
				<td >
					<Foundation:InformationGroup runat="server" ID="c_informationGroupDeliveryStatuses"
						HeaderTextName="DeliveryStatuses">
						<br />
						<asp:PlaceHolder ID="c_deliveryStatusPlaceHolder" runat="server">
							<asp:Table ID="c_deliveryStatusTable" runat="server" CellPadding="3" class="lsSettingTable">
							</asp:Table>
						</asp:PlaceHolder>
					</Foundation:InformationGroup>
					<br />
				</td>
			</tr>
		</table>
		<br />
	</div>
</asp:Content>
