<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ECommerce_WebUserControls_PaymentInfoView, Litum.Studio.Web" %>
            <div class="printBorder">
                    <!-- Payment Info -->
                <Foundation:InformationGroup runat="server" ID="c_informationGroupPaymentInfo" HeaderText = "">
                    <asp:Panel runat="server" ID="c_panelPaymentInfo" Visible="true">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td valign="top">
                            <table border="0" cellspacing="0" cellpadding="0" width="310px">
                                <tr id = "c_rowPaymentInfoTotalExclVAT" runat= "server" visible = "false">
		                            <td style="padding-top:10px;" class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringTotalExclVAT" Name="TotalExclVAT" runat="server" />:</td>
		                            <td style="padding-top:10px;text-align: right;" class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelTotalExclVAT" /></td>
	                            </tr>
                                <tr id = "c_rowPaymentInfoVAT" runat= "server" visible = "false">
		                            <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringTotalVAT" Name="TotalVAT" runat="server" />:</td>
		                            <td style="text-align: right;" class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelTotalVAT" /></td>
	                            </tr>
                                <tr id = "c_rowPaymentInfoTotal" runat= "server" visible = "false">
		                            <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringAmountPaid" Name="TotalIncludingVAT" runat="server" />:</td>
		                            <td style="text-align: right;" class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelAmountPaid" /></td>
	                            </tr>
                                <tr id = "c_rowPaymentInfoPaymentStatus" runat = "server" visible = "false">
		                            <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringPaymentStatus" Name="PaymentStatus" runat="server" />:</td>
		                            <td style="text-align: right;" class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelPaymentStatus" /></td>
	                            </tr>
                                <tr id = "c_rowPaymentInfoPaymentMethod" runat = "server" visible = "false">
		                            <td class="litBoldText lsOrderViewInfoCaption" valign="top" width = "40%"><Foundation:ModuleString ID="c_moduleStringPaymentMethod" Name="PaymentMethod" runat="server" />:</td>
		                            <td style="text-align: right;" class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelPaymentMethod" /></td>
	                            </tr>
	                            <tr id = "c_rowPaymentInfoPaymentProvider" runat = "server" visible = "false">
		                            <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringPaymentProvider" Name="PaymentProvider" runat="server" />:</td>
		                            <td style="text-align: right;" class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelPaymentProvider" /></td>
	                            </tr>    			                       
	                            <tr id = "c_rowPaymentInfoTransactionReference" runat = "server" visible = "false">
		                            <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringTransactionReference" Name="TransactionReference" runat="server" />:</td>
		                            <td style="text-align: right;" class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelTransactionReference" /></td>
	                            </tr>
	                            <tr id = "c_rowPaymentInfoTransactionMessage" runat = "server" visible = "false">
		                            <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringTransactionMessage" Name="TransactionMessage" runat="server" />:</td>
		                            <td style="text-align: right;" class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelTransactionMessage" /></td>
	                            </tr>
	                            <tr id = "c_rowPaymentInfoTransactionNumber" runat = "server" visible = "false">
		                            <td class="litBoldText lsOrderViewInfoCaption" valign="top"><Foundation:ModuleString ID="c_moduleStringTransactionNumber" Name="TransactionNumber" runat="server" />:</td>
		                            <td style="text-align: right;" class="litText lsOrderViewInfo"><asp:label runat="server" id="c_labelTransactionNumber" /></td>
	                            </tr>
	                        </table>
	                        </td>
	                        <td style="padding-left: 29px;" class="printBlock" valign="top">
	                        <table border="0" cellspacing="0" cellpadding="0"  width="310px">
                                <tr id="c_rowBillingAddressEmail" runat="server" visible="false">
                                    <td class="litFormLeft litBoldText" style="padding-top:10px;"><Foundation:ModuleString ID="c_moduleStringEmailBilling" Name="Email" runat="server" />:</td>
                                    <td class="litFormRight litText"><asp:HyperLink id="c_linkBillingEmail" runat="server" class="lsMailLink"><asp:label runat="server" id="c_labelEmailBilling" /></asp:HyperLink></td>
                                </tr>                    
                                <tr id="c_rowBillingAddressRow1" runat="server" visible="false">
                                    <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringAddressRow1Billing" Name="AddressRow1" runat="server" />:</td>
                                    <td class="litFormRight litText"><asp:label runat="server" id="c_labelAddressRow1Billing" /></td>
                                </tr>
                                <tr id="c_rowBillingAddressRow2" runat="server" visible="false">
                                    <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringAddressRow2Billing" Name="AddressRow2" runat="server" />:</td>
                                    <td class="litFormRight litText"><asp:label runat="server" id="c_labelAddressRow2Billing" /></td>


                                        </tr>
                                        <tr id="c_rowBillingAddressZip" runat="server" visible="false">
                                            <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringZipBilling" Name="Zip" runat="server" />:</td>
                                            <td class="litFormRight litText"><asp:label runat="server" id="c_labelZipBilling" /></td>
                                        </tr>  
                                        <tr id="c_rowBillingAddressCity" runat="server" visible="false">
                                            <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringCityBilling" Name="City" runat="server" />:</td>
                                            <td class="litFormRight litText"><asp:label runat="server" id="c_labelCityBilling" /></td>
                                        </tr> 
                                        <tr id="c_rowBillingAddressState" runat="server" visible="false">
                                            <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringStateBilling" Name="State" runat="server" />:</td>
                                            <td class="litFormRight litText"><asp:label runat="server" id="c_labelStateBilling" /></td>
                                        </tr>      
                                        <tr id="c_rowBillingAddressCountry" runat="server" visible="false">
                                            <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringCountyBilling" Name="Country" runat="server" />:</td>
                                            <td class="litFormRight litText"><asp:label runat="server" id="c_labelCountyBilling" /></td>
                                        </tr>                              
                                    </table>
                                    </td>
                                    <td style="padding-left: 29px;"  class="printBlock" valign="top">
                                    <table border="0" cellspacing="0" cellpadding="0"  width="310px">
                                        <tr id="c_rowBillingAddressMobile" runat="server" visible="false">
                                            <td class="litFormLeft litBoldText" style="padding-top:10px"><Foundation:ModuleString ID="c_moduleStringMobileBilling" Name="MobilePhone" runat="server" />:</td>
                                            <td class="litFormRight litText"><asp:label runat="server" id="c_labelMobileBilling" /></td>
                                        </tr>                
                                        <tr id="c_rowBillingAddressPhone" runat="server" visible="false">
                                            <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringHomePhoneBilling" Name="HomePhone" runat="server" />:</td>
                                            <td class="litFormRight litText"><asp:label runat="server" id="c_labelHomePhoneBilling" /></td>
                                        </tr>                                 
                                        <tr id="c_rowBillingAddressFax" runat="server" visible="false">
                                            <td class="litFormLeft litBoldText"><Foundation:ModuleString ID="c_moduleStringFaxBilling" Name="Fax" runat="server" />:</td>
                                            <td class="litFormRight litText"><asp:label runat="server" id="c_labelFaxBilling" /></td>
                                        </tr>                                
                                    </table>
                                    </td>
                                </tr>
                            </table>

                            </asp:Panel>
                        </Foundation:InformationGroup>
                    </div>