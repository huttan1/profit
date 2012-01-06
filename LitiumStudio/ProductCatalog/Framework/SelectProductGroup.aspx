<%@ page language="C#" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_Framework_SelectProductGroup, Litum.Studio.Web" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="Form1" method="post" runat="server">
	<asp:ScriptManager ID="ScriptManager" EnablePageMethods="true" runat="server" />
	<Telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" />
	<asp:HiddenField ID="c_hiddenSelectAllClientID" value="" runat="server" />
	<div style="width: 603px;" class="lsContentHeaderBackground">
		<div style="padding: 4px; height: 20px;">
			<Foundation:ModuleString ID="ModuleString1" runat="server" Name="Search" />
			<asp:TextBox runat="server" ID="c_searchField" />
		</div>
		<LS:GridHelperAjax runat="server" AssociatedControlID="c_productGroupGrid" OnNeedData="grid_NeedData"
			ID="c_productGroupGridHelper" DataKeyName="ID" />
		<Telerik:RadGrid AllowPaging="true" runat="server" ID="c_productGroupGrid" Width="99%" OnItemCreated="grid_ItemCreated"
			Height="430" AllowMultiRowSelection="true">
			<ClientSettings>
				<Selecting AllowRowSelect="true" />
				<ClientEvents OnRowCreating="HeaderShowing" OnRowSelecting="RowSelecting" OnRowDeselecting="RowDeselecting" OnRowDeselected="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server" ClientDataKeyNames="ID">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn"  HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="Name" />
					<Telerik:GridBoundColumn DataField="AssortmentPath" AllowSorting="false"/>
					<Telerik:GridBoundColumn DataField="ID" Display="false" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
		<div style="text-align: right; padding: 4px;">
			<asp:Button ID="ButtonCancel" CssClass="litInputButton" OnClientClick="RadClose();" runat="server" Text="Cancel" UseSubmitBehavior="false" />
			<asp:Button ID="ButtonAdd" CssClass="litInputButton" runat="server" Text="Add" OnClick="ButtonAdd_Click" />
		</div>
	</div>
	<Telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
		<script type="text/javascript">
			var cancelDeselect = false;
			var cancelSelect = false;
			var selectedItemsCount = 0;
			function SelectAllClick(sender) {
				if (sender.checked) {
					SelectAllItems();
				}
				else {
					ClearSelection();
				}
			}
			function SelectAllItems() {
				var tableView = $find("<%= c_productGroupGrid.ClientID %>").get_masterTableView();
				tableView.clearSelectedItems();
				cancelDeselect = true;
				tableView.selectAllItems();
				PageMethods.SelectAllItems($get('<%= c_searchField.ClientID %>').value, callMethod_Success, callMethod_Failure);
				cancelDeselect = false;
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = true;
			}

			function ClearSelection() {
				var tableView = $find("<%= c_productGroupGrid.ClientID %>").get_masterTableView();
				cancelSelect = true;
				tableView.clearSelectedItems();
				if (tableView.get_selectedItems().length > 0)
					tableView.selectAllItems();
				cancelSelect = false;
				PageMethods.ClearSelection(callMethod_Success, callMethod_Failure);
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = false;
			}
			function HeaderShowing(sender, args) {
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = selectedItemsCount == $find("<%= c_productGroupGrid.ClientID %>").get_masterTableView()._virtualItemCount;
			}
			function RowSelecting(sender, args, gridHelper) {
				if (args._domEvent.type != null) {
					PageMethods.UpdateSelection(args._dataKeyValues.ID, 'true', callMethod_Success, callMethod_Failure);
				}
				else {
					if (cancelSelect)
						args.set_cancel(true);
				}
			}

			function RowDeselecting(sender, args, gridHelper) {
				if (args._domEvent.type != null) {
					var items = gridHelper.GetSelectedKeys();
					if (items != null && items.length > 0) {
						PageMethods.UpdateSelection(args._dataKeyValues.ID, 'false', callMethod_Success, callMethod_Failure);
					}
					else {
						PageMethods.ClearSelection(callMethod_Success, callMethod_Failure);
					}
				}
				else {
					if (cancelDeselect) {
						args.set_cancel(true);
					}
				}
			}

			function RowDeselected(sender, args, gridHelper) {
				$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = false;
			}
			function callMethod_Success(results, userContext, methodName) {

			}

			function callMethod_Failure(errors, userContext, methodName) {
				alert(errors.get_message());
			}

			function GetRadWindow() {
				var oWindow = null;
				if (window.radWindow)
					oWindow = window.radWindow;
				else if (window.frameElement.radWindow)
					oWindow = window.frameElement.radWindow;
				return oWindow;
			}
			function RadClose() {
				var oWnd = GetRadWindow();
				oWnd.close();
			}
			
			 var _timer = null;
			var _lastValue = "";

			function SearchBoxKeyUp() {
				if (_timer != null)
					clearTimeout(_timer);
				_timer = setTimeout(function () { Search() }, 250);
			}
			function Search() {
				clearTimeout(_timer);

				var value = $get("<%=c_searchField.ClientID%>").value;
				if (value == _lastValue)
					return;

//				if (value.length < 3 && _lastValue.length < 3)
//					return;

				$find("<%=c_productGroupGrid.ClientID %>").get_masterTableView().page("First");

				_lastValue = value;
			}

			Sys.Application.add_init(function () {
				$addHandler($get("<%=c_searchField.ClientID%>"), "keyup", SearchBoxKeyUp);
			});
		
		</script>
	</Telerik:RadCodeBlock>
	</form>
</body>
</html>
