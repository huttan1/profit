<%@ Control Language="C#" AutoEventWireup="true" CodeFile="XAmountOffView.ascx.cs" Inherits="LitiumStudio_ECommerce_WebUserControls_Campaigns_XAmountOffView" %>
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td><div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringExceedAmount" Name="CampaignUserControlExceedAmount" runat="server" />:</div>
		    <asp:Label ID="c_labelExceedAmount" runat="server"></asp:Label>
		</td>
	</tr>
	<tr>
		<td><div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringXAmount" Name="CampaignUserControlXPercentOffXAmount" runat="server" />:</div>
		    <asp:Label ID="c_labelXAmount" runat="server"></asp:Label>
		</td>
	</tr>
</table>