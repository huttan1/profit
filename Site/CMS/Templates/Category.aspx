<%@ Page Language="C#" CodeFile="Category.aspx.cs" Inherits="Site.CMS.Templates.Category" %>
<%@ Register TagPrefix="ExtensionsMetadata" Namespace="Litium.Extensions.Metadata.WebControls"
	Assembly="Litium.Extensions" %>
<asp:Content ContentPlaceHolderID="Content" runat="server">
       
	<div id="primary" class="grid_3_6 alpha">  
    
       <ExtensionsMetadata:MetadataPageRepeater ID="c_metadataPageRepeater" IncludeStartNode="true"
        UsePageing="true" OnInit="OnInit_MetadataPageRepeater" OnPreRender="OnPreRender_MetadataPageRepeater" runat="server">
        <ItemTemplate>
        <div class="item">
	            <div class="item_holder">
                  <web:PageLink ID="PageLink1" runat="server">  <h1 class="item_title"><web:Text Name="Title" runat="server" /></h1> 
                  </web:PageLink>
                        <div class="item_info">
                            <p>
                                <span class="item_info_by">written by <web:PublishedBy ID="PublishedBy1" runat="server" /> </span>
                                <span class="item_info_date"><web:DateTime ID="DateTime1" Name="Date" runat="server" /></span>
                                <span class="item_info_comments"></span>
                            </p>
                        </div>
                        <div class="item_content">                        
                            <web:Text ID="Text1" Name="Text" runat="server" />
                        </div>
                        <div class="item_picture">
                            <web:PageLink ID="PageLink2" runat="server">
                                <web:Image ID="Image1" Name="Image" runat="server" MaxWidth="325" MaxHeight="250"  />
                            </web:PageLink>
                        </div>
                        <div style="clear:both;"></div>
                           <div class="item_info">
                                <p>
                                <web:PageLink ID="PageLink3" runat="server" CssClass="item_link_readmore">
                                Read More
                                </web:PageLink>
                                <br />
                                    <span class="item_info_true">77% true</span>
                                    <span class="item_info_untrue">23% false</span>
                            
                                </p>
                           </div>
                </div>                
        </div>
        </ItemTemplate>
    </ExtensionsMetadata:MetadataPageRepeater>
    <Plus:Pager runat="server" CssClass="pagination" ID="c_pagerMetadataPageRepeater" PageSize="10" AllwaysShowPrevNextButtons="true"
        ShowFirstAndLastButtons="true" />

	</div>
	
	
	<div id="tertiary" class="grid_3 omega">
           <div class="itemleft">
        <site:Filter ID="Filter1" runat="server" />
        </div>		
		
		<br />
		<web:ValueExists Name="ImageBanner1" runat="server">
			<OnTrue>
				<div class="itemleft">
					<web:ValueExists Name="ImageBanner1LinkExternal" runat="server">
						<OnTrue>
								<a href="<web:Text Name='ImageBanner1LinkExternal' />"> 
									<web:Image Name="ImageBanner1" runat="server" />		
								</a>
							<web:ValueExists runat="server" Name="ImageBanner1Text">
								<OnTrue>
									<web:Text Name="ImageBanner1Text" runat="server" />
								</OnTrue>
							</web:ValueExists>
						</OnTrue>
						<OnFalse>
							<web:PageLink runat="server" Name="ImageBanner1Link">
								<web:Image Name="ImageBanner1" MaxWidth="235" runat="server" />
							</web:PageLink>
						<web:ValueExists runat="server" Name="ImageBanner1Text">
							<OnTrue>
								<web:Text Name="ImageBanner1Text" runat="server" />
							</OnTrue>
						</web:ValueExists>
						</OnFalse>
						</web:ValueExists>		
				</div>
			</OnTrue>
		</web:ValueExists>
	</div>
	


</asp:Content>