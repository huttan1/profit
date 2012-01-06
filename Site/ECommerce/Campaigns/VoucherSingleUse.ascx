<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VoucherSingleUse.ascx.cs" Inherits="LitiumStudio_ECommerce_WebUserControls_Campaigns_VoucherSingleUse" %>
<table border="0" cellspacing="0" cellpadding="15">
	<tr>
		<td><div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringExceedAmount" Name="CampaignUserControlExceedAmount" runat="server" />
		<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageRequiredExceedAmount" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
		<asp:TextBox ID="c_textBoxExceedAmount" runat="server" MaxLength="5" CssClass="litInputText150"></asp:TextBox>&nbsp;
		<asp:RequiredFieldValidator Display="Dynamic" ID="c_requiredFieldValidatorExceedAmount" ControlToValidate="c_textBoxExceedAmount" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
		<asp:RangeValidator Display="Dynamic" ID="c_rangeValidatorExceedAmount" ControlToValidate="c_textBoxExceedAmount" runat="server" ErrorMessage="*" CultureInvariantValues="true" Type="Double" MinimumValue="0" MaximumValue="99999"></asp:RangeValidator></td>
	</tr>
	<tr>
		<td>
			<div class="litBoldHeader"><asp:RadioButton ID="c_radioButtonAmountDiscount" runat="server" AutoPostBack="true" OnCheckedChanged="RadioButtonAmountDiscount_Clicked" /><Foundation:ModuleString ID="m_moduleStringAmountDiscount" Name="CampaignUserControlAmountDiscount" runat="server" />
			<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageRequiredPayForQuantity" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
			<asp:TextBox ID="c_textBoxAmountDiscount" runat="server" MaxLength="5" CssClass="litInputText150"></asp:TextBox>&nbsp;
			<asp:RequiredFieldValidator Display="Dynamic" ID="c_requiredFieldValidatorAmountDiscount" ControlToValidate="c_textBoxAmountDiscount" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
			<asp:RangeValidator Display="Dynamic"  ID="c_rangeValidatorAmountDiscount" ControlToValidate="c_textBoxAmountDiscount" runat="server" ErrorMessage="*" CultureInvariantValues="true" Type="Double" MinimumValue="0" MaximumValue="99999"></asp:RangeValidator>

			<div class="litBoldHeader"><asp:RadioButton ID="c_radioButtonPercentageDiscount" runat="server" AutoPostBack="true" OnCheckedChanged="RadioButtonPercentageDiscount_Clicked" /><Foundation:ModuleString ID="m_moduleStringPercentageDiscount" Name="CampaignUserControlPercentageDiscount" runat="server" />
			<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageRequiredPercentageDiscount" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
			<asp:TextBox ID="c_textBoxPercentageDiscount" runat="server" MaxLength="5" CssClass="litInputText150"></asp:TextBox>&nbsp;
			<asp:RequiredFieldValidator Display="Dynamic" ID="c_requiredFieldValidatorPercentageDiscount" ControlToValidate="c_textBoxPercentageDiscount" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
			<asp:RangeValidator Display="Dynamic"  ID="c_rangeValidatorPercentageDiscount" ControlToValidate="c_textBoxPercentageDiscount" runat="server" ErrorMessage="*" CultureInvariantValues="true" Type="Double" MinimumValue="0" MaximumValue="100"></asp:RangeValidator>			
		</td>
	</tr>
	<tr>
	    <td><div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringNoOfVoucherCodes" Name="NoOfVoucherCodes" runat="server" />
		<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imgRequiredNoOfVoucherCodes" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
		<asp:TextBox ID="c_textBoxNoOfVoucherCodes" runat="server" MaxLength="5" CssClass="litInputText150"></asp:TextBox>&nbsp;
		<asp:RequiredFieldValidator Display="Dynamic" ID="c_requiredFieldValidatorNoOfVoucherCodes" ControlToValidate="c_textBoxNoOfVoucherCodes" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
		<asp:RangeValidator Display="Dynamic" ID="c_rangeValidatorNoOfVoucherCodes" ControlToValidate="c_textBoxNoOfVoucherCodes" runat="server" ErrorMessage="*" CultureInvariantValues="true" Type="Double" MinimumValue="0" MaximumValue="99999"></asp:RangeValidator></td>
	</tr>
</table>