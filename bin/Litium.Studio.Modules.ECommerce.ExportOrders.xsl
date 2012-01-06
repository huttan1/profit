
<xsl:stylesheet version="2.0" exclude-result-prefixes="xs xdt err fn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:err="http://www.w3.org/2005/xqt-errors">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<ArrayOfOrderCarrier>
			<xsl:for-each select="ArrayOfOrderCarrier/OrderCarrier">
				<OrderCarrier>
					<ExternalOrderId>
						<xsl:value-of select="ExternalOrderID"/>
					</ExternalOrderId>
					<OrderStatus>
						<xsl:variable name="m_orderStatus">
							<xsl:value-of select="OrderStatus"/>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="$m_orderStatus=0">Init </xsl:when>
							<xsl:when test="$m_orderStatus=1">Confirmed</xsl:when>
							<xsl:when test="$m_orderStatus=2">Processing</xsl:when>
							<xsl:when test="$m_orderStatus=3">Completed</xsl:when>
							<xsl:when test="$m_orderStatus=4">Cancelled</xsl:when>
							<xsl:when test="$m_orderStatus=5">Returned</xsl:when>
							<xsl:when test="$m_orderStatus=6">Attention</xsl:when>
							<xsl:otherwise>Invalid</xsl:otherwise>
						</xsl:choose>
					</OrderStatus>
					<OrderDate>
						<xsl:value-of select="OrderDate"/>
					</OrderDate>
					<Total>
						<xsl:value-of select="Total"/>
					</Total>
					<TotalDeliveryCost>
						<xsl:value-of select="TotalDeliveryCost"/>
					</TotalDeliveryCost>
					<TotalFee>
						<xsl:value-of select="TotalFee"/>
					</TotalFee>
					<TotalVAT>
						<xsl:value-of select="TotalVAT"/>
					</TotalVAT>
					<TotalDiscount>
						<xsl:value-of select="TotalDiscount"/>
					</TotalDiscount>
					<TotalCampaignDiscount>
						<xsl:value-of select="TotalCampaignDiscount"/>
					</TotalCampaignDiscount>
					<OrderGrandTotal>
						<xsl:value-of select="GrandTotal"/>
					</OrderGrandTotal>
					<PaymentStatus>
						<xsl:variable name="m_paymentStatus">
							<xsl:value-of select="PaymentInfo/PaymentInfoCarrier/PaymentStatus"/>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="$m_paymentStatus=0">Init</xsl:when>
							<xsl:when test="$m_paymentStatus=1">InitiatedReserve</xsl:when>
							<xsl:when test="$m_paymentStatus=2">Reserved</xsl:when>
							<xsl:when test="$m_paymentStatus=3">InitiatedCompleteTransaction</xsl:when>
							<xsl:when test="$m_paymentStatus=4">InitiatedDirectPayment</xsl:when>
							<xsl:when test="$m_paymentStatus=5">Paid</xsl:when>
							<xsl:when test="$m_paymentStatus=6">ReserveFailed</xsl:when>
							<xsl:when test="$m_paymentStatus=7">CompleteFailed</xsl:when>
							<xsl:when test="$m_paymentStatus=8">DirectPaymentFailed</xsl:when>
							<xsl:when test="$m_paymentStatus=9">InitiateCancel</xsl:when>
							<xsl:when test="$m_paymentStatus=10">Cancelled</xsl:when>
							<xsl:when test="$m_paymentStatus=12">InitializeCaptureTransaction</xsl:when>
							<xsl:when test="$m_paymentStatus=13">Returned</xsl:when>
							<xsl:when test="$m_paymentStatus=14">ReturnFailed</xsl:when>
							<xsl:otherwise>Unknown</xsl:otherwise>
						</xsl:choose>
					</PaymentStatus>
					<PaymentAmount>
						<xsl:value-of select="PaymentInfo/PaymentInfoCarrier/Amount"/>
					</PaymentAmount>
					<PaymentVatAmount>
						<xsl:value-of select="PaymentInfo/PaymentInfoCarrier/VATAmount"/>
					</PaymentVatAmount>
					<PaymentProvider>
						<xsl:value-of select="PaymentInfo/PaymentInfoCarrier/PaymentProvider"/>
					</PaymentProvider>
					<PaymentMethod>
						<xsl:variable name="m_provider">
							<xsl:value-of select="PaymentInfo/PaymentInfoCarrier/PaymentProvider"/>
						</xsl:variable>
						<xsl:variable name="m_paymentMethod">
							<xsl:value-of select="PaymentInfo/PaymentInfoCarrier/PaymentMethod"/>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="$m_provider='Kreditor'">
								<xsl:choose>
									<xsl:when test="$m_paymentMethod=1">Invoice</xsl:when>
									<xsl:otherwise>Undefined</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="$m_provider='PayEx'">
								<xsl:choose>
									<xsl:when test="$m_paymentMethod=1">CreditCard</xsl:when>
									<xsl:when test="$m_paymentMethod=2">DirectBank</xsl:when>
									<xsl:when test="$m_paymentMethod=7">Invoice</xsl:when>
									<xsl:otherwise>Undefined</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="$m_provider='DirectPay'">
								<xsl:choose>
									<xsl:when test="$m_paymentMethod=1">DirectPayment</xsl:when>
									<xsl:when test="$m_paymentMethod=2">Prepayment</xsl:when>
									<xsl:otherwise>Undefined</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="$m_provider='Auriga'">
								<xsl:choose>
									<xsl:when test="$m_paymentMethod=1">Invoice</xsl:when>
									<xsl:when test="$m_paymentMethod=6">CardPaymentSweden</xsl:when>
									<xsl:otherwise>Undefined</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="$m_provider='Dibs'">
								<xsl:choose>
									<xsl:when test="$m_paymentMethod=2">CC_CEKAB</xsl:when>
									<xsl:when test="$m_paymentMethod=7">CC_PAGO</xsl:when>
									<xsl:when test="$m_paymentMethod=10">CC_TEST</xsl:when>
									<xsl:otherwise>Undefined</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>Invalid</xsl:otherwise>
						</xsl:choose>
					</PaymentMethod>
					<PaymentDate>
						<xsl:value-of select="PaymentInfo/PaymentInfoCarrier/PaymentDate"/>
					</PaymentDate>
					<DeliveryStatus>
						<xsl:variable name="m_deliveryStatus">
							<xsl:value-of select="Deliveries/DeliveryCarrier/DeliveryStatus"/>
						</xsl:variable>											
						<xsl:choose>
							<xsl:when test="$m_deliveryStatus='0'">Init</xsl:when>
							<xsl:when test="$m_deliveryStatus='1'">Delivered</xsl:when>
							<xsl:when test="$m_deliveryStatus='2'">Failed</xsl:when>
							<xsl:when test="$m_deliveryStatus='3'">Cancelled</xsl:when>
							<xsl:otherwise>NotDefined</xsl:otherwise>
						</xsl:choose>
						
					</DeliveryStatus>
				</OrderCarrier>
			</xsl:for-each>
		</ArrayOfOrderCarrier>
	</xsl:template>
</xsl:stylesheet>
