<%@ Control Language="C#" CodeFile="MetadataControl.ascx.cs" Inherits="Site.CMS.EditPanels.Controls.MetadataControl" %>
<%@ Import Namespace="App_Code.Site.CMS.MetaData" %>
<%@ Import Namespace="Site.CMS.EditPanels.Controls" %>

<link rel="Stylesheet" type="text/css" href="<% = ResolveUrl("~/site/cms/editpanels/ui/dark-hive/jquery-ui-1.8.16.custom.css")  %>" />
<style type="text/css">
	.ui-button { font-size: 80%!important; }
	.type-header { margin-top:15px; margin-bottom:10px; }
</style>
<script type="text/javascript" src="<% = ResolveUrl("~/site/cms/editpanels/ui/jquery-ui-1.8.16.custom.min.js") %>"></script>
<script type="text/javascript">
	(function() {
		var selectedMetadatasField;
		var boxes;

		function initButtons() {
			selectedMetadatasField = "#<% = m_hiddenFieldSelected.ClientID %>";
			boxes = $(".metadatas").find("input");
			boxes.button();
			boxes.change(checkBoxChanged);
		}
		
		function isMetadataType($input) {
			return $input.hasClass('<%= MetadataClassPrefix + MetadataType.Type %>');		
		}

		function deselectMetadataTypeSiblings($input) {
			$input.siblings('input.metadata-<%= MetadataType.Type %>').attr('checked', false);
			boxes.button('refresh'); // Need to visually update the ui buttons.
		}

		function checkBoxChanged() {

			var $this = $(this);
			var array = [];
			var selectedMetadatas;

			if (isMetadataType($this)) {
				// MetadataType == Type: Only one selected at a time.
				deselectMetadataTypeSiblings($this);
			}

			boxes.filter(':checked').each(function (i, e) {
				array[i] = $(e).val();
			});

			selectedMetadatas = array.join(";");
			$(selectedMetadatasField).val(selectedMetadatas);
		}

		$(function () {
			initButtons();
		});
}());
</script>

<asp:HiddenField ID="m_hiddenFieldSelected" runat="server" />
<div class="metadatas">
	<asp:Repeater id="m_repeaterTypes" runat="server">
		<ItemTemplate>
			<div class="type-header litBoldText"><%# DataBinder.Eval(Container.DataItem, "Name") %></div>
			<asp:Repeater id="m_repeaterMetadatas" OnItemDataBound="RepeaterMetadatas_ItemDataBound" DataSource="<%# ((MetadataTypeContainer)Container.DataItem).Metadatas %>" runat="server">
				<ItemTemplate>
					<input type="checkbox" ID="m_checkBox" runat="server" /><label id="m_label" runat="server"></label>
				</ItemTemplate>
			</asp:Repeater>
		</ItemTemplate>
	</asp:Repeater>
</div>