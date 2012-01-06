<%@ page language="C#" masterpagefile="~/LitiumStudio/ECommerce/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_ECommerce_ViewCampaign, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ECommerce/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    
    <ComponentArt:ToolBar ID="c_toolbarViewCampaign"
        OnItemCommand="c_toolbarViewCampaign_ItemCommand" runat="server" 
        CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew" 
        DefaultItemHoverCssClass="litToolbarItemOnMouseOver" 
        DefaultItemActiveCssClass="litToolbarItemOnMouseDown" 
        DefaultItemDisabledCssClass="litToolbarItemDisabled" 
        ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false" 
        Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
        <Items runat="server">
            <ComponentArt:ToolBarItem ID="c_toolbarItemBack" runat="server" ImageUrl="icons_standard/arrow_left_blue_16px.png"
            AutoPostBackOnSelect = "true" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
        </Items>
        <ClientTemplates>
		    <ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemButtonTemplate">
		        <table cellspacing="0" cellpadding="0" border="0" style="margin: 0px; margin-right: auto;">
		            <tbody>
		                <tr>
		                    <td class="ToolbarItemLeft">
		                        &nbsp;
		                    </td>
		                    <td class="ca_tb_img ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##" alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
		                    </td>
		                    <td class="ca_tb_txt ToolbarItemMain">
		                        <nobr>## DataItem.get_text() ##</nobr>
		                    </td>
		                    <td class="ToolbarItemRight">
		                        &nbsp;
		                    </td>
		                </tr>
		            </tbody>
		         </table>			       
		    </ComponentArt:ClientTemplate>
		</ClientTemplates> 
    </ComponentArt:ToolBar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td valign="middle" style="height:34px;" class="litPageStatusHeaderV2">
                <span class="litContentTopHeader">
                <Foundation:ModuleString ID="c_moduleStringHeader" Name="Campaign" runat="server" />:<asp:Label runat="server" ID="c_labelHeader" class="litPageStatusHeaderV2"/></span> 
            </td>
        </tr>
    </table>   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
       <div class="lsContentScroll">
        
        
        <!--[if IE 6]>
        <table cellpadding="15" width="98%" cellspacing="0" border="0" class="litModuleContentMainWithPaddingTabAreaVIE7">
        <![endif]-->
        <!--[if IE 7]>
        <table cellpadding="15" width="98%" cellspacing="0" border="0" class="litModuleContentMainWithPaddingTabAreaVIE7">
        <![endif]-->
        <!--[if IE 8]>
        <table cellpadding="15" width="100%" cellspacing="0" border="0" class="litModuleContentWithTreeMainUnderTabAreaV2">
        <![endif]-->
        <!--[if !IE]>-->
        <table width="100%" cellspacing="0" border="0" >
        <!--<![endif]-->        
            <tr>
                <td valign = "top">
                <div style="padding-bottom: 15px;">
                    <Foundation:InformationGroup runat="server" ID="c_informationGroupCampaign" Width="250" HeaderText="PaymentInfo123">
                        <table>
                             <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringId" Name="CampaignReadableID" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelID" runat="server" CssClass="litText"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringName" Name="CampaignName" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelName" runat="server" CssClass="litText"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringDescription" Name="CampaignDescription" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelDescription" runat="server" CssClass="litText"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringType" Name="CampaignType" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelCampignType" runat="server" CssClass="litText"></asp:Label>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringCurrency" Name="Currency" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelCurrency" runat="server" CssClass="litText"></asp:Label>
                                </td>
                            </tr>
							
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringExclusive" Name="CampaignExclusive" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelExclusive" runat="server" CssClass="litText"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringActive" Name="CampaignActive" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelActive" runat="server" CssClass="litText"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </Foundation:InformationGroup> 
                    </div>               
                </td>
            </tr>
            <tr>
                <td valign = "top">
                    <div style="padding-bottom: 15px;">
                    <Foundation:InformationGroup runat="server" ID="c_InformationGroupValidFor" Width="250" HeaderText="CampaignValidFor">
                        <table>
                             <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringCampaignPeriod" Name="CampaignPeriod" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelStartDate" runat="server" CssClass="litText"></asp:Label>-
                                    <asp:Label ID="c_labelEndDate" runat="server" CssClass="litText"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringArticles" Name="CampaignProducts" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelArticles" runat="server" CssClass="litText"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringProductGroups" Name="CampaignProductGroups" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelProductGroups" runat="server" CssClass="litText"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringProductCatalogs" Name="CampaignProductCatalogs" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelProductCatalogs" runat="server" CssClass="litText"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringGroups" Name="CampaignGroups" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelGroupsInRelations" runat="server" CssClass="litText"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </Foundation:InformationGroup>  
                    </div>              
                </td>
            </tr>
            <tr>
                <td valign = "top">
                    <Foundation:InformationGroup runat="server" ID="c_informationGroupOtherInfo" Width="250" HeaderText="OtherInfo">
                        <asp:PlaceHolder ID="c_placeHolderUserControl" runat="server">
							<Foundation:ModuleString ID="m_moduleStringControlLoadError" Name="CampaignUserControlError" runat="server" Visible="false"/>
						</asp:PlaceHolder>
                    </Foundation:InformationGroup>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

