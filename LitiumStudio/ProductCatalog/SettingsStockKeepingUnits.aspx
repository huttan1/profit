<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_ProductCatalog_SettingsStockKeepingUnits, Litum.Studio.Web" enableeventvalidation="false" %>
<%@ Import Namespace="Litium.Studio.UI.ProductCatalog.Common.Constants"%>

<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">

	<script type="text/javascript">
		//<![CDATA[
		function ListToolbar_ItemBeforeSelect(sender, eventArgs) {
			var id = eventArgs.get_item().get_id();
			if (id == 'Delete') {
				if (!confirm('<%=SystemStrings.GetValue(Litium.Studio.UI.ProductCatalog.Common.Constants.SystemStringConstants.LABEL_CONFIRMATION_DELETE, FoundationContext.LanguageID, true)%>')) {
					eventArgs.set_cancel(true);
				}
			}
		}
		//]]>
	</script>

	<ComponentArt:ToolBar ID="ListToolbar" AutoPostBackOnSelect="true" OnItemCommand="ToolBar_ItemCommand"
		runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16">
		<Items runat="server">
			<ComponentArt:ToolBarItem ID="Add" runat="server" ImageUrl="icons_standard/add.png"
				KeyboardShortcut="Enter" ClientSideCommand="addClick()" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif" ImageHeight="16"
				ImageWidth="1" />
			<ComponentArt:ToolBarItem ID="View" runat="server" ImageUrl="icons_standard/view.png"
				Enabled="false"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="Edit" runat="server" ImageUrl="icons_standard/pencil.png"
				Enabled="false"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="Delete" runat="server" ImageUrl="icons_standard/delete.png"
				Enabled="false"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
		</Items>
		<ClientEvents>
			<ItemBeforeSelect EventHandler="ListToolbar_ItemBeforeSelect" />
		</ClientEvents>
		<ClientTemplates>
		    <ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemButtonTemplate">
		        <table cellspacing="0" cellpadding="0" border="0" style="margin: 0px; margin-right: auto;">
		            <tbody>
		                <tr>
		                    <td class="ToolbarItemLeft">
		                        &nbsp;
		                    </td>
		                    <td class="ca_tb_img ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##" alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
		                    </td>
		                    <td class="ca_tb_txt ToolbarItemMain">
		                        <nobr>## DataItem.get_text() ##</nobr>
		                    </td>
		                    <td class="ToolbarItemRight">
		                        &nbsp;
		                    </td>
		                </tr>
		            </tbody>
		         </table>			       
		    </ComponentArt:ClientTemplate>
		</ClientTemplates>
	</ComponentArt:ToolBar>
	<script type="text/javascript">
		    function addClick() {
		        document.location = '<%=UrlConstants.SKU_ADD_EDIT %>';
		        return false;
		    }
	</script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<Foundation:ModuleString ID="ModuleString1" Name="StockKeepingUnits" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">

	<script type="text/javascript">

		function setToolbarButtonEnabled(id, enabled) {
			ListToolbar.get_items().getItemById(id).set_enabled(enabled);
		}
                
	</script>

	<script type="text/javascript">
		function RowSelected(sender, args) {
			setToolbarButtonEnabled('View', true);
			setToolbarButtonEnabled('Edit', true);
			setToolbarButtonEnabled('Delete', true);
		}
		function RowDeselected(sender, args) {
			setToolbarButtonEnabled('View', false);
			setToolbarButtonEnabled('Edit', false);
			setToolbarButtonEnabled('Delete', false);
		}
	</script>

	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_stockKeepingUnits" ID="m_stockKeepingUnitsHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid runat="server" ID="m_stockKeepingUnits">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="SKUCode" />
					<Telerik:GridBoundColumn DataField="DecimalDigits" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>
