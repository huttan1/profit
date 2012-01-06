<%@ page language="C#" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_Framework_SelectArticles, Litum.Studio.Web" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<Telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">

		<script type="text/javascript">
			function GetRadWindow() {
				var oWindow = null;
				if (window.radWindow)
					oWindow = window.radWindow;
				else if (window.frameElement.radWindow)
					oWindow = window.frameElement.radWindow;
				return oWindow;
			}
			function AddAndClose() {
				var oWnd = GetRadWindow();
				var helper = Litium.Studio.UI.Common.WebControls.GridHelperAjax._instance["<%=c_articlesGrid.ClientID %>"];
				oWnd.close(helper.GetSelectedKeys());
			}
			var alreadyCreated = null;
			function GridCreated(s, e) {
				if (alreadyCreated)
					return;
					
				parentField = window.parent.document.getElementById("<%=Request["AllArticleFieldID"] %>");
				if (parentField)
					document.getElementById("<%=c_allArticleIDs.ClientID %>").value = parentField.value;
				$find("<%=c_articlesGrid.ClientID %>").get_masterTableView().rebind();
				alreadyCreated = true;
			}
		</script>

	</Telerik:RadScriptBlock>
</head>
<body>
	<form id="Form1" method="post" runat="server">
	<asp:HiddenField runat="server" ID="c_allArticleIDs" />
	<Telerik:RadScriptManager ID="ScriptManager" runat="server" EnableScriptCombine="false" />
	<Telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxSettingCreated="ajaxManager_AjaxSettingCreated"
		DefaultLoadingPanelID="AjaxLoadingPanel" />
	<Telerik:RadAjaxLoadingPanel runat="server" ID="AjaxLoadingPanel" Skin="Windows7" />
	<div style="width: 603px;" class="lsContentHeaderBackground">
		<div style="padding: 4px; height:20px;">
			<Foundation:ModuleString runat="server" Name="Search" />
			<asp:TextBox runat="server" ID="c_searchField" />
		</div>
		<LS:GridHelperAjax runat="server" AssociatedControlID="c_articlesGrid" OnNeedData="articleGrid_NeedData"
			ID="c_articlesGridHelper" DataKeyName="ID" FullHeight="false" />
		<Telerik:RadGrid AllowPaging="true" runat="server" Width="99%" Height="430" ID="c_articlesGrid"
			AllowMultiRowSelection="true">
			<ClientSettings>
				<Selecting AllowRowSelect="true" />
				<ClientEvents OnGridCreated="GridCreated" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridClientSelectColumn HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="Number" />
					<Telerik:GridBoundColumn DataField="Name" />
					<Telerik:GridBoundColumn DataField="Status" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
		<div style="text-align: right; padding: 4px;">
			<asp:Button ID="ButtonCancel" OnClientClick="GetRadWindow().close();" UseSubmitBehavior="false"
				runat="server" />
			<asp:Button ID="ButtonAdd" runat="server" OnClientClick="AddAndClose();" UseSubmitBehavior="false" />
		</div>
	</div>
	</form>
	<Telerik:RadCodeBlock runat="server">

		<script type="text/javascript">
			var _timer = null;
			var _lastValue = "";

			function SearchBoxKeyDown() {
				if (_timer != null)
					clearTimeout(_timer);
				_timer = setTimeout(function() { Search() }, 250);
			}
			function Search() {
				clearTimeout(_timer);

				var value = $get("<%=c_searchField.ClientID%>").value;
				if (value == _lastValue)
					return;

				if (value.length < 3 && _lastValue.length < 3)
					return;

				$find("<%=c_articlesGrid.ClientID %>").get_masterTableView().page("First");

				_lastValue = value;
			}

			Sys.Application.add_init(function() {
				$addHandler($get("<%=c_searchField.ClientID%>"), "keyup", SearchBoxKeyDown);
			});
		
		</script>

	</Telerik:RadCodeBlock>
</body>
</html>
