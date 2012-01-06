<%@ page language="C#" masterpagefile="~/LitiumStudio/ECommerce/Framework/Base1.master" validaterequest="false" autoeventwireup="true" inherits="LitiumStudio_ECommerce_AddEditRow, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ECommerce/Framework/Base1.master" %>


<%@ Register TagPrefix="ProductCatalog" TagName="ProductCatalogDialog" src="~/LitiumStudio/WebUserControls/ProductCatalogDialog.ascx" %>

<asp:Content ID="toolbarContent" ContentPlaceHolderID="ToolbarRight" Runat="Server">
	<%--<asp:Panel id="c_panelMajorError" visible="False" runat="server"> 
		<fieldset class="litErrorFieldset"><legend class="litErrorFieldsetMsg"><img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" /><b><Foundation:SystemString Name="UnknownError" runat="server" ID="Systemstring2"/></b></legend><img src="Images/transparent.gif" width="5" alt="" /><br />
			<asp:Label id="c_labelMajorError" runat="server"/>
		</fieldset>
	</asp:Panel>--%>
	
	<ComponentArt:ToolBar ID="c_toolbarAddEditRow"
		OnItemCommand="c_toolbarAddEditRow_ItemCommand" runat="server" 
		CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew" 
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" 
		DefaultItemActiveCssClass="litToolbarItemOnMouseDown" 
		DefaultItemDisabledCssClass="litToolbarItemDisabled" 
		ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false" 
		Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
		<Items runat="server">
			<ComponentArt:ToolBarItem ID="c_toolbarItemCancel" runat="server" ImageUrl="icons_standard/sign_stop.png"
			    AutoPostBackOnSelect="true" CausesValidation="False" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="c_toolbarItemSave" runat="server" ImageUrl="icons_standard/floppy_disk_blue.png"
			    AutoPostBackOnSelect="true"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
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

<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td valign="middle" style="height:34px;" class="litPageStatusHeaderV2">
                <span class="litContentTopHeader"><img src="Images/transparent.gif" alt="" runat="server" id="c_imageHeaderIcon" />
			    <Foundation:ModuleString ID="c_moduleStringAddEditRowHeader" Name="AddRow" runat="server" /></span>  
            </td>
        </tr>    
    </table>    
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="ContentRight" Runat="Server">	
	<div style="width:100%;">
		<table border="0" cellpadding="0" cellspacing="3">
		    <tr>
				<td style="width:10px;"></td>
				<td>
					<div class="litBoldHeader"><Foundation:ModuleString ID="moduleString1" Name="AddRowProduct" Runat="server"/>
					<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="Img2" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>					
				</td>
				<td></td>
			</tr>
			<tr>
				<td style="width:10px;"></td>
				<td>
					<asp:TextBox runat="server" ID="c_textBoxArticleNumber" CssClass="litInputText200" Width = "250px"></asp:TextBox>	
					<asp:RequiredFieldValidator ID="c_requiredFieldValidatorArticleNumber" runat="server" ControlToValidate="c_textBoxArticleNumber" Display="Dynamic" Font-Size="11px"></asp:RequiredFieldValidator>
					<asp:CustomValidator OnServerValidate="ArticleExistanceCheck" ValidateEmptyText="false" ControlToValidate="c_textBoxArticleNumber"  ID="c_customValidatorArticleNumber" Display="Dynamic" runat="server" Font-Size="11px"></asp:CustomValidator>									
				</td>
				<td valign = "top">
				    <asp:Image imageurl="~/LitiumStudio/images/icons_standard/product_green.png" ImageAlign = "Top" runat="server" id="c_imageButtonProduct" causesvalidation="False" borderwidth="0" style="vertical-align:top;margin-left:4px;cursor:pointer;" />				        
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<asp:TextBox MaxLength="255" TextMode="MultiLine" runat="server" ID="c_textBoxArticleName" CssClass="litInputText200" Width="250px" Height="50px"></asp:TextBox>
				</td>
				<td></td>
			</tr>			
			<tr>
			    <td></td>
				<td>
					<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringQuantity" Name="Quantity" Runat="server"/>
					<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageRequiredDeliveryVat" style="vertical-align:middle;" class="litIconRequired" alt="" />:
                    <asp:Label ID="c_labelSkuCodeDescription" runat="server" Text=""></asp:Label></div>
					<asp:TextBox runat="server" ID="c_textBoxQuantity" CssClass="litInputText200" Width = "250px"></asp:TextBox>
					<asp:RequiredFieldValidator ID="c_requiredFieldValidatorQuantity" runat="server" ControlToValidate="c_textBoxQuantity" Display="Dynamic" Font-Size="11px"></asp:RequiredFieldValidator>
					<asp:RangeValidator ID="c_rangeValidatorQuantity" Type="Double" runat="server" ControlToValidate="c_textBoxQuantity" MaximumValue="999999" MinimumValue="0" Display="Dynamic" Font-Size="11px"></asp:RangeValidator>	
				</td>
				<td></td>
			</tr>
			<tr>
			    <td></td>
				<td>
					<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringRowDiscount" Name="DiscountPercentage" Runat="server"/>:</div>
					<asp:TextBox runat="server" ID="c_textBoxRowDiscount" MaxLength = 2 CssClass="litInputText200" Width = "250px"></asp:TextBox>
					<asp:RangeValidator ID="c_rangeValidatorRowDiscount" Type="Double" runat="server" ControlToValidate="c_textBoxRowDiscount" MaximumValue="100" MinimumValue="0" Display="Dynamic" Font-Size="11px"></asp:RangeValidator>					
				</td>
				<td></td>
			</tr>
			<tr>
			    <td></td>
				<td>
					<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringComment" Name="Comment" Runat="server"/>:</div>
					<asp:TextBox MaxLength="255" TextMode="MultiLine" runat="server" ID="c_textBoxComment" CssClass="litInputText200" Width="250px" Height="50px"></asp:TextBox>
				</td>
				<td></td>
			</tr>
		</table>
	</div>
	<ProductCatalog:ProductCatalogDialog id="ProductCatalogDialog" runat="server" PageSize="10" />	
    <asp:HiddenField ID="c_inputHiddenArticleID" runat="server"/>
    <asp:HiddenField ID="c_inputHiddenProductID"  runat="server"/>
</asp:Content>

