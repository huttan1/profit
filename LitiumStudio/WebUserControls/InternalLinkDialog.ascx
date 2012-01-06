<%@ Import namespace="Litium.Foundation.Modules.CMS"%>
<%@ control language="C#" autoeventwireup="true" inherits="Web.Modules.Common.WebUserControls.InternalLinkDialog, Litum.Studio.Web" %>
<script type="text/javascript">
    var insertID = false;
    var g_inputHiddenInternalLinkIDsID = '';
    var g_textBoxInternalLinkNamesID = '';

    function InternalLinkDialogShow(dialog)
    {
        if (document.getElementById("c_buttonCancelInternalLink"))
            document.getElementById("c_buttonCancelInternalLink").value='<%=CancelButtonText %>';
        if (document.getElementById("c_buttonAddInternalLink"))
            document.getElementById("c_buttonAddInternalLink").value='<%=AddButtonText %>';
        
        //Make sure that the hiden iframe will be showed.
        document.getElementById(dialog.get_id()+"_IFrame").style.display = 'block';
        document.getElementById(dialog.get_id()+"_IFrame").style.visiblity = 'visible';
        document.getElementById(dialog.get_id()).style.display = 'block';
        document.getElementById(dialog.get_id()).style.visiblity = 'visible';
    }

    function InternalLinkDialogClose(dialog)
    {
        if(insertID) {
            var iframeDocument = document.getElementById(dialog.get_id()+"_IFrame").contentWindow.document;
            if (g_textBoxInternalLinkNamesID != null && document.getElementById(g_textBoxInternalLinkNamesID) && iframeDocument.getElementById('selectedPageName').value.length > 0)
                document.getElementById(g_textBoxInternalLinkNamesID).value = iframeDocument.getElementById('selectedPageName').value;
            if (g_inputHiddenInternalLinkIDsID != null && document.getElementById(g_inputHiddenInternalLinkIDsID) && iframeDocument.getElementById('selectedPageID').value.length > 0)
                document.getElementById(g_inputHiddenInternalLinkIDsID).value = iframeDocument.getElementById('selectedPageID').value;
        } 
        
        //Make sure to hide the iframe.
        document.getElementById(dialog.get_id()+"_IFrame").style.display = 'none';
        document.getElementById(dialog.get_id()+"_IFrame").style.visiblity = 'hidden';
        document.getElementById(dialog.get_id()).style.display = 'none';
        document.getElementById(dialog.get_id()).style.visiblity = 'hidden';
    }
    
    
    // title: Extra information in the title of the pop up window.
    // inputHiddenInternalLinkIDsID: ID of the input control where the selected item id(s) will be saved.
    // textBoxInternalLinkNamesID: ID of the input control where the selected item name(s) will be saved.
    // uniqueName: A unique name in order to be able to refresh the iframe's content if there is more than one selection user control on the same page.
  function OpenSelectInternalLink(title, inputHiddenInternalLinkIDsID, textBoxInternalLinkNamesID, uniqueName)
    {
    <%
        if(ModuleCMS.ExistsInstance) {
    %>
        g_inputHiddenInternalLinkIDsID = inputHiddenInternalLinkIDsID;
        g_textBoxInternalLinkNamesID = textBoxInternalLinkNamesID;
        InternalLinkItemsDialog.set_contentUrl("<%=Page.ResolveUrl("~/LitiumStudio/WebUserControls/SelectInternalLink.aspx") %>?UNIQUE_NAME=" + uniqueName + "" + "&t=" + (new Date().toString())); 
        var title1 = '<%=ModuleCMS.Instance.Strings.GetValue("SelectInternalLink", foundationContext.LanguageID, true)%>';
        var title2 = '';
        if (title != '')
            title2 = ' (' + title + ')';
        InternalLinkItemsDialog.Show('', title1 + title2);
    <% 
		} 
    %>
    }
    function CloseSelectInternalLink(status)
    {
        insertID=status;
        if(document.all && navigator.userAgent.indexOf("opera") == -1) {
        InternalLinkItemsDialog.set_contentUrl("about:blank");}
        InternalLinkItemsDialog.Close();
    }
</script>


   
<ComponentArt:Dialog 
     Alignment="MiddleCentre"
     ContentUrl="about:blank" 
     ContentCssClass="litModalPopupContent" 
     FooterClientTemplateId="FooterClientTemplate"
     FooterCssClass="litModalPopupFooter" 
     HeaderClientTemplateId="HeaderClientTemplate"
     HeaderCssClass="litModalPopupHeader"
     Height="450"
     ID="InternalLinkItemsDialog" 
     IFrameCssClass="litModalPopupIFrame"
     IFrameBorder="0" 
     Modal="true"
     Runat="server"
     Width="702" 
     X="270" 
     Y="100"
     >

    <ClientEvents>
       <OnShow EventHandler="InternalLinkDialogShow" />
       <OnClose EventHandler="InternalLinkDialogClose" />
    </ClientEvents>

	<ClientTemplates>
        <ComponentArt:ClientTemplate id="HeaderClientTemplate">        
	        <table cellpadding="0" border="0" cellspacing="0" width="702" onmousedown="InternalLinkItemsDialog.StartDrag(event);" >
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
		           <td width="30" style="background-image:url(~/LitiumStudio/Images/ca_dialog/top.gif);"><img id="Img2" style="display:block;margin-top:2px;" src="~/LitiumStudio/Images/ca_dialog/close.gif" onclick="CloseSelectInternalLink(false);"></td>
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
		                <input type="button" id="c_buttonCancelInternalLink" onclick="CloseSelectInternalLink(false);" class="litInputButton" value="Avbryt"/>
		                &nbsp;
		                <input type="button" id="c_buttonAddInternalLink" onclick="CloseSelectInternalLink(true);" class="litInputButton"  value="Infoga"  />
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