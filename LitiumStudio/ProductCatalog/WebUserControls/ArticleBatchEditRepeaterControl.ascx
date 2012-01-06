<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_WebUserControls_ArticleBatchEditRepeaterControl, Litum.Studio.Web" %>
<%@ Register TagPrefix="MediaArchive" TagName="MediaArchiveDialog" Src="~/LitiumStudio/WebUserControls/MediaArchiveDialog.ascx" %>
<Telerik:RadCodeBlock runat="server">

	<script type="text/javascript">
		function ReloadEditArticleGrid() {
			$find("<%=c_articleGrid.ClientID %>").get_masterTableView().rebind();
		}
		function AddArticle_EditArticleGrid() {
			var masterTable = $find('<%= c_articleGrid.MasterTableView.ClientID %>');
			if (masterTable._virtualItemCount <= 0) {
				masterTable.showInsertItem();				
			}
			else {
				masterTable.fireCommand("ShowInsertItemOwn", "");
			}
		}
	</script>

	<style type="text/css">
		.rgEditRow td
		{
			height: 350px;
		}
		.rgEditRow td td 
		{
			height: auto;
		}
		.rgRow td, .rgAltRow td, .rgEditRow td
		{
			vertical-align: top;
		}
	</style>
</Telerik:RadCodeBlock>
<LS:GridHelperAjax runat="server" AssociatedControlID="c_articleGrid" OnNeedData="Grid_NeedData"
	ID="c_articleGridHelper" DataKeyName="ID" AllowPaging="false" AllowSorting="false" />
<Telerik:RadGrid runat="server" ID="c_articleGrid" OnColumnCreating="Grid_ColumnCreating"
	OnUpdateCommand="Grid_Update" OnDeleteCommand="Grid_Delete" OnPreRender="Grid_PreRender" OnItemCommand="Grid_ItemCommand"
	OnItemDataBound="Grid_ItemDataBound" EnableAJAXLoadingTemplate="true" EnableAJAX="True"
	OnRowDrop="Grid_RowDrop"   
	EnableViewState="true" Widt="100%"
	AllowMultiRowSelection="true" >
	<ClientSettings  AllowRowsDragDrop="true">
		<Selecting AllowRowSelect="true" />
		<Scrolling FrozenColumnsCount="3" />
	</ClientSettings>
	<MasterTableView runat="server" EnableColumnsViewState="true" EditMode="InPlace">
		<PagerStyle Position="Bottom" />
		<Columns>
			<Telerik:GridTemplateColumn HeaderStyle-Width="120px">
				<EditItemTemplate>
					<asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update"><Foundation:ModuleString Name="ToolbarSave" runat="server" /></asp:LinkButton>
					|
					<asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CausesValidation="false"><Foundation:ModuleString Name="ToolbarCancel" runat="server" /></asp:LinkButton>
				</EditItemTemplate>
				<ItemTemplate>
					<asp:LinkButton ID="EditButton" runat="server" CommandName="Edit"><Foundation:ModuleString Name="ToolbarEdit" runat="server" /></asp:LinkButton>
					<asp:Label runat="server" ID="Delimiter" Text="|" />
					<asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CausesValidation="false"><Foundation:SystemString Name="ButtonRemove" runat="server" /></asp:LinkButton>
				</ItemTemplate>
			</Telerik:GridTemplateColumn>
			<%-- All dynamic added columns is added here, after all fixed columns --%>
		</Columns>
	</MasterTableView>
</Telerik:RadGrid>
<Telerik:RadCalendar ID="RadCalendar1" runat="server" Skin="Windows7" style="display: none;" />
<MediaArchive:MediaArchiveDialog ID="mediabankdialog" runat="server" />