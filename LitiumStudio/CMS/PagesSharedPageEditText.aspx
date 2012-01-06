<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/SharedPageEditBase1.master" validaterequest="false" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesSharedPageEditText, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/SharedPageEditBase1.master" %>
<%@ Register TagPrefix="Pages" Namespace="Litium.Studio.UI.CMS.Pages.WebControls" Assembly="Litium.Studio.UI"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentEdit" Runat="Server">
    <div class="lsTabContent">
	    <table cellpadding="0" cellspacing="0" border="0" class="litModuleContentWithTreeMainTabSizeV2 litEditArea">
		    <tr>
		        <td style="width:90px;" valign="top" class="litInputLeftArea">
                    <span class="litBoldText" style="margin-bottom:2px;"><Foundation:ModuleString ID="ModuleString5" name="Template" runat="server"/></span><br />
                    <img src="<%=TemplateThumbnailUrl%>" width="90" height="110" alt="" style="margin-top:2px;" /><br /><br />
                    <img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" class="litIconRequired" alt="" /><span class="litSmallText">= <Foundation:ModuleString ID="ModuleString6" name="MandatoryInfo" runat="server"/></span>
	            </td>
	            <td valign="top" class="litInputRightArea">
	                <table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
	                    <tr>
			                <td valign="top" style="padding-top: 3px;">
			                    <span class="litBoldText"><Foundation:ModuleString ID="ModuleString1" name="SharedPage" runat="server"/></span><br />
			                    <div class="litText" style="width:95%;"><Foundation:ModuleString ID="ModuleString2" name="SharedPageEditDescription" runat="server"/></div>
			                </td>
		                </tr>
		                <tr>
	                        <td valign="top" style="padding-top: 15px;">
				                <asp:PlaceHolder id="c_placeHolderExternalPanel" runat="server"/>
		                    </td>
		                </tr>
	                </table>
	                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
	                    <tr>
	                        <td>
	                            <table border="0" cellspacing="0" cellpadding="0">
                                    <thead>
				                        <th class="litBoldText"><Foundation:ModuleString ID="ModuleString11" Name="NameOfMasterPage" runat="server" /></th>
                                        <th style="padding-left:25px;" class="litBoldText"><Foundation:ModuleString ID="ModuleString10" Name="Location" runat="server" /></th>
				                        <th style="padding-left:25px;" class="litBoldText" colspan="2"><Foundation:ModuleString ID="ModuleString4" Name="Created" runat="server" /></th>
                                    </thead>
                                    <tr>
                                        <td class="litText"><%=MasterPageShortName%></td>
                                        <td style="padding-left:25px;" class="litText"><%=MasterPageLocation%></td>
                                        <td style="padding-left:25px;" class="litText"><%=MasterPageCreatedDate%></td>
                                        <td style="padding-left:25px;" class="litText" style="width:16px;"><a href="<%= MasterPageUrl%>"><img src="Images/transparent.gif" class="litIconNavRightBlue" border="0" alt="" /></a></td>
                                    </tr>
                                </table>
		                    </td>
	                    </tr>
	                    <tr>
			                <td valign="top"><input type="hidden" id="CMS_CBU" name="CMS_CBU" /></td>
		                </tr>
                    </table>
                    <div style="margin-top:0px">&nbsp;</div>
	                <table cellpadding="0" cellspacing="0" border="0" width="100%" runat="server" id="c_urlTable">
	                    <tr style="padding-bottom: 0px !important;">
	                        <td style="padding-left:0px; width:50%; padding-right: 0px !important;" id="c_tdOriginalPropertyUrlName" runat="server">
	                            <Foundation:ModuleString ID="ModuleString7" CssClass="litBoldText" name="AdvancedPageAlias" runat="server"/><img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" class="litIconRequired" alt="" />
	                            <asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="c_textBoxPageUrlNameRegularExpressionValidator" ControlToValidate="c_textBoxPageUrlName" ValidationExpression="[^<>\']*"><Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="SystemString1"/></asp:RegularExpressionValidator>
	                            <Pages:LitCustomValidator ControlToValidate="c_textBoxPageUrlName" OnServerValidate="ValidatePageUrlName" id="c_validatorPageUrlName" cssClass="litErrorMsg" runat="server"/></td>
	                    </tr>
	                    <tr>
	                         <td>
	                            <asp:TextBox id="c_textBoxPageUrlName" cssclass="litInputText175" MaxLength="400" runat="server"/>
						     </td>
					    </tr>
				    </table>
	            </td>
		    </tr>
	    </table>
    </div>
</asp:Content>