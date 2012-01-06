<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VoucherSingleUseView.ascx.cs" Inherits="LitiumStudio_ECommerce_WebUserControls_Campaigns_VoucherSingleUseView" %>
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
			<div runat="server" id="c_divNoOfVoucherCodes">
			    <div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringNoOfVoucherCodes" Name="NoOfVoucherCodes" runat="server" />:</div>
			    <asp:Label ID="c_labelNoOfVoucherCodes" runat="server" CssClass="litText"></asp:Label>	
			</div>
			<div runat="server" id="c_divVoucherCodes">
			    <div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringVoucherCodes" Name="VoucherCodes" runat="server" />:</div>
			    <asp:DataList ID="c_dataListVoucherCodes" runat="server" RepeatColumns="2" CellPadding="5">
			        <ItemTemplate>
			            <asp:Label ID="c_labelValue" runat="server" CssClass="litText" Text='<%# DataBinder.Eval(Container.DataItem, "VoucherCode") %>'></asp:Label>
			        </ItemTemplate>
			    </asp:DataList>	
			</div>
		</td>
	</tr>
</table>