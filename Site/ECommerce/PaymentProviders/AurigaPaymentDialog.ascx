<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AurigaPaymentDialog.ascx.cs"
	Inherits="LitiumStudio_ECommerce_Panels_AurigaDialog" %>

<asp:UpdatePanel ID="DynamicHolderUpdater" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
	<ContentTemplate>
		<asp:Panel runat="server" ID="AurigaDialog" Style="position: absolute; top: 50px;
			left: 50px;" Visible="false">
			<div class="ie6Overlap3">
				<table cellpadding="0" cellspacing="0" border="0" width="700" class="GridPayPop">
					<thead class="GridPayPopHeader">
						<tr>
							<td style="font-size: 15px; font-family: Arial; font-weight: bold; padding: 10px;"
								colspan="2">
								<Foundation:ModuleString ID="c_moduleStringSSNHeader" Name="SSNHeader" runat="server" />
							</td>
							<td align="right" style="padding: 10px;">
								<asp:ImageButton id="Img1" runat="server" ImageUrl="~/LitiumStudio/Images/ca_dialog/close.gif" OnClick="Close" />
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="font-size: 11px; font-family: Arial; padding: 10px; width: 250px;" valign="top">
								<Foundation:InformationGroup runat="server" ID="c_informationGroupAurigaInformation"
									Width="250" HeaderText="Auriga Information123">
									<table>
										<tr>
											<td>
												<div class="litBoldHeader">
													<Foundation:ModuleString ID="ModuleStringSSN" Name="SSN" runat="server" />
													:
												</div>
												<asp:TextBox ID="c_textboxSSN" runat="server"></asp:TextBox>
											</td>
										</tr>
									</table>
								</Foundation:InformationGroup>
								&nbsp;
								<Foundation:InformationGroup runat="server" ID="c_informationGroupPayment" Width="250"
									HeaderText="Payment Information123">
									<table>
										<tr>
											<td>
												<div class="litBoldHeader">
													<Foundation:ModuleString ID="ModuleStringAmount" Name="Amount" runat="server" />
													:
													<asp:Label ID="c_labelAmount" runat="server" Text="1000"></asp:Label>
												</div>
											</td>
										</tr>
									</table>
								</Foundation:InformationGroup>
							</td>
							<td valign="top" style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px;">
								<Foundation:InformationGroup runat="server" ID="c_informationGroupBilling" Width="250"
									HeaderText="Billing Address123">
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td>
												<div class="litBoldHeader">
													<Foundation:ModuleString ID="ModuleStringBillingFirstName" Name="FirstName" runat="server" />
													:
													<asp:Label ID="c_labelBillingFirstName" runat="server"></asp:Label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="litBoldHeader">
													<Foundation:ModuleString ID="ModuleStringBillingLastName" Name="LastName" runat="server" />
													:
													<asp:Label ID="c_labelBillingLastName" runat="server"></asp:Label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="litBoldHeader">
													<Foundation:ModuleString ID="ModuleStringBillingAddressRow1" Name="AddressRow1" runat="server" />
													:
													<asp:Label ID="c_labelBillingAddressRow1" runat="server"></asp:Label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="litBoldHeader">
													<Foundation:ModuleString ID="ModuleStringBillingAddressRow2" Name="AddressRow2" runat="server" />
													:
													<asp:Label ID="c_labelBillingAddressRow2" runat="server"></asp:Label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="litBoldHeader">
													<Foundation:ModuleString ID="ModuleStringBillingZip" Name="Zip" runat="server" />
													:
													<asp:Label ID="c_labelBillingZip" runat="server"></asp:Label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="litBoldHeader">
													<Foundation:ModuleString ID="ModuleStringBillingCity" Name="City" runat="server" />
													:
													<asp:Label ID="c_labelBillingCity" runat="server"></asp:Label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="litBoldHeader">
													<Foundation:ModuleString ID="ModuleStringBillingCountry" Name="Country" runat="server" />
													:
													<asp:Label ID="c_labelBillingCountry" runat="server"></asp:Label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="litBoldHeader">
													<Foundation:ModuleString ID="ModuleStringBillingPhone" Name="Phone" runat="server" />
													:
													<asp:Label ID="c_labelBillingPhone" runat="server"></asp:Label>
												</div>
											</td>
										</tr>
									</table>
								</Foundation:InformationGroup>
							</td>
							<td valign="top" style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px;">
								<Foundation:InformationGroup runat="server" ID="c_informationGroupDelivery" Width="250"
									HeaderText="Billing Address123">
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td>
												<div class="litBoldHeader">
													<Foundation:ModuleString ID="ModuleStringDeliveryFirstName" Name="FirstName" runat="server" />
													:
													<asp:Label ID="c_labelDeliveryFirstName" runat="server"></asp:Label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="litBoldHeader">
													<Foundation:ModuleString ID="ModuleStringDeliveryLastName" Name="LastName" runat="server" />
													:
													<asp:Label ID="c_labelDeliveryLastName" runat="server"></asp:Label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="litBoldHeader">
													<Foundation:ModuleString ID="ModuleStringDeliveryAddressRow1" Name="AddressRow1"
														runat="server" />
													:
													<asp:Label ID="c_labelDeliveryAddressRow1" runat="server"></asp:Label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="litBoldHeader">
													<Foundation:ModuleString ID="ModuleStringDeliveryAddressRow2" Name="AddressRow2"
														runat="server" />
													:
													<asp:Label ID="c_labelDeliveryAddressRow2" runat="server"></asp:Label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="litBoldHeader">
													<Foundation:ModuleString ID="ModuleStringDeliveryZip" Name="Zip" runat="server" />
													:
													<asp:Label ID="c_labelDeliveryZip" runat="server"></asp:Label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="litBoldHeader">
													<Foundation:ModuleString ID="ModuleStringDeliveryCity" Name="City" runat="server" />
													:
													<asp:Label ID="c_labelDeliveryCity" runat="server"></asp:Label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="litBoldHeader">
													<Foundation:ModuleString ID="ModuleStringDeliveryCountry" Name="Country" runat="server" />
													:
													<asp:Label ID="c_labelDeliveryCountry" runat="server"></asp:Label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="litBoldHeader">
													<Foundation:ModuleString ID="ModuleStringDeliveryPhone" Name="Phone" runat="server" />
													:
													<asp:Label ID="c_labelDeliveryPhone" runat="server"></asp:Label>
												</div>
											</td>
										</tr>
									</table>
								</Foundation:InformationGroup>
							</td>
						</tr>
						<tr class="GridPayPopFooter">
							<td align="right" colspan="3" style="padding: 10px;">
								<asp:Button ID="c_buttonCancel" runat="server" OnClick="Close" Text="Cancel" class="litInputButtonSearch" />
								<asp:Button ID="c_commit" runat="server" OnClick="Complete" CausesValidation="false"
									Text="OK" class="litInputButtonSearch" />
								<asp:HiddenField ID="c_hiddenCurrentOperation" runat="server" />
								<asp:HiddenField ID="c_hiddenOrderId" runat="server" />
							</td>
						</tr>
					</tbody>
				</table>
				<!--[if lte IE 6.5]><iframe id="if" src="blank.html" frameborder="0"></iframe><![endif]-->
			</div>
		</asp:Panel>
	</ContentTemplate>
</asp:UpdatePanel>