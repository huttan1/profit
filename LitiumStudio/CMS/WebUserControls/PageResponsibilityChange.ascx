<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_CMS_WebUserControls_PageResponsibilityChange, Litum.Studio.Web" %>
<Telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
	<script language="javascript" type="text/javascript">
		function RowSelected(sender, args, gridHelper) {
			if (typeof (ResponsibilitySelected) == "function") {
				ResponsibilitySelected(sender, args, gridHelper);
			}
		}
		function RowDeselected(sender, args, gridHelper) {
			if (typeof (ResponsibilityDeselected) == "function") {
				ResponsibilityDeselected(sender, args, gridHelper);
			}
		}
		function SuppressBubbling(evt) {
			if (evt.keyCode == "13") {
				evt.cancelBubble = true;
				evt.returnValue = false;

				if (evt.stopPropagation) {
					evt.stopPropagation();
					evt.preventDefault();
				}
				Update();
			}
		}
		function Update() {
			$find("<%=m_pageResponsibility.ClientID %>").get_masterTableView().rebind(); ;
			return false;
		}
	</script>
</Telerik:RadCodeBlock>
<Telerik:RadSplitter runat="server" Orientation="Horizontal" Height="100%">
	<Telerik:RadPane Height="31" runat="server">
		<div style="width: 35%; float: left; padding-top: 8px; padding-left: 8px;">
			<span class="litBoldText">
				<Foundation:ModuleString ID="ModuleString3" Name="PageResponsible" runat="Server" />
			</span>
		</div>
		<div style="float: right; padding-top: 4px;">
			<asp:TextBox ID="txtSearch" runat="server" Style="vertical-align: middle" onkeydown="SuppressBubbling(event)"></asp:TextBox>
			<asp:ImageButton runat="server" Width="22px" Height="15px" ID="SearchButton" CssClass="lsFastSearchButton"
				OnClientClick="return Update()" ImageUrl="../Images/Transparent.gif" />
		</div>
	</Telerik:RadPane>
	<Telerik:RadPane runat="server">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_pageResponsibility" ID="m_pageResponsibilityHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid runat="server" ID="m_pageResponsibility">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server" ClientDataKeyNames="ID">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="Name" />
					<Telerik:GridBoundColumn DataField="Email" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</Telerik:RadPane>
</Telerik:RadSplitter>