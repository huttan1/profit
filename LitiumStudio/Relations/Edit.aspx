<%@ page language="C#" masterpagefile="~/LitiumStudio/Relations/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_Relations_Edit, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/Relations/Framework/Base.master" %>
<%@ Register TagPrefix="MediaArchive" TagName="MediaArchiveDialog" Src="~/LitiumStudio/WebUserControls/MediaArchiveDialog.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="c_toolbarRight" runat="server">
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemCancel" OnClick="ToolbarItemCancel_Click"
			runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server"
			ID="Divideritem2" />
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemSave" OnClick="ToolbarItemSave_Click"
			runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" alt="" runat="server" id="c_imageHeaderIcon" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentRight" runat="Server">
	<Telerik:RadCodeBlock runat="server">
		<script type="text/javascript">
		    var haveVisitOrganizationTab = false;
		    var haveVisitPersonsTab = false;
		    function OnTabSelecting(sender, e) {
		        var tab = e.get_tab();
		        if (tab.get_value() == "PersonRoles" && haveVisitOrganizationTab || tab.get_value() == "Roles" && haveVisitPersonsTab) {
		            tab.set_postBack(true);
		        } else if (tab.get_value() == "Organizations") {
		            haveVisitOrganizationTab = true;
		        } else if (tab.get_value() == "Persons") {
		            haveVisitPersonsTab = true;
		        }
		   }
		</script>
	</Telerik:RadCodeBlock>
	<div class="lsContentTabScroll">
		<LS:TabContainer runat="server" ID="m_tab" OnClientTabSelecting="OnTabSelecting" />
	</div>
	<MediaArchive:MediaArchiveDialog ID="MediaArchiveDialog" runat="server" />
</asp:Content>
