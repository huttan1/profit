<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_Foundation_WebUserControl_GroupEditMemersControl, Litum.Studio.Web" %>
<div class="lsTabContent">
<Telerik:RadAjaxManagerProxy ID="RadAjaxManagerProxy1" runat="server">
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
	<Foundation:InformationGroup ID="InformationGroup1" runat="server" Width="730px">
		<table>
			<tr>
				<td>
					<div class="litBoldText">
						<Foundation:SystemString ID="SystemString1" Name="SystemUsers" runat="server" />
					</div>
					<LS:GridHelperAjax runat="server" AssociatedControlID="m_user" ID="m_user_Helper"
						OnNeedData="user_NeedData" DataKeyName="ID" FullHeight="false" />
					<Telerik:RadGrid runat="server" ID="m_user" Height="400px" Width="300">
						<MasterTableView runat="server">
							<Columns>
								<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
								<Telerik:GridBoundColumn DataField="Name" HeaderText="Name" />
							</Columns>
						</MasterTableView>
					</Telerik:RadGrid>
				</td>
				<td style="padding-left: 8px; padding-right: 4px;">
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
					<Telerik:RadGrid runat="server" ID="m_member" Height="400px" Width="300">
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
</div>