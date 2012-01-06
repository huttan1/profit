<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_WebUserControls_DeleteDialog, Litum.Studio.Web" %>
<%@ Import Namespace="Litium.Foundation.GUI"%>


<script type="text/javascript">
    var g_deleteActionType = '0';
    var g_deleteFolder = '0';
    var g_inputHiddenFileIDName = '';
    var g_previousPage = '';
    var g_selectedItemID = '';
    var g_versionId = '';

    function dialogshow(dialog) {
        if (document.getElementById("c_buttonCancel"))
            document.getElementById("c_buttonCancel").value = '<%=Cancel %>';
        if (document.getElementById("c_buttonDelete"))
            document.getElementById("c_buttonDelete").value = '<%=Delete %>';
        if (document.getElementById("c_buttonCheck"))
            document.getElementById("c_buttonCheck").value = '<%=Check %>';


        //Make sure that the hiden iframe will be showed.
        document.getElementById(dialog.get_id()).style.display = 'block';
        document.getElementById(dialog.get_id()).style.visiblity = 'visible';
    }

    function dialogclose(dialog) {
        var newLocation = window.location;
        if (g_deleteActionType != '0') {
            if (g_selectedItemID == '') {
                g_selectedItemID = $get(g_inputHiddenFileIDName).value;
                
                if(g_selectedItemID.substring(g_selectedItemID.length-1)==';') {
                    g_selectedItemID = g_selectedItemID.substring(0, g_selectedItemID.length - 1);
                }
            }
            var windowLocation = new String(window.location);
            var locationArray = windowLocation.split('?');
            var pathArray = locationArray[0].split('/');
            pathArray[pathArray.length - 1] = '<%=Litium.Studio.UI.MediaArchive.Constants.UrlConstants.SEARCH_FILE_POINTER_RESULT%>';
            var path = pathArray.join('/');
            var parameterString = ''
            if (locationArray.length > 1 && locationArray[1] != '') {
                var fileIDHandled = 0;
                var parameterArray = locationArray[1].split('&');
                var versionAdded = false;

                for (i = 0; i < parameterArray.length; i++) {
                    var currentParameter = parameterArray[i];
                    var parameterValueArray = currentParameter.split('=');
                    if (parameterValueArray[0] == '<%=Litium.Studio.UI.MediaArchive.Constants.ParameterConstants.FILE_ID%>' && g_deleteFolder != '1') {
                        parameterValueArray[1] = g_selectedItemID;
                        fileIDHandled = 1;
                    }
                    else if (parameterValueArray[0] == '<%=Litium.Studio.UI.MediaArchive.Constants.ParameterConstants.FOLDER_ID%>' && g_deleteFolder == '1') {
                        parameterValueArray[1] = g_selectedItemID;
                        fileIDHandled = 1;
                    }
                    else if (parameterValueArray[0] == '<%=Litium.Studio.UI.MediaArchive.Constants.ParameterConstants.VERSION_ID%>' && g_versionId != '' ) {
                        parameterValueArray[1] = g_versionId;
                        versionAdded = true;
                    }

                    parameterString = parameterString + parameterValueArray.join('=') + '&';
                }

                if (g_versionId != '' && versionAdded == false) {
                    parameterString = parameterString + '<%=Litium.Studio.UI.MediaArchive.Constants.ParameterConstants.VERSION_ID%>=' + g_versionId + '&';
                    versionAdded = true;
                }

                if (fileIDHandled == 0) {
                    if (g_deleteFolder == '1') {
                        parameterString += '<%=Litium.Studio.UI.MediaArchive.Constants.ParameterConstants.FOLDER_ID%>=' + g_selectedItemID + '&';
                    }
                    else {
                        parameterString += '<%=Litium.Studio.UI.MediaArchive.Constants.ParameterConstants.FILE_ID%>=' + g_selectedItemID + '&';
                    }
                }
            }
            if (parameterString == '') {
				if	(g_deleteFolder == '0'){ 
					parameterString += '<%=Litium.Studio.UI.MediaArchive.Constants.ParameterConstants.FILE_ID%>=' + g_selectedItemID + '&';
                 }
				else if(g_deleteFolder == '1'){
             parameterString += '<%=Litium.Studio.UI.MediaArchive.Constants.ParameterConstants.FOLDER_ID%>=' + g_selectedItemID + '&';
				 }
             }
          
            if (g_deleteActionType == '1') {
                parameterString += '<%=Litium.Studio.UI.MediaArchive.Constants.ParameterConstants.DELETE_IMMEDIATELY%>=<%=Litium.Studio.UI.MediaArchive.Constants.ParameterConstants.VALUE_TRUE%>&';
            }
            if (g_deleteFolder == '1')
                parameterString += '<%=Litium.Studio.UI.MediaArchive.Constants.ParameterConstants.DELETE_FOLDER%>=<%=Litium.Studio.UI.MediaArchive.Constants.ParameterConstants.VALUE_TRUE%>&';

            parameterString += '<%=Litium.Foundation.GUI.Constants.ParameterConstants.MODULE_ID%>=<%=foundationContext.ActiveModuleID%>&';
            parameterString += '<%=Litium.Studio.UI.MediaArchive.Constants.ParameterConstants.PREVIOUS_PAGE%>=' + g_previousPage;
            newLocation = path + '?' + parameterString;
        }

        //Make sure to hide the iframe.
        document.getElementById(dialog.get_id()).style.display = 'none';
        document.getElementById(dialog.get_id()).style.visiblity = 'hidden';
        g_deleteFolder = '0';
        g_inputHiddenFileIDName = '';
        g_previousPage = '';
        g_selectedItemID = '';
        g_versionIndex = '';

        if (g_deleteActionType != '0') {
            g_deleteActionType = '0';
            window.location = newLocation;
        }
        else {
            g_deleteActionType = '0';
        }
    }

    function OpenDeleteDialog(variableName, inputHiddenFileIDName, selectedItemID, previousPage, deleteFolder, versionId) {
        g_inputHiddenFileIDName = inputHiddenFileIDName;
        g_versionId = versionId;
        g_deleteFolder = deleteFolder;
        g_previousPage = previousPage;
        g_selectedItemID = selectedItemID
        if (deleteFolder == '1')
            DeleteFileDialog.Show('<%=DeleteFolderConfirmationMessage %>', variableName);
        else
            if (versionId != '')
            DeleteFileDialog.Show('<%=DeleteFileVersionConfirmationMessage %>', variableName);
        else
            DeleteFileDialog.Show('<%=DeleteFileConfirmationMessage %>', variableName);

            
            
    }

    function CloseDeleteDialog(actionType) {
        g_deleteActionType = actionType;
        DeleteFileDialog.Close();
    }
