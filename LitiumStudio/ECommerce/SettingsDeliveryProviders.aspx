<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_ECommerce_SettingsDeliveryProviders, Litum.Studio.Web" %>
<%@ Import Namespace="Litium.Studio.UI.ECommerce.Common.Constants"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<ComponentArt:ToolBar ID="c_toolbarSettingsDeliveryMethods" OnItemCommand="c_toolbarSettingsDeliveryMethods_ItemCommand"
		runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16" AutoPostBackOnSelect="true">
		<Items runat="server">
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemAdd" ImageUrl="icons_standard/add.png"
			    ClientSideCommand="addClick()"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemEdit" ImageUrl="icons_standard/pencil.png"
				Enabled="false"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="ToolBarItem1" runat="server" ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif"
				ImageHeight="16" ImageWidth="2" />
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemDelete" ImageUrl="icons_standard/delete.png"
				Enabled="false"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
		</Items>
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
	        document.location = '<%=UrlConstants.SETTINGS_DELIVERY_PROVIDERS_ADD_EDIT_NAME %>';
	        return false;
	    }
	</script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconECommerce" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">

	<script type="text/javascript">
	    function onItemSelect(sender, eventArgs) {
	        setToolbarButtonEnabled('c_toolbarItemEdit', true);
	        setToolbarButtonEnabled('c_toolbarItemDelete', true);
	    }

	    function setToolbarButtonEnabled(id, enabled) {
	        c_toolbarSettingsDeliveryMethods.get_items().getItemById(id).set_enabled(enabled);
	    }
                
	</script>

	<script language="javascript" type="text/javascript">
	    function RowSelected(sender, args) {
	        setToolbarButtonEnabled('c_toolbarItemEdit', true);
	        setToolbarButtonEnabled('c_toolbarItemDelete', true);
	    }
	    function RowDeselected(sender, args) {
	        setToolbarButtonEnabled('c_toolbarItemEdit', false);
	        setToolbarButtonEnabled('c_toolbarItemDelete', false);
	    }
	</script>

	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_deliveryProvider" ID="m_deliveryProviderHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid runat="server" ID="m_deliveryProvider">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="Name" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>

