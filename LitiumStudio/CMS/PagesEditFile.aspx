<%@ page language="C#" validaterequest="false" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesEditFile, Litum.Studio.Web" %>
<%@ Register TagPrefix="Pages" Namespace="Litium.Studio.UI.CMS.Pages.WebControls" Assembly="Litium.Studio.UI"%>
<%@ Register TagPrefix="MediaArchive" TagName="MediaArchiveDialog" src="~/LitiumStudio/WebUserControls/MediaArchiveDialog.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentEdit" Runat="Server">
<div class="lsTabContent">
	    <table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
		    <tr>
	            <td style="width:90px;" valign="top" class="litInputLeftArea">
                    <span class="litBoldText" style="margin-bottom:2px;"><Foundation:ModuleString ID="ModuleString1" name="Template" runat="server"/></span><br />
                    <img src="<%=TemplateThumbnailUrl%>" width="90" height="110" style="margin-top:2px;" alt="" /><br /><br />
                    <img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" class="litIconRequired" alt="" /><span class="litSmallText">= <Foundation:ModuleString ID="ModuleString2" name="MandatoryInfo" runat="server"/></span>
	            </td>
			    <td valign="top" class="litInputRightArea">
				    <table cellpadding="0" cellspacing="0"   style="height:100%;" class="litInputTable">
						<tr id="c_trTranslationHeaders" style="padding-bottom: 0px !important;" runat="server">
				            <td style="padding-left:0px; width:50%; padding-right: 0px !important;"><img id="c_imgOriginalLanguageFlag" style="vertical-align:middle;" alt="" runat="server"/>&nbsp;<Foundation:ModuleString ID="ModuleString5" CssClass="litBoldText" name="TranslationOriginalLanguage" runat="server"/>&nbsp;<asp:Label id="c_labelOriginalPageStatus" CssClass="litText" runat="server" /></td>
                            <td><img id="c_imgTranslationLanguageFlag" style="vertical-align:middle;" alt="" runat="server"/>&nbsp;<Foundation:ModuleString ID="ModuleString6"  CssClass="litBoldText" name="Translation" runat="server"/></td>
	                    </tr>  
	                    <asp:PlaceHolder id="c_placeHolderUpload" runat="server">
							<tr>
								<td colspan="2" align="right">
									<asp:Button id="c_buttonUpload1" cssclass="litInputButton" style="width:auto;padding-left:18px;background:#F3F3EE url(../../LitiumStudio/Images/icons_standard/import2_16px.gif) center left no-repeat;height:24px;" OnClick="ButtonUpload_Click" runat="server"/>
								</td>
							</tr>
							<tr>
								<td colspan="2"><hr /></td>
							</tr>
						</asp:PlaceHolder>
						<Pages:PropertyList id="c_propertyList" runat="server">
							<FileTemplate>
								<Pages:FileField ID="FileField1" DisabledCssClass="litToolbarItemDisabled" runat="server">
									<FileItemTemplate>
							            <tr id="trFilePropertyName" runat="server" style="padding-bottom: 0px !important;">
		                                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalFilePropertyName" runat="server"><asp:Label id="labelOriginalFilePropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgOriginalFileMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/></td>
		                                    <td><asp:Label id="labelFilePropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgFileMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/><asp:ImageButton id="imageButtonFileDeleteProperty" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
		                                </tr>
		                                <tr>
	                                        <td style="padding-left:0px; width:50%; padding-right:0px !important;vertical-align:bottom;" id="tdOriginalFile" runat="server">
	                                            <table cellpadding="0" cellspacing="0" style="padding-bottom:5px;" id="tableOriginalFile" border="0" runat="server"> 
						                            <tr>
							                            <td style="width:100%;" class="litText"><asp:HyperLink id="hyperLinkOriginalFile" runat="server"/><asp:Label id="labelOriginalFileName" runat="server" /></td>
							                            <td style="width:16px;height:18px;" valign="top"><div class="litBlankAddDelete" /></td>
							                            <td style="width:16px;height:18px;" valign="top"><div class="litBlankAddDelete" /></td>
							                            <td style="width:16px;height:18px;" valign="top"><div class="litBlankAddDelete" /></td>
						                            </tr>
					                            </table>
	                                        </td>
	                                        <td style="width:100%;" valign="top">
	                                            <asp:Panel style="padding-bottom:5px" id="panelFileInput" runat="server">
				                                    <Pages:LitCustomValidator id="validatorMandatoryFile" Display="Dynamic" runat="server"/>
				                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                            <asp:PlaceHolder id="placeHolderBrowseFile" runat="server">
				                                            <tr>
								                                <td><input type="file" id="inputFileUpload" style="width: 193px;" size="21" class="litInputFile" runat="server"/></td>
							                                </tr>    
							                                </asp:PlaceHolder>	
							                                <asp:PlaceHolder id="placeHolderFileFromMediaArchive" runat="server">
							                                <tr>
								                                <td style="padding-right:3px;">
								                                    <div runat="server" id="panelMediaArchiveFiles" visible="false" style="clear:both;">
                                                                        <input type="text" runat="server" readonly="readonly" id="textBoxMediaArchiveFileDispName" class="litInputText100"/>
                                                                        <input type="button" runat="server" id="buttonFromMediaArchive" class="litInputText" style="width:auto;margin-left:-2px;" visible="true" />
                                                                        <input type="hidden" runat="server" id="inputHiddenMediaArchiveFileID"/>
                                                                        <input type="hidden"  runat="server" id="inputHiddenMediaArchiveFileVersionID"/>
                                                                    </div>
                                                                </td>
								                            </tr>
							                                </asp:PlaceHolder>	
				                                    </table>
				                                 </asp:Panel>
				                                 <table cellpadding="0" cellspacing="0" style="padding-bottom:5px" id="tableFile" border="0" width="100%" runat="server"> 
					                                <tr>
						                                <td style="width:100%;" class="litText"><asp:HyperLink id="hyperLinkFile" runat="server"/><asp:Label id="labelFileName" runat="server" /></td>
						                                <td style="width:16px;" valign="middle"><div class="litBlankAddDelete"><asp:ImageButton id="imageButtonFileUp" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" style="margin-top:3px; margin-left:5px;" cssclass="litIconArrowUpBlue" runat="server"/></div></td>
						                                <td style="width:16px;" valign="middle"><div class="litBlankAddDelete"><asp:ImageButton id="imageButtonFileDown" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" style="margin-top:3px; margin-left:5px;" cssclass="litIconArrowDownBlue" runat="server"/></div></td>
						                                <td style="width:16px;" valign="middle"><div class="litBlankAddDelete"><asp:ImageButton id="imageButtonFileDelete" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></div></td>
					                                </tr>
				                                </table>	
				                                <asp:Panel id="panelMediaArchiveMessage1" style="display:none" runat="server"><div class="litText"><img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" alt="" class="litIconWarning" /><Foundation:ModuleString ID="ModuleString5" name="WarningFileFromMediaArchive1" runat="server"/></asp:Panel>
			                                    <asp:Panel id="panelMediaArchiveMessage2" style="display:none" runat="server"><div class="litText"><img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" alt="" class="litIconWarning" /><Foundation:ModuleString ID="ModuleString6" name="WarningFileFromMediaArchive2" runat="server"/></asp:Panel>
						                    </td>
                                        </tr>										            
									    <tr id="trFileHr" runat="server">
										    <td colspan="2"><hr></td>
									    </tr>
									</FileItemTemplate>
								</Pages:FileField>	
								<tr>
									<td colspan="2" style="padding-top:30px!important;"></td>
								</tr>
							</FileTemplate>
							<FlashTemplate>
								<Pages:FlashField ID="FlashField1" runat="server">
									<FlashItemTemplate>
										<tr>
									        <td  valign="top">
									            <table cellpadding="0" cellspacing="0" border="0" width="100%">
					                                <tr id="trFlashPropertyName" runat="server" style="padding-bottom: 0px !important;">
					                                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalFlashPropertyName" runat="server"><asp:Label id="labelOriginalFlashPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgOriginalFlashMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/></td>
					                                    <td><asp:Label id="labelFlashPropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgFlashMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/><asp:ImageButton id="imageButtonFlashDeleteProperty" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
					                                </tr>
					                                <tr>
					                                    <td style="padding-left:0px; width:50%; padding-right:0px !important;" id="tdOriginalFlash" runat="server">
					                                        <table cellpadding="0" cellspacing="0" border="0" width="100%" >
						                                        <tr>
							                                        <td valign="top" style="padding-right:10px!important;"><div style="height:62px; width:70px; padding:5px; background-color:white; border:1px solid gray;"><asp:Literal id="literalOriginalFlash" runat="server"/></div></td>
							                                        <td style="width:200px;" valign="top">
					                                                    <asp:DropDownList cssClass="litInputSelect" AutoPostBack="true" id="dropDownListOriginalFlashArray" runat="server"/>
											                        </td>
											                        <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
											                        <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                                        </tr>
						                                        <tr>
						                                            <td colspan="4">
						                                                <div style="vertical-align:bottom;padding-bottom:5px;" ><span class="litText"><Foundation:ModuleString ID="ModuleString9" name="FlashWidth" runat="server"/></span><br /><asp:TextBox id="textBoxOriginalFlashWidth" Enabled="false" ReadOnly="true" cssClass="litInputText275" runat="server"/></div>
						                                                <div style="vertical-align:bottom;padding-bottom:5px;" ><span class="litText"><Foundation:ModuleString ID="ModuleString13" name="FlashHeight" runat="server"/></span><br /><asp:TextBox id="textBoxOriginalFlashHeight" Enabled="false" ReadOnly="true" cssClass="litInputText275" runat="server"/></div>
						                                                <div style="vertical-align:bottom;padding-bottom:5px;" ><span class="litText"><Foundation:ModuleString ID="ModuleString14" name="FlashVersion" runat="server"/></span><br /><asp:TextBox id="textBoxOriginalFlashVersion" Enabled="false" ReadOnly="true" cssClass="litInputText275" runat="server"/></div>
						                                                <div style="vertical-align:bottom;padding-bottom:5px;" ><span class="litText"><Foundation:ModuleString ID="ModuleString15" name="FlashVariables" runat="server"/></span><br /><asp:TextBox id="textBoxOriginalFlashVariables" Enabled="false" ReadOnly="true" cssClass="litInputText275" runat="server"/></div>
						                                                <div style="vertical-align:bottom;padding-bottom:5px;" ><span class="litText"><Foundation:ModuleString ID="ModuleString16" name="FlashParameters" runat="server"/></span><br /><asp:TextBox id="textBoxOriginalFlashParameters" Enabled="false" ReadOnly="true" cssClass="litInputText275" runat="server"/></div>
						                                                <div style="vertical-align:bottom;padding-bottom:5px;" ><span class="litText"><Foundation:ModuleString ID="ModuleString17" name="FlashAttributes" runat="server"/></span><br /><asp:TextBox id="textBoxOriginalFlashAttributes" Enabled="false" ReadOnly="true" cssClass="litInputText275" runat="server"/></div>
						                                            </td>
						                                        </tr>
					                                        </table>
					                                     </td>
					                                    <td>
									                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
									                            <tr>
											                        <td valign="top" style="padding-right:10px!important;"><div style="height:62px; width:70px; padding:5px; background-color:white; border:1px solid gray;"><Pages:LitCustomValidator cssClass="litErrorMsg" Display="Dynamic" id="validatorMandatoryFlash" runat="server"/><asp:Literal id="literalFlash" runat="server"/></div></td>
											                        <td style="width:100%;" valign="top">
												                        <asp:Panel style="padding-bottom:5px" id="panelFlashArray" runat="server">
														                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
															                        <tr>
																                        <td style="width:100%;">
																	                        <asp:DropDownList cssClass="litInputSelect" AutoPostBack="true" id="dropDownListFlashArray" runat="server"/>
																                        </td>
																                        <td style="width:16px;" valign="top"><asp:panel id="panelFlashRemove" class="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonFlashRemove" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
																                        <td style="width:16px;" valign="top"><asp:panel id="panelFlashAdd" class="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonFlashAdd" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconAdd" runat="server"/></td>
															                        </tr>
														                        </table>
												                        </asp:Panel>
												                        <div style="padding-bottom:5px">
													                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
														                        <tr>
															                        <td style="width:100%;"><input type="file" id="inputFlash" size="25" style="width: 220px;" class="litInputFile" runat="server"/></td>
															                        <td style="width:16px;" valign="top"><asp:panel id="panelFlashDelete" class="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonFlashDelete" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
														                        </tr>
													                        </table>
												                        </div>	
											                        </td>
										                        </tr>
										                        <tr>
										                            <td colspan="2">
                                                                        <div style="padding-bottom:5px"><span class="litText"><Foundation:ModuleString ID="ModuleString7" name="FlashWidth" runat="server"/></span><br /><asp:TextBox id="textBoxFlashWidth" cssClass="litInputText275" runat="server"/></div>										                            
                                                                        <div style="padding-bottom:5px"><span class="litText"><Foundation:ModuleString ID="ModuleString3" name="FlashHeight" runat="server"/></span><br /><asp:TextBox id="textBoxFlashHeight" cssClass="litInputText275" runat="server"/></div>										                            	                            
                                                                        <div style="padding-bottom:5px"><span class="litText"><Foundation:ModuleString ID="ModuleString8" name="FlashVersion" runat="server"/></span><br /><asp:TextBox id="textBoxFlashVersion" cssClass="litInputText275" runat="server"/></div>										                            	                            
                                                                        <div style="padding-bottom:5px"><span class="litText"><Foundation:ModuleString ID="ModuleString10" name="FlashVariables" runat="server"/></span><br /><asp:TextBox id="textBoxFlashVariables" cssClass="litInputText275" runat="server"/></div>										                            	                            
                                                                        <div style="padding-bottom:5px"><span class="litText"><Foundation:ModuleString ID="ModuleString11" name="FlashParameters" runat="server"/></span><br /><asp:TextBox id="textBoxFlashParameters" cssClass="litInputText275" runat="server"/></div>										                            	                            
                                                                        <div style="padding-bottom:5px"><span class="litText"><Foundation:ModuleString ID="ModuleString12" name="FlashAttributes" runat="server"/></span><br /><asp:TextBox id="textBoxFlashAttributes" cssClass="litInputText275" runat="server"/></div>										                            	                            
										                            </td>
										                        </tr>
										                    </table>
										                </td>
										            </tr>
										        </table>
										    </td>
										</tr>
			                            <tr>
				                            <td ><hr /></td>
			                            </tr>
									</FlashItemTemplate>
								</Pages:FlashField>	
							</FlashTemplate>
						</Pages:PropertyList>
						<tr>
							<td  colspan="2" align="right">
								<asp:Button id="c_buttonUpload2" cssclass="litInputButton" style="width:auto;padding-left:18px;background:#F3F3EE url(../../LitiumStudio/Images/icons_standard/import2_16px.gif) center left no-repeat;height:24px;" OnClick="ButtonUpload_Click" runat="server"/>
							</td>
						</tr>
						<tr>
							<td colspan="2" valign="top" class="litSmallText" style="padding-top:20px; height:100%;">
								<input type="hidden" id="CMS_CBU" name="CMS_CBU" />
								<img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>"  style="vertical-align:middle;" alt="" />
							</td>
						</tr>
					</table> 
		        </td>
		    </tr>
	    </table>
    <MediaArchive:MediaArchiveDialog id="MediaArchiveDialog" runat="server" />
</div>
    <script type="text/javascript">
        var submitObject = document.getElementById("<% Response.Write(c_buttonUpload2.ClientID.ToString()); %>");
        var cancelObject = null;
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
</asp:Content>