<%@ Control Language="C#" AutoEventWireup="true" CodeFile="XAmountOff.ascx.cs" Inherits="LitiumStudio_ECommerce_WebUserControls_Campaigns_XAmountOff" %>
<table border="0" cellspacing="0" cellpadding="15">
	<tr>
		<td><div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringExceedAmount" Name="CampaignUserControlExceedAmount" runat="server" />
		<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageRequiredExceedAmount" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
		<asp:TextBox ID="c_textBoxExceedAmount" runat="server" MaxLength="5" CssClass="litInputText150"></asp:TextBox>&nbsp;
		<asp:RequiredFieldValidator Display="Dynamic" ID="c_requiredFieldValidatorExceedAmount" ControlToValidate="c_textBoxExceedAmount" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
		<asp:RangeValidator Display="Dynamic" ID="c_rangeValidatorExceedAmount" ControlToValidate="c_textBoxExceedAmount" runat="server" ErrorMessage="*" CultureInvariantValues="true" Type="Double" MinimumValue="0" MaximumValue="99999"></asp:RangeValidator></td>
	</tr>
	<tr>
		<td><div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringXAmount" Name="CampaignUserControlXPercentOffXAmount" runat="server" />
		<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageRequiredXAmount" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
		<asp:TextBox ID="c_textBoxXAmount" runat="server" MaxLength="5" CssClass="litInputText150"></asp:TextBox>&nbsp;
		<asp:RequiredFieldValidator Display="Dynamic" ID="c_requiredFieldValidatorXAmount" ControlToValidate="c_textBoxXAmount" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
		<asp:RangeValidator Display="Dynamic" ID="c_rangeValidatorXAmount" ControlToValidate="c_textBoxXAmount" runat="server" ErrorMessage="*" CultureInvariantValues="true" Type="Double" MinimumValue="0" MaximumValue="99999"></asp:RangeValidator></td>
	</tr>
</table>