<%@ Page Language="C#" Inherits="Site.ProductCatalog.Templates.ProductECom1" CodeFile="ProductECom1.aspx.cs" %>
<asp:content id="Content1" contentplaceholderid="Content" runat="server">
   <pc:UseProduct runat="server" ID="c_useProduct1" >
	    <div class="product grid_12">
		    
		    <%// Images %>
		    <div class="grid_5 alpha">
			    <%// Main image %>
			    <PC:DisplayImageLink runat="server">
					<PC:DisplayImage runat="server" MaxWidth="300" />
                </PC:DisplayImageLink>
                
                <%// Additional images %>
                <PC:PropertyRepeater runat="server" RenderEmptyTemplate="false">
					<HeaderTemplate>
						<ul class="productimages container">
					</HeaderTemplate>
					<FooterTemplate>
						</ul>
					</FooterTemplate>
                    <ItemTemplate>
						<PC:ValueExists runat="server">
							<OnTrue>
								<pc:PropertyTemplate runat="server">
									<ImageItemTemplate>
										<li class="grid_1">
											<PC:ImageLink runat="server">
												<PC:Image runat="server" MaxWidth="60" />
											</PC:ImageLink>
										</li>
									</ImageItemTemplate>
								</pc:PropertyTemplate>
							</OnTrue>
						</PC:ValueExists>
                    </ItemTemplate>
                </PC:PropertyRepeater>
		    </div>
		    
		    <%// Info %>
		    <div class="grid_7 alpha omega">
		    <% // Render variant group name if variant group, otherwise article display name %>
                <PC:IsVariantGroup runat="server">
                    <OnTrue>
                        <h1><PC:VariantGroupName runat="server" /></h1>
                    </OnTrue>
                    <OnFalse>
                        <h1><PC:DisplayName runat="server" /></h1>
                    </OnFalse>
                </PC:IsVariantGroup>
                
                <%// Render variants %>
                <PC:VariantArticleRepeater runat="server">
                    <HeaderTemplate>
                        <div class="variantarea">
                            <h3><web:WebSiteString runat="server" Name="ProductVariants" /></h3>                            
                            <ul> 
                    </HeaderTemplate>
                    <ItemTemplate>
                            <li class="plain">
                                <PC:ProductLink runat="server">
                                    <PC:DisplayName runat="server" />
                                    <PC:ProductListPriceExists runat="server">
					                    <OnTrue>
                                            <pc:ProductListPrice runat="server" IncludeVatInPrice="true" ShowCampaignPrice="true" />    
                                        </OnTrue>
                                    </PC:ProductListPriceExists>
                                </PC:ProductLink>
                            </li>
                    </ItemTemplate>
                    <FooterTemplate>
                            </ul>
                        </div>                            
                    </FooterTemplate>
                </PC:VariantArticleRepeater>
                
                <div class="buyarea">
					<PC:ProductListPriceExists runat="server">
						<OnTrue>
							<pc:ProductListPrice CssClass="price" runat="server" IncludeVatInPrice="true" ShowCampaignPrice="true" />    
						</OnTrue>
					</PC:ProductListPriceExists>
                    
					    <web:WebSiteString runat="server" Name="ProductQuantity" />
					    <PC:ProductBuyQuantityTextBox runat="server" CssClass="quantity" Text="1" />
					    <pc:ProductBuyButton Name="ProductBuy" runat="server" CssClass="buy" />
				</div>
				
		        <PC:ValueExists runat="server" FieldName="Description">	        
		            <OnTrue>
		                <PC:Text runat="server" FieldName="Description" />
		            </OnTrue>
		        </PC:ValueExists>

	            
	            <%// Render properties, both for variantgroup and variant as well as articles %>
	            <pc:PropertyRepeater runat="server" Exclude="Description">
			        <HeaderTemplate>
						<h2><web:WebSiteString runat="server" Name="ProductSpecification" /></h2>
				        <dl class="specifications">
			        </HeaderTemplate>
			        <FooterTemplate>
				        </dl>
			        </FooterTemplate>
			        <ItemTemplate>
                        <pc:ValueExists runat="server" > 
                            <OnTrue>
                                <pc:PropertyTemplate runat="server">
	                                <ShortTextItemTemplate>
		                                <dt><pc:PropertyName runat="server" /></dt>
		                                <dd><pc:Text runat="server"/></dd>	
	                                </ShortTextItemTemplate>
	                                <LongTextItemTemplate>
	                                    <dt><pc:PropertyName runat="server"/></dt>
		                                <dd><pc:Text runat="server" /></dd>
	                                </LongTextItemTemplate>
	                                <NumberItemTemplate>
		                                <dt><pc:PropertyName runat="server"/></dt>
		                                <dd><pc:Number runat="server" /></dd>
	                                </NumberItemTemplate>
                                    <BooleanItemTemplate>
	                                    <dt><pc:PropertyName runat="server" /></dt>
		                                <dd>
		                                     <pc:Boolean runat="server" >
			                                    <OnTrue><web:WebSiteString runat="server" Name="ProductYes" /></OnTrue>
			                                    <OnFalse><web:WebSiteString runat="server" Name="ProductNo" /></OnFalse>
			                                </pc:Boolean>
		                                </dd>
	                                </BooleanItemTemplate>
	                                <DateTimeItemTemplate>
		                                <dt><pc:PropertyName runat="server" /></dt>
		                                <dd><pc:DateTime runat="server" /></dd>
	                                </DateTimeItemTemplate>
                                    <FileItemTemplate>
		                                <dt><pc:PropertyName runat="server"/></dt>
		                                <dd><pc:FileLink Attachment="true" runat="server" ><pc:FileName runat="server" /></pc:FileLink></dd>
	                                </FileItemTemplate>
	                                <ImageItemTemplate>
		                                <dt><pc:PropertyName runat="server" /></dt>
		                                <dd>
											<pc:ImageLink Attachment="false" target="_blank" runat="server" MaxHeight="3072" MaxWidth="4096">
												<pc:Image runat="server" MaxHeight="15" MaxWidth="15" />
												<pc:ImageName runat="server"/>
											</pc:ImageLink>
		                                </dd>
	                                </ImageItemTemplate>
                                </pc:PropertyTemplate>
                            </OnTrue>
                        </pc:ValueExists>				        
			        </ItemTemplate>
		        </pc:PropertyRepeater>                
		    </div>
	   
			<%// Related products %>
			<div class="grid_12 clear alpha">
				<PC:RelatedRepeater runat="server" RenderEmpty="false">
					<HeaderTemplate>
						<h2><PC:RelationTypeName runat="server" /></h2>
						<ul class="relatedproducts">
					</HeaderTemplate>
					<FooterTemplate>
						</ul>
					</FooterTemplate>
					<ProductTemplate>
						<li class="grid_2">
							<div class="imageholder">
								<PC:ProductLink runat="server">
									<PC:DisplayImage runat="server" MaxWidth="100" MaxHeight="100" />
								</PC:ProductLink>
							</div>
							<PC:ProductLink runat="server">
								<PC:DisplayName runat="server" />
							</PC:ProductLink>
						</li>
					</ProductTemplate>
				</PC:RelatedRepeater>
				
				
				<Ecom:MostSoldArticleRepeater ID="MostSoldArticleRepeater1" runat="server" NumberOfArticles="3" RenderEmpty="false">
                    <HeaderTemplate>
						<h2><web:WebSiteString ID="WebSiteString1" runat="server" Name="ProductPopularProducts" /></h2>
						<ul class="popularproducts">
                    </HeaderTemplate>
                    <FooterTemplate>
						</ul>
                    </FooterTemplate>
                    <ItemTemplate>
                        <li class="grid_1">
							<div class="imageholder">
								<PC:ProductLink ID="ProductLink1" runat="server">
									<PC:DisplayImage ID="DisplayImage1" runat="server" MaxWidth="60" MaxHeight="60" />
								</PC:ProductLink>
                            </div>
                            <PC:ProductLink ID="ProductLink2" runat="server">
                                <PC:DisplayName ID="DisplayName1" runat="server" />
                            </PC:ProductLink>
                        </li>
                    </ItemTemplate>
                </Ecom:MostSoldArticleRepeater>
			</div>
		</div>
    </pc:UseProduct>
</asp:content>