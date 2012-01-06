<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/DefaultEditBase1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesEditText, Litum.Studio.Web" validaterequest="false" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/DefaultEditBase1.master" %>

<%@ Register TagPrefix="Pages" Namespace="Litium.Studio.UI.CMS.Pages.WebControls" Assembly="Litium.Studio.UI"%>
<%@ Register TagPrefix="Relations" TagName="RelationsDialog" src="~/LitiumStudio/WebUserControls/RelationsDialog.ascx" %>
<%@ Register TagPrefix="ProductCatalog" TagName="ProductCatalogDialog" src="~/LitiumStudio/WebUserControls/ProductCatalogDialog.ascx" %>
<%@ Register TagPrefix="ECommerce" TagName="ECommerceDialog" src="~/LitiumStudio/WebUserControls/ECommerceDialog.ascx" %>
<%@ Register TagPrefix="InternalLink" TagName="InternalLinkDialog" src="~/LitiumStudio/WebUserControls/InternalLinkDialog.ascx" %>
<%@ Register TagPrefix="treeview" Namespace="Litium.Foundation.Modules.MediaArchive.WebControls.AdminTreeView"  Assembly="Litium.Studio.WebControls"%>	

<asp:Content ID="Content1" ContentPlaceHolderID="ContentEdit" Runat="Server">
<script type="text/javascript">
    function SelectRelationBaseTemplate(inputHiddenRelationsIDsID, ddlRelationBaseTemplateID) 
    {
        var g_inputHiddenRelationsIDsID = inputHiddenRelationsIDsID;
        var g_ddlRelationBaseTemplateID = ddlRelationBaseTemplateID;
        document.getElementById(g_inputHiddenRelationsIDsID).value = document.getElementById(g_ddlRelationBaseTemplateID).value;
    }    
</script>

<link href="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Styles/treeStyle.css") %>" type="text/css" rel="stylesheet" />
<style type="text/css">
	.mediaArchiveTreeView td { padding:0px; }
	.mediaArchiveTreeView { position:relative; padding:0px;}
