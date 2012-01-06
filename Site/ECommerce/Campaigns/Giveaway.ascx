<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Giveaway.ascx.cs" Inherits="LitiumStudio_ECommerce_WebUserControls_Campaigns_Giveaway" %>
<%@ Register TagPrefix="ProductCatalog" TagName="ProductCatalogDialog" src="~/LitiumStudio/WebUserControls/ProductCatalogDialog.ascx" %>
<table border="0" cellspacing="0" cellpadding="15">
	<tr>
		<td><div class="litBoldHeader"><Foundation:ModuleString ID="m_moduleStringProductY" Name="CampaignUserControlGiveawayProductY" runat="server" />
		<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageRequiredProductY" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
		<asp:TextBox ID="c_textBoxProductY" runat="server" MaxLength="5" CssClass="litInputText150"></asp:TextBox>
		<asp:Image CssClass="litIconPopUp" imageurl="~/LitiumStudio/Images/icons_standard/article_group.png" runat="server" id="c_imageButtonProductY" />&nbsp;
		<asp:RequiredFieldValidator Display="Dynamic" ID="c_requiredFieldValidatorProductY" ControlToValidate="c_textBoxProductY" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
	</tr>	
	<tr>
		<td><div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringExceedAmount" Name="CampaignUserControlExceedAmount" runat="server" />
		<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageRequiredExceedAmount" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
		<asp:TextBox ID="c_textBoxExceedAmount" runat="server" MaxLength="5" CssClass="litInputText150"></asp:TextBox>&nbsp;
		<asp:RequiredFieldValidator Display="Dynamic" ID="c_requiredFieldValidatorExceedAmount" ControlToValidate="c_textBoxExceedAmount" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
		<asp:RangeValidator Display="Dynamic" ID="c_rangeValidatorExceedAmount" ControlToValidate="c_textBoxExceedAmount" runat="server" ErrorMessage="*" CultureInvariantValues="true" Type="Double" MinimumValue="0" MaximumValue="99999"></asp:RangeValidator></td>
	</tr>
	<tr>
		<td><div class="litBoldHeader"><Foundation:ModuleString ID="m_moduleStringMaxQuantityPerShoppingCart" Name="CampaignMaxQuantityPerShoppingCart" runat="server" />:</div>
		<asp:TextBox ID="c_textBoxMaxQuantityPerShoppingCart" runat="server" MaxLength="5" CssClass="litInputText150"></asp:TextBox>&nbsp;</td>
	</tr>
</table>
<ProductCatalog:ProductCatalogDialog id="c_productDialogGiveaway" runat="server" PageSize="10" />
<asp:HiddenField runat="server" id="c_hiddenFieldProductY" />
<asp:HiddenField runat="server" id="c_hiddenFieldArticleY" />
