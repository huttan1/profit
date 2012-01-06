<xsl:stylesheet version="2.0" exclude-result-prefixes="xs xdt err fn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:err="http://www.w3.org/2005/xqt-errors">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template name="Traverse">
		<xsl:comment>Traverse Tree</xsl:comment>
	</xsl:template>
	<xsl:template match="/">
		<Assortment>
			<xsl:for-each select="//ProductGroup">
			<ProductGroup>
				<xsl:for-each select="//Product">
					<Product>
						<ProductID>
							<xsl:value-of select="@ID"/>
						</ProductID>
					</Product>
				</xsl:for-each>
			</ProductGroup>
			</xsl:for-each>
		</Assortment>
	</xsl:template>
</xsl:stylesheet>
