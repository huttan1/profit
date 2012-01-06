<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_Icons, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
	<Foundation:ModuleString ID="IconsUsedInCMS" Name="IconsUsedInCMS" Runat="server"/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <div class="litBoldText">
            <Foundation:ModuleString ID="PageStatus" Name="PageStatus" Runat="server"/>
        </div>
        <div class="lsIconContent litText">                   
            <img alt="" class="litIconPagePublish" style="vertical-align: middle;" src="Images/transparent.gif" />
            <Foundation:ModuleString ID="StatusPublished" Name="StatusPublished" Runat="server"/>
        </div>
        <div class="lsIconContent litText">
            <img alt="" class="litIconPageUnPublish" style="vertical-align: middle;" src="Images/transparent.gif"/>
            <Foundation:ModuleString ID="StatusUnpublished" Name="StatusUnpublished" Runat="server"/>
        </div>
        <div class="lsIconContent litText">
            <img alt="" class="litIconPageTimePublish" style="vertical-align: middle;" src="Images/transparent.gif"/>
            <Foundation:ModuleString ID="StatusTimePublished" Name="StatusTimePublished" Runat="server"/>
        </div>
        <div class="lsIconContent litText">
            <img alt="" class="litIconReadyForPublish" style="vertical-align: middle;" src="Images/transparent.gif"/>
            <Foundation:ModuleString ID="StatusApproved" Name="StatusApproved" Runat="server"/>
        </div>
        <div class="lsIconContent litText">
            <img alt="" class="litIconPageWorkingCopy" style="vertical-align: middle;" src="Images/transparent.gif"/>
            <Foundation:ModuleString ID="StatusWorkingCopy" Name="StatusWorkingCopy" Runat="server"/>
         </div>
        <div class="lsIconContent litText">
            <img alt="" class="litIconHiddenInMenu" style="vertical-align: middle;" src="Images/transparent.gif"/>
            <Foundation:ModuleString ID="StatusHidden" Name="StatusHidden" Runat="server"/>
        </div>
        
        <div class="litBoldText" style="padding-top: 20px;">
            <Foundation:ModuleString ID="DifferentKindsOfPages" Name="DifferentKindsOfPages" Runat="server"/>
        </div>
        <div class="lsIconContent litText">                   
            <img alt="" class="litIconProductCatalog" style="vertical-align: middle;" src="Images/transparent.gif"/>
            <Foundation:ModuleString ID="ProductCatalogPage" Name="ProductCatalogPage" Runat="server"/>
        </div>
        <div class="lsIconContent litText">
            <img alt="" class="litIconFlagUnitedKingdom" style="vertical-align: middle;" src="Images/transparent.gif"/>
            <Foundation:ModuleString ID="TranslatedDefinedByFlag" Name="TranslatedDefinedByFlag" Runat="server"/>
        </div>
        <div class="lsIconContent litText">
            <img alt="" class="litIconTranslate" style="vertical-align: middle;" src="Images/transparent.gif"/>
            <Foundation:ModuleString ID="TranslatedToIntoOtherLanguages" Name="TranslatedToIntoOtherLanguages" Runat="server"/>
        </div>
        <div class="lsIconContent litText">
            <img alt="" class="litIconMasterPage" style="vertical-align: middle;" src="Images/transparent.gif"/>
            <Foundation:ModuleString ID="MasterPage" Name="MasterPage" Runat="server"/>
        </div>
        <div class="lsIconContent litText">
            <img alt="" class="litIconSharedPage" style="vertical-align: middle;" src="Images/transparent.gif"/>
            <Foundation:ModuleString ID="SharedPage" Name="SharedPage" Runat="server"/>
         </div>
    </div>
</asp:Content>
