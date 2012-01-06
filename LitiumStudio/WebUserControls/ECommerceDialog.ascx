<%@ Import Namespace="Litium.Foundation.GUI"%>
<%@ Import namespace="Litium.Foundation.Modules.ECommerce"%>
<%@ control language="C#" autoeventwireup="true" inherits="Web.Modules.Common.WebUserControls.ECommerceDialog, Litum.Studio.Web" %>


<script type="text/javascript">
    var insertID = false;
    var g_inputHiddenECommerceIDsID = '';
    var g_textBoxECommerceNamesID = '';
    

    function ECommerceDialogShow(dialog)
    {
        if (document.getElementById("c_buttonCancelECommerce"))
            document.getElementById("c_buttonCancelECommerce").value='<%=this.Cancel %>';
        if (document.getElementById("c_buttonAddECommerce"))
            document.getElementById("c_buttonAddECommerce").value='<%=this.Add %>';
        /*
        if (g_textBoxECommerceNamesID != '_' && document.getElementById(dialog.get_value() + g_textBoxECommerceNamesID))
            document.getElementById(dialog.get_value() + g_textBoxECommerceNamesID).value = "";
        if (g_inputHiddenECommerceIDsID != '_' && document.getElementById(dialog.get_value() + g_inputHiddenECommerceIDsID))
            document.getElementById(dialog.get_value() + g_inputHiddenECommerceIDsID).value = "";
        */
        
        //Make sure that the hiden iframe will be showed.
        document.getElementById(dialog.get_id()+"_IFrame").style.display = 'block';
        document.getElementById(dialog.get_id()+"_IFrame").style.visiblity = 'visible';
        document.getElementById(dialog.get_id()).style.display = 'block';
        document.getElementById(dialog.get_id()).style.visiblity = 'visible';
    }

    function ECommerceDialogClose(dialog)
    {
        if(insertID) {

            var iframeDocument = document.getElementById(dialog.get_id()+"_IFrame").contentWindow.document;
            if (g_textBoxECommerceNamesID != null && document.getElementById(g_textBoxECommerceNamesID) && iframeDocument.getElementById('c_inputHiddenECommerceNames').value.length > 0)
            {
                var ecommerceNames = iframeDocument.getElementById('c_inputHiddenECommerceNames').value;
                while(ecommerceNames.indexOf('#LITIUM#') > -1)
                    ecommerceNames = ecommerceNames.replace('#LITIUM#', ',');
                document.getElementById(g_textBoxECommerceNamesID).value = ecommerceNames;
            }
            if (g_inputHiddenECommerceIDsID != null && document.getElementById(g_inputHiddenECommerceIDsID) && iframeDocument.getElementById('c_inputHiddenECommerceIDs').value.length > 0)
                document.getElementById(g_inputHiddenECommerceIDsID).value = iframeDocument.getElementById('c_inputHiddenECommerceIDs').value;

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
        if(ModuleECommerce.ExistsInstance) {
    %>
    
    // title: Extra information in the title of the pop up window.
    // inputHiddenECommerceIDsID: ID of the input control where the selected item id(s) will be saved.
    // textBoxECommerceNamesID: ID of the input control where the selected item name(s) will be saved.
    // eCommerceItemType: Type of the item. 0: currency
    // selectMultiple: Wheter to select multiple or not. 1: Select multiple 0: Select single
    // uniqueName: A unique name in order to be able to refresh the iframe's content if there is more than one selection user control on the same page.
    // propertyID: Id of the property if pop up is called from administration pages of web publishing
    function OpenSelectFromECommerce(title, inputHiddenECommerceIDsID, textBoxECommerceNamesID, eCommerceItemType, selectMultiple, uniqueName, propertyID)
    {
        
        g_inputHiddenECommerceIDsID = inputHiddenECommerceIDsID;
        g_textBoxECommerceNamesID = textBoxECommerceNamesID;
        ECommerceItemsDialog.set_offsetX((document.body.clientWidth/2)-350);
        ECommerceItemsDialog.set_offsetY((document.body.clientHeight/2)-250);
        ECommerceItemsDialog.set_contentUrl("<%=ResolveUrl("SelectItemFromECommerce.aspx") %>?ECOMMERCE_ITEM_TYPE=" + eCommerceItemType + "&SELECT_MULTIPLE=" + selectMultiple + "&UNIQUE_NAME=" + uniqueName + "&PAGE_SIZE=<%= PageSize %>" +  "&PROPERTY_ID=" + propertyID + "&t=" + (new Date().toString())); 
        var title1 = '';
        switch(eCommerceItemType)
        {
            case '0':
                title1 = '<%=ModuleECommerce.Instance.Strings.GetValue("SelectCurrencyFromECommerce", FoundationContext.Current.LanguageID, true)%>';
                break;
        }
        var title2 = '';
        if (title != '')
            title2 = ' (' + title + ')';
        ECommerceItemsDialog.Show('', title1 + title2);
    }
    <% 
    } 
    %>
    function CloseSelectFromECommerce(status)
    {
        insertID=status;
        if(document.all && navigator.userAgent.indexOf("opera") == -1) {
        ECommerceItemsDialog.set_contentUrl("about:blank");}
        ECommerceItemsDialog.Close();
    }
</script>


   
<ComponentArt:Dialog 
     Alignment="TopLeft"
     ContentUrl="about:blank" 
     ContentCssClass="litModalPopupContent" 
     FooterClientTemplateId="FooterClientTemplate"
     FooterCssClass="litModalPopupfooter" 
     HeaderClientTemplateId="HeaderClientTemplate"
     HeaderCssClass="litModalPopupHeader"
     Height="700"
     ID="ECommerceItemsDialog" 
     IFrameCssClass="litModalPopupIFrame"
     IFrameBorder="0" 
     Modal="true"
     Runat="server"
     Width="702"
     X="0"
     Y="0"
     >

    <ClientEvents>
       <OnShow EventHandler="ECommerceDialogShow" />
       <OnClose EventHandler="ECommerceDialogClose" />
    </ClientEvents>

	<ClientTemplates>
        <ComponentArt:ClientTemplate id="HeaderClientTemplate">
	        <table cellpadding="0" cellspacing="0" width="702" onmousedown="ECommerceItemsDialog.StartDrag(event);" >
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
		           <td width="30" style="background-image:url(~/LitiumStudio/Images/ca_dialog/top.gif);"><img id="Img2" style="display:block;margin-top:2px;" src="~/LitiumStudio/Images/ca_dialog/close.gif" onclick="CloseSelectFromECommerce(false);"></td>
		           <td width="6"><img id="Img3" style="display:block;" src="~/LitiumStudio/Images/ca_dialog/top_right.gif"/></td>
                </tr>
             </table>
        </ComponentArt:ClientTemplate>

        <ComponentArt:ClientTemplate id="FooterClientTemplate">
            <table class="litModalPopupBottom" cellpadding="0" cellspacing="0" width="701">
                <tr>
		             <td style="background-repeat:repeat-y;background-image:url(~/LitiumStudio/Images/ca_dialog/left.gif);"><img style="display:block;" src="~/LitiumStudio/Images/ca_dialog/spacer.gif" height="1" width="6" /></td> 
		             <td style="text-align:right; padding-right:2px; padding-bottom:3px;">
		                <input type="button" id="c_buttonCancelECommerce" onclick="CloseSelectFromECommerce(false);" class="litInputButton" value="Avbryt"/>
		                &nbsp;
		                <input type="button" id="c_buttonAddECommerce" onclick="CloseSelectFromECommerce(true);" class="litInputButton"  value="Infoga"  />
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
        </ComponentArt:ClientTemplate>
    </ClientTemplates>
</ComponentArt:Dialog>