</style>
<div class="lsTabContent">    
	    <table cellpadding="0" cellspacing="0" border="0"  style="width:100%;">
		    <tr>
	            <td style="width:90px;" valign="top" class="litInputLeftArea">
                    <span class="litBoldText" style="margin-bottom:2px;"><Foundation:ModuleString ID="ModuleString1" name="Template" runat="server"/></span><br />
                    <img src="<%=TemplateThumbnailUrl%>" width="90" height="110" style="margin-top:2px;" alt="" /><br /><br />
                    <img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" class="litIconRequired" alt="" /><span class="litSmallText">= <Foundation:ModuleString ID="ModuleString2" name="MandatoryInfo" runat="server"/></span>
	            </td>
			    <td valign="top" class="litInputRightArea">
			        <table cellpadding="0" cellspacing="0" border="0" width="100%" id="c_tableTranslationHeaders" runat="server">
	                    <tr style="padding-bottom: 0px !important;">
	                        <td style="padding-left:0px; width:50%; padding-right: 0px !important;"><img id="c_imgOriginalLanguageFlag" style="vertical-align:middle;" alt="" runat="server"/>&nbsp;<Foundation:ModuleString ID="ModuleString5" CssClass="litBoldText" name="TranslationOriginalLanguage" runat="server"/>&nbsp;<asp:Label id="c_labelOriginalPageStatus" CssClass="litText" runat="server" /></td>
	                        <td><img id="c_imgTranslationLanguageFlag" style="vertical-align:middle;" alt="" runat="server"/>&nbsp;<Foundation:ModuleString ID="ModuleString6"  CssClass="litBoldText" name="Translation" runat="server"/></td>
	                    </tr>
	                </table>
				    <table cellpadding="0" cellspacing="0" border="0" width="100%">
	                    <tr style="padding-bottom: 0px !important;">
	                        <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="c_tdOriginalPropertyName" runat="server"><Foundation:ModuleString ID="ModuleString3" CssClass="litBoldText" name="PageName" runat="server"/><img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" class="litIconRequired" alt="" /></td>
	                        <td><Foundation:ModuleString ID="ModuleString4"  CssClass="litBoldText" name="PageName" runat="server"/><img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" class="litIconRequired" alt="" />&nbsp;                				
                                <asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorPageName" ControlToValidate="c_textBoxPageName" ValidationExpression="[^<>\']*"><Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="Modulestring18"/></asp:RegularExpressionValidator>                               
                                <Pages:LitCustomValidator ControlToValidate="c_textBoxPageName" EnableClientScript="false" OnServerValidate="ValidatePageName" id="c_validatorPageName" cssClass="litErrorMsg" runat="server"/></td>
	                    </tr>
	                    <tr>
	                        <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="c_tdOriginalPageName" runat="server">
	                            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
		                            <tr>
			                            <td valign="middle" style="width:100%;"><asp:TextBox id="c_textBoxOriginalPageName" cssclass="litInputTextArea litInputFullWidth" Enabled="false" ReadOnly="true" runat="server"/></td>
			                            <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
		                            </tr>
	                            </table>
	                         </td>
	                         <td>
	                            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
					                <tr>
						                <td style="width:100%;"><asp:TextBox id="c_textBoxPageName" cssclass="litInputTextArea litInputFullWidth"  runat="server"/>
		                                </td>
						                <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
					                </tr>
					            </table>
					       </td>
					    </tr>
				    </table>
				    
				    <table cellpadding="0" cellspacing="0" border="0" width="100%" runat="server" id="c_urlTable">
	                    <tr style="padding-bottom: 0px !important;">
	                        <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="c_tdOriginalPropertyUrlName" runat="server"><Foundation:ModuleString ID="ModuleString7" CssClass="litBoldText" name="AdvancedPageAlias" runat="server"/><img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" class="litIconRequired" alt="" /></td>
	                        <td><Foundation:ModuleString ID="ModuleString8"  CssClass="litBoldText" name="AdvancedPageAlias" runat="server"/><img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" class="litIconRequired" alt="" />&nbsp;
	                        <asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="c_textBoxPageUrlNameRegularExpressionValidator" ControlToValidate="c_textBoxPageUrlName" ValidationExpression="[^<>\']*"><Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="SystemString1"/></asp:RegularExpressionValidator>
	                        <Pages:LitCustomValidator ControlToValidate="c_textBoxPageUrlName" OnServerValidate="ValidatePageUrlName" id="c_validatorPageUrlName" cssClass="litErrorMsg" runat="server"/></td>
	                    </tr>
	                    <tr>
	                        <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="c_tdOriginalPageUrlName" runat="server">
	                            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
		                            <tr>
			                            <td valign="middle" style="width:100%;"><asp:TextBox id="c_textBoxOriginalPageUrlName" cssclass="litInputTextArea litInputFullWidth" Enabled="false" ReadOnly="true" runat="server"/></td>
			                            <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
		                            </tr>
	                            </table>
	                         </td>
	                         <td>
	                            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
					                <tr>
						                <td style="width:100%;">
						                    <asp:TextBox id="c_textBoxPageUrlName" cssclass="litInputTextArea litInputFullWidth"  runat="server"/>
						                </td>
						                <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
					                </tr>
					            </table>
					       </td>
					    </tr>
				    </table><div style="height:5px;"></div>
		            <Pages:PropertyList id="c_propertyList" runat="server">
			            <BooleanTemplate>
				            <Pages:BooleanCheckBox ID="BooleanCheckBox1" runat="server">
					            <BooleanItemTemplate>
						            <table cellpadding="0" cellspacing="0" border="0" width="100%">
						                <tr id="trBooleanPropertyName" runat="server" style="padding-bottom: 0px !important;">
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalBooleanPropertyName" runat="server"><asp:Label id="labelOriginalBooleanPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgOriginalBooleanMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/></td>
						                    <td><asp:Label id="labelBooleanPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgBooleanMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/><asp:ImageButton id="imageButtonBooleanDeleteProperty" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
						                </tr>
						                <tr>
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalBoolean" runat="server">
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td valign="middle" style="width:100%;" id="tdBooleanOriginal" runat="server"><asp:Label id="labelOriginalBoolean" CssClass="litText" runat="server"/><asp:CheckBox id="checkBoxOriginalBoolean" cssclass="litInputCheckbox" Enabled="false" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                                <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
							                        </tr>
						                        </table>
						                     </td>
						                    <td>
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td valign="middle" style="width:100%;" id="tdBoolean" runat="server"><asp:Label id="labelBoolean" CssClass="litText" runat="server"/><asp:CheckBox id="checkBoxBoolean" cssclass="litInputCheckbox" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelBooleanRemove" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonBooleanRemove" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelBooleanAdd" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonBooleanAdd" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconAdd" runat="server"/></td>
							                        </tr>
						                        </table>
						                    </td>
						                </tr>
						            </table>
					            </BooleanItemTemplate>
				            </Pages:BooleanCheckBox><div style="height:5px;"></div>
			            </BooleanTemplate>
			            <DecimalTemplate>
				            <Pages:DecimalTextBox ID="DecimalTextBox1" runat="server">
					            <DecimalItemTemplate>
						            <table cellpadding="0" cellspacing="0" border="0" width="100%">
						                <tr id="trDecimalPropertyName" runat="server" style="padding-bottom: 0px !important;">
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalDecimalPropertyName" runat="server"><asp:Label id="labelOriginalDecimalPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgOriginalDecimalMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/></td>
						                    <td><asp:Label id="labelDecimalPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgDecimalMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/><Pages:LitCustomValidator id="validatorMandatoryDecimal" cssClass="litErrorMsg" Display="Dynamic" runat="server"/><Pages:LitCustomValidator cssClass="litErrorMsg" id="validatorDecimal" runat="server"/><asp:ImageButton id="imageButtonDecimalDeleteProperty" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
						                </tr>
						                <tr>
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalDecimal" runat="server">
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td valign="middle" style="width:100%;" id="tdDecimalOriginal" runat="server"><asp:Label id="labelOriginalDecimal" CssClass="litText" runat="server"/><asp:TextBox id="textBoxOriginalDecimal" ReadOnly="true" Enabled="false" cssclass="litText" style="width:50px;" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                                <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
							                        </tr>
						                        </table>
						                     </td>
						                     <td>
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td valign="middle" style="width:100%;" id="tdDecimal" runat="server"><asp:Label id="labelDecimal" CssClass="litText" runat="server"/><asp:TextBox id="textBoxDecimal" cssclass="litText" style="width:50px;" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelDecimalRemove" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonDecimalRemove" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelDecimalAdd" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonDecimalAdd" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconAdd" runat="server"/></td>
							                        </tr>
						                        </table>
						                    </td>
						                </tr>
						            </table>
					            </DecimalItemTemplate>
				            </Pages:DecimalTextBox><div style="height:5px;"></div>
			            </DecimalTemplate>
			            <DateTemplate>
				            <Pages:DateCalendar ID="DateCalendar1" HeaderBackground="white" runat="server">
					            <DateItemTemplate>
						            <table cellpadding="0" cellspacing="0" border="0" width="100%">
						                <tr id="trDatePropertyName" runat="server" style="padding-bottom: 0px !important;">
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalDatePropertyName" runat="server"><asp:Label id="labelOriginalDatePropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgOriginalDateMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/></td>
						                    <td><asp:Label id="labelDatePropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgDateMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/><Pages:LitCustomValidator id="validatorMandatoryDateCalendar" cssClass="litErrorMsg" Display="Dynamic" runat="server"/><asp:ImageButton id="imageButtonDateDeleteProperty" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
						                </tr>
						                <tr>
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalDate" runat="server">
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td><asp:Label id="labelOriginalDate" CssClass="litText" runat="server"/>
														
														    <LS:DateTimeHelper ID="dateTimeHelperOriginal" runat="server" AssociatedControlID="radDatePickerOriginal" />
															<Telerik:RadDatePicker runat="server" ID="radDatePickerOriginal" Enabled="false" MinDate="1754-01-01" />

                                                        </td>
								                        <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                                <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
							                        </tr>
						                        </table>
						                     </td>
						                     <td>
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td><asp:Label id="labelDate" CssClass="litText" runat="server"/>
									                    
														    <LS:DateTimeHelper ID="dateTimeHelper" runat="server" AssociatedControlID="radDatePicker" />
															<Telerik:RadDatePicker runat="server" ID="radDatePicker" MinDate="1754-01-01" />

								                        </td>
								                        <td style="width:100%; padding-left:10px!important;" valign="bottom">&nbsp;</td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelDateRemove" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonDateRemove" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelDateAdd" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonDateAdd" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconAdd" runat="server"/></td>
							                        </tr>
						                        </table>
						                    </td>
						                </tr>
						            </table>
					            </DateItemTemplate>
				            </Pages:DateCalendar><div style="height:5px;"></div>
			            </DateTemplate>
			            <DateTimeTemplate>
				            <Pages:DateTimeCalendar ID="DateTimeCalendar1" HeaderBackground="white" runat="server">
					            <DateTimeItemTemplate>
						            <table cellpadding="0" cellspacing="0" border="0" width="100%">
						                <tr id="trDateTimePropertyName" runat="server" style="padding-bottom: 0px !important;">
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalDateTimePropertyName" runat="server"><asp:Label id="labelOriginalDateTimePropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgOriginalDateTimeMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/></td>
						                    <td><asp:Label id="labelDateTimePropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgDateTimeMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/><Pages:LitCustomValidator id="validatorMandatoryDateTimeCalendar" cssClass="litErrorMsg" Display="Dynamic" runat="server"/><asp:ImageButton id="imageButtonDateTimeDeleteProperty" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
						                </tr>
						                <tr>
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalDateTime" runat="server">
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td><asp:Label id="labelOriginalDateTime" CssClass="litText" runat="server"/>
               												<LS:DateTimeHelper ID="dateTimeHelperOriginal" runat="server" AssociatedControlID="radDatetimePickerOriginal" />
															<Telerik:RadDateTimePicker runat="server" ID="radDatetimePickerOriginal" Enabled="false" MinDate="1754-01-01" />

                                                        </td>
                                                        <td style="width:100%; padding-left:10px!important;" valign="bottom">&nbsp;</td>
								                        <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                                <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                        </table>
						                     </td>
						                     <td>
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td><asp:Label id="labelDateTime" CssClass="litText" runat="server"/>
									                        <LS:DateTimeHelper ID="dateTimeHelper" runat="server" AssociatedControlID="radDateTimePicker" />
															<Telerik:RadDateTimePicker runat="server" ID="radDateTimePicker" MinDate="1754-01-01" />
								                        </td>
								                        <td style="width:100%; padding-left:10px!important;" valign="bottom"><Pages:LitCustomValidator cssClass="litErrorMsg" id="validatorTimeDateTimeCalendar" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelDateTimeRemove" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonDateTimeRemove" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelDateTimeAdd" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonDateTimeAdd" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconAdd" runat="server"/></td>
							                        </tr>
						                        </table>
						                    </td>
						                </tr>
						            </table>
					            </DateTimeItemTemplate>
				            </Pages:DateTimeCalendar><div style="height:5px;"></div>
			            </DateTimeTemplate>
			            <IntegerTemplate>
				            <Pages:IntegerTextBox ID="IntegerTextBox1" runat="server">
					            <IntegerItemTemplate>
						            <table cellpadding="0" cellspacing="0" border="0" width="100%">
						                <tr id="trIntegerPropertyName" runat="server" style="padding-bottom: 0px !important;">
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalIntegerPropertyName" runat="server"><asp:Label id="labelOriginalIntegerPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgOriginalIntegerMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/></td>
						                    <td><asp:Label id="labelIntegerPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgIntegerMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/><Pages:LitCustomValidator id="validatorMandatoryInteger" cssClass="litErrorMsg" Display="Dynamic" runat="server"/><Pages:LitCustomValidator cssClass="litErrorMsg" id="validatorInteger" runat="server"/><asp:ImageButton id="imageButtonIntegerDeleteProperty" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
						                </tr>
						                <tr>
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalInteger" runat="server">
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td valign="middle" style="width:100%;" id="tdIntegerOriginal" runat="server"><asp:Label id="labelOriginalInteger" CssClass="litText" runat="server"/><asp:TextBox id="textBoxOriginalInteger" cssclass="litText" ReadOnly="true" Enabled="false" style="width:50px;" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                                <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
							                        </tr>
						                        </table>
						                     </td>
						                     <td>
							                    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td valign="middle" style="width:100%;" id="tdInteger" runat="server"><asp:Label id="labelInteger" CssClass="litText" runat="server"/><asp:TextBox id="textBoxInteger" cssclass="litText" style="width:50px;" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelIntegerRemove" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonIntegerRemove" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelIntegerAdd" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonIntegerAdd" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconAdd" runat="server"/></td>
							                        </tr>
						                        </table>
						                    </td>
						                </tr>
						            </table>
					            </IntegerItemTemplate>
				            </Pages:IntegerTextBox><div style="height:5px;"></div>
			            </IntegerTemplate>
			            <ECommerceItemTemplate>
				            <Pages:ECommerceItemGrid ID="ECommerceGrid" runat="server">
					            <ECommerceItemItemTemplate>
						             <table cellpadding="0" cellspacing="0" border="0" width="100%">
						                <tr style="padding-bottom: 0px !important;">
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalECommerceItemPropertyName" runat="server"><asp:Label id="labelOriginalECommerceItemPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgOriginalECommerceItemMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/></td>
						                    <td><asp:Label id="labelECommerceItemPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgECommerceItemMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/><Pages:LitCustomValidator id="validatorMandatoryECommerceItem" cssClass="litErrorMsg" Display="Dynamic" runat="server"/><asp:ImageButton id="imageButtonECommerceItemDeleteProperty" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
						                </tr>
						                <tr>
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalECommerceItem" runat="server">
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td style="width:100%; margin: 10px 10px 10px 10px;"><asp:TextBox id="textBoxOriginalECommerceItem" CssClass="litInputFullWidth" ReadOnly="true" Enabled="false" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                                <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
							                        </tr>
						                        </table>
						                     </td>
						                    <td> 
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td style="width:100%;"><asp:TextBox id="textBoxECommerceItem" CssClass="litInputTextArea litInputFullWidth" ReadOnly="true" runat="server"/></td>
								                        <td valign="top"><Input type="hidden" ID="hiddenInputECommerceItem" runat="server"/><Input type="button" id="buttonSelectECommerceItem" class="litInputButton" style="width:auto;margin-left:10px;" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelECommerceItemAdd" CssClass="litBlankAddDelete" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelECommerceItemRemove" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonECommerceItemRemove" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
							                        </tr>
						                        </table>
						                    </td>
						                </tr>
						            </table>
					            </ECommerceItemItemTemplate>
				            </Pages:ECommerceItemGrid><div style="height:5px;"></div>
			            </ECommerceItemTemplate>
			             <ProductCatalogItemTemplate>
				            <Pages:ProductCatalogItemGrid ID="ProductCatalogGrid" runat="server">
					            <ProductCatalogItemItemTemplate>
						            <table cellpadding="0" cellspacing="0" border="0" width="100%">
						                <tr style="padding-bottom: 0px !important;">
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalProductCatalogItemPropertyName" runat="server"><asp:Label id="labelOriginalProductCatalogItemPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgOriginalProductCatalogItemMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/></td>
						                    <td><asp:Label id="labelProductCatalogItemPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgProductCatalogItemMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/><Pages:LitCustomValidator id="validatorMandatoryProductCatalogItem" cssClass="litErrorMsg" Display="Dynamic" runat="server"/><asp:ImageButton id="imageButtonProductCatalogItemDeleteProperty" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
						                </tr>
						                <tr>
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalProductCatalogItem" runat="server">
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td style="width:100%; margin: 10px 10px 10px 10px;"><asp:TextBox id="textBoxOriginalProductCatalogItem" CssClass="litInputFullWidth" ReadOnly="true" Enabled="false" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                                <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
							                        </tr>
						                        </table>
						                     </td>
						                    <td> 
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td style="width:100%;"><asp:TextBox id="textBoxProductCatalogItem" CssClass="litInputTextArea litInputFullWidth" ReadOnly="true" runat="server"/></td>
								                        <td valign="top"><Input type="hidden" ID="hiddenInputProductCatalogItem" runat="server"/><Input type="button" id="buttonSelectProductCatalogItem" class="litInputButton" style="width:auto;margin-left:10px;" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelProductCatalogItemAdd" CssClass="litBlankAddDelete" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelProductCatalogItemRemove" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonProductCatalogItemRemove" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
							                        </tr>
						                        </table>
						                    </td>
						                </tr>
						            </table>
					            </ProductCatalogItemItemTemplate>
				            </Pages:ProductCatalogItemGrid><div style="height:5px;"></div>
			            </ProductCatalogItemTemplate>
			            <RelationsItemTemplate>
				            <Pages:RelationsItemGrid ID="RelationsGrid" runat="server" OnNeedReloadControl="RelationsGrid_needReloadControl">
					            <RelationsItemItemTemplate>
						            <table cellpadding="0" cellspacing="0" border="0" width="100%">
						                <tr style="padding-bottom: 0px !important;">
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalRelationsItemPropertyName" runat="server"><asp:Label id="labelOriginalRelationsItemPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgOriginalRelationsItemMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/></td>
						                    <td><asp:Label id="labelRelationsItemPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgRelationsItemMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/><Pages:LitCustomValidator id="validatorMandatoryRelationsItem" cssClass="litErrorMsg" Display="Dynamic" runat="server"/><Pages:LitCustomValidator id="validatorMandatoryRelationBaseTemplate" cssClass="litErrorMsg" Display="Dynamic" runat="server"/><asp:ImageButton id="imageButtonRelationsItemDeleteProperty" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
						                </tr>
						                <tr>
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalRelationsItem" runat="server">
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td style="width:100%; margin: 10px 10px 10px 10px;">
															<asp:TextBox id="textBoxOriginalRelationsItem" CssClass="litInputFullWidth" ReadOnly="true" Enabled="false" runat="server"/>
															<asp:DropDownList id="ddlOriginalRelationBaseTemplate" runat="server" Visible="false" ReadOnly="true"/>
														</td>
								                        <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                                <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
							                        </tr>
						                        </table>
						                     </td>
						                    <td> 
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td style="width:100%;">
															<asp:TextBox id="textBoxRelationsItem" CssClass="litInputTextArea litInputFullWidth" ReadOnly="true" runat="server"/>
															<asp:DropDownList id="ddlRelationBaseTemplate" runat="server" Visible="false" />
															<Input type="hidden" ID="hiddenInputRelationsItem" runat="server"/>
								                        </td>
								                        <td valign="top">
															<Input type="button" id="buttonSelectRelationsItem" class="litInputButton" style="width:auto;margin-left:10px;" runat="server"/>
														</td>
								                        <td style="width:16px;" valign="top">
															<asp:panel id="panelRelationsItemAdd" CssClass="litBlankAddDelete" runat="server"/>
														</td>
								                        <td style="width:16px;" valign="top">
															<asp:panel id="panelRelationsItemRemove" CssClass="litBlankAddDelete" runat="server"/>
															<asp:ImageButton id="imageButtonRelationsItemRemove" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/>
														</td>
							                        </tr>
						                        </table>
						                    </td>
						                </tr>
						            </table>
					            </RelationsItemItemTemplate>
				            </Pages:RelationsItemGrid><div style="height:5px;"></div>
			            </RelationsItemTemplate>
			            <ShortStringTemplate>
				            <Pages:ShortStringTextBox ID="ShortStringTextBox1" runat="server">
					            <ShortStringItemTemplate>
						            <table cellpadding="0" cellspacing="0" border="0" width="100%">
						                <tr id="trShortStringPropertyName" runat="server" style="padding-bottom: 0px !important;">
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalShortStringPropertyName" runat="server"><asp:Label id="labelOriginalShortStringPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgOriginalShortStringMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/></td>
						                    <td><asp:Label id="labelShortStringPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgShortStringMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/>
						                    <Pages:LitCustomValidator id="validatorMandatoryShortString" cssClass="litErrorMsg" Display="Dynamic" runat="server"/><asp:ImageButton id="imageButtonShortStringDeleteProperty" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/>
						                    <Pages:LitCustomValidator id="validatorDangerousRequestShortString" cssClass="litErrorMsg" Display="Dynamic" runat="server"/>
						                    </td>
						                </tr>
						                <tr>
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalShortString" runat="server">
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td valign="middle">
								                            <asp:Label id="labelOriginalShortString" CssClass="litText" runat="server"/>								                            
								                        </td>
								                        <td style="width:100%; margin: 10px 10px 10px 10px;">
								                            <asp:TextBox id="textBoxOriginalShortString" CssClass="litInputFullWidth" Enabled="false" ReadOnly="true" runat="server"/>
		                                                 </td>
								                        <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                                <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
							                        </tr>
						                        </table>
						                     </td>
						                     <td>
							                    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td valign="middle">
								                            <asp:Label id="labelShortString" CssClass="litText" runat="server"/>	
								                        </td>
								                        <td style="width:100%;">
								                            <asp:TextBox id="textBoxShortString" CssClass="litInputText litInputFullWidth" runat="server"/>
								                        </td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelShortStringRemove" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonShortStringRemove" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelShortStringAdd" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonShortStringAdd" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconAdd" runat="server"/></td>
							                        </tr>
							                    </table>
							                </td>
							            </tr> 
						            </table>
					            </ShortStringItemTemplate>
				            </Pages:ShortStringTextBox><div style="height:5px;"></div>
			            </ShortStringTemplate>
			            <InternalLinkTemplate>
				            <Pages:LinkInternal ID="LinkInternal1" runat="server">
					            <LinkInternalItemTemplate>
						            <table cellpadding="0" cellspacing="0" border="0" width="100%">
						                <tr id="trLinkInternalPropertyName" runat="server" style="padding-bottom: 0px !important;">
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalLinkInternalPropertyName" runat="server"><asp:Label id="labelOriginalLinkInternalPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgOriginalLinkInternalMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/></td>
						                    <td><asp:Label id="labelLinkInternalPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgLinkInternalMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/><Pages:LitCustomValidator id="validatorMandatoryLinkInternal" cssClass="litErrorMsg" Display="Dynamic" runat="server"/><asp:ImageButton id="imageButtonLinkInternalDeleteProperty" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
						                </tr>
						                <tr>
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalLinkInternal" runat="server">
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td valign="top"><asp:Label id="labelOriginalLinkInternal" CssClass="litText" runat="server"/></td>
								                        <td style="width:100%; margin: 10px 10px 10px 10px;"><asp:TextBox id="textBoxOriginalLinkInternal" CssClass="litInputFullWidth" ReadOnly="true" Enabled="false" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                                <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
							                        </tr>
						                        </table>
						                     </td>
						                    <td> 
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td valign="middle"><asp:Label id="labelLinkInternal" CssClass="litText" runat="server"/>&nbsp;</td>
								                        <td style="width:100%;"><asp:TextBox id="textBoxLinkInternal" CssClass="litInputTextArea litInputFullWidth" ReadOnly="true" runat="server"/></td>
								                        <td valign="top"><Input type="hidden" ID="hiddenInputLinkInternal" runat="server"/><Input type="button" id="buttonSelectLinkInternal" class="litInputButton" style="width:auto;margin-left:10px;" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelLinkInternalRemove" runat="server"/><asp:ImageButton id="imageButtonLinkInternalRemove" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelLinkInternalAdd" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonLinkInternalAdd" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconAdd" runat="server"/></td>
							                        </tr>
							                    </table>
							                </td>
							            </tr>
						            </table>
					            </LinkInternalItemTemplate>
				            </Pages:LinkInternal><div style="height:5px;"></div>
			            </InternalLinkTemplate>
			            <LongStringSimpleTemplate>
				            <Pages:LongStringTextBox ID="LongStringTextBox1" runat="server">
					            <LongStringSimpleItemTemplate>
						            <table cellpadding="0" cellspacing="0" border="0" width="100%">
						                <tr id="trLongStringSimplePropertyName" runat="server" style="padding-bottom: 0px !important;">
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalLongStringSimplePropertyName" runat="server"><asp:Label id="labelOriginalLongStringSimplePropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgOriginalLongStringSimpleMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/></td>
						                    <td><asp:Label id="labelLongStringSimplePropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgLongStringSimpleMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/><Pages:LitCustomValidator id="validatorMandatoryLongStringSimple" cssClass="litErrorMsg" Display="Dynamic" runat="server"/><asp:ImageButton id="imageButtonLongStringSimpleDeleteProperty" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
						                </tr>
						                <tr>
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalLongStringSimple" runat="server">
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td valign="top"><asp:Label id="labelOriginalLongStringSimple" CssClass="litText" runat="server"/></td>
								                        <td style="width:100%; margin: 10px 10px 10px 10px;"><asp:TextBox id="textBoxOriginalLongStringSimple" CssClass="litInputFullWidth" textMode="multiline" ReadOnly="true" Enabled="false" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                                <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
							                        </tr>
						                        </table>
						                     </td>
						                    <td>   
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td valign="top"><asp:Label id="labelLongStringSimple" CssClass="litText" runat="server"/></td>
								                        <td style="width:100%;"><asp:TextBox id="textBoxLongStringSimple" CssClass="litInputTextArea litInputFullWidth" textMode="multiline" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelLongStringSimpleRemove" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonLongStringSimpleRemove" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" CssClass="litIconDelete" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelLongStringSimpleAdd" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonLongStringSimpleAdd" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" CssClass="litIconAdd" runat="server"/></td>
							                        </tr>
						                        </table>
						                    </td>
							            </tr> 
						            </table>
					            </LongStringSimpleItemTemplate>
				            </Pages:LongStringTextBox><div style="height:5px;"></div>
			            </LongStringSimpleTemplate>
			            <LongStringTemplate>
				            <Pages:LongStringEditor ID="LongStringEditor1" runat="server">
					            <LongStringItemTemplate>
						            <table cellpadding="0" cellspacing="0" border="0" width="100%">
						                <tr id="trLongStringPropertyName" runat="server" style="padding-bottom: 0px !important;">
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalLongStringPropertyName" runat="server"><asp:Label id="labelOriginalLongStringPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgOriginalLongStringMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/></td>
						                    <td><asp:Label id="labelLongStringPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgLongStringMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/><Pages:LitCustomValidator id="validatorMandatoryLongString" cssClass="litErrorMsg" Display="Dynamic" runat="server"/><asp:ImageButton id="imageButtonLongStringDeleteProperty" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
						                </tr>
						                <tr>
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalLongString" runat="server">
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td valign="top"><asp:Label id="labelOriginalLongString" CssClass="litText" runat="server"/></td>
								                        <td style="width:100%"><Pages:HTMLEditor id="editorOriginalLongString" width="100%" height="300px" CssClass="litInputFullWidth" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                                <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
							                        </tr>
						                        </table>
						                     </td>
						                    <td>   
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td valign="top"><asp:Label id="labelLongString" CssClass="litText" runat="server"/></td>
								                        <td style="width:100%;"><Pages:HTMLEditor id="editorLongString" width="100%" height="300px" cssclass="litInputTextArea litInputFullWidth" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelLongStringRemove" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonLongStringRemove" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
								                        <td style="width:16px;" valign="top"><asp:panel id="panelLongStringAdd" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonLongStringAdd" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconAdd" runat="server"/></td>
							                        </tr>
						                        </table>
						                    </td>
						                </tr>
						            </table>
					            </LongStringItemTemplate>
				            </Pages:LongStringEditor><div style="height:5px;"></div>
			            </LongStringTemplate>
			            <MediaArchiveFolderTemplate>
			                <Pages:MediaArchiveFolderTree ID="MediaArchiveFolderTree1" runat="server">
			                    <MediaArchiveFolderItemTemplate>
			                        <table style="width: 100%;" cellpadding="0" cellspacing="0" border="0">
						                <tr id="trMediaArchiveFolderPropertyName" runat="server" style="padding-bottom: 0px !important;">
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalMediaArchiveFolderName" runat="server"><asp:Label id="labelMediaArchiveFolderPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgMediaArchiveFolderMandatoryOriginal" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/></td>
						                    <td><asp:Label id="labelMediaArchiveFolderTdName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgMediaArchiveFolderMandatoryCotrol" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/><Pages:LitCustomValidator id="validatorMandatoryMediaArchiveFolder" cssClass="litErrorMsg" Display="Dynamic" runat="server"/></td>
						                </tr>
						                <tr>
						                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalMediaArchiveFolder" runat="server">
						                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
							                        <tr>
								                        <td valign="top"><asp:Label id="labelOriginalMediaArchiveFolder" CssClass="litText" runat="server"/></td>
								                        <td style="width:100%">
								                            <LS:TreeHelper runat="server" ID="c_mediaArchiveFolderTreeViewOriginalHelper" AssociatedControlID="c_mediaArchiveFolderTreeViewOriginal" />
								                            <TreeView:AdminTreeView width="300" Runat="server" ShowCategories="false" id="c_mediaArchiveFolderTreeViewOriginal" ShowArchive="False" ShowTrashcan="False" ImagesBaseUrl="~/LitiumStudio/Images/icons_standard/"/></td>
							                        </tr>
						                        </table>
						                     </td>
						                    <td> 
						                        <asp:Label id="labelMediaArchiveFolder" CssClass="litText" runat="server"/>  
						                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; margin-bottom: 10px;" class="litInputTable">
							                        <tr>
								                        <%--<td valign="top"></td>--%>
								                        <td style="width:100%;">
								                        <LS:TreeHelper runat="server" ID="c_mediaArchiveFolderTreeViewHelper" AssociatedControlID="c_mediaArchiveFolderTreeView"/>
								                        <TreeView:AdminTreeView width="300" Runat="server" ShowCategories="false" id="c_mediaArchiveFolderTreeView"  ShowArchive="False" ShowTrashcan="False" ImagesBaseUrl="~/LitiumStudio/Images/icons_standard/"/><input type="hidden" runat="server" id="c_hiddenSelectedFolder" />
								                        </td>
							                        </tr>
						                        </table>						                        						                        
						                    </td>
						                </tr>
						            </table>
						            
						            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
	                                <tr>
		                                <td>									                                			
			                                <span class="litBoldText"><asp:Label runat="server" ID="c_labelCategoryTitle" /></span>
			                                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;" class="litInputTable" style="margin-bottom:10px;">
				                                <tr>
					                                <td style="width: 100%;">
						                                <asp:DropDownList ID="c_ddlCurrentCategory" runat="server" CssClass="litInputSelect" style="width:400px;" />
					                                </td>
				                                </tr>
			                                </table>
			                                <span class="litBoldText"><asp:Label runat="server" ID="c_labelShowSubfolders" /></span>
			                                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;" class="litInputTable" style="margin-bottom:10px;">
				                                <tr>
					                                <td style="width: 100%;">
						                                <asp:DropDownList runat="server" id="c_ddlSubfolders" CssClass="litInputSelect"  style="width:400px;" />						                                  
					                                </td>
				                                </tr>
			                                </table>
			                            </td>
			                        </tr>
			                        </table>					            						                      						            						            
			                    </MediaArchiveFolderItemTemplate>
			                </Pages:MediaArchiveFolderTree>
			            </MediaArchiveFolderTemplate>
		            </Pages:PropertyList>
		            <asp:PlaceHolder id="c_placeHolderExternalPanel" runat="server"/>
		        </td>
		    </tr>
		    <tr>
			    <td colspan="2" valign="top"><input type="hidden" id="CMS_CBU" name="CMS_CBU" /></td>
		    </tr>
	    </table>
    <Relations:RelationsDialog id="RelationsDialog" runat="server" />
    <ProductCatalog:ProductCatalogDialog id="ProductCatalogDialog" runat="server" />
    <ECommerce:ECommerceDialog id="ECommerceDialog" runat="server" />
    <InternalLink:InternalLinkDialog id="InternalLinkDialog" runat="server" />
</div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_textBoxPageName.ClientID.ToString()); %>");
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
    
   <script type="text/javascript">       
//        var te = document.getElementById('editorLongString');
//        alert(te);
//        document.getElementById('editor___Frame').contentDocument.getElementById('xEditingArea').style.height = '100.1%';
//        setTimeout(function() {
//            document.getElementById('editor___Frame').contentDocument.getElementById('xEditingArea').style.height = '100%'
//        }, 100);
    </script>
</asp:Content>
