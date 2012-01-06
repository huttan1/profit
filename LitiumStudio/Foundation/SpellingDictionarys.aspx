<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_CMS_SpellingDictionarys, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="c_toolbar" runat="server">
		<Toolbar:ToolbarItem OnClick="ToolbarItemNew_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconAdd2" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="../Images/transparent.gif" ID="c_toolbarItemNew" runat="server" />
		<Toolbar:DividerItem ImageURL="../Images/transparent.gif" Class="litToolbarDivider"
			runat="server" ID="Divideritem1" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemChange_Click" Enabled="false" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../Images/transparent.gif"
			ID="c_toolbarItemChange" runat="server" />
		<Toolbar:DividerItem ImageURL="../Images/transparent.gif" Class="litToolbarDivider"
			runat="server" ID="Divideritem3" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemDelete_Click" Enabled="false" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../Images/transparent.gif"
			ID="c_toolbarItemDelete" runat="server" />
		<Toolbar:DividerItem ImageURL="../Images/transparent.gif" Class="litToolbarDivider"
			runat="server" ID="Divideritem2" />
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconRefresh" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="../Images/transparent.gif" ID="c_toolbarItemRefresh" runat="server"
			OnClick="ToolbarItemRefresh_Click" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="LitiumStudioContentHeading">
	<Foundation:SystemString runat="server" Name="SpellingDictionarys" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">

	<script language="javascript" type="text/javascript">
		function RowSelected(sender, args) {
			toolbarItemAction("activate", "0_1,0_2");
		}
		function RowDeselected(sender, args) {
			toolbarItemAction("disable", "0_1,0_2");
		}
	</script>

	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_spellingDictionary" ID="m_spellingDictionaryHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid runat="server" ID="m_spellingDictionary">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="Name" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>
