<%@ page language="C#" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_VariantGroupAdd1, Litum.Studio.Web" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>

<%@ Register TagPrefix="w" TagName="UC" Src="~/LitiumStudio/ProductCatalog/WebUserControls/EditSettingsControl.ascx" %>
<asp:content id="Content1" contentplaceholderid="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="c_toolbarRight" runat="server">
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateAbort" OnClick="ToolbarItemAbort_Click"
			runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server"
			ID="Divideritem2" />
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemSave" OnClick="ToolbarItemSave_Click"
			runat="server"  Visible="false"/>
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateNext" OnClick="ToolbarItemNext_Click"
			runat="server" CausesValidation="true" />
	</Toolbar:HorizontalToolbar>
</asp:content>
<asp:content id="Content2" contentplaceholderid="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" class="litIconProductGroup" alt="" runat="server" id="c_imageIcon" />
	<asp:Label ID="c_label" runat="server" />
	<span class="litTextNormalWeight">
		&nbsp;<asp:Label ID="c_labelSteps" runat="server" />
	</span>
</asp:content>
<asp:content id="Content3" contentplaceholderid="ContentRight" runat="Server">
	<div class="lsContentScroll">
		<w:UC runat="server" ID="c_settings" />
	</div>
</asp:content>
