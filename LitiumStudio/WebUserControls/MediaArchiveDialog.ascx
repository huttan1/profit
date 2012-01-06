<%@ Import namespace="Litium.Foundation.Modules.MediaArchive"%>
<%@ control language="C#" autoeventwireup="true" inherits="Web.Modules.Common.WebUserControls.MediaArchiveDialog, Litum.Studio.Web" %>


<script type="text/javascript">
    var insertFile = false;
    var g_inputHiddenMediaArchiveFileID = '';
    var g_inputHiddenMediaArchiveFileVersionID = '';
    var g_inputFileUpload = '';
    var g_panelMediaArchiveMessage1 = '';
    var g_textBoxMediaArchiveFileDispNameID = '';
    

    function dialogshow(dialog)
    {     
        MediaBankDialog.set_offsetX((document.body.clientWidth/2)-350);
        MediaBankDialog.set_offsetY((document.body.clientHeight/2)-250);
        if (document.getElementById("c_buttonCancel"))
            document.getElementById("c_buttonCancel").value='<%=this.Cancel %>';
        if (document.getElementById("c_buttonAdd"))
            document.getElementById("c_buttonAdd").value='<%=this.Add %>';
        if (g_textBoxMediaArchiveFileDispNameID != '_' && document.getElementById(dialog.get_value() + g_textBoxMediaArchiveFileDispNameID))
            document.getElementById(dialog.get_value() + g_textBoxMediaArchiveFileDispNameID).value = "";
        if (g_inputHiddenMediaArchiveFileID != '_' && document.getElementById(dialog.get_value() + g_inputHiddenMediaArchiveFileID))
            document.getElementById(dialog.get_value() + g_inputHiddenMediaArchiveFileID).value = "";
        if (g_inputHiddenMediaArchiveFileVersionID != '_' && document.getElementById(dialog.get_value() + g_inputHiddenMediaArchiveFileVersionID)) 
            document.getElementById(dialog.get_value() + g_inputHiddenMediaArchiveFileVersionID).value = "";
    
        
        //Make sure that the hiden iframe will be showed.
        document.getElementById(dialog.get_id()+"_IFrame").style.display = 'block';
        document.getElementById(dialog.get_id()+"_IFrame").style.visiblity = 'visible';
        document.getElementById(dialog.get_id()).style.display = 'block';
        document.getElementById(dialog.get_id()).style.visiblity = 'visible';
    }

    function dialogclose(dialog)
    {
        if(insertFile) {
            var iframeDocument = document.getElementById(dialog.get_id()+"_IFrame").contentWindow.document;
            
            if (g_textBoxMediaArchiveFileDispNameID != null && document.getElementById(g_textBoxMediaArchiveFileDispNameID))
                document.getElementById(g_textBoxMediaArchiveFileDispNameID).value = iframeDocument.getElementById('inputHiddenMediaArchiveFileName').value;
            if (g_inputHiddenMediaArchiveFileID != null && document.getElementById(g_inputHiddenMediaArchiveFileID))
                document.getElementById(g_inputHiddenMediaArchiveFileID).value = iframeDocument.getElementById('inputHiddenMediaArchiveFileID').value;
            
            if (g_inputHiddenMediaArchiveFileVersionID != null && document.getElementById(g_inputHiddenMediaArchiveFileVersionID))
            {
                var fileVersionID =  iframeDocument.getElementById('inputHiddenMediaArchiveFileVersionID').value;
                if(fileVersionID!='' && fileVersionID!='null')
                    document.getElementById(g_inputHiddenMediaArchiveFileVersionID).value = iframeDocument.getElementById('inputHiddenMediaArchiveFileVersionID').value;
            }
            
            if(iframeDocument.getElementById('inputHiddenMediaArchiveFileVersionName').value)
            {
                var versionName = iframeDocument.getElementById('inputHiddenMediaArchiveFileVersionName').value;
                if(versionName != '' && versionName!='null') 
                {
                    if (g_textBoxMediaArchiveFileDispNameID != null && document.getElementById(g_textBoxMediaArchiveFileDispNameID))
                    {
					    document.getElementById(g_textBoxMediaArchiveFileDispNameID).value += "(" + versionName + ")";
					}
				}
            }
            
            if (g_inputFileUpload != null && document.getElementById(g_inputFileUpload) && document.getElementById(g_inputFileUpload).value && document.getElementById(g_inputFileUpload).value != "")
				if (g_panelMediaArchiveMessage1 != null && document.getElementById(g_panelMediaArchiveMessage1))
					document.getElementById(g_panelMediaArchiveMessage1).style.display = '';
        } 
        
        //Make sure to hide the iframe.
        document.getElementById(dialog.get_id()+"_IFrame").style.display = 'none';
        document.getElementById(dialog.get_id()+"_IFrame").style.visiblity = 'hidden';
        document.getElementById(dialog.get_id()).style.display = 'none';
        document.getElementById(dialog.get_id()).style.visiblity = 'hidden';
        MediaBankDialog.set_contentUrl("about:blank"); 
    }
    
    <%
        if(ModuleMediaArchive.ExistsInstance) {
    %>
    function OpenSelectFromMediaBank(variableName, inputHiddenMediaArchiveFileID, inputHiddenMediaArchiveFileVersionID, inputFileUpload, panelMediaArchiveMessage1, textBoxMediaArchiveFileDispNameID, imageOnly)
    {       
        g_inputFileUpload = inputFileUpload;
        g_inputHiddenMediaArchiveFileID = inputHiddenMediaArchiveFileID;
        g_inputHiddenMediaArchiveFileVersionID = inputHiddenMediaArchiveFileVersionID;
        g_panelMediaArchiveMessage1 = panelMediaArchiveMessage1;
        g_textBoxMediaArchiveFileDispNameID = textBoxMediaArchiveFileDispNameID;
        MediaBankDialog.set_contentUrl("<%=Page.ResolveUrl("~/LitiumStudio/WebUserControls/SelectFile.aspx")%>?MA_IMG_ONLY=" + imageOnly + "&t=" + (new Date().toString())); 
        MediaBankDialog.Show('', '<%=ModuleMediaArchive.Instance.Strings.GetValue("SelectFileFromMediaArchiveFor", foundationContext.Language.Culture, true)%>' + variableName);
    }
    <% 
    } 
    %>
    function CloseSelectFromMediaBank(status)
    {
        insertFile=status;
        MediaBankDialog.Close();
    }
