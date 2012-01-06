<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GiveawayView.ascx.cs" Inherits="LitiumStudio_ECommerce_WebUserControls_Campaigns_GiveawayView" %>
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td><div class="litBoldHeader"><Foundation:ModuleString ID="m_moduleStringProductY" Name="CampaignUserControlGiveawayProductY" runat="server" />:</div>
		    <asp:Label ID="c_labaleProductY" runat="server" CssClass="litText"></asp:Label>
		</td>
	</tr>	
	<tr>
		<td><div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringExceedAmount" Name="CampaignUserControlExceedAmount" runat="server" />:</div>
		<asp:Label ID="c_lableBoxExceedAmount" runat="server" CssClass="litText"></asp:Label>	
		</td>
	</tr>
	<tr>
		<td><div class="litBoldHeader"><Foundation:ModuleString ID="m_moduleStringMaxQuantityPerShoppingCart" Name="CampaignMaxQuantityPerShoppingCart" runat="server" />:</div>
		<asp:Label ID="c_lableMaxQuantity" runat="server" CssClass="litText"></asp:Label>	
		</td>
	</tr>
</table>