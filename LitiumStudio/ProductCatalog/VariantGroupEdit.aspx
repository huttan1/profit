<%@ page title="" language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_VariantGroupEdit, Litum.Studio.Web" validaterequest="false" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<ComponentArt:ToolBar ID="ToolBar1" AutoPostBackOnSelect="true" OnItemCommand="ToolBar_ItemCommand"
		runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16">
		<Items>
			<ComponentArt:ToolBarItem ID="Abort" runat="server" ImageUrl="icons_standard/sign_stop.png"
				CausesValidation="False" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
			<ComponentArt:ToolBarItem ID="Save" runat="server" ClientSideCommand="true" CausesValidation="True" ImageUrl="icons_standard/floppy_disk_blue.png"
				ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
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
								<img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##"
									alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
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
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" class="litIconVariant" alt="" /><Foundation:ModuleString
		ID="ModuleString1" Name="VariantEditHeader" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentTabScrollNoBottom" id="tab">
		<LS:TabContainer runat="server" OnClientLoad="OnTabClientLoad" ID="m_tab" />
	    <Telerik:RadScriptBlock runat="server">
            <script type="text/javascript">
                function DisableToolbarWhileHtmlEditorLoad() {
                    var enabledToolbarItems = ToolBar1.get_items().get_itemArray();
                    for (i = 0; i < enabledToolbarItems.length; i++) {
                        enabledToolbarItems[i].set_enabled(false);
                    }
                }
                function EnableToolbarAfterHtmlEditorLoad() {
                    var disabledToolbarItems = ToolBar1.get_items().get_itemArray();
                    for (i = 0; i < disabledToolbarItems.length; i++) {
                        disabledToolbarItems[i].set_enabled(true);
                    }
                }
                function OnTabClientLoad(sender) {
                    if (typeof numberOfHTMLEditors != "undefined")
                        DisableTabsWhileHtmlEditorLoad();
                }
                function DisableTabsWhileHtmlEditorLoad() {
                    var enabledTabStrip = $find("<%= m_tab.TabStrip.ClientID %>");
                    if (enabledTabStrip) {
                        var enabledTabs = enabledTabStrip.get_allTabs();
                        for (var i = 0; i < enabledTabs.length; i++) {
                            enabledTabs[i].disable();
                        }
                    }
                } 
                
                function EnableTabsAfterHtmlEditorLoad() {
                    var disabledTabStrip = $find("<%= m_tab.TabStrip.ClientID %>");
                    if (disabledTabStrip) {
                        var disabledTabs = disabledTabStrip.get_allTabs();
                        for (var i = 0; i < disabledTabs.length; i++) {
                            disabledTabs[i].enable();
                        }
                    }
                }
        </script>
    </Telerik:RadScriptBlock>    
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LitiumStudioFilterArea" runat="Server">
</asp:Content>
