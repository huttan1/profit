<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" enableeventvalidation="False" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_VariantGroupAdd2, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<%@ Register TagPrefix="w" TagName="UC" Src="~/LitiumStudio/ProductCatalog/WebUserControls/EditGeneralControl.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="c_toolbarRight" runat="server">
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateAbort" OnClick="ToolbarItemAbort_Click"
			runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server"
			ID="Divideritem3" />
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateSave" OnClick="ToolbarItemCreateSave_Click"
			runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server"
			ID="Divideritem2" />
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemCreatePrevious" runat="server"
			OnClick="ToolbarItemPrev_Click" runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server"
			ID="Divideritem1" />
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateNext" OnClick="ToolbarItemNext_Click"
			runat="server" CausesValidation="true" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" class="litIconProductGroup" alt="" runat="server"
		id="c_imageIcon" />
	<asp:Label ID="c_label" runat="server" />
	<span class="litTextNormalWeight">&nbsp;
		<asp:Label ID="c_labelSteps" runat="server" />
	</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
		<w:UC runat="server" ID="c_general" />
	</div>
    <script type="text/javascript">
        function DisableToolbarWhileHtmlEditorLoad() {
            toolbarItemAction("disable", "1_1,1_2,1_3");
        }
        function EnableToolbarAfterHtmlEditorLoad() {
            toolbarItemAction("activate", "1_1,1_2,1_3");
        }
    </script>
</asp:Content>
