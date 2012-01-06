<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_Assortments, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" class="litIconProductCatalog" alt="" /><Foundation:ModuleString
		ID="ModuleString1" Name="CatalogsHeader" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentNoScroll">

		<script type="text/javascript">
			//Buttons
			//1_1 - View 

			function RowSelected(sender, args, gridHelper) {
				setCommonToolbarButtonEnabled('c_toolbarItemView', true);
				setCommonToolbarButtonEnabled('c_toolbarItemDelete', true);
				setCommonToolbarButtonEnabled('c_toolbarItemEdit', true);
			}
			function RowDeselected(sender, args, gridHelper) {
				setCommonToolbarButtonEnabled('c_toolbarItemView', false);
				setCommonToolbarButtonEnabled('c_toolbarItemDelete', false);
				setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
			}			
		</script>

		<LS:GridHelperAjax runat="server" AssociatedControlID="c_catalogGrid" ID="c_catalogGridHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid AllowPaging="true" runat="server" ID="c_catalogGrid">
			<ClientSettings>
				<Selecting AllowRowSelect="true" />
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server" ClientDataKeyNames="ID">
				<Columns>
					<Telerik:GridBoundColumn DataField="CatalogName" HeaderStyle-Width="20%" />
					<Telerik:GridBoundColumn DataField="ProductCount" HeaderStyle-Width="20%" />
					<Telerik:GridBoundColumn DataField="PublishedCount" HeaderStyle-Width="20%" />
					<Telerik:GridBoundColumn DataField="UnpublishedCount" HeaderStyle-Width="20%" />
					<Telerik:GridBoundColumn DataField="ProductsGroups" HeaderStyle-Width="20%" />
					<Telerik:GridBoundColumn DataField="ID" Display="false"/>
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>
