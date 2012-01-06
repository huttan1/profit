<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_CMS_WebUserControls_PageResponsibility, Litum.Studio.Web" %>
<Telerik:RadCodeBlock runat="server">
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
</script>
</Telerik:RadCodeBlock>
<LS:GridHelperAjax runat="server" AssociatedControlID="m_pageTypes" ID="m_pageTypesHelper" OnNeedData="m_pageTypesHelper_NeedData" DataKeyName="ID" />
<Telerik:RadGrid runat="server" ID="m_pageTypes" AllowMultiRowSelection="true">
	<ClientSettings>
		<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
	</ClientSettings>
	<MasterTableView runat="server">
		<Columns>
			<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
			<Telerik:GridBoundColumn DataField="Name" />
			<Telerik:GridBoundColumn DataField="Place" />
			<Telerik:GridBoundColumn DataField="LastDate" HeaderStyle-Width="130" />
			<Telerik:GridHyperLinkColumn HeaderStyle-Width="30" DataNavigateUrlFormatString="../Pages.aspx?CMS_SP_ID={0}"
				DataNavigateUrlFields="ID" Text="&lt;img class='litIconNavRightBlue' src='Images/transparent.gif' &gt;" />
		</Columns>
	</MasterTableView>
</Telerik:RadGrid>
