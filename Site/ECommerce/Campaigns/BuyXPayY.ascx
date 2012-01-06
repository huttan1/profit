<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BuyXPayY.ascx.cs" Inherits="LitiumStudio_ECommerce_WebUserControls_Campaigns_BuyXPayY" %>
<table border="0" cellspacing="0" cellpadding="15">
	<tr>
		<td><div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringBuyQuantity" Name="CampaignUserControlBuyXPayYBuyQuantity" runat="server" />
		<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageRequiredBuyQuantity" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
		<asp:TextBox ID="c_textBoxBuyQuantity" runat="server" MaxLength="5" CssClass="litInputText150"></asp:TextBox>&nbsp;
		<asp:RequiredFieldValidator Display="Dynamic" ID="c_requiredFieldValidatorBuyQuantity" ControlToValidate="c_textBoxBuyQuantity" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
		<asp:RangeValidator Display="Dynamic" ID="c_rangeValidatorBuyQuantity" ControlToValidate="c_textBoxBuyQuantity" runat="server" ErrorMessage="*" CultureInvariantValues="true" Type="Double" MinimumValue="0" MaximumValue="99999"></asp:RangeValidator></td>
	</tr>
	<tr>
		<td><div class="litBoldHeader"><Foundation:ModuleString ID="m_moduleStringPayForQuantity" Name="CampaignUserControlBuyXPayYPayForQuantity" runat="server" />
		<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageRequiredPayForQuantity" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
		<asp:TextBox ID="c_textBoxPayForQuantity" runat="server" MaxLength="5" CssClass="litInputText150"></asp:TextBox>&nbsp;
		<asp:RequiredFieldValidator Display="Dynamic" ID="c_requiredFieldValidatorPayForQuantity" ControlToValidate="c_textBoxPayForQuantity" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
		<asp:RangeValidator Display="Dynamic" ID="c_rangeValidatorPayForQuantity" ControlToValidate="c_textBoxPayForQuantity" runat="server" ErrorMessage="*" CultureInvariantValues="true" Type="Double" MinimumValue="0" MaximumValue="99999"></asp:RangeValidator>
		<asp:CustomValidator Display="Dynamic" ID="c_customValidatorPayForQuantity" ControlToValidate="c_textBoxPayForQuantity" runat="server" OnServerValidate="PayForQuantity_ServerValidate" ErrorMessage="*"></asp:CustomValidator></td>
	</tr>
</table>