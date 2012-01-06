<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_Relations_SettingsRoleView, Litum.Studio.Web" enableeventvalidation="false" %>

<%@ Register assembly="Litum.Studio.Web"  TagPrefix="FieldDefinitionAdmin" Namespace="Litium.Studio.UI.Relations.FieldTemplates.WebControls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="c_toolbar" runat="server">
		<Toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif"
			ID="c_toolbarItemBack" runat="server" />
		<Toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarDivider"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemEdit_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif"
			ID="c_toolbarItemEdit" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemDelete_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif"
			ID="c_toolbarItemDelete" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ContentPlaceHolderID="LitiumStudioContentHeading" runat="server">
	<asp:Label ID="c_labelHeaderRole" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString1" Name="LabelRoleName" runat="server"/>:</div>
			<asp:Label CssClass="litInputText200" ID="c_labelRoleName" runat="server" />

			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString3" Name="Description" runat="server" />:</div>
			<asp:Label ID="c_labelRoleDescription" runat="server" />

			<div class="litBoldHeader">
				<Foundation:ModuleString runat="server" Name="LabelAssignedRoles" />:</div>
			<asp:Repeater ID="c_repeaterAssignedRole" OnItemDataBound="RepeaterAssignedRole_ItemDataBound"
				runat="server">
				<ItemTemplate>
					<div class="litText">
						<a id="userLink" runat="server"></a>
					</div>
				</ItemTemplate>
			</asp:Repeater>
	</div>
</asp:Content>
