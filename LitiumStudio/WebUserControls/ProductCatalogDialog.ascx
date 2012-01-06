<%@ Import namespace="Litium.Foundation.Modules.ProductCatalog"%>
<%@ control language="C#" autoeventwireup="true" inherits="Web.Modules.Common.WebUserControls.ProductCatalogDialog, Litum.Studio.Web" %>


<script type="text/javascript">
    var insertID = false;
    var g_inputHiddenProductCatalogIDsID = '';
    var g_inputHiddenProductCatalogExtraIDsID = '';
    var g_textBoxProductCatalogExtraInfosID = '';
    var g_textBoxProductCatalogNamesID = '';
    var g_gridResultId = '';
    
    function ProductCatalogDialogShow(dialog)
    {
        ProductCatalogItemsDialog.set_offsetX((document.body.clientWidth/2)-350);
        ProductCatalogItemsDialog.set_offsetY((document.body.clientHeight/2)-250);
        if (document.getElementById("c_buttonCancelProductCatalog"))
            document.getElementById("c_buttonCancelProductCatalog").value='<%=Cancel %>';
        if (document.getElementById("c_buttonAddProductCatalog"))
            document.getElementById("c_buttonAddProductCatalog").value='<%=Add %>';
        
        //Make sure that the hiden iframe will be showed.
        document.getElementById(dialog.get_id()+"_IFrame").style.display = 'block';
        document.getElementById(dialog.get_id()+"_IFrame").style.visiblity = 'visible';
        document.getElementById(dialog.get_id()).style.display = 'block';
        document.getElementById(dialog.get_id()).style.visiblity = 'visible';
    }

    function ProductCatalogDialogClose(dialog)
    {
        if(insertID) {
            var iframeDocument = document.getElementById(dialog.get_id()+"_IFrame").contentWindow.document;
            if (g_textBoxProductCatalogNamesID != null && document.getElementById(g_textBoxProductCatalogNamesID))
            {
                var productCatalogNames = iframeDocument.getElementById('c_inputHiddenProductCatalogNames').value;
                
                while(productCatalogNames.indexOf('#LITIUM#') > -1)
                    productCatalogNames = productCatalogNames.replace('#LITIUM#', ',');
                document.getElementById(g_textBoxProductCatalogNamesID).value = productCatalogNames;
            }
            if (g_inputHiddenProductCatalogIDsID != null && document.getElementById(g_inputHiddenProductCatalogIDsID))
                document.getElementById(g_inputHiddenProductCatalogIDsID).value = iframeDocument.getElementById('c_inputHiddenProductCatalogIDs').value;

            if (g_inputHiddenProductCatalogExtraIDsID != null && document.getElementById(g_inputHiddenProductCatalogExtraIDsID))
                document.getElementById(g_inputHiddenProductCatalogExtraIDsID).value = iframeDocument.getElementById('c_inputHiddenProductCatalogExtraIDs').value;

            if (g_textBoxProductCatalogExtraInfosID != null && document.getElementById(g_textBoxProductCatalogExtraInfosID))
            {
                var productCatalogExtraInfos = iframeDocument.getElementById('c_inputHiddenProductCatalogExtraInfos').value;
                while(productCatalogExtraInfos.indexOf('#LITIUM#') > -1)
                    productCatalogExtraInfos = productCatalogExtraInfos.replace('#LITIUM#', ',');
                document.getElementById(g_textBoxProductCatalogExtraInfosID).value = productCatalogExtraInfos;
                
            }
            if(g_gridResultId != '')
            {
                $find(g_gridResultId).get_masterTableView().rebind();
            }
            
            var iframeWindow = document.getElementById(dialog.get_id()+"_IFrame").contentWindow;
            if (iframeWindow)
                iframeWindow.submitResult();
        } 
        
        //Make sure to hide the iframe.
        document.getElementById(dialog.get_id()+"_IFrame").style.display = 'none';
        document.getElementById(dialog.get_id()+"_IFrame").style.visiblity = 'hidden';
        document.getElementById(dialog.get_id()).style.display = 'none';
        document.getElementById(dialog.get_id()).style.visiblity = 'hidden';
    }
    
    <%
        if(ModuleProductCatalog.ExistsInstance) {
    %>
  
    // title: Extra information in the title of the pop up window.
    // inputHiddenProductCatalogIDsID: ID of the input control where the selected item id(s) will be saved.
    // textBoxProductCatalogNamesID: ID of the input control where the selected item name(s) will be saved.
    // productCatalogItemType: Type of the item. 0: article 1: productArticle, 2: product, 3: productCatalog, 4: productGroup
    // selectMultiple: Wheter to select multiple or not. 1: Select multiple 0: Select single
    // showUnpublishedItem: Wheter to show unpublished item in the grid or not. 1: Show unpublished and published items, 0: Show only published items
    // showOnlyPricedItems: Whether to show items with prices or not. 1: Show items with prices, 0: Show all items
    // currencyID: Current currency ID.
    // uniqueName: A unique name in order to be able to refresh the iframe's content if there is more than one selection user control on the same page.
    // inputHiddenProductCatalogExtraIDsID: ID of the input control where the selected item extra id(s) will be saved (Product id(s) in selection of product articles).
    // textAreaProductCatalogExtraInfosID: ID of the input control where the selected item extra info(s) will be saved (Article name(s) in selection of product articles).
    // propertyID: Id of the property if pop up is called from administration pages of web publishing.
    function OpenSelectFromProductCatalogEx(title, inputHiddenProductCatalogIDsID, textBoxProductCatalogNamesID, productCatalogItemType, selectMultiple, showUnpublishedItem, showOnlyPricedItems, currencyID, uniqueName, inputHiddenProductCatalogExtraIDsID, textAreaProductCatalogExtraInfosID, propertyID)
    {
        g_inputHiddenProductCatalogIDsID = inputHiddenProductCatalogIDsID;
        g_textBoxProductCatalogNamesID = textBoxProductCatalogNamesID;
        g_inputHiddenProductCatalogExtraIDsID = inputHiddenProductCatalogExtraIDsID;
        g_textBoxProductCatalogExtraInfosID = textAreaProductCatalogExtraInfosID;
        ProductCatalogItemsDialog.set_contentUrl("<%=Page.ResolveUrl("~/LitiumStudio/WebUserControls/SelectItemFromProductCatalog.aspx")%>?PRODUCT_CATALOG_ITEM_TYPE=" + productCatalogItemType + "&SELECT_MULTIPLE=" + selectMultiple + "&SHOW_UNPUBLISHED_ITEM=" + showUnpublishedItem + "&SHOW_ONLY_PRICED_ITEMS=" + showOnlyPricedItems + "&CURRENCY_ID=" + currencyID + "&UNIQUE_NAME=" + uniqueName + "&PAGE_SIZE=<%= PageSize %>" + "&PROPERTY_ID=" + propertyID + "&t=" + (new Date().toString())); 
        var title1 = '';
        switch(productCatalogItemType)
        {
            case '0':
                title1 = '<%=ModuleProductCatalog.Instance.Strings.GetValue("SelectArticleFromProductCatalog", foundationContext.LanguageID, true)%>';
                break;
            case '1':
                title1 = '<%=ModuleProductCatalog.Instance.Strings.GetValue("SelectProductArticleFromProductCatalog", foundationContext.LanguageID, true)%>';
                break;
            case '2':
                title1 = '<%=ModuleProductCatalog.Instance.Strings.GetValue("SelectProductFromProductCatalog", foundationContext.LanguageID, true)%>';
                break;
            case '3':
                title1 = '<%=ModuleProductCatalog.Instance.Strings.GetValue("SelectProductCatalogFromProductCatalog", foundationContext.LanguageID, true)%>';
                break;
            case '4':
                title1 = '<%=ModuleProductCatalog.Instance.Strings.GetValue("SelectProductGroupFromProductCatalog", foundationContext.LanguageID, true)%>';
                break;
        }
        var title2 = '';
        if (title != '')
            title2 = ' (' + title + ')';
        ProductCatalogItemsDialog.Show('', title1 + title2);
    }    
    
    // title: Extra information in the title of the pop up window.
    // inputHiddenProductCatalogIDsID: ID of the input control where the selected item id(s) will be saved.
    // textBoxProductCatalogNamesID: ID of the input control where the selected item name(s) will be saved.
    // productCatalogItemType: Type of the item. 0: article 1: productArticle, 2: product, 3: productCatalog, 4: productGroup
    // selectMultiple: Wheter to select multiple or not. 1: Select multiple 0: Select single
    // showUnpublishedItem: Wheter to show unpublished item in the grid or not. 1: Show unpublished and published items, 0: Show only published items
    // uniqueName: A unique name in order to be able to refresh the iframe's content if there is more than one selection user control on the same page.
    // inputHiddenProductCatalogExtraIDsID: ID of the input control where the selected item extra id(s) will be saved (Product id(s) in selection of product articles).
    // textAreaProductCatalogExtraInfosID: ID of the input control where the selected item extra info(s) will be saved (Article name(s) in selection of product articles).
    // propertyID: Id of the property if pop up is called from administration pages of web publishing
    function OpenSelectFromProductCatalog(title, inputHiddenProductCatalogIDsID, textBoxProductCatalogNamesID, productCatalogItemType, selectMultiple, showUnpublishedItem, uniqueName, inputHiddenProductCatalogExtraIDsID, textAreaProductCatalogExtraInfosID, propertyID)
    {
        g_inputHiddenProductCatalogIDsID = inputHiddenProductCatalogIDsID;
        g_textBoxProductCatalogNamesID = textBoxProductCatalogNamesID;
        g_inputHiddenProductCatalogExtraIDsID = inputHiddenProductCatalogExtraIDsID;
        g_textBoxProductCatalogExtraInfosID = textAreaProductCatalogExtraInfosID;
        ProductCatalogItemsDialog.set_contentUrl("<%=Page.ResolveUrl("~/LitiumStudio/WebUserControls/SelectItemFromProductCatalog.aspx")%>?PRODUCT_CATALOG_ITEM_TYPE=" + productCatalogItemType + "&SELECT_MULTIPLE=" + selectMultiple + "&SHOW_UNPUBLISHED_ITEM=" + showUnpublishedItem + "&UNIQUE_NAME=" + uniqueName + "&PAGE_SIZE=<%= PageSize %>" + "&PROPERTY_ID=" + propertyID + "&t=" + (new Date().toString())); 
        var title1 = '';
        switch(productCatalogItemType)
        {
            case '0':
                title1 = '<%=ModuleProductCatalog.Instance.Strings.GetValue("SelectArticleFromProductCatalog", foundationContext.LanguageID, true)%>';
                break;
            case '1':
                title1 = '<%=ModuleProductCatalog.Instance.Strings.GetValue("SelectProductArticleFromProductCatalog", foundationContext.LanguageID, true)%>';
                break;
            case '2':
                title1 = '<%=ModuleProductCatalog.Instance.Strings.GetValue("SelectProductFromProductCatalog", foundationContext.LanguageID, true)%>';
                break;
            case '3':
                title1 = '<%=ModuleProductCatalog.Instance.Strings.GetValue("SelectProductCatalogFromProductCatalog", foundationContext.LanguageID, true)%>';
                break;
            case '4':
                title1 = '<%=ModuleProductCatalog.Instance.Strings.GetValue("SelectProductGroupFromProductCatalog", foundationContext.LanguageID, true)%>';
                break;
        }
        var title2 = '';
        if (title != '')
            title2 = ' (' + title + ')';
        ProductCatalogItemsDialog.Show('', title1 + title2);
    }
    
   function OpenSelectFromProductCatalogGridResult(title, inputHiddenProductCatalogIDsID, textBoxProductCatalogNamesID, productCatalogItemType, selectMultiple, showUnpublishedItem, uniqueName, inputHiddenProductCatalogExtraIDsID, gridId, textAreaProductCatalogExtraInfosID, propertyID)
    {
        g_inputHiddenProductCatalogIDsID = inputHiddenProductCatalogIDsID;
        g_textBoxProductCatalogNamesID = textBoxProductCatalogNamesID;
        g_inputHiddenProductCatalogExtraIDsID = inputHiddenProductCatalogExtraIDsID;
        g_textBoxProductCatalogExtraInfosID = textAreaProductCatalogExtraInfosID;
        g_gridResultId = gridId;
        ProductCatalogItemsDialog.set_contentUrl("<%=Page.ResolveUrl("~/LitiumStudio/WebUserControls/SelectItemFromProductCatalog.aspx")%>?PRODUCT_CATALOG_ITEM_TYPE=" + productCatalogItemType + "&SELECT_MULTIPLE=" + selectMultiple + "&SHOW_UNPUBLISHED_ITEM=" + showUnpublishedItem + "&UNIQUE_NAME=" + uniqueName + "&PAGE_SIZE=<%= PageSize %>" + "&PROPERTY_ID=" + propertyID + "&t=" + (new Date().toString())); 
        var title1 = '';
        switch(productCatalogItemType)
        {
            case '0':
                title1 = '<%=ModuleProductCatalog.Instance.Strings.GetValue("SelectArticleFromProductCatalog", foundationContext.LanguageID, true)%>';
                break;
            case '1':
                title1 = '<%=ModuleProductCatalog.Instance.Strings.GetValue("SelectProductArticleFromProductCatalog", foundationContext.LanguageID, true)%>';
                break;
            case '2':
                title1 = '<%=ModuleProductCatalog.Instance.Strings.GetValue("SelectProductFromProductCatalog", foundationContext.LanguageID, true)%>';
                break;
            case '3':
                title1 = '<%=ModuleProductCatalog.Instance.Strings.GetValue("SelectProductCatalogFromProductCatalog", foundationContext.LanguageID, true)%>';
                break;
            case '4':
                title1 = '<%=ModuleProductCatalog.Instance.Strings.GetValue("SelectProductGroupFromProductCatalog", foundationContext.LanguageID, true)%>';
                break;
        }
        var title2 = '';
        if (title != '')
            title2 = ' (' + title + ')';
        ProductCatalogItemsDialog.Show('', title1 + title2);
    }
    
    <% 
    } 
    %>
    function CloseSelectFromProductCatalog(status)
    {
        insertID=status;
        if(document.all && navigator.userAgent.indexOf("opera") == -1) {
        ProductCatalogItemsDialog.set_contentUrl("about:blank");
        } 
        
        ProductCatalogItemsDialog.Close();
    }
