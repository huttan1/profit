<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_EditSettings, Litum.Studio.Web" %>

<%@ Register TagPrefix="w" TagName="UC" Src="~/LitiumStudio/ProductCatalog/WebUserControls/EditSettingsControl.ascx" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
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
	<img src="Images/transparent.gif" class="litIconArticle" alt="" runat="server" id="imageIcon" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentTabScroll">
		<div class="lsTabContainer">
			<WebControls:TabListContainer ID="m_tabs" runat="server">
				<tabitems>
					<WebControls:TabListItem CausesValidation="true" ID="c_tabItemGeneral" OnClick="TabItemGeneral_Click"
						LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink"
						ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent"
						runat="server" />
					<WebControls:TabListItem CausesValidation="true" ID="c_tabItemIncludedArticles" OnClick="TabItemIncludedArticles_Click"
						LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink"
						ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent"
						runat="server" Visible="false" />
					<WebControls:TabListItem CausesValidation="true" ID="c_tabItemPrice" OnClick="TabItemPrice_Click"
						LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink"
						ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent"
						runat="server" Visible="false" />
					<WebControls:TabListItem CausesValidation="true" ID="c_tabItemSettings" OnClick="TabItemSettings_Click"
						LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink"
						ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent"
						runat="server" />
				</tabitems>
			</WebControls:TabListContainer>
			<w:UC runat="server" ID="c_settings" />
		</div>
	</div>
	<Telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
		<script type="text/javascript">
			var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
			var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
			document.onkeypress = function (e) { var key = (window.event) ? window.event.keyCode : e.keyCode; if (key == 27) simulateClick(cancelObject); else if (key == 13) simulateClick(submitObject); }
		</script>
	</Telerik:RadCodeBlock>
</asp:Content>
