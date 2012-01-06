<%@ page language="C#" validaterequest="false" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesEditImage, Litum.Studio.Web" %>
<%@ Register TagPrefix="Pages" Namespace="Litium.Studio.UI.CMS.Pages.WebControls" Assembly="Litium.Studio.UI"%>
<%@ Register TagPrefix="MediaArchive" TagName="MediaArchiveDialog" src="~/LitiumStudio/WebUserControls/MediaArchiveDialog.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentEdit" Runat="Server">
<div class="lsTabContent">
	    <table cellpadding="0" cellspacing="0" border="0"  style="width:100%;">
		    <tr>
	            <td style="width:90px;" valign="top" class="litInputLeftArea">
                    <span class="litBoldText" style="margin-bottom:2px;"><Foundation:ModuleString ID="ModuleString1" name="Template" runat="server"/></span><br />
                    <img src="<%=TemplateThumbnailUrl%>" width="90" height="110" style="margin-top:2px;" alt="" /><br /><br />
                    <img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" class="litIconRequired" alt="" /><span class="litSmallText">= <Foundation:ModuleString ID="ModuleString2" name="MandatoryInfo" runat="server"/></span>
	            </td>
			    <td valign="top" class="litInputRightArea">
				     <table cellpadding="0" cellspacing="0" border="0" class="litInputTable">
						<tr>
							<td >
								 <table cellpadding="0" cellspacing="0" border="0" width="100%" id="c_tableTranslationHeaders" runat="server">
	                                <tr style="padding-bottom: 0px !important;">
	                                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;"><img id="c_imgOriginalLanguageFlag" style="vertical-align:middle;" alt="" runat="server"/>&nbsp;<Foundation:ModuleString ID="ModuleString5" CssClass="litBoldText" name="TranslationOriginalLanguage" runat="server"/>&nbsp;<asp:Label id="c_labelOriginalPageStatus" CssClass="litText" runat="server" /></td>
	                                    <td><img id="c_imgTranslationLanguageFlag" style="vertical-align:middle;" alt="" runat="server"/>&nbsp;<Foundation:ModuleString ID="ModuleString6"  CssClass="litBoldText" name="Translation" runat="server"/></td>
	                                </tr>
	                            </table>
	                        </td>
	                    </tr>   
	                    <asp:PlaceHolder id="c_placeHolderUpload" runat="server">
							<tr>
								<td  align="right">
									<asp:Button id="c_buttonUpload1" cssclass="litInputButton" style="width:auto;padding-left:18px;background:#F3F3EE url(../../LitiumStudio/Images/icons_standard/import2_16px.gif) center left no-repeat;height:24px;" OnClick="ButtonUpload_Click" runat="server"/>
								</td>
							</tr>
							<tr>
								<td ><hr /></td>
							</tr>
						</asp:PlaceHolder>
						<Pages:PropertyList id="c_propertyList" runat="server">
							<ImageTemplate>
								<Pages:ImageField runat="server">
									<ImageItemTemplate>
									    <tr>
									        <td  valign="top">
									            <table cellpadding="0" cellspacing="0" border="0" width="100%">
					                                <tr id="trImagePropertyName" runat="server" style="padding-bottom: 0px !important;">
					                                    <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="tdOriginalImagePropertyName" runat="server"><asp:Label id="labelOriginalImagePropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgOriginalImageMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/></td>
					                                    <td><asp:Label id="labelImagePropertyName" CssClass="litBoldText" runat="server"/><asp:Image ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" id="imgImageMandatory" CssClass="litIconRequired" AlternateText="" ImageAlign="AbsMiddle" runat="server"/><asp:ImageButton id="imageButtonImageDeleteProperty" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
					                                </tr>
					                                <tr>
					                                    <td style="padding-left:0px; width:50%; padding-right:0px !important;" id="tdOriginalImage" runat="server">
					                                        <table cellpadding="0" cellspacing="0" border="0"  width="100%">
						                                        <tr>
							                                        <td valign="top" style="padding-right:10px!important;" >
											                            <table style="height:62px; width:70px; padding:5px; background-color:white; border:1px solid gray;">
											                                <tr>
											                                    <td align="center" valign="middle">
				                                                                    <asp:Image id="imgOriginalImage" runat="server"/>
								                                                 </td>
											                                </tr>
											                           </table>
							                                        </td>
							                                        <td style="width:200px;" valign="top">
					                                                    <asp:DropDownList cssClass="litInputSelect" AutoPostBack="true" id="dropDownListOriginalImageArray" runat="server"/>
											                        </td>
											                        <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
											                        <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
						                                        </tr>
						                                        <tr>
											                        <td colspan="4">
											                            <div style="vertical-align:bottom;padding-bottom:5px;" ><span class="litText"><Foundation:ModuleString ID="ModuleString9" name="ImageText" runat="server"/></span><br /><asp:TextBox id="textBoxOriginalImageText" Enabled="false" ReadOnly="true" cssClass="litInputText275" runat="server"/></div>
											                        </td>
											                    </tr>
											                    <tr>
											                        <td colspan="4">
											                            <div style="vertical-align:bottom;padding-bottom:5px;" ><span class="litText"><Foundation:ModuleString ID="ModuleString3" name="ImageTitleText" runat="server"/></span><br /><asp:TextBox id="textBoxOriginalImageTitleText" Enabled="false" ReadOnly="true" cssClass="litInputText275" runat="server"/></div>
											                        </td>
											                    </tr>
					                                        </table>
					                                     </td>
					                                    <td>
									                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
									                            <tr>
											                        <td valign="top" style="padding-right:10px!important;">
											                            <table style="height:62px; width:70px; padding:5px; background-color:white; border:1px solid gray;">
											                                <tr>
											                                    <td align="center" valign="middle">
											                                        <Pages:LitCustomValidator cssClass="litErrorMsg" id="validatorMandatoryImage" Display="Dynamic" runat="server"/>
											                                        <asp:Label cssClass="litErrorMsg" id="labelImageFromMediaArchive" visible="false" runat="server" />
											                                        <asp:Image id="imgImage" runat="server"/>
											                                    </td>
											                                </tr>
											                           </table>
										                            </td>
											                        <td style="width:100%;" valign="top">
												                        <asp:Panel style="padding-bottom:5px" id="panelImageArray" runat="server">
														                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
															                        <tr>
																                        <td style="width:100%;"><asp:DropDownList cssClass="litInputSelect" AutoPostBack="true" id="dropDownListImageArray" runat="server"/></td>
																                        <td style="width:16px;" valign="top"><asp:panel id="panelImageRemove" class="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonImageRemove" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
																                        <td style="width:16px;" valign="top"><asp:panel id="panelImageAdd" class="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonImageAdd" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconAdd" runat="server"/></td>
															                        </tr>
														                        </table>
												                        </asp:Panel>
												                        <div style="padding-bottom:5px">
													                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
														                        <tr>
															                        <td style="width:100%;">
																                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
																	                            <asp:PlaceHolder id="placeHolderBrowse" runat="server">
																	                            <tr>
																			                        <td valign="top"><input type="file" id="inputImage" style="width: 193px;" size="21" class="litInputFile" runat="server"/></td>
																		                        </tr>
																		                        </asp:PlaceHolder>	
																		                        <asp:PlaceHolder id="placeHolderFromMediaArchive" runat="server">
																		                        <tr>
																			                        <td valign="top">
																			                             <div runat="server" id="panelMediaArchiveFiles" visible="false" style="clear:both;">
                                                                                                            <input type="text" runat="server" readonly="readonly" id="textBoxMediaArchiveFileDispName" class="litInputText100"/>&nbsp;<input type="button" runat="server" id="buttonFromMediaArchive" class="litInputText" style="width:auto;margin-left:-2px;" visible="true" />
                                                                                                            <input type="hidden" runat="server" id="inputHiddenMediaArchiveFileID"/>
                                                                                                            <input type="hidden"  runat="server" id="inputHiddenMediaArchiveFileVersionID"/>
                                                                                                        </div>
																		                            </td>
																			                    </tr>
																		                        </asp:PlaceHolder>	
																                        </table>
															                        </td>
															                        <td style="width:16px;" valign="top"><asp:panel id="panelImageDelete" class="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonImageDelete" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server"/></td>
															                        <td style="width:16px;" valign="top"><div class="litBlankAddDelete" /></td>
														                        </tr>
													                        </table>
												                        </div>	
												                        <asp:Panel id="panelMediaArchiveMessage1" style="display:none" runat="server"><div class="litText"><img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" alt="" class="litIconWarning" /><Foundation:ModuleString ID="ModuleString5" name="WarningImageFromMediaArchive1" runat="server"/></div></asp:Panel>
												                        <asp:Panel id="panelMediaArchiveMessage2" style="display:none" runat="server"><div class="litText"><img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" alt="" class="litIconWarning" /><Foundation:ModuleString ID="ModuleString6" name="WarningImageFromMediaArchive2" runat="server"/></div></asp:Panel>
											                        </td>
											                    </tr>
											                    <tr>
											                        <td colspan="2">
											                            <div style="padding-bottom:5px"><span class="litText"><Foundation:ModuleString ID="ModuleString4" name="ImageText" runat="server"/></span><br /><asp:TextBox id="textBoxImageText" cssClass="litInputText275" runat="server"/><Pages:LitCustomValidator id="validatorDangerousRequestImageTextString" cssClass="litErrorMsg" Display="Dynamic" runat="server"/></div>
											                        </td>
											                    </tr>
											                    <tr>
                                                                    <td colspan="2">
											                            <div style="padding-bottom:5px"><span class="litText"><Foundation:ModuleString ID="ModuleString7" name="ImageTitleText" runat="server"/></span><br /><asp:TextBox id="textBoxImageTitleText" cssClass="litInputText275" runat="server"/><Pages:LitCustomValidator id="validatorDangerousRequestImageTitleString" cssClass="litErrorMsg" Display="Dynamic" runat="server"/></div>
											                        </td>
											                    </tr>
											                </table>
											            </td>
											        </tr>
											    </table>
											</td>
										</tr>
										<tr>
											<td ><hr size="1" /></td>
										</tr>
									</ImageItemTemplate>
								</Pages:ImageField>	
							</ImageTemplate>
						</Pages:PropertyList>
						<tr>
							<td  align="right">
								<asp:Button id="c_buttonUpload2" cssclass="litInputButton" style="width:175px;padding-left:18px;background:#F3F3EE url(../../LitiumStudio/Images/icons_standard/import2_16px.gif) center left no-repeat;height:24px;" OnClick="ButtonUpload_Click" runat="server"/>
							</td>
						</tr>
						<tr>
							<td  valign="top" class="litSmallText" style="padding-top:20px; height:100%;">
								<input type="hidden" id="CMS_CBU" name="CMS_CBU" />
								<img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" alt="" />
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