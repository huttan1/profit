<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_SearchVariants, Litum.Studio.Web" %>
<%@ Import namespace="Litium.Foundation.Security"%>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarRight" runat="server" >
		<toolbar:ToolbarItem OnClientClick="StoreSelectedNodes(); return true;" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconView" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif" ID="c_toolbarItemView" OnClick="ToolbarItemView_Click" runat="server"/>
		<toolbar:ToolbarItem OnClientClick="StoreSelectedNodes(); return true;" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif" ID="c_toolbarItemEdit" OnClick="ToolbarItemEdit_Click" runat="server"/>
		<toolbar:ToolbarItem OnClientClick="StoreSelectedNodes(); return true;" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif" ID="c_toolbarItemDelete" OnClick="ToolbarItemDelete_Click" runat="server"/>
		<toolbar:DividerItem ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif" Class="litToolbarDivider" runat="server"/>
		<toolbar:ToolbarItem ID="c_toolbarItemCreateNewProduct" OnBeforeUnload="return false;" OnClientClick="CreateNewProduct(this); return false;" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil"  SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="/LitiumStudio/ProductCatalog/Images/transparent.gif" runat="server"/>
	</toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">

    <script type="text/javascript">
    //<![CDATA[
    var onCheckClick = false;
    var resultNodesCount = <%=ResultNodesCount %>;
    
    function toggleNodesElement()
    {
        return document.getElementById('toggleNodes');
    }
    
    // event handler for node checkbox onclick
    function nodeCheckbox_OnClick(sender)
    {
        onCheckClick = true;
    }
    
    // toggles state of toolbar buttons
    function setToolbarState()
    {
        var nodeCheckboxes = getElementsByClassName(document, 'nodeCheckbox');
        var checkedNodesCount = 0;
        
        for (var i = 0, l = nodeCheckboxes.length; i < l; i++)
        {
            if (nodeCheckboxes[i].checked)
            {
                checkedNodesCount++; 
            }
        }
        
        // set state of toggleNodes checkbox
        toggleNodesElement().checked = (resultNodesCount > 0 && resultNodesCount == checkedNodesCount);                       
    
        if (checkedNodesCount > 0)
        {
            document.getElementById('ToolbarItem_1_0').className = "litToolbarItem";            
            <% if(FoundationContext.Token.User.HasModulePermission(m_currentModule.ID, BuiltInModulePermissionTypes.PERMISSION_ID_CONTENT_ALL, true, true)) {%>
            document.getElementById('ToolbarItem_1_1').className = "litToolbarItem";
            document.getElementById('ToolbarItem_1_2').className = "litToolbarItem";
            document.getElementById('ToolbarItem_1_3').className = "litToolbarItem";
            <%}%>
            
            if (checkedNodesCount > 1)
            {
                document.getElementById('ToolbarItem_1_0').className = "litToolbarItem litToolbarItemDisabled";
                document.getElementById('ToolbarItem_1_1').className = "litToolbarItem litToolbarItemDisabled";
            }
        }
        else
        {
            document.getElementById('ToolbarItem_1_0').className = "litToolbarItem litToolbarItemDisabled";
            document.getElementById('ToolbarItem_1_1').className = "litToolbarItem litToolbarItemDisabled";
            document.getElementById('ToolbarItem_1_2').className = "litToolbarItem litToolbarItemDisabled";
            document.getElementById('ToolbarItem_1_3').className = "litToolbarItem litToolbarItemDisabled";
        }
    }
    
    // event handler for node row
    function NodeRow_OnMouseOver(sender)
    {
        sender.className = 'litHoverTreeNodeRowList';
    }
    
    // event handler for node row
    function NodeRow_OnMouseOut(sender)
    {
        var nodeCheckbox = getElementsByClassName(sender, 'nodeCheckbox')[0];
        
        if (nodeCheckbox.checked)
        {
            sender.className = 'litSelectedTreeNodeRowList';
        }
        else
        {
            sender.className = 'litTreeNodeRowList';
        }
    }
    
    // event handler for node row: check/uncheck node checkbox
    function NodeRow_OnClick(sender)
    {
        var nodeCheckbox = getElementsByClassName(sender, 'nodeCheckbox')[0];

        if (onCheckClick)
        {
            onCheckClick = false;
        }
        else
        {
            nodeCheckbox.checked = !nodeCheckbox.checked;
        }            
                    
        if (nodeCheckbox.checked)
        {
            sender.className = 'litSelectedTreeNodeRowList';
        }                       
        
        setToolbarState();
    }
    
    // event handler for checkbox toggle 
    function toggleNodes_OnClick(sender)
    {
        var checked = sender.checked;
        var nodeCheckboxes = getElementsByClassName(document.getElementById('litSimpleNodeView'), 'nodeCheckbox');
        
        for (var i = 0, l = nodeCheckboxes.length; i < l; i++)
        {
            nodeCheckboxes[i].checked = checked;
        }
        
        if (checked)
        {
            var nodeRows = getElementsByClassName(document.getElementById('litSimpleNodeView'), 'litTreeNodeRowList');
            // select all rows not already selected
            for (var i = 0, l = nodeRows.length; i < l; i++)
            {
                nodeRows[i].className = 'litSelectedTreeNodeRowList';
            }        
        }
        else
        {
            var nodeSelectedRows = getElementsByClassName(document.getElementById('litSimpleNodeView'), 'litSelectedTreeNodeRowList');        
            // deselect all rows not already deselected
            for (var i = 0, l = nodeSelectedRows.length; i < l; i++)
            {
                nodeSelectedRows[i].className = 'litTreeNodeRowList';
            }        
        }
        
         setToolbarState();
    }
    
    // returns array of elements with specified className
    getElementsByClassName = function(sender, className)
    {
        var elements = [];
        var myclass = new RegExp('\\b' + className + '\\b');
        var elem = sender.getElementsByTagName('*');
        
        for (var i = 0, l = elem.length; i < l; i++)
        {
            var classes = elem[i].className;
            
            if (myclass.test(classes))
            {
                elements.push(elem[i]);
            }
        }
        
        return elements;
    };
    //]]>
    </script>

    <div class="litModuleContentWithTreeTopAreaSingleRowV2">
        <div class="litLeftArea litPageStatusHeaderV2">
            <img id="Img1" src="Images/transparent.gif" style="vertical-align:middle; margin-right:5px;" class="litIconDocumentFind2" alt="" runat="server" /><Foundation:ModuleString ID="ModuleString1" Name="SearchResultHeader" Runat="server"/><asp:Label ID="c_queryString" runat="server" />
        </div>
    </div>
    <div class="litModuleContentWithTreeMainAreaV2">
         <div class="litModuleContentWithTreeMainTabAreaV2">
            <ul class="litTabItemUL">
                <WebControls:TabListItem CausesValidation="true" ID="c_tabItemArticles" OnClick="TabItemArticles_Click" LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink" ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent" runat="server" />
                <WebControls:TabListItem CausesValidation="true" ID="c_tabItemVariants" OnClick="TabItemVariants_Click" LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink" ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent" runat="server" />
                <WebControls:TabListItem CausesValidation="true" ID="c_tabItemProductGroups" OnClick="TabItemProductGroups_Click" LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink" ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent" runat="server" />
            </ul><div style="clear:both;"></div>
        </div>
        
        <!-- begin new style -->
        <div id="litSimpleNodeView" class="litModuleContentWithTreeMainUnderTabAreaV2 litUnderTabArea litSimpleNodeView">
        
            <asp:Repeater ID="c_repeaterSearchResult" runat="server">
                <HeaderTemplate>
                    <div class="litTreeNodeHeader litTreeNodeHeaderRowList ProductCatalogSearchHeader">
		                <table border="0" cellspacing="0" cellpadding="0" class="litTreeNodeVariantsTable">
                            <tr>
                                <th class="litText" style="width: 25px; vertical-align: middle;"><input type="checkbox" id="toggleNodes" class="toggleNodes" onclick="toggleNodes_OnClick(this)" /></th>
                                <th class="litText" style="width: 330px;"><Foundation:ModuleString ID="ModuleString4" Name="Term" Runat="server"/></th>
                                <th class="litText" style="width: 120px;"><Foundation:ModuleString ID="ModuleString5" Name="Status" Runat="server"/></th>
                                <th class="litText" style="width: 150px; text-align: center;"><Foundation:ModuleString ID="ModuleString6" Name="Products" Runat="server"/></th>
                                <th class="litText" style="width: 150px; text-align: center;"><Foundation:ModuleString ID="ModuleString7" Name="Articles" Runat="server"/></th>
                            </tr>
                        </table>
                    </div>
                </HeaderTemplate>
                <FooterTemplate></FooterTemplate>
                <ItemTemplate>
                    <div class="litTreeNodeRowList" onclick="NodeRow_OnClick(this);" onmouseover="NodeRow_OnMouseOver(this);" onmouseout="NodeRow_OnMouseOut(this);">                
                        <table cellpadding="0" cellspacing="0" border="0" class="litTreeNodeVariantsTable">
                            <tr>
                                <td class="litText" style="width: 25px; vertical-align: middle;"><input type="checkbox" class="nodeCheckbox" value="<%#(Container.DataItem as SearchVariantsSearchResultNode).VariantID.ToString()%>" onclick="nodeCheckbox_OnClick(this);" /></th>
                                <td class="litText" style="width: 330px;"><%#(Container.DataItem as SearchVariantsSearchResultNode).Text%></td>
                                <td class="litText" style="width: 120px;"><%#(Container.DataItem as SearchVariantsSearchResultNode).Status%></td>
                                <td class="litText" style="width: 150px; text-align: center;"><%#(Container.DataItem as SearchVariantsSearchResultNode).Produkter%></td>
                                <td class="litText" style="width: 150px; text-align: center;"><%#(Container.DataItem as SearchVariantsSearchResultNode).Artiklar%></td>
                            </tr>
                        </table>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <!-- end new style -->
        
    </div>
    <script type="text/javascript">
    //<![CDATA[
    var createProduct = false; // gets value from included iframe document
   
    function StoreSelectedNodes()
    {
        var articleIDs = new Array();
        var hiddenElement = document.getElementById('<%=mc_SelectedVariantIDs.ClientID%>');

        var nodeCheckboxes = getElementsByClassName(document, 'nodeCheckbox');
        
        for (var i = 0, l = nodeCheckboxes.length; i < l; i++)
        {
            if (nodeCheckboxes[i].checked)
            {
                articleIDs.push(nodeCheckboxes[i].value);
            }
        }
        
        hiddenElement.value = articleIDs.join(',');
    }
    
    function CreateNewProduct(sender)
    {
        // show dialog if toolbar item is not disabled
        if (sender.parentNode.className.indexOf('litToolbarItemDisabled') === -1)
        {            
            StoreSelectedNodes();
            CreateNewProductDialog.show();
        }
    }
    
    function CreateNewProductDialog_OnShow(dialog)
    {      
        CreateNewProductDialog.set_offsetX((document.body.clientWidth/2) - 150);
        CreateNewProductDialog.set_offsetY((document.body.clientHeight/2) - 175);
    
        document.getElementById(dialog.get_id()).style.display = 'block';
        document.getElementById(dialog.get_id()).style.visiblity = 'visible';
    }

    function CreateNewProductDialog_OnClose(dialog)
    {
        if(createProduct)
        {
            // get reference to iframe with product tree
            var iframeDocument = document.getElementById('CreateNewProductDialogIframe').contentWindow.document;                

            // check if a node was selected
            if (iframeDocument.getElementById('ProductCatalogID').value)
            {
                // set value of the hidden input element to the value of the selected node 
                document.getElementById('<%=CreateNewProductCatalogID%>').value = iframeDocument.getElementById('ProductCatalogID').value
            }
        }

        document.getElementById(dialog.get_id()).style.display = 'none';
        document.getElementById(dialog.get_id()).style.visiblity = 'hidden';
    }
    
    function CloseCreateNewProductDialog(status)
    {
        createProduct = status;
        CreateNewProductDialog.Close();
    }
    
    function enableSaveButton()
    {
        document.getElementById('<%=CreateNewProductButtonClientID%>').disabled = false;
    }
    //]]>
    </script>
    
    <input type="hidden" ID="mc_CreateNewProductCatalogID" value="" runat="server" />
    <input type="hidden" ID="mc_ClearSelectedVariants" runat="server" />
    <input type="hidden" ID="mc_SelectedVariantIDs" runat="server" />

    <ComponentArt:Dialog 
        Alignment="TopLeft"
        FooterCssClass="CreateNewProductDialogBottom"
        ContentCssClass="CreateNewProductDialog" 
        Height="300"
        ID="CreateNewProductDialog"
        IFrameCssClass="CreateNewProductDialogIframe"
        IFrameBorder="0"
        Modal="true"
        Runat="server"
        Width="300"
        X="0"
        Y="0"
     >

        <ClientEvents>
            <OnShow EventHandler="CreateNewProductDialog_OnShow" />
            <OnClose EventHandler="CreateNewProductDialog_OnClose" />
        </ClientEvents>
        
        <HeaderTemplate>
                    
            <table cellpadding="0" cellspacing="0" width="302" onmousedown="CreateNewProductDialog.StartDrag(event);" >
                <tr>
                   <td width="6"><img style="display: block;" src="../../LitiumStudio/Images/ca_dialog/top_left.gif"/></td>
                   <td style="padding: 3px; padding-bottom: 0px; background-image: url(../../LitiumStudio/Images/ca_dialog/top.gif);">
                        <table width="100%" height="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="bottom" class="litHeader3"><%=m_currentModule.Strings.GetValue("ArticlesCreateNewProduct", FoundationContext.Language.Culture, true)%></td>
                                <td align="right" valign="middle"></td>
                            </tr>
                        </table>
                   </td>
                   <td width="30" style="background-image: url(../../LitiumStudio/Images/ca_dialog/top.gif);"><img id="Img2" style="display:block; margin-top:2px;" src="../../LitiumStudio/Images/ca_dialog/close.gif" onclick="CloseCreateNewProductDialog(false);"></td>
                   <td width="6"><img id="Img3" style="display: block;" src="../../LitiumStudio/Images/ca_dialog/top_right.gif"/></td>
                </tr>
            </table>

        </HeaderTemplate>
        
        <ContentTemplate>
        
            <iframe id="CreateNewProductDialogIframe" class="CreateNewProductDialogIframe" src="<%=Page.ResolveUrl("~/LitiumStudio/ProductCatalog/Framework/SelectProductCatalog.aspx")%>" border="0" frameborder="0" marginheight="0" marginwidth="0"></iframe>
        
        </ContentTemplate>
                
        <FooterTemplate>
            
            <table class="litModalPopupBottom" cellpadding="0" cellspacing="0" width="302">
                <tr>
                     <td style="background: url(../../LitiumStudio/Images/ca_dialog/left.gif) repeat-y left top;"><img style="display:block;" src="../../LitiumStudio/Images/ca_dialog/spacer.gif" height="1" width="6" /></td> 
                     <td style="text-align:right; padding-top: 10px; padding-right:2px; padding-bottom:3px;">
                        <input type="button" onclick="CloseCreateNewProductDialog(false);" class="litInputButton" id="Button1" value="<%=m_currentModule.Strings.GetValue("Cancel", FoundationContext.LanguageID, true)%>" />
                        &nbsp;	                        
                        <asp:Button ID="CreateNewProductButton" disabled="disabled" CssClass="litInputButton" OnClientClick="CloseCreateNewProductDialog(true);" OnClick="CreateNewProductButton_OnClick" OnLoad="CreateNewProductButton_OnLoad" runat="server" />
                     </td>
                     <td style="background: url(../../LitiumStudio/Images/ca_dialog/right.gif) repeat-y right top;"><img style="display:block;" src="../../LitiumStudio/Images/ca_dialog/spacer.gif" height="1" width="6" /></td> 
                </tr>
                <tr>
                     <td width="6"><img style="display: block;" src="../../LitiumStudio/Images/ca_dialog/bottom_left.png"/></td>
                     <td style="background-image:url(../../LitiumStudio/Images/ca_dialog/bottom.gif);">
                        <img style="display: block;" src="../../LitiumStudio/Images/ca_dialog/spacer.gif" height="5" width="288" />
                     </td>
                     <td width="6"><img style="display: block;" src="../../LitiumStudio/Images/ca_dialog/bottom_right.png"/></td>
                </tr>
            </table>
            
        </FooterTemplate>
	            
    </ComponentArt:Dialog>
    
</asp:Content>