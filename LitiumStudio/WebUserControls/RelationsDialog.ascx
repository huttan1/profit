<%@ Import namespace="Litium.Foundation.Modules.Relations"%>
<%@ control language="C#" autoeventwireup="true" inherits="Web.Modules.Common.WebUserControls.RelationsDialog, Litum.Studio.Web" %>


<script type="text/javascript">
    var insertID = false;
    var g_inputHiddenRelationsIDsID = '';
    var g_textBoxRelationsNamesID = '';
    var g_parentPageName = ''; 
    var g_gridResultId = '';

    function RelationsDialogShow(dialog)
    {
        RelationsItemsDialog.set_offsetX((document.body.clientWidth/2)-350);
        RelationsItemsDialog.set_offsetY((document.body.clientHeight/2)-250);
        if (document.getElementById("c_buttonCancelRelations"))
            document.getElementById("c_buttonCancelRelations").value='<%=Cancel %>';
        if (document.getElementById("c_buttonAddRelations"))
            document.getElementById("c_buttonAddRelations").value='<%=Add %>';
        /*
        if (g_textBoxRelationsNamesID != '_' && document.getElementById(dialog.get_value() + g_textBoxRelationsNamesID))
            document.getElementById(dialog.get_value() + g_textBoxRelationsNamesID).value = "";
        if (g_inputHiddenRelationsIDsID != '_' && document.getElementById(dialog.get_value() + g_inputHiddenRelationsIDsID))
            document.getElementById(dialog.get_value() + g_inputHiddenRelationsIDsID).value = "";
        */
        
        //Make sure that the hiden iframe will be showed.
        document.getElementById(dialog.get_id()+"_IFrame").style.display = 'block';
        document.getElementById(dialog.get_id()+"_IFrame").style.visiblity = 'visible';
        document.getElementById(dialog.get_id()).style.display = 'block';
        document.getElementById(dialog.get_id()).style.visiblity = 'visible';
    }

    function RelationsDialogClose(dialog)
    {		
        if(insertID) {
            var iframeDocument = document.getElementById(dialog.get_id()+"_IFrame").contentWindow.document;
            if (g_textBoxRelationsNamesID != null && document.getElementById(g_textBoxRelationsNamesID) && iframeDocument.getElementById('c_inputHiddenRelationsNames').value.length >= 0)
            {
                var relationsNames = iframeDocument.getElementById('c_inputHiddenRelationsNames').value;
                while(relationsNames.indexOf('#LITIUM#') > -1)
                    relationsNames = relationsNames.replace('#LITIUM#', ',');
                document.getElementById(g_textBoxRelationsNamesID).value = relationsNames;
            }
            if (g_inputHiddenRelationsIDsID != null && document.getElementById(g_inputHiddenRelationsIDsID) && iframeDocument.getElementById('c_inputHiddenRelationsIDs').value.length >= 0)
            {
                document.getElementById(g_inputHiddenRelationsIDsID).value = iframeDocument.getElementById('c_inputHiddenRelationsIDs').value;
            }
            
            if(g_gridResultId != '')
            {
                $find(g_gridResultId).get_masterTableView().rebind();
            }
            
            var idString = document.getElementById(g_inputHiddenRelationsIDsID).value;
            idStringArray = idString.split(',');
	        
            if(g_parentPageName != '')
            {
                switch(g_parentPageName)
                {
                    case 'CustomerInfo':
                        GetPersonForCustomerInfo();
                        break;    
                    case 'Delivery':
                        GetPersonForDelivery();
                        break;
                    case 'Billing':
                        GetPersonForBilling();
                        break;
                    default:
                        break
                } 

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
        if(ModuleRelations.ExistsInstance) {
    %>
    
    // title: Extra information in the title of the pop up window.
    // inputHiddenRelationsIDsID: ID of the input control where the selected item id(s) will be saved.
    // textBoxRelationsNamesID: ID of the input control where the selected item name(s) will be saved.
    // relationsItemType: Type of the item. 0: group, 1: organization, 2: person, 3: role
    // selectMultiple: Wheter to select multiple or not. 1: Select multiple 0: Select single
    // uniqueName: A unique name in order to be able to refresh the iframe's content if there is more than one selection user control on the same page.
    // propertyID: Id of the property if pop up is called from administration pages of web publishing
  function OpenSelectFromRelations(title, inputHiddenRelationsIDsID, textBoxRelationsNamesID, relationsItemType, selectMultiple, uniqueName, parentName, propertyID)
    {
        g_parentPageName = parentName;
        g_inputHiddenRelationsIDsID = inputHiddenRelationsIDsID;
        g_textBoxRelationsNamesID = textBoxRelationsNamesID;
        RelationsItemsDialog.set_contentUrl("<%=Page.ResolveUrl("~/LitiumStudio/WebUserControls/SelectItemFromRelations.aspx") %>?RELATIONS_ITEM_TYPE=" + relationsItemType + "&SELECT_MULTIPLE=" + selectMultiple + "&UNIQUE_NAME=" + uniqueName + "&PAGE_SIZE=<%= PageSize %>" + "&PROPERTY_ID=" + propertyID + "&t=" + (new Date().toString())); 
        var title1 = '';
        switch(relationsItemType)
        {
            case '0':
                title1 = '<%=ModuleRelations.Instance.Strings.GetValue("SelectGroupFromRelations", foundationContext.LanguageID, true)%>';
                break;
            case '1':
                title1 = '<%=ModuleRelations.Instance.Strings.GetValue("SelectOrganizationFromRelations", foundationContext.LanguageID, true)%>';
                break;
            case '2':
                title1 = '<%=ModuleRelations.Instance.Strings.GetValue("SelectPersonFromRelations", foundationContext.LanguageID, true)%>';
                break;
            case '3':
                title1 = '<%=ModuleRelations.Instance.Strings.GetValue("SelectRoleFromRelations", foundationContext.LanguageID, true)%>';
                break;
            case '4':
				title1 = '<%=ModuleRelations.Instance.Strings.GetValue("SelectFieldTemplateFromRelations", foundationContext.LanguageID, true)%>';
                break;
        }
        var title2 = '';
        if (title != '')
            title2 = ' (' + title + ')';
        RelationsItemsDialog.Show('', title1 + title2);
    }
    
        // title: Extra information in the title of the pop up window.
    // inputHiddenRelationsIDsID: ID of the input control where the selected item id(s) will be saved.
    // textBoxRelationsNamesID: ID of the input control where the selected item name(s) will be saved.
    // relationsItemType: Type of the item. 0: group, 1: organization, 2: person, 3: role
    // selectMultiple: Wheter to select multiple or not. 1: Select multiple 0: Select single
    // uniqueName: A unique name in order to be able to refresh the iframe's content if there is more than one selection user control on the same page.
    // propertyID: Id of the property if pop up is called from administration pages of web publishing
  function OpenSelectFromRelationsGridResult(title, inputHiddenRelationsIDsID, textBoxRelationsNamesID, gridResultID, relationsItemType, selectMultiple, uniqueName, parentName, propertyID)
    {
        g_parentPageName = parentName;
        g_inputHiddenRelationsIDsID = inputHiddenRelationsIDsID;
        g_textBoxRelationsNamesID = textBoxRelationsNamesID;
        g_gridResultId = gridResultID;
        RelationsItemsDialog.set_contentUrl("<%=Page.ResolveUrl("~/LitiumStudio/WebUserControls/SelectItemFromRelations.aspx") %>?RELATIONS_ITEM_TYPE=" + relationsItemType + "&SELECT_MULTIPLE=" + selectMultiple + "&UNIQUE_NAME=" + uniqueName + "&PAGE_SIZE=<%= PageSize %>" + "&PROPERTY_ID=" + propertyID + "&t=" + (new Date().toString())); 
        var title1 = '';
        switch(relationsItemType)
        {
            case '0':
                title1 = '<%=ModuleRelations.Instance.Strings.GetValue("SelectGroupFromRelations", foundationContext.LanguageID, true)%>';
                break;
            case '1':
                title1 = '<%=ModuleRelations.Instance.Strings.GetValue("SelectOrganizationFromRelations", foundationContext.LanguageID, true)%>';
                break;
            case '2':
                title1 = '<%=ModuleRelations.Instance.Strings.GetValue("SelectPersonFromRelations", foundationContext.LanguageID, true)%>';
                break;
            case '3':
                title1 = '<%=ModuleRelations.Instance.Strings.GetValue("SelectRoleFromRelations", foundationContext.LanguageID, true)%>';
                break;
            case '4':
				title1 = '<%=ModuleRelations.Instance.Strings.GetValue("SelectFieldTemplateFromRelations", foundationContext.LanguageID, true)%>';
                break;
        }
        var title2 = '';
        if (title != '')
            title2 = ' (' + title + ')';
        RelationsItemsDialog.Show('', title1 + title2);
    }
    
    <% 
    } 
    %>
    function CloseSelectFromRelations(status)
    {
        insertID=status;
        if(document.all && navigator.userAgent.indexOf("opera") == -1) {
        RelationsItemsDialog.set_contentUrl("about:blank");}
        RelationsItemsDialog.Close();
    }
</script>


   
<ComponentArt:Dialog 
     Alignment="TopLeft"
     ContentUrl="about:blank" 
     ContentCssClass="litModalPopupContent" 
     FooterClientTemplateId="FooterClientTemplate"
     FooterCssClass="litModalPopupFooter" 
     HeaderClientTemplateId="HeaderClientTemplate"
     HeaderCssClass="litModalPopupHeader"
     Height="700"
     ID="RelationsItemsDialog" 
     IFrameCssClass="litModalPopupIFrame"
     IFrameBorder="0" 
     Modal="true"
     Runat="server"
     Width="702" 
     X= "0" 
     Y = "0"
     >

    <ClientEvents>
       <OnShow EventHandler="RelationsDialogShow" />
       <OnClose EventHandler="RelationsDialogClose" />
    </ClientEvents>

	<ClientTemplates>
        <ComponentArt:ClientTemplate id="HeaderClientTemplate">        
	        <table cellpadding="0" border="0" cellspacing="0" width="702" onmousedown="RelationsItemsDialog.StartDrag(event);" >
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
		           <td width="30" style="background-image:url(~/LitiumStudio/Images/ca_dialog/top.gif);"><img id="Img2" style="display:block;margin-top:2px;" src="~/LitiumStudio/Images/ca_dialog/close.gif" onclick="CloseSelectFromRelations(false);"></td>
		           <td width="6"><img id="Img3" style="display:block;" src="~/LitiumStudio/Images/ca_dialog/top_right.gif"/></td>
                </tr>                
             </table>      
        </ComponentArt:ClientTemplate>

        <ComponentArt:ClientTemplate id="FooterClientTemplate">
           
          <div class="ie6Overlap">
            <table class="litModalPopupBottom" cellpadding="0" cellspacing="0" border="0" width="701">
                <tr>
		             <td style="background-repeat:repeat-y;background-image:url(~/LitiumStudio/Images/ca_dialog/left.gif);"><img style="display:block;" src="~/LitiumStudio/Images/ca_dialog/spacer.gif" height="1" width="6" /></td> 
		             <td style="text-align:right; padding-right:2px; padding-bottom:3px;">
		                <input type="button" id="c_buttonCancelRelations" onclick="CloseSelectFromRelations(false);" class="litInputButton" value="Avbryt"/>
		                &nbsp;
		                <input type="button" id="c_buttonAddRelations" onclick="CloseSelectFromRelations(true);" class="litInputButton"  value="Infoga"  />
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