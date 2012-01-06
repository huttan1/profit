<%@ Page Language="C#" CodeFile="~/Site/ProductCatalog/Templates/ProductGroupECom1.aspx.cs" Inherits="Site.ProductCatalog.Templates.ProductGroupECom1" %>
<asp:content id="Content1" contentplaceholderid="Content" runat="Server">
<div class="productgroup grid_12">
    <div class="grid_5 alpha">
    	<pc:DisplayImage runat="server" MaxWidth="370" MaxHeight="300" />
	</div>
	<div class="grid_7 alpha omega">	
	    <h1><pc:DisplayName runat="server" /></h1>
        <PC:ValueExists runat="server" FieldName="Description">	        
            <OnTrue>
                <PC:Text runat="server" FieldName="Description" />
            </OnTrue>	    
        </PC:ValueExists>
        
        <%// Render properties, excluding description that are shown above %>        	    
		<pc:PropertyRepeater runat="server" RenderEmptyTemplate="false" Exclude="Description">
			<HeaderTemplate>
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
			                                    <OnTrue><web:WebSiteString runat="server" Name="ProductGroupYes" /></OnTrue>
			                                    <OnFalse><web:WebSiteString runat="server" Name="ProductGroupNo" /></OnFalse>
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
    <div class="clear"></div>        
	
		<%// Repeat product groups %>
	    <pc:ProductGroupRepeater runat="server" ShowEmptyGroups="true">
			<HeaderTemplate>
			    <hr />
			    <h2><web:WebSiteString runat="server" Name="ProductGroupSubGroups" /></h2>
				<ul class="productgroups container">
			</HeaderTemplate>
    		<FooterTemplate>
    			</ul>
    		</FooterTemplate>
    		<ItemTemplate>
			    <li class="grid_2">
    				<pc:ProductGroupLink runat="server" ShowEmptyGroup="true"><pc:DisplayImage MaxWidth="130" MaxHeight="140" runat="server" /></pc:ProductGroupLink>
					<pc:ProductGroupLink runat="server" ShowEmptyGroup="true"><pc:DisplayName runat="server" /></pc:ProductGroupLink>
			    </li>
		    </ItemTemplate>
	    </pc:ProductGroupRepeater>
	    
	    <%// Repeat products %>
	    <pc:ProductRepeater ID="m_productRepeater" runat="server">
			<HeaderTemplate>
			    <hr />
			    <h2><web:WebSiteString runat="server" Name="ProductGroupProducts" /></h2>
				<ul class="products container">
			</HeaderTemplate>
    		<FooterTemplate>
    			</ul>
    		</FooterTemplate>
		    <ItemTemplate>
    			<li class="grid_2">
					<div class="imageholder">
					    <PC:DisplayImageExists runat="server">
					        <OnTrue>
						        <pc:ProductLink runat="server">
							        <pc:DisplayImage MaxHeight="130" MaxWidth="140" runat="server" />
						        </pc:ProductLink>
						    </OnTrue>
						</PC:DisplayImageExists>
				    </div>
					<h2>
						<pc:ProductLink runat="server">
							<pc:DisplayName runat="server" />
						</pc:ProductLink>
					</h2>
                    <PC:IsArticle runat="server">
                        <OnTrue>
						    <div class="buyarea">
							    <pc:ProductBuyButton Name="ProductGroupBuy" runat="server" CssClass="buy" />
							    <pc:ProductListPrice IncludeVatInPrice="true" runat="server" DisplayCurrencySymbol="true" ShowCampaignPrice="true" />
						    </div>
                        </OnTrue>
                    </PC:IsArticle>
			    </li>
		    </ItemTemplate>
	    </pc:ProductRepeater>
	    <site:Paging ID="Paging" runat="server" />
	</div>
</asp:content>