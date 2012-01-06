<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_WebUserControls_ToolBarCommonButtons, Litum.Studio.Web" %>
	<Telerik:RadCodeBlock ID="RadScriptBlock1" runat="server" >

		<script type="text/javascript">		   
		    function setCommonToolbarButtonEnabled(id, enabled) {		        
		        c_toolbarCommon.get_items().getItemById(id).set_enabled(enabled);
		    }
        </script>
	</Telerik:RadCodeBlock>
<div style="float: left;">
<ComponentArt:ToolBar ID="c_toolbarCommon"
     OnItemCommand="c_toolbarCommon_ItemCommand"
		runat="server"
		CssClass="litToolbar" EnableViewState="false"
		DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver"
		DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled"
		ImagesBaseUrl="~/LitiumStudio/Images/"
		DefaultItemExpandedCssClass="litToolbarItemOnMouseDown"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16">
		<Items runat="server">
            <ComponentArt:ToolBarItem ID="c_toolbarItemAdd" ImageUrl="icons_standard/add.png" ItemType="DropDown" runat="server"
                DropDownId="c_menuAdd" DropDownImageUrl="toolbar/dropdown.gif" DropDownImageWidth="16" DropDownImageHeight="16"
                ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate"/>
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemView" ImageUrl="icons_standard/view.png"
				AutoPostBackOnSelect="true" Style="padding: 1px 3px;" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemEdit" ImageUrl="icons_standard/pencil.png"
				AutoPostBackOnSelect="true"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemDelete"
			    ImageUrl="icons_standard/delete.png"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="ToolBarItem1" runat="server" ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif"
				ImageHeight="16" ImageWidth="2" />
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
		    <ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemButtonDropDownTemplate">
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
		                    <td rowspan="1" class="ca_tb_ddn ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_dropDownImageUrl() ##" alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
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
	</div>