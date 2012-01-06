<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VoucherMultiUseView.ascx.cs" Inherits="LitiumStudio_ECommerce_WebUserControls_Campaigns_VoucherMultiUseView" %>
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td><div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringExceedAmount" Name="CampaignUserControlExceedAmount" runat="server" />:</div>
		    <asp:Label ID="c_labelExceedAmount" runat="server" CssClass="litText"></asp:Label>
		</td>
	</tr>
	<tr>
		<td>
			<div runat="server" id="c_divAmountDiscount">
			    <div class="litBoldHeader"><Foundation:ModuleString ID="m_moduleStringAmountDiscount" Name="CampaignUserControlAmountDiscount" runat="server" />:</div>
			    <asp:Label ID="c_labelAmountDiscount" runat="server" CssClass="litText"></asp:Label>	
            </div>
            <div runat="server" id="c_divPercentageDiscount">
			    <div class="litBoldHeader"><Foundation:ModuleString ID="m_moduleStringPercentageDiscount" Name="CampaignUserControlPercentageDiscount" runat="server" />:</div>
			    <asp:Label ID="c_labelPercentageDiscount" runat="server" CssClass="litText"></asp:Label>	
			</div>
			<div runat="server" id="c_divVoucherCodes">
			    <table cellpadding="0" cellspacing="0">
			    <asp:DataList ID="c_dataListVoucherCodes" runat="server" CellPadding="5">
					<HeaderTemplate><tr><td><div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringVoucherCode" Name="CampaignUserControlVoucherCode" runat="server" /></div></td><td><div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringFrequency" Name="CampaignUserControlFrequency" runat="server" /></div></td></tr></HeaderTemplate>
			        <ItemTemplate><tr>
			            <td><asp:Label ID="c_labelVoucherCode" runat="server" CssClass="litText" Text='<%# DataBinder.Eval(Container.DataItem, "VoucherCode") %>'></asp:Label></td>
			            <td><asp:Label ID="c_labelFrequency" runat="server" CssClass="litText" Text='<%# DataBinder.Eval(Container.DataItem, "UsedCount") %>'></asp:Label></td>
			        </tr></ItemTemplate>
			    </asp:DataList>
			    </table>
			</div>
		</td>
	</tr>
</table>