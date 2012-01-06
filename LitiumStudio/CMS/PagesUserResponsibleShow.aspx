<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesUserResponsibleShow, Litum.Studio.Web" %>

<%@ Register TagPrefix="CMS" TagName="PagesUserResponsibility" Src="~/LitiumStudio/CMS/WebUserControls/PageResponsibility.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<asp:Label ID="pageResponsible" runat="server" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="c_toolbar" runat="server">
		<Toolbar:ToolbarItem OnClick="ToolbarItemDecline_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Enabled="false" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDocumentPinnedDelete"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="c_toolbarItemDecline" runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarDivider"
			runat="server" ID="c_toolbarDividerDecline" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemChange_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Enabled="false" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDocumentPinnedOver"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="c_toolbarItemChange" runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarDivider"
			runat="server" ID="c_toolbarDividerBack" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="c_toolbarItemBack" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">

	<script type="text/javascript">
		function ResponsibilitySelected(sender, args, gridHelper) {
			toolbarItemAction("activate", "0_0,0_1");
		}
		function ResponsibilityDeselected(sender, args, gridHelper) {
			var items = gridHelper.GetSelectedKeys();
			if (items.length == 0)
				toolbarItemAction("disable", "0_0,0_1");
		}
	</script>

	<div class="lsContentNoScroll">
		<CMS:PagesUserResponsibility runat="server" ID="c_responsibility" />
	</div>
</asp:Content>
