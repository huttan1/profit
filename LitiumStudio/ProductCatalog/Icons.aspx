<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_Icons, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
	<Foundation:ModuleString ID="IconsUsedInPC" Name="IconsUsedInPC" Runat="server"/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <div class="litBoldText">
            <Foundation:ModuleString ID="Articles" Name="Articles" Runat="server"/>
        </div>
           <div class="lsIconContent litText">
                <img alt="" class="litIconArticleGroup" style="vertical-align: middle;" src="Images/transparent.gif"/>
                <Foundation:ModuleString ID="ArticleGroup" Name="ArticleGroup" Runat="server"/>
           </div>                  
           
           <div class="lsIconContent litText">
                <img alt="" class="litIconArticle" style="vertical-align: middle;" src="Images/transparent.gif"/>
                <Foundation:ModuleString ID="Article" Name="Article" Runat="server"/>
           </div>
           
           <div class="lsIconContent litText">
                <img alt="" class="litIconPackageArticle" style="vertical-align: middle;" src="Images/transparent.gif"/>
                <Foundation:ModuleString ID="Package" Name="Package" Runat="server"/>
           </div>
           
            <div class="lsIconContent litText">
                <img alt="" class="litIconVariant" style="vertical-align: middle;" src="Images/transparent.gif"/>
                <Foundation:ModuleString ID="Variant" Name="Variant" Runat="server"/>
           </div>
                   
                   
                   
        <div class="litBoldText" style="padding-top: 20px;">
            <Foundation:ModuleString ID="ProductCatalogHeader" Name="ProductCatalog" Runat="server"/>
        </div>
          <div class="lsIconContent litText">
                <img alt="" class="litIconProductCatalog" style="vertical-align: middle;" src="Images/transparent.gif"/>
                <Foundation:ModuleString ID="ProductCatalog" Name="ProductCatalog" Runat="server"/>
           </div>                  
           
           <div class="lsIconContent litText">
                <img alt="" class="litIconFolderPublished" style="vertical-align: middle;" src="Images/transparent.gif"/>
                <Foundation:ModuleString ID="PublishedProductGroup" Name="PublishedProductGroup" Runat="server"/>
           </div>
           
           <div class="lsIconContent litText">
                <img alt="" class="litIconFolderUnPublished" style="vertical-align: middle;" src="Images/transparent.gif"/>
                <Foundation:ModuleString ID="UnpublishedProductGroup" Name="UnpublishedProductGroup" Runat="server"/>
           </div>
           
           <div class="lsIconContent litText">
                <img alt="" class="litIconFolderIncomplete" style="vertical-align: middle;" src="Images/transparent.gif"/>
                <Foundation:ModuleString ID="UnpublishedProductGroupAndIncoplete" Name="UnpublishedProductGroupAndIncoplete" Runat="server"/>
           </div>
           
            <div class="lsIconContent litText">
                <img alt="" class="litIconProductPublishedListed" style="vertical-align: middle;" src="Images/transparent.gif"/>
                <Foundation:ModuleString ID="ProductPublishedAndAddedToPriceAgents" Name="ProductPublishedAndAddedToPriceAgents" Runat="server"/>
           </div>
           
           <div class="lsIconContent litText">
                <img alt="" class="litIconProductUnpublished" style="vertical-align: middle;" src="Images/transparent.gif"/>
                <Foundation:ModuleString ID="ProductUnpublished" Name="ProductUnpublished" Runat="server"/>
           </div>                 
    </div>
</asp:Content>
