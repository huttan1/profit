<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesPreview, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
	<toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarPreview" runat="server" >
		<toolbar:ToolbarItem OnClick="ToolbarItemPreviewBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemPreviewBack" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemPreviewSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemPreviewSave" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem3"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemPreviewRestore_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconRecycle" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemPreviewRestore" runat="server"/>	
	</toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" alt="" class="litIconDocumentExchange" />
	<Foundation:ModuleString ID="ModuleString1" name="VersionList" runat="server" /> <span class="litText" style="font-weight:normal;"><asp:Label ID="c_labelVersionName" Runat="server"/></span>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentNoScroll">
        <iframe src="<%=SelectedPagePath%>" class="litModuleIframeWithTreeAreaV2" width="100%" height="100%" scrolling="auto" frameborder="0" id="iframeTest"></iframe>
    </div>
</asp:Content>

