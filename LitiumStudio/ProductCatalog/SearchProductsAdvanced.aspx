<%@ page language="C#" debug="true" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_SearchProductsAdvanced, Litum.Studio.Web" %>
<%@ Import namespace="Litium.Foundation.Security"%>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarRight" runat="server" >
		<toolbar:ToolbarItem ID="c_toolbarItemView" OnClick="ToolbarItemView_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconView" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif" runat="server"/>
		<toolbar:ToolbarItem ID="c_toolbarItemEdit" OnClick="ToolbarItemEdit_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif" runat="server"/>
		<toolbar:ToolbarItem ID="c_toolbarItemDelete" OnClick="ToolbarItemDelete_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif" runat="server"/>
		<toolbar:DividerItem Visible="false" ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif" Class="litToolbarDivider" runat="server" ID="Divideritem5"/>
		<toolbar:ToolbarItem Visible="false" ID="c_toolbarItemCopy" OnClick="ToolbarItemCopy_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconCopy" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif" runat="server"/>
		<toolbar:ToolbarItem Visible="false" ID="c_toolbarItemPaste" OnClick="ToolbarItemPaste_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPaste" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif" runat="server"/>
	</toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="litModuleContentWithTreeTopAreaSingleRowV2">
        <div class="litLeftArea litPageStatusHeaderV2">
            <img id="Img1" src="Images/transparent.gif" style="vertical-align:middle; margin-right:5px;" class="litIconDocumentFind2" alt="" runat="server" /><Foundation:ModuleString ID="ModuleString1" Name="SearchResultHeader" Runat="server"/><asp:Label ID="c_queryString" runat="server" />
        </div>
    </div>
    <div class="litModuleContentWithTreeMainAreaV2">
        <script type="text/javascript">
        //<![CDATA[
        
        function TreeView1_onNodeSelect(sender, eventArgs)
        {
            var selectedNode = eventArgs.get_node();
            selectedNode.set_checked(true);
        
            var rootNodes = TreeView1.get_nodes();
            var isNodeSelected = false;
            var isMultipleNodesSelected = false;
            var countSelectedNodes = 0;
            for (var i = 0; i < rootNodes.get_length(); i++)
            {
                if (rootNodes.getNode(i).get_checked())
                {
                    countSelectedNodes += 1;
                    isNodeSelected = true;
                }
            }
            //if (countSelectedNodes > 1) isMultipleNodesSelected = true;
            if (isNodeSelected)
            {
                <% if(FoundationContext.Token.User.HasModulePermission(m_currentModule.ID, BuiltInModulePermissionTypes.PERMISSION_ID_CONTENT_ALL, true, true)) {%>
                    document.getElementById('ToolbarItem_1_1').className = "litToolbarItem";
                    document.getElementById('ToolbarItem_1_2').className = "litToolbarItem";
                <%}%>
                
                if (!isMultipleNodesSelected)
                {
                    document.getElementById('ToolbarItem_1_0').className = "litToolbarItem";
                }

                else
                {
                    document.getElementById('ToolbarItem_1_0').className = "litToolbarItem litToolbarItemDisabled";
                }
            }
            else
            {
                document.getElementById('ToolbarItem_1_0').className = "litToolbarItem litToolbarItemDisabled";
                document.getElementById('ToolbarItem_1_1').className = "litToolbarItem litToolbarItemDisabled";
                document.getElementById('ToolbarItem_1_2').className = "litToolbarItem litToolbarItemDisabled";
                //document.getElementById('ToolbarItem_1_3').className = "litToolbarItem litToolbarItemDisabled";
            }
        }
        //]]>
        </script>
        <div class="litModuleContentWithTreeMainTabAreaV2">
            <ul class="litTabItemUL">
                <WebControls:TabListItem CausesValidation="true" ID="c_tabItemArticles" OnClick="TabItemArticles_Click" LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink" ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent" runat="server" />
                <WebControls:TabListItem CausesValidation="true" ID="c_tabItemVariants" OnClick="TabItemVariants_Click" LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink" ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent" runat="server" />
                <WebControls:TabListItem CausesValidation="true" ID="c_tabItemProducts" OnClick="TabItemProducts_Click" LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink" ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent" runat="server" />
            </ul><div style="clear:both;"></div>
        </div>
        <div class="litModuleContentWithTreeMainUnderTabAreaV2 litUnderTabArea">
            <ComponentArt:TreeView id="TreeView1"
                AutoPostBackOnNodeMove="true"
                OnNodeMoved="TreeView1_OnNodeMoved"
                AutoAssignNodeIDs = "true"
                DragAndDropEnabled = "true" 
                DragAndDropAcrossTreesEnabled = "true"
                DropRootEnabled = "true"
                NodeEditingEnabled = "false"
                KeyboardEnabled = "false"
                CssClass = "litTreeViewList" 
                NodeCssClass = "litTreeNode" 
                MultipleSelectEnabled = "false"
                HoverNodeRowCssClass = "litHoverTreeNodeRowList"
                SelectedNodeRowCssClass="litSelectedTreeNodeRowList"
                NodeEditCssClass = "NodeEdit"
                NodeRowCssClass = "litTreeNodeRowList"
                NodeIndent = "0"
                ShowLines = "false"
                EnableViewState = "true"
                runat="server">
                <Nodes>
                    <ComponentArt:TreeViewNode ID="M0" Selectable="false" RowCssClass="litTreeNodeHeaderRowList" HoverRowCssClass="" ClientTemplateId="ArticleHeaderTemplate" ShowCheckBox="false" Expanded="true" DroppingEnabled="false" DroppingAcrossTreesEnabled="false" DraggingEnabled="false" DraggingAcrossTreesEnabled="false" />
                </Nodes>
                <ClientEvents>
                    <NodeSelect EventHandler="TreeView1_onNodeSelect" />
                </ClientEvents>
                <ServerTemplates>
                    <ComponentArt:NavigationCustomTemplate id="HeaderTemplate">
                        <Template>
                            <table cellpadding="0" cellspacing="0" border="0" class="litTreeNodeVariantsTable">
                                <tr>
                                    <th class="litText" align="left" style="width:400px; padding-left:5px;"><Foundation:ModuleString ID="ModuleString2" Name="Term" Runat="server"/></th>
                                    <th class="litText" align="left" style="width:210px;"><Foundation:ModuleString ID="ModuleString12" Name="Definition" Runat="server"/></th>
                                </tr>
                            </table>
                        </Template>
                    </ComponentArt:NavigationCustomTemplate>
                </ServerTemplates>
                <ClientTemplates>
                    <ComponentArt:ClientTemplate id="ProductTemplate">
                            <table cellpadding="0" cellspacing="0" border="0" class="litTreeNodeVariantsTable">
                                <tr>
                                    <td class="litText" align="left" style="width:400px; padding-left:5px;" title="## DataItem.GetProperty('FullPath') #### DataItem.GetProperty('Term') ##">/ ## DataItem.GetProperty('Path') ##<b>## DataItem.GetProperty('Term') ##</b></td>
                                    <td class="litText" align="left" style="width:210px;">## DataItem.GetProperty('Template') ##</td>
                                </tr>
                            </table>
                    </ComponentArt:ClientTemplate>
                    <ComponentArt:ClientTemplate id="ProductInfo">
                            <table cellpadding="0" cellspacing="0" border="0" style="margin-left:8px;">
                                <tr>
                                    <td class="litText" colspan="5"><i>## DataItem.GetProperty('Info') ##</i></td>
                                </tr>
                            </table>
                    </ComponentArt:ClientTemplate>
                      <ComponentArt:ClientTemplate id="ErrorTemplate">
                            <table cellpadding="0" cellspacing="0" border="0" style="">
                                <tr>
                                    <td class="litText" style="padding-left:8px;color:Red;" colspan="5"><strong>## DataItem.GetProperty('Info') ##</strong></td>
                                </tr>
                            </table>
                    </ComponentArt:ClientTemplate>
                </ClientTemplates>
            </ComponentArt:TreeView>
        </div>
    </div>
</asp:Content>