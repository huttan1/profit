<%@ Import namespace="Litium.Foundation.Modules.ProductCatalog"%>
<%@ control language="C#" autoeventwireup="true" inherits="Litium.Studio.UI.ProductCatalog.Common.DefinitionFieldAlternativeDialog, Litum.Studio.Web" %>


 <style type="text/css">
    .contentCss
    {
    	overflow:hidden;
        border-left:1px solid #C8C2A8;
        border-right:1px solid #C8C2A8;
        width:700px;
        text-align:center;
    }
    .iFrameCss
    {
        overflow:hidden;
	    width:700px;
	    height:450px;
	    padding:0px;
	    margin:0px;
    }
</style>
<script type="text/javascript">
    var insertFile = false;
    function dialogshow(dialog){
        document.getElementById(dialog.get_id()+"_IFrame").style.display = 'block';
        document.getElementById(dialog.get_id()+"_IFrame").style.visiblity = 'visible';
        document.getElementById(dialog.get_id()).style.display = 'block';
        document.getElementById(dialog.get_id()).style.visiblity = 'visible';
    }
    function dialogclose(dialog){
        document.getElementById(dialog.get_id()+"_IFrame").style.display = 'none';
        document.getElementById(dialog.get_id()+"_IFrame").style.visiblity = 'hidden';
        document.getElementById(dialog.get_id()).style.display = 'none';
        document.getElementById(dialog.get_id()).style.visiblity = 'hidden';
    }
    function OpenDialog(fieldDefinitionID,fieldName){
        //AlternativeDialog.set_value(repetaterID);
        AlternativeDialog.set_offsetX((document.body.clientWidth/2)-350);
        AlternativeDialog.set_offsetY((document.body.clientHeight/2)-250);
        AlternativeDialog.set_contentUrl("~/LitiumStudio/ProductCatalog/Framework/ShowDefinitionFieldAlternatives.aspx?FieldDefinitionID="+fieldDefinitionID); 
        AlternativeDialog.Show('', '<%=ModuleProductCatalog.Instance.Strings.GetValue("AlternativeForDefinitionField",foundationContext.Language.Culture,true)%> "' + fieldName + '"');
    }
    function Close(status){
        insertFile=status;
        AlternativeDialog.Close();
    }
</script>
<ComponentArt:Dialog 
     Alignment="TopLeft"
     ContentUrl="about:blank" 
     ContentCssClass="contentCss" 
     FooterClientTemplateId="FooterClientTemplate"
     FooterCssClass="footerCss" 
     HeaderClientTemplateId="HeaderClientTemplate"
     Height="700"
     ID="AlternativeDialog" 
     IFrameCssClass="iFrameCss"
     IFrameBorder="0" 
     Modal="true"
     Runat="server"
     Width="700"
     X="0"
     Y="0">
    <ClientEvents>
       <OnShow EventHandler="dialogshow" />
       <OnClose EventHandler="dialogclose" />
    </ClientEvents>
	<ClientTemplates>
        <ComponentArt:ClientTemplate id="HeaderClientTemplate">
	        <table cellpadding="0" cellspacing="0" width="702" onmousedown="AlternativeDialog.StartDrag(event);" >
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
		           <td width="30" style="background-image:url(~/LitiumStudio/Images/ca_dialog/top.gif);"><img id="Img2" style="display:block;margin-top:2px;" src="~/LitiumStudio/Images/ca_dialog/close.gif" onclick="Close(false);"></td>
		           <td width="6"><img id="Img3" style="display:block;" src="~/LitiumStudio/Images/ca_dialog/top_right.gif"/></td>
                </tr>
             </table>
        </ComponentArt:ClientTemplate>
        <ComponentArt:ClientTemplate id="FooterClientTemplate">
            <table class="litModalPopupBottom" cellpadding="0" cellspacing="0" width="701">
                <tr>
		             <td style="background-repeat:repeat-y;background-image:url(~/LitiumStudio/Images/ca_dialog/left.gif);"><img style="display:block;" src="~/LitiumStudio/Images/ca_dialog/spacer.gif" height="1" width="6" /></td> 
		             <td style="text-align:right; padding-right:2px; padding-bottom:3px;">
		                <input type="button" onclick="Close(false);" class="litInputButton" id="Button1" value="##CLOSEBUTTON##" />
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