</script>


   
<ComponentArt:Dialog 
     Alignment="TopLeft"
     ContentUrl="about:blank" 
     ContentCssClass="contentCssMediaArchive" 
     FooterClientTemplateId="FooterClientTemplate"
     FooterCssClass="litModalPopupFooter" 
     HeaderClientTemplateId="HeaderClientTemplate"
     HeaderCssClass="litModalPopupHeader"
     Height="700"
	 ID="MediaBankDialog" 
     IFrameCssClass="litModalPopupIFrame"
     IFrameBorder="0" 
     Modal="true"
     Runat="server"
     Width="702" 
     X = "0" 
     Y = "0"
     >

    <ClientEvents>
       <OnShow EventHandler="dialogshow" />
       <OnClose EventHandler="dialogclose" />
    </ClientEvents>

	<ClientTemplates>
        <ComponentArt:ClientTemplate id="HeaderClientTemplate">
	        <table cellpadding="0" cellspacing="0" width="702" onmousedown="MediaBankDialog.StartDrag(event);" >
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
		           <td width="30" style="background-image:url(~/LitiumStudio/Images/ca_dialog/top.gif);"><img id="Img2" style="display:block;margin-top:2px;" src="~/LitiumStudio/Images/ca_dialog/close.gif" onclick="CloseSelectFromMediaBank(false);"></td>
		           <td width="6"><img id="Img3" style="display:block;" src="~/LitiumStudio/Images/ca_dialog/top_right.gif"/></td>
                </tr>
             </table>
        </ComponentArt:ClientTemplate>

        <ComponentArt:ClientTemplate id="FooterClientTemplate">
            <table class="litModalPopupBottom" cellpadding="0" cellspacing="0" width="701">
                <tr>
		             <td style="background-repeat:repeat-y;background-image:url(~/LitiumStudio/Images/ca_dialog/left.gif);"><img style="display:block;" src="~/LitiumStudio/Images/ca_dialog/spacer.gif" height="1" width="6" /></td> 
		             <td style="text-align:right; padding-right:2px; padding-top:5px;">
		                <input type="button" id="c_buttonCancel" onclick="CloseSelectFromMediaBank(false);" class="litInputButton" value="[[AVBRYT]]"/>
		                &nbsp;
		                <input type="button" id="c_buttonAdd" onclick="CloseSelectFromMediaBank(true);" class="litInputButton"  value="[[INFOGA]]"  />
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