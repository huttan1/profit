<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_GroupCreate5, Litum.Studio.Web" %>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconFoundationGroups" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="c_toolbar" runat="server">
		<Toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="../images/transparent.gif" ID="c_toolbarItemCancel" runat="server" />
		<Toolbar:DividerItem ID="DividerItem1" ImageURL="../images/transparent.gif" Class="litToolbarSpace"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemPrevious_Click" DisabledClass="litToolbarItem"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif"
			ID="c_toolbarItemPrevious" runat="server" />
		<Toolbar:DividerItem ID="DividerItem2" ImageURL="../images/transparent.gif" Class="litToolbarSpace"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif"
			ID="c_toolbarItemNext" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" runat="Server">
	<Telerik:RadAjaxManagerProxy runat="server">
		<AjaxSettings>
			<Telerik:AjaxSetting AjaxControlID="MainContent">
				<UpdatedControls>
					<Telerik:AjaxUpdatedControl LoadingPanelID="LoadingPane" ControlID="MainContent" />
				</UpdatedControls>
			</Telerik:AjaxSetting>
		</AjaxSettings>
	</Telerik:RadAjaxManagerProxy>
	<Telerik:RadAjaxLoadingPanel runat="server" Skin="Windows7" ID="LoadingPane">
	</Telerik:RadAjaxLoadingPanel>
	<Telerik:RadAjaxPanel runat="server" CssClass="lsContentScroll" ID="MainContent">
		<Foundation:InformationGroup runat="server" Width="940px">
			<table>
				<tr>
					<td>
						<div class="litBoldText">
							<Foundation:SystemString ID="SystemString1" Name="SystemUsers" runat="server" />
						</div>
						<LS:GridHelperAjax runat="server" AssociatedControlID="m_user" ID="m_user_Helper"
							OnNeedData="user_NeedData" DataKeyName="ID" FullHeight="false" />
						<Telerik:RadGrid runat="server" ID="m_user" Height="400px" Width="400">
							<MasterTableView runat="server">
								<Columns>
									<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
									<Telerik:GridBoundColumn DataField="Name" HeaderText="Name" />
								</Columns>
							</MasterTableView>
						</Telerik:RadGrid>
					</td>
					<td>
						<asp:Button ID="c_buttonAdd" runat="server" OnClick="c_buttonAdd_Click" CssClass="litInputButton litInputButtonAdd" /><br />
						<br />
						<asp:Button ID="c_buttonRemove" runat="server" OnClick="c_buttonRemove_Click" CssClass="litInputButton litInputButtonRemove" />
					</td>
					<td>
						<div class="litBoldText">
							<Foundation:SystemString ID="SystemString2" Name="UsersOfTheGroup" runat="server" />
						</div>
						<LS:GridHelperAjax runat="server" AssociatedControlID="m_member" ID="m_member_Helper"
							OnNeedData="member_NeedData" DataKeyName="ID" FullHeight="false" />
						<Telerik:RadGrid runat="server" ID="m_member" Height="400px" Width="400">
							<MasterTableView runat="server">
								<Columns>
									<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
									<Telerik:GridBoundColumn DataField="Name" HeaderText="Name2" />
								</Columns>
							</MasterTableView>
						</Telerik:RadGrid>
					</td>
				</tr>
			</table>
		</Foundation:InformationGroup>
	</Telerik:RadAjaxPanel>
</asp:Content>
