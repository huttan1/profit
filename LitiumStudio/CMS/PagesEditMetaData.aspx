<%@ page language="C#" validaterequest="false" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesEditMetaData, Litum.Studio.Web" %>
<%@ Register TagPrefix="Pages" Namespace="Litium.Studio.UI.CMS.Pages.WebControls" Assembly="Litium.Studio.UI"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentEdit" Runat="Server">
<div class="lsTabContent">
	    <table cellpadding="0" cellspacing="0" border="0"  style="width:100%;">
		    <tr>
	            <td style="width:90px;" valign="top" class="litInputLeftArea">
                    <span class="litBoldText" style="margin-bottom:2px;"><Foundation:ModuleString ID="ModuleString1" name="Template" runat="server"/></span><br />
                    <img src="<%=TemplateThumbnailUrl%>" width="90" height="110" alt="" style="margin-top:2px;" /><br /><br />
                    <img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" class="litIconRequired" alt="" /><span class="litSmallText">= <Foundation:ModuleString ID="ModuleString2" name="MandatoryInfo" runat="server"/></span>
	            </td>
			    <td valign="top" class="litInputRightArea">
			         <table cellpadding="0" cellspacing="0" border="0" width="100%" id="c_tableTranslationHeaders" runat="server">
	                    <tr style="padding-bottom: 0px !important;">
	                        <td style="padding-left:0px; width:50%; padding-right: 0px !important;"><img id="c_imgOriginalLanguageFlag" style="vertical-align:middle;" alt="" runat="server"/>&nbsp;<Foundation:ModuleString ID="ModuleString3" CssClass="litBoldText" name="TranslationOriginalLanguage" runat="server"/>&nbsp;<asp:Label id="c_labelOriginalPageStatus" CssClass="litText" runat="server" /></td>
	                        <td><img id="c_imgTranslationLanguageFlag" style="vertical-align:middle;" alt="" runat="server"/>&nbsp;<Foundation:ModuleString ID="ModuleString4"  CssClass="litBoldText" name="Translation" runat="server"/></td>
	                    </tr>
	                </table>
	    	        <table cellpadding="0" cellspacing="0" border="0" style="width:100%; height:100%;">
				        <tr>
				            <td  valign="top" style="padding-left:0px; width:50%; padding-right: 0px !important;" id="c_tdOriginalTitle" runat="server">
						        <span class="litBoldText"><Foundation:ModuleString ID="ModuleString11" name="MetaDataTitle" runat="server"/></span><img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" class="litIconRequired" alt="" />&nbsp;
						        <Pages:LitCustomValidator id="LitCustomValidator1" OnServerValidate="ValidateTitle" cssClass="litErrorMsg" runat="server"/>
						        <asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorOriginalTitle" ControlToValidate="c_textBoxOriginalTitle" ValidationExpression="[^<>\']*"><Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="Modulestring18"/></asp:RegularExpressionValidator><br />
						        <asp:TextBox id="c_textBoxOriginalTitle" Enabled="false" ReadOnly="true" cssclass="litInputText" style="width:95%;" runat="server"/><br />
						    </td>
					        <td valign="top">
						        <span class="litBoldText"><Foundation:ModuleString ID="ModuleString5" name="MetaDataTitle" runat="server"/></span><img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" class="litIconRequired" alt="" />&nbsp;
						        <Pages:LitCustomValidator id="c_validatorTitle" OnServerValidate="ValidateTitle" cssClass="litErrorMsg" runat="server"/>
						        <asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorTitle" ControlToValidate="c_textBoxTitle" ValidationExpression="[^<>\']*"><Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="SystemString1"/></asp:RegularExpressionValidator><br />
						        <asp:TextBox id="c_textBoxTitle" cssclass="litInputText" style="width:95%;" runat="server"/><br />
						        <div class="litText" style="width:95%;"><Foundation:ModuleString ID="ModuleString6" name="MetaDataTitleDescription" runat="server"/></div><br />
					        </td>
				        </tr>
				        <tr>
					        <td  valign="top" style="padding-left:0px; width:50%; padding-right: 0px !important;" id="c_tdOriginalDescription" runat="server">
						        <span class="litBoldText"><Foundation:ModuleString ID="ModuleString12" name="MetaDataDescription" runat="server"/></span>
						        <asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorOriginalDescription" ControlToValidate="c_textBoxOriginalDescription" ValidationExpression="[^<>\']*"><Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="SystemString2"/></asp:RegularExpressionValidator><br />
						        <asp:TextBox id="c_textBoxOriginalDescription" Enabled="false" ReadOnly="true" TextMode="Multiline" rows="4" cssclass="litInputText" style="width:95%;" runat="server"/><br />
						    </td>
					        <td valign="top">
						        <span class="litBoldText"><Foundation:ModuleString ID="ModuleString7" name="MetaDataDescription" runat="server"/></span>
						        <asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorDescription" ControlToValidate="c_textBoxDescription" ValidationExpression="[^<>\']*"><Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="SystemString3"/></asp:RegularExpressionValidator><br />
						        <asp:TextBox id="c_textBoxDescription" TextMode="Multiline" cssclass="litInputTextArea" style="width:95%;" rows="4" runat="server"/><br />
						        <div class="litText" style="width:95%;"><Foundation:ModuleString ID="ModuleString8" name="MetaDataDescriptionDescription" runat="server"/></div><br />
					        </td>
				        </tr>
				        <tr>
					        <td valign="top" style="padding-left:0px; width:50%; padding-right: 0px !important;" id="c_tdOriginalKeywords" runat="server">
						        <span class="litBoldText"><Foundation:ModuleString ID="ModuleString13" name="MetaDataKeywords" runat="server"/></span>
						        <asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorOriginalKeywords" ControlToValidate="c_textBoxOriginalKeywords" ValidationExpression="[^<>\']*"><Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="SystemString4"/></asp:RegularExpressionValidator><br />
						        <asp:TextBox id="c_textBoxOriginalKeywords" Enabled="false" ReadOnly="true" TextMode="Multiline" rows="4" cssclass="litInputText" style="width:95%;" runat="server"/><br />
						    </td>
					        <td valign="top">
						        <span class="litBoldText"><Foundation:ModuleString ID="ModuleString9" name="MetaDataKeywords" runat="server"/></span>
						        <asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorriKeywords" ControlToValidate="c_textBoxKeywords" ValidationExpression="[^<>\']*"><Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="SystemString5"/></asp:RegularExpressionValidator><br />
						        <asp:TextBox id="c_textBoxKeywords" TextMode="Multiline" cssclass="litInputTextArea" style="width:95%;" rows="4" runat="server" /><br />
						        <div class="litText" style="width:95%;"><Foundation:ModuleString ID="ModuleString10" name="MetaDataKeywordsDescription" runat="server"/></div><br />
					        </td>
				        </tr>
				        <tr>
					        <td valign="top" style="padding-left:0px; width:50%; padding-right: 0px !important;" id="c_tdOriginalChangeFrequency" runat="server">
						        <span class="litBoldText"><Foundation:ModuleString name="MetaDataChangeFrequency" runat="server"/></span><br />
						        <asp:DropDownList id="c_dropDownListOriginalChangeFrequency" Enabled="false" cssclass="litInputText" runat="server"/><br />
						    </td>
					        <td valign="top">
						        <span class="litBoldText"><Foundation:ModuleString name="MetaDataChangeFrequency" runat="server"/></span><br />
						        <asp:DropDownList id="c_dropDownListChangeFrequency" cssclass="litInputText" runat="server"/><br />
						        <div class="litText" style="width:95%;"><Foundation:ModuleString name="MetaDataChangeFrequencyDescription" runat="server"/></div><br />
					        </td>
				        </tr>
				         <tr>
					        <td valign="top" style="padding-left:0px; width:50%; padding-right: 0px !important;" id="c_tdOriginalPriority" runat="server">
						        <span class="litBoldText"><Foundation:ModuleString name="MetaDataPriority" runat="server"/></span><br />
						        <asp:TextBox id="c_textBoxOriginalPriority" Enabled="false" ReadOnly="true" cssclass="litInputText" style="width:95%;" runat="server"/><br />
						    </td>
					        <td valign="top">
						        <span class="litBoldText"><Foundation:ModuleString name="MetaDataPriority" runat="server"/></span><Pages:LitCustomValidator id="LitCustomValidator2"  Display="Dynamic" Text="Fel decimal" OnServerValidate="ValidatePriority" cssClass="litErrorMsg" runat="server"/><br />
						        <asp:TextBox id="c_textBoxPriority" cssclass="litInputTextArea" style="width:95%;" runat="server" /><br />
						        <div class="litText" style="width:95%;"><Foundation:ModuleString name="MetaDataPriorityDescription" runat="server"/></div><br />
					        </td>
				        </tr>
				        <tr>
					        <td valign="top" class="litSmallText">
						        <input type="hidden" id="CMS_CBU" name="CMS_CBU" />
						        <img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" alt="" />
					        </td>
				        </tr>
			        </table> 
		        </td>
		    </tr>
	    </table>	   
	 </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_textBoxTitle.ClientID.ToString()); %>");
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>