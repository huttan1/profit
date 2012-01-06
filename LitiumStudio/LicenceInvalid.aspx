<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/LitiumStudio.master" autoeventwireup="true" inherits="LitiumStudio_LicenceInvalid, Litum.Studio.Web" %>

<%@ Import Namespace="Litium.Foundation.Modules.CMS" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Framework/LitiumStudio.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" width="16" height="16" class="litIconWarning" style="vertical-align: middle;"
		alt="" /><Foundation:ModuleString Name="LicenceAdmin" runat="server" ID="ModuleString1" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="LitiumStudioContent" runat="Server">
	<div class="lsContentScroll">
		<div class="litBoldText">
			<asp:Label ID="c_labelModuleName" runat="server" />
		</div>
		<br />
		<asp:Label ID="c_labelInvalidLicence" CssClass="litText" runat="server" />
	</div>
</asp:Content>
<%--
<asp:Content ID="Content1" ContentPlaceHolderID="PageContent" Runat="Server">
    <!--Modulikon-->
    <div class="litModuleTopAreaV2">
        <div class="litLeftArea litHeader"></div>
        <div class="litRightArea" style="padding-top:7px;"></div>
    </div>
    <!--Innehåll-->
    <div class="litModuleContentToolbarAreaV2">
    </div>
    <div class="litModuleContentAreaV2">
        <div class="litModuleContentTopAreaV2">
            <div class="litLeftArea litContentTopHeader"><Foundation:ModuleString Name="LicenceAdmin" runat="server" ID="Systemstring10"/></div>
        </div>
        <div class="litModuleContentMainWithPaddingTabAreaV2">
		    
        </div>
    </div>
</asp:Content>--%>