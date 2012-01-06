<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ECommerce_WebUserControls_EditPaymentDialog, Litum.Studio.Web" %>

<script type="text/javascript">

function CancelEdittingPayment()
{
    EditPaymentDialog.Close();
}

</script>

<ComponentArt:Dialog 
    ContentCssClass="contentCss" FooterCssClass="footerCss" 
    HeaderCssClass="headerCss" CssClass="dialogCss" 
    Icon=""  Value="" HeaderClientTemplateId="header" 
    Title="AJAX TabStrip Content" ShowTransition="Pixelate" 
    CloseTransition="Pixelate" AnimationDuration="200" 
    ModalMaskCssClass="modalMaskCssClass" AllowDrag="true" 
    Alignment="MiddleCentre"  ID="EditPaymentDialog" runat="server" 
    Height="400" Width="510" Modal="true">
      <ClientTemplates>
        <ComponentArt:ClientTemplate id="header">
              <table cellpadding="0" cellspacing="0" border = "0" width = "400px">
                
              </table>
          </ComponentArt:ClientTemplate>
      </ClientTemplates>
      <Content>
        <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl("~/LitiumStudio/StyleSheets/Foundation.css")%>" />
        <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl("~/LitiumStudio/StyleSheets/Position.css")%>" />
	    <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl(FoundationContext.SkinPath + "/Skin.css")%>" />
          <div class="ie6Overlap2">  
          <table cellpadding="0" cellspacing="0" border="0" width="600">
                  <thead class="litModalPopupHeader">
                  <tr>
                      <td width="6"><img style="display:block; " src="~/LitiumStudio/Images/ca_dialog/top_left.gif" runat="server" /></td>
                       <td style="background-image:url(../../LitiumStudio/Images/ca_dialog/top.gif);padding:3px; padding-bottom: 0px;">
	                        <table width="100%" height="100%" cellpadding="0" cellspacing="0">
	                            <tr>
	                                <td valign="bottom" class="litHeader3"><Foundation:ModuleString ID="ModuleString1" Name="PaymentInfo" runat="server" /></td>
	                                <td align="right" valign="middle"></td>
	                            </tr>
	                        </table>
		              </td>
                      <td align="right" style="background-image:url(../../LitiumStudio/Images/ca_dialog/top.gif);padding:3px; padding-bottom: 0px;">
                          <img id="Img1" runat="server" src="~/LitiumStudio/Images/ca_dialog/close.gif" onclick="EditPaymentDialog.Close();" />
                      </td>
                      <td width="6"><img id="Img3" style="display:block;" src="~/LitiumStudio/Images/ca_dialog/top_right.gif"  runat="server"/></td>
                  </tr>
                  </thead>
                  <tbody  style=" background-color: #FFFFFF;">
                  <tr>
                      <td style="font-size: 11px; font-family: Arial; padding: 10px; width:80px;" valign = "top" colspan = "4">
                        <Foundation:InformationGroup runat="server" ID="c_informationGroupPaymentInformation" Width="600" HeaderText = "payment Information123">
                            <table border = "0">
                            <tr>
                                <td>
                                    <div class="litBoldHeader">
                                        <Foundation:ModuleString ID="ModuleStringPaymentMethodOptions" Name="PaymentMethod" Runat="server"/>:
                                    </div>
                                    <asp:DropDownList ID="c_dropDownListPaymentMethodOptions" runat="server"></asp:DropDownList>
                                </td>
                            </tr>                          
                        </table>
                        </Foundation:InformationGroup>
                      </td>
                  </tr>
            </tbody>
            <tfoot class="litModalPopupBottom">
               <tr>
		             <td style="background-repeat:repeat-y;background-image:url(../../LitiumStudio/Images/ca_dialog/left.gif);"><img id="Img2" style="display:block;" src="~/LitiumStudio/Images/ca_dialog/spacer.gif" height="1" width="6" runat="server"/></td> 
		             <td style="text-align:right; padding-right:2px; padding-top:5px;" colspan="2">
                          <input id="c_buttonCancel" type="button" runat="server" onclick="CancelEdittingPayment();"
                              value="Cancel1" class="litInputButton" width="50px" />
		                  <input id="c_buttonOk" type="button" runat="server" onclick="SavePayment();"
                              value="OK" class="litInputButton" width="50px" />
                          <%--<asp:HiddenField ID="c_hiddenCurrentOperation" runat="server" />--%>
                          <asp:HiddenField ID="c_hiddenOrderId" runat="server" />
                          
                          <!-- these two hidden fields are used to keep the current payment method and payment provider (before being changed using the popup) -->
                          <asp:HiddenField ID="c_hiddenPaymentProvider" runat="server" />
                          <asp:HiddenField ID="c_hiddenPaymentMethod" runat="server" />
		             </td>
		             <td style="background-repeat:repeat-y;background-image:url(../../LitiumStudio/Images/ca_dialog/right.gif);"><img id="Img4" style="display:block;" src="~/LitiumStudio/Images/ca_dialog/spacer.gif" height="1" width="6" runat="server"/></td> 
		        </tr>
		        <tr>
		             <td width="6"><img id="Img5" style="display:block;" src="~/LitiumStudio/Images/ca_dialog/bottom_left.png" runat="server"/></td>
		             <td style="background-image:url(../../LitiumStudio/Images/ca_dialog/bottom.gif);" colspan="2">
		                <img id="Img6" style="display:block;" src="~/LitiumStudio/Images/ca_dialog/spacer.gif" height="5" width="688" runat="server"/>
		             </td>
		             <td width="6"><img id="Img7" style="display:block;background-repeat:repeat-y;" src="~/LitiumStudio/Images/ca_dialog/bottom_right.png" runat="server"/></td>
		        </tr>
            </tfoot>
        </table>
        <!--[if lte IE 6.5]><iframe id="if" src="blank.html" frameborder="0"></iframe><![endif]-->
        </div>
      </Content>
      <ClientEvents>
            <%--<OnClose EventHandler="KreditorDialogClose" />--%>
            <%--<OnShow EventHandler = "LoadData" />--%>
      </ClientEvents>
</ComponentArt:Dialog>