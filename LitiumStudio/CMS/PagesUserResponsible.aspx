<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesUserResponsible, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>
<%@ Register TagPrefix="CMS" TagName="PagesUserResponsibility" Src="~/LitiumStudio/CMS/WebUserControls/PageResponsibility.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <Toolbar:HorizontalToolbar id="c_toolbarTasks" runat="server" ToolbarIndex="1">
		<Toolbar:ToolbarItem OnClick="ToolbarItemDecline_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Enabled="false" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDocumentPinnedDelete" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemDecline" runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarDivider" runat="server" ID="c_toolbarDividerDecline"/>
		<Toolbar:ToolbarItem OnClick="ToolbarItemChange_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Enabled="false" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDocumentPinnedOver" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemChange" runat="server"/>
    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" alt="" class="litIconDocumentPinned" />
	<asp:Label runat="server" ID="c_labelHeader" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
	<script type="text/javascript">
		function ResponsibilitySelected(sender, args, gridHelper) {
			toolbarItemAction("activate", "1_0,1_1");
		}
		function ResponsibilityDeselected(sender, args, gridHelper) {
			var items = gridHelper.GetSelectedKeys();
			if (items.length == 0)
				toolbarItemAction("disable", "1_0,1_1");
		}
	</script>
    <div class="lsContentNoScroll">
		<CMS:PagesUserResponsibility runat="server" ID="c_responsibility" />
    </div>
</asp:Content>