</script>

  
<ComponentArt:Dialog 
     Alignment="MiddleCentre"
     ContentCssClass="litModalPopupContent" 
     ContentClientTemplateId="ContentClientTemplate"
     FooterClientTemplateId="FooterClientTemplate"
     FooterCssClass="litModalPopupFooter" 
     HeaderClientTemplateId="HeaderClientTemplate"
     HeaderCssClass="litModalPopupHeader"
     Height="405"
     ID="DeleteFileDialog" 
     IFrameCssClass="litModalPopupIFrame"
     IFrameBorder="0" 
     Modal="true"
     Runat="server"
     Width="702"
     >

    <ClientEvents>
       <OnShow EventHandler="dialogshow" />
       <OnClose EventHandler="dialogclose" />
    </ClientEvents>

	<ClientTemplates>
        <ComponentArt:ClientTemplate id="HeaderClientTemplate">
	        <table cellpadding="0" cellspacing="0" width="702" onmousedown="DeleteFileDialog.StartDrag(event);" >
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
		           <td width="30" style="background-image:url(~/LitiumStudio/Images/ca_dialog/top.gif);"><img id="Img2" style="display:block;margin-top:2px;" src="~/LitiumStudio/Images/ca_dialog/close.gif" onclick="CloseDeleteDialog('0');"></td>
		           <td width="6"><img id="Img3" style="display:block;" src="~/LitiumStudio/Images/ca_dialog/top_right.gif"/></td>
                </tr>
             </table>
        </ComponentArt:ClientTemplate>
        <ComponentArt:ClientTemplate id="ContentClientTemplate">
             <table cellpadding="0" cellspacing="0" width="701" class="litModalPopupContent">
                <tr>
                    <td style="text-align: left; padding: 3px;">
                        <table style="height: 100%; width: 100%;  padding: 3px;" cellpadding="3" cellspacing="0">
                            <tr>
                                <td valign="middle" class="litText">## Parent.Content ##</td>
                            </tr>
                        </table>
                    </td>
               </tr>
              </table>
        </ComponentArt:ClientTemplate>
        <ComponentArt:ClientTemplate id="FooterClientTemplate">
            <table class="litModalPopupBottom footerCss" cellpadding="0" cellspacing="0" width="100%" border="0">
                <tr>
		             <td style="background-repeat:repeat-y;background-image:url(~/LitiumStudio/Images/ca_dialog/left.gif);"><img style="display:block;" src="~/LitiumStudio/Images/ca_dialog/spacer.gif" height="1" width="6" /></td> 
		             <td style="text-align:right; padding-right:2px; padding-top: 5px;">
		                <input type="button" id="c_buttonCheck" onclick="CloseDeleteDialog('2');" class="litInputButton"  value="Nej"  />
		                &nbsp;
		                <input type="button" id="c_buttonDelete" onclick="CloseDeleteDialog('1');" class="litInputButton"  value="Ja"  />
		                &nbsp;
		                <input type="button" id="c_buttonCancel" onclick="CloseDeleteDialog('0');" class="litInputButton" value="Avbryt"/>
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