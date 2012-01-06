<%@ page language="C#" validaterequest="false" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesEditTemplate, Litum.Studio.Web" %>
<%@ Register TagPrefix="Pages" Namespace="Litium.Studio.UI.CMS.Pages.WebControls" Assembly="Litium.Studio.UI"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentEdit" Runat="Server"> 
<div class="lsTabContent">  
	    <table cellpadding="0" cellspacing="0" border="0"  style="width:100%;">
		    <tr>
	            <td style="width:90px;" valign="top" class="litInputLeftArea">
                    <span class="litBoldText" style="margin-bottom:2px;"><Foundation:ModuleString ID="ModuleString1" name="Template" runat="server"/></span><br />
                    <img id="c_imgTranslationLanguageFlag" style="vertical-align:middle;" alt="" runat="server"/>
                    <img src="<%=TemplateThumbnailUrl%>" width="90" height="110" style="margin-top:2px;" alt="" /><br /><br />
                    <asp:Panel id="c_panelOriginalPage" runat="server">
                        <img id="c_imgOriginalLanguageFlag" style="vertical-align:middle;" alt="" runat="server"/>&nbsp;<Foundation:ModuleString id="c_moduleStringOriginal" name="Original" CssClass="litText" runat="server" />
                        <img id="c_imgOriginalLanguageTemplate"  width="90" height="110" runat="server" style="margin-top:2px;" alt="" /><br /><br />
                    </asp:Panel>
                    <img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" class="litIconRequired" alt="" /><span class="litSmallText">= <Foundation:ModuleString ID="ModuleString2" name="MandatoryInfo" runat="server"/></span>
	            </td>
			    <td valign="top" class="litInputRightArea">
	    	        <table cellpadding="0" cellspacing="0" border="0" style="width:100%; height:100%;">
				        <tr>
							<td>
								<asp:Repeater ID="c_repeaterPageTemplate" Runat="server">
									<HeaderTemplate>
										<span class="litBoldText"><Foundation:ModuleString ID="ModuleString3" name="AvailableTemplates" runat="server"/><img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" alt="" class="litIconRequired" /></span><br /><br />
									</HeaderTemplate>
									<ItemTemplate>
									    <div style="float:left;padding-right:20px;padding-bottom:10px;text-align:center;">
										    <asp:ImageButton width="90" height="110" CssClass="litSelectedItem" OnClick="TemplateImage_Click" Runat="server" /><br />
										    <asp:Label runat="server" ID="c_labelTemplateName" CssClass="litText" />
								        </div>
									</ItemTemplate>
									<FooterTemplate>
										<div style="clear:both;"></div>
										<div class="litText" style="padding-top:10px;"><Foundation:ModuleString ID="ModuleString4" name="TemplatesDescription" runat="server"/></div>
									</FooterTemplate>
								</asp:Repeater>
							</td>
						</tr>	
						<tr>
							<td valign="top" class="litSmallText" style="padding-top:20px; height:100%;">
								<input type="hidden" id="CMS_CBU" name="CMS_CBU" />
								<img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" alt="" />
							</td>
						</tr>
			        </table> 
		        </td>
		    </tr>
	    </table>
</div>
</asp:Content>