</script>


<ComponentArt:Dialog
     Alignment="TopLeft"
     PreloadContentUrl="true"
     ContentUrl="about:blank" 
     ContentCssClass="litModalPopupContent" 
     FooterClientTemplateId="FooterClientTemplate"
     FooterCssClass="litModalPopupFooter" 
     HeaderClientTemplateId="HeaderClientTemplate"
     HeaderCssClass="litModalPopupHeader"
     Height="700"
     ID="ProductCatalogItemsDialog" 
     IFrameCssClass="litModalPopupIFrame"
     IFrameBorder="0" 
     Modal="true"
     Runat="server"
     Width="702" 
     X= "0" 
     Y = "0"
     >

    <ClientEvents>
       <OnShow EventHandler="ProductCatalogDialogShow" />
       <OnClose EventHandler="ProductCatalogDialogClose" />
    </ClientEvents>

	<ClientTemplates>
        <ComponentArt:ClientTemplate id="HeaderClientTemplate">
	        <table cellpadding="0" cellspacing="0" width="702" onmousedown="ProductCatalogItemsDialog.StartDrag(event);" >
		        <tr>
		           <td width="6"><img style="display:block;" src="~/LitiumStudio/Images/ca_dialog/top_left.gif"/></td>
		           <td style="background-image:url(~/LitiumStudio/Images/ca_dialog/top.gif);padding:3px; padding-bottom: 0px;">
		                <table width="100%" height="100%" cellpadding="0" cellspacing="0">
		                    <tr>
		                        <td valign="bottom" class="litHeader3">## Parent.Title ##</td>
		                        <td align="right" valign="middle"></td>
		                    </tr>
		                </table>
		           </td>
		           <td width="30" style="background-image:url(~/LitiumStudio/Images/ca_dialog/top.gif);"><img id="Img2" style="display:block;margin-top:2px;" src="~/LitiumStudio/Images/ca_dialog/close.gif" onclick="CloseSelectFromProductCatalog(false);"></td>
		           <td width="6"><img id="Img3" style="display:block;" src="~/LitiumStudio/Images/ca_dialog/top_right.gif"/></td>
                </tr>
             </table>
        </ComponentArt:ClientTemplate>

        <ComponentArt:ClientTemplate id="FooterClientTemplate">
        <div class="ie6Overlap">
            <table class="litModalPopupBottom" cellpadding="0" border="0" cellspacing="0" width="701">
                <tr>
		             <td style="background-repeat:repeat-y;background-image:url(~/LitiumStudio/Images/ca_dialog/left.gif);"><img style="display:block;" src="~/LitiumStudio/Images/ca_dialog/spacer.gif" height="1" width="6" /></td> 
		             <td style="text-align:right; padding-right:2px; padding-bottom:3px;">
		                <input type="button" id="c_buttonCancelProductCatalog" onclick="CloseSelectFromProductCatalog(false);" class="litInputButton" value="Avbryt"/>
		                &nbsp;
		                <input type="button" id="c_buttonAddProductCatalog" onclick="CloseSelectFromProductCatalog(true);" class="litInputButton"  value="Infoga"  />
		             </td>
		             <td style="background-repeat:repeat-y;background-image:url(~/LitiumStudio/Images/ca_dialog/right.gif);"><img style="display:block;" src="~/LitiumStudio/Images/ca_dialog/spacer.gif" height="1" width="6" /></td> 
		        </tr>
		        <tr>
		             <td width="6"><img style="display:block;" src="~/LitiumStudio/Images/ca_dialog/bottom_left.png"/></td>
		             <td style="background-image:url(~/LitiumStudio/Images/ca_dialog/bottom.gif);">
		                <img style="display:block;" src="~/LitiumStudio/Images/ca_dialog/spacer.gif" height="5" width="688" />
		             </td>
		             <td width="6"><img style="display:block;background-repeat:repeat-y;" src="~/LitiumStudio/Images/ca_dialog/bottom_right.png"/></td>
		        </tr>
		    </table>
		    <!--[if lte IE 6.5]><iframe id="if" src="blank.html" frameborder="0"></iframe><![endif]-->
		</div>    
        </ComponentArt:ClientTemplate>
    </ClientTemplates>
</ComponentArt:Dialog>
