<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ECommerce_WebUserControls_OrderTotal, Litum.Studio.Web" %>
<div class="lsTabContent">
<table cellpadding="0" cellspacing="0" border="0">
	<%--<tr>
		<td>
			<div class="litBoldHeader2">
				<Foundation:ModuleString ID="ModuleStringOrderTotal" Name="OrderTotal" runat="server" />
				:
			</div>
			<asp:Label runat="server" ID="c_labelOrderTotal" CssClass="litText" />
		</td>
	</tr>--%>
	<tr runat="server" id="c_trDiscounts">
		<td style="padding-top: 10px;">
			<Foundation:InformationGroup runat="server" ID="c_informationGroupDiscounts" Width="250" HeaderText="Discounts">
				<asp:Repeater ID="c_repeaterDiscounts" runat="server">
					<HeaderTemplate>
						<table>
							<tr>
								<td style="width: 150px;">
									<div class="litBoldHeader">
										<Foundation:ModuleString ID="ModuleStringDiscountDescription" Name="Description" runat="server" />
									</div>
								</td>
								<td style="width: 100px; text-align: right;">
									<div class="litBoldHeader">
										<Foundation:ModuleString ID="ModuleStringDiscountAmount" Name="Amount" runat="server" />
									</div>
								</td>
							</tr>
						</table>
					</HeaderTemplate>
					<ItemTemplate>
						<table>
							<tr>
								<td style="width: 150px;">
									<asp:Label runat="server" ID="c_labelDiscountDescription" CssClass="litText" Text='<%#DataBinder.Eval(Container.DataItem, "DiscountDescription")%>' />
								</td>
								<td style="width: 100px; text-align: right;">
									<asp:Label runat="server" ID="c_labelDiscountAmount" CssClass="litText" Text='<%#DataBinder.Eval(Container.DataItem, "DiscountAmountWithVAT", "{0:N}")%>' />
								</td>
							</tr>
						</table>
					</ItemTemplate>
					<FooterTemplate>
						<table>
							<tr>
								<td style="width: 150px;">
									<div class="litBoldHeader">
										<Foundation:ModuleString ID="ModuleStringTotalDiscount" Name="TotalDiscount" runat="server" />
									</div>
								</td>
								<td style="width: 100px; text-align: right;">
									<asp:Label runat="server" ID="c_labelTotalDiscount" CssClass="litText" />
								</td>
							</tr>
						</table>
					</FooterTemplate>
				</asp:Repeater>
			</Foundation:InformationGroup>
		</td>
	</tr>
	<%--<tr>
		<td>
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleStringCampaignDiscount" Name="TotalCampaignDiscount" runat="server" />
				:
			</div>
			<asp:Label runat="server" ID="c_labelCampaignDiscount" CssClass="litText" />
		</td>
	</tr>--%>
	<tr runat="server" id="c_trFees">
		<td style="padding-top: 10px;">
			<Foundation:InformationGroup runat="server" ID="c_informationGroupFees" Width="250" HeaderText="Fees">
				<asp:Repeater ID="c_repeaterFees" runat="server">
					<HeaderTemplate>
						<table>
							<tr>
								<td style="width: 150px;">
									<div class="litBoldHeader">
										<Foundation:ModuleString ID="ModuleStringFeeDescription" Name="Description" runat="server" />
									</div>
								</td>
								<td style="width: 100px; text-align: right;">
									<div class="litBoldHeader">
										<Foundation:ModuleString ID="ModuleStringFeeAmount" Name="Amount" runat="server" />
									</div>
								</td>
							</tr>
						</table>
					</HeaderTemplate>
					<ItemTemplate>
						<table>
							<tr>
								<td style="width: 150px;">
									<asp:Label runat="server" ID="c_labelDescription" CssClass="litText" Text='<%#DataBinder.Eval(Container.DataItem, "Description")%>' />
								</td>
								<td style="width: 100px; text-align: right;">
									<asp:Label runat="server" ID="c_labelAmount" CssClass="litText" Text='<%#DataBinder.Eval(Container.DataItem, "TotalFeeWithVAT", "{0:N}")%>' />
								</td>
							</tr>
						</table>
					</ItemTemplate>
					<FooterTemplate>
						<table>
							<tr>
								<td style="width: 150px;">
									<div class="litBoldHeader">
										<Foundation:ModuleString ID="ModuleStringTotalFee" Name="TotalFee" runat="server" />
									</div>
								</td>
								<td style="width: 100px; text-align: right;">
									<asp:Label runat="server" ID="c_labelTotalFee" CssClass="litText" />
								</td>
							</tr>
						</table>
					</FooterTemplate>
				</asp:Repeater>
			</Foundation:InformationGroup>
		</td>
	</tr>
	<%--<tr>
		<td>
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleStringVAT" Name="OrderVAT" runat="server" />
				:
			</div>
			<asp:Label runat="server" ID="c_labelVAT" CssClass="litText" />
		</td>
	</tr>
	<tr>
		<td>
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleStringGrandTotal" Name="OrderGrandTotal" runat="server" />
				:
			</div>
			<asp:Label runat="server" ID="c_labelGrandTotal" CssClass="litText" />
		</td>
	</tr>--%>
	<tr>
		<td style="padding-top: 10px;">
			<!-- Order Totals -->
            <Foundation:InformationGroup runat="server" ID="c_informationGroupOrderTotals" HeaderText="" Width="250">
                <asp:Panel runat="server" ID="c_panelOrderTotals" Visible="true">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr id="c_rowOrderTotalsOrderTotal" runat="server">
	                        <td style="width: 150px;">
								<div class="litBoldHeader1">
									<Foundation:ModuleString ID="c_moduleStringOrderTotal" Name="OrderTotal" runat="server" />:
								</div>
							</td>
							<td class="order_total_summary" style="padding-top: 10px;">
								<asp:label runat="server" id="c_labelOrderTotal" CssClass="litText" />
							</td>
                        </tr>	
                        <tr id = "c_rowOrderDeliveryCost" runat="server">
							<td>
								<div class="litBoldHeader1">
									<Foundation:ModuleString ID="c_moduleStringDeliveryCost" Name="DeliveryCost" runat="server" />:
								</div>
							</td>
							<td class="order_total_summary" style="padding-top: 10px;">
								<asp:label runat="server" id="c_labelDeliveryCost" CssClass="litText" />
							</td>
                        </tr>
                        <tr id = "c_rowOrderTotalsFees" runat="server">
	                        <td>
								<div class="litBoldHeader1">
									<Foundation:ModuleString ID="c_moduleStringFees" Name="Fees" runat="server" />:
								</div>
							</td>
							<td class="order_total_summary" style="padding-top: 10px;">
								<asp:label runat="server" id="c_labelFees" CssClass="litText" />
							</td>
                        </tr>	
                        <tr id = "c_rowOrderTotalsTotalDiscount" runat="server">
	                        <td>
								<div class="litBoldHeader1">
									<Foundation:ModuleString ID="c_moduleStringTotalDiscount" Name="TotalDiscount" runat="server" />:
								</div>
							</td>
							<td class="order_total_summary" style="padding-top: 10px;">
								<asp:label runat="server" id="c_labelTotalDiscount" CssClass="litText" />
							</td>
                        </tr>
                        <tr id = "c_rowOrderTotalsTotalCampaignDiscount" runat="server">
	                        <td>
								<div class="litBoldHeader1">
									<Foundation:ModuleString ID="c_moduleStringTotalCampaignDiscount" Name="TotalCampaignDiscount" runat="server" />:
								</div>
							</td>
							<td class="order_total_summary" style="padding-top: 10px;">
								<asp:label runat="server" id="c_labelTotlaCampaignDiscount" CssClass="litText" />
							</td>
                        </tr>			                        
                        <tr id = "c_rowOrderTotalsGrandTotal" runat="server">
	                        <td>
								<div class="litBoldHeader1">
									<Foundation:ModuleString ID="c_moduleStringGrandTotal" Name="GrandTotal" runat="server" />:
								</div>
							</td>
							<td class="order_total_summary" style="padding-top: 10px;">
								<b><asp:label runat="server" id="c_labelGrandTotal" CssClass="litText" /></b>
							</td>
                        </tr>
                        <tr id = "c_rowOrderTotalsVat" runat="server">
	                        <td>
								<div class="litBoldHeader1">
									<Foundation:ModuleString ID="c_moduleStringVat" Name="Vat" runat="server" />:
								</div>
							</td>
							<td class="order_total_summary" style="padding-top: 10px;">
								<asp:label runat="server" id="c_labelVat" CssClass="litText" />
							</td>
                        </tr>
                    </table>
                </asp:Panel>
            </Foundation:InformationGroup>
		</td>
	</tr>
</table>
</div>