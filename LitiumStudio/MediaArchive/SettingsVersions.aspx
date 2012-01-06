<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_SettingsVersions, Litum.Studio.Web" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<script type="text/javascript">

		// Called from the onToolbarItemSelect event of the toolbar in the current page.
		function toolbarItemSelected(sender, eventArgs) {
			var toolbarItem = eventArgs.get_item().get_id();
			if (toolbarItem == 'c_toolbarItemNew') {
				__doPostBack('new', '');
			}
			else if (toolbarItem == 'c_toolbarItemView') {
				__doPostBack('view', '');
			}
			else if (toolbarItem == 'c_toolbarItemEdit') {
				__doPostBack('edit', '');
			}
			else if (toolbarItem == 'c_toolbarItemDelete') {
				var confirmationMessage = '<%= ConfirmationMessage %>';
				var confirmed = confirm(confirmationMessage);
				if (confirmed) {
					__doPostBack('delete', '');
				}
			}
		}

		// Enables or disables a button in the toolbar.
		function setToolbarButtonEnabled(id, enabled) {
			c_toolbarVersions.get_items().getItemById(id).set_enabled(enabled);
		}

		// Called from the onPageIndexChange event of the settings grid in the current page.
		function onPageIndexChange(sender, eventArgs) {
			// disable toolbar buttons when the page index is changed.
			setToolbarButtonEnabled("c_toolbarItemView", false);
			setToolbarButtonEnabled("c_toolbarItemEdit", false);
			setToolbarButtonEnabled("c_toolbarItemDelete", false);
		}

		function RowSelected(sender, args) {
			setToolbarButtonEnabled("c_toolbarItemView", true);
			setToolbarButtonEnabled('c_toolbarItemEdit', true);
			setToolbarButtonEnabled('c_toolbarItemDelete', true);
		}
		function RowDeselected(sender, args) {
			setToolbarButtonEnabled("c_toolbarItemView", false);
			setToolbarButtonEnabled('c_toolbarItemEdit', false);
			setToolbarButtonEnabled('c_toolbarItemDelete', false);
		}
	</script>
	<ComponentArt:ToolBar ID="c_toolbarVersions" runat="server" CssClass="litToolbar"
		DefaultItemCssClass="litToolbarItemNew" DefaultItemHoverCssClass="litToolbarItemOnMouseOver"
		DefaultItemActiveCssClass="litToolbarItemOnMouseDown" DefaultItemDisabledCssClass="litToolbarItemDisabled"
		ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false"
		Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
		<Items runat="server">
			<ComponentArt:ToolBarItem ID="c_toolbarItemNew" runat="server" ImageUrl="icons_standard/add.png"
				CausesValidation="False" Text="New" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
			<ComponentArt:ToolBarItem ID="c_toolbarItemView" runat="server" ImageUrl="icons_standard/view.png"
				CausesValidation="False" Enabled="false" Text="View" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
			<ComponentArt:ToolBarItem ID="c_toolbarItemEdit" runat="server" ImageUrl="icons_standard/pencil.png"
				CausesValidation="False" Enabled="false" Text="Edit" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
			<ComponentArt:ToolBarItem ID="c_toolbarItemDelete" runat="server" ImageUrl="icons_standard/delete.png"
				CausesValidation="False" Enabled="false" Text="Delete" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
		</Items>
		<ClientEvents>
			<ItemSelect EventHandler="toolbarItemSelected" />
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
								<img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##"
									alt="" style="display: block;" title="## DataItem.get_toolTip() ##" />
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
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<Foundation:ModuleString Name="SettingVersionGridHeader" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_versions" ID="m_versionsHelper"
			OnNeedData="grid_NeedData" DataKeyName="Name" />
		<Telerik:RadGrid runat="server" ID="m_versions">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server" ClientDataKeyNames="Name">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="Name" />
					<Telerik:GridBoundColumn DataField="MaxWidth" />
					<Telerik:GridBoundColumn DataField="MaxHeight" />
					<Telerik:GridBoundColumn DataField="Percentage" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>
