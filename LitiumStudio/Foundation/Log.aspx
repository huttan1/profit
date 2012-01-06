<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_Log, Litum.Studio.Web" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="c_toolbar" runat="server">
		<Toolbar:ToolbarItem OnClick="ToolbarItemView_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconView" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="../images/transparent.gif" ID="c_toolbarItemView" runat="server" />
		<Toolbar:DividerItem ID="DividerItem1" ImageURL="../images/transparent.gif" Class="litToolbarDivider"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemDelete_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif"
			ID="c_toolbarItemDeleteAll" runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemRefresh_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconRefresh"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif"
			ID="c_toolbarItemRefresh" runat="server" />
	</Toolbar:HorizontalToolbar>




    <ComponentArt:ToolBar ID="ListToolbar" AutoPostBackOnSelect="true" 
		runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16" EnableViewState="false" >
		<Items runat="server">
            <ComponentArt:ToolBarItem ID="c_logLevel" runat="server" ItemType="DropDown" DropDownId="c_logLevelMenu"
				ImageUrl="icons_standard/warning_16px.png" Enabled="true" DropDownImageUrl="toolbar/dropdown.gif"
				DropDownImageWidth="16" DropDownImageHeight="16" ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate" />
		</Items>
		<ClientTemplates>
		    <ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemButtonDropDownTemplate">
		        <table cellspacing="0" cellpadding="0" border="0" style="margin: 0px; margin-right: auto;width:220px;">
		            <tbody>
		                <tr>
		                    <td class="ToolbarItemLeft">
		                        &nbsp;
		                    </td>
		                    <td class="ca_tb_img ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##" alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
		                    </td>
		                    <td class="ca_tb_txt ToolbarItemMain" style="text-align:left;" >
		                        <nobr>## DataItem.get_text() ##</nobr>
		                    </td>
		                    <td rowspan="1" class="ca_tb_ddn ToolbarItemMain" >
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_dropDownImageUrl() ##" alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
		                    </td>
		                    <td class="ToolbarItemRight" >
		                        &nbsp;
		                    </td>
		                 </tr>
		             </tbody>
		         </table>
		    </ComponentArt:ClientTemplate>
		</ClientTemplates>
	</ComponentArt:ToolBar>
    
	<ComponentArt:Menu runat="server" ID="c_logLevelMenu" OnItemSelected="LogLevelMenu_OnItemSelected"
		ImagesBaseUrl="~/LitiumStudio/Images/" CssClass="litNavMenuGroup" DefaultItemLookId="DefaultItemLook"
		DefaultGroupItemSpacing="1" DefaultItemTextAlign="Left" DefaultItemTextWrap="false"
		DefaultGroupExpandOffsetX="0" DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto"
		TopGroupExpandDirection="BelowLeft" TopGroupExpandOffsetY="0" CollapseDuration="100"
		CollapseSlide="ExponentialDecelerate" ExpandDuration="100" ExpandSlide="ExponentialDecelerate"
		ExpandDelay="0" ExpandOnClick="false" CascadeCollapse="true" CollapseDelay="10000"
		HideSelectElements="false" HighlightExpandedPath="true" KeyboardEnabled="true"
		OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true" ShadowOffset="2"
		Orientation="Vertical" ContextMenu="Custom" Width="220">
		<ItemLooks>
			<ComponentArt:ItemLook LookId="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16"
				CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive"
				HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10"
				LabelPaddingRight="10" LabelPaddingTop="3" />
			<ComponentArt:ItemLook LookId="SelectedItemLook" RightIconUrl="menu/arrow.gif"
				RightIconWidth="20" RightIconHeight="15" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded"
				ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4"
				LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3" />
			<ComponentArt:ItemLook LookId="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16"
				CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10"
				LabelPaddingRight="10" LabelPaddingTop="3" />
           
		</ItemLooks>
		<Items runat="server">
			<ComponentArt:MenuItem ID="c_debug" Text="Debug" runat="server" AutoPostBackOnSelect="true" />
			<ComponentArt:MenuItem ID="c_info" Text="Info" runat="server" AutoPostBackOnSelect="true" />
            <ComponentArt:MenuItem ID="c_warn" Text="Warn" runat="server" AutoPostBackOnSelect="true" />
            <ComponentArt:MenuItem ID="c_error" Text="Error" runat="server" AutoPostBackOnSelect="true" />
            <ComponentArt:MenuItem ID="c_fatal" Text="Fatal" runat="server" Checked="true" Look-LookId="SelectedItemLook" AutoPostBackOnSelect="true" />
		</Items>
	</ComponentArt:Menu>


</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconMainLog" /><Foundation:SystemString
		Name="LogPageSubHeader1" runat="server" ID="Systemstring1" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentNoScroll">

		<script type="text/javascript">
			function RowSelected(sender, args) {
				toolbarItemAction("activate", "0_0");
			}
			function RowDeselected(sender, args) {
				toolbarItemAction("disable", "0_0");
			}
		</script>

		<LS:GridHelperAjax runat="server" AssociatedControlID="m_log" ID="m_logHelper" OnNeedData="grid_NeedData"
			DataKeyName="ID" />
		<Telerik:RadGrid runat="server" ID="m_log">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
                    <Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="25px" />
					<Telerik:GridBoundColumn DataField="Event" />
                    <Telerik:GridBoundColumn DataField="EventPreviewText" HeaderStyle-Width="510px"   />
					<Telerik:GridBoundColumn DataField="Date" HeaderStyle-Width="130px" />
					<Telerik:GridBoundColumn DataField="Level" HeaderStyle-Width="60px" />
					<Telerik:GridBoundColumn DataField="WebServer" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>
