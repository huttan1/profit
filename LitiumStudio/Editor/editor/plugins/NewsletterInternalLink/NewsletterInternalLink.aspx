<%@ page language="C#" autoeventwireup="true" inherits="FCKeditor_editor_plugins_NewsletterInternalLink_NewsletterInternalLink, Litum.Studio.Web" %>
<%@ Register TagPrefix="TreeView" Namespace="Litium.Foundation.Modules.CMS.WebControls.TreeView" Assembly="Litium.Studio.WebControls"%>

<%@ Register TagPrefix="MediaArchiveTreeView" Namespace="Litium.Foundation.Modules.MediaArchive.WebControls.AdminTreeView"  Assembly="Litium.Studio.WebControls"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title><Foundation:ModuleString ID="ModuleString1" Name="InternalLink" runat="server"/></title>
    <Telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
    <link href="../../dialog/common/fck_dialog_common.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl(FoundationContext.SkinPath + "/Skin.css")%>" />
    <link href="../../../../Stylesheets/Foundation.css" type="text/css" rel="stylesheet">    
    <link href="../../../../Newsletter/Styles/Circular.css" type="text/css" rel="stylesheet">    
    <link href="../../dialog/common/fck_dialog_common.css" type="text/css" rel="stylesheet">
    <script src="../../dialog/common/fck_dialog_common.js" type="text/javascript"></script> 
    <script src="../../dialog/common/fck_dialog_common.js" type="text/javascript"></script>
    <script src="../common/internalLink.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
	<!--
        var lrSelectedRow = null;
        function listRow_onClick(t) {
            t.className = 'litImageList litImageListSelected';
            if ((lrSelectedRow != null) && (lrSelectedRow != t))
                lrSelectedRow.className = 'litImageList';
            lrSelectedRow = t;
            document.forms[0].MediaArchive_FileID.value = t.id.substr(t.id.length - 36);
            if (window.list_onClick) {
                list_onClick(t.id.substr(t.id.length - 36));
            }
        }
        function listRow_onMouseOver(t) {
            if (lrSelectedRow != t)
                t.className = 'litImageList litImageListOver';
        }
        function listRow_onMouseOut(t) {
            if (lrSelectedRow != t)
                t.className = 'litImageList';
        }
	//-->
	</script>
	</Telerik:RadScriptBlock>
</head>
<body style="overflow: hidden; padding-right :0px;">
    <div id="divProgress" style="position:absolute; top:150px; left:150px;">
        <span class="litText" id="textProgress"><Foundation:SystemString ID="SystemString1" Name="ProgressText" runat="server"/> </span><img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/progress.gif")%>" id="imageProgress" width="89" height="17" style="display:inline; vertical-align:middle;" alt="" />
    </div>
    <div id="divInfo" style="DISPLAY: none;">
			<span fckLang="DlgLnkType">Link Type</span><br />
			<select id="cmbLinkType" onchange="SetLinkType(this.value);">
				<option value="url" fckLang="DlgLnkTypeURL" selected="selected">URL</option>
				<option value="anchor" fckLang="DlgLnkTypeAnchor">Anchor in this page</option>
				<option value="email" fckLang="DlgLnkTypeEMail">E-Mail</option>
			</select>
			<br />
			<br />
			<div id="divLinkTypeUrl">
				<table cellspacing="0" cellpadding="0" width="100%" border="0" dir="ltr">
					<tr>
						<td nowrap="nowrap">
							<span fckLang="DlgLnkProto">Protocol</span><br />
							<select id="cmbLinkProtocol">
								<option value="http://" selected="selected">http://</option>
								<option value="https://">https://</option>
								<option value="ftp://">ftp://</option>
								<option value="news://">news://</option>
								<option value="" fckLang="DlgLnkProtoOther">&lt;other&gt;</option>
							</select>
						</td>
						<td nowrap="nowrap">&nbsp;</td>
						<td nowrap="nowrap" width="100%">
							<span fckLang="DlgLnkURL">URL</span><br />
							<input id="txtUrl" style="width:540px" type="text" onkeyup="OnUrlChange();" onchange="OnUrlChange();" />
						</td>
					</tr>
					<tr>
						<td colspan="3"><input type="checkbox" checked="checked" id="checkboxAttachment" onchange="OnUrlAttachmentChanged();" /> <Foundation:SystemString ID="EditorAttachAsAttachment" runat="server" Name="EditorAttachAsAttachment" /></td>
					</tr>
				</table>
				<br />
				<div id="divBrowseServer">
				
				</div>
			</div>
			<div id="divLinkTypeAnchor" style="DISPLAY: none" align="center">
				<div id="divSelAnchor" style="DISPLAY: none">
					<table cellspacing="0" cellpadding="0" border="0" width="70%">
						<tr>
							<td colspan="3">
								<span fckLang="DlgLnkAnchorSel">Select an Anchor</span>
							</td>
						</tr>
						<tr>
							<td width="50%">
								<span fckLang="DlgLnkAnchorByName">By Anchor Name</span><br />
								<select id="cmbAnchorName" onchange="GetE('cmbAnchorId').value='';" style="WIDTH: 100%">
									<option value="" selected="selected"></option>
								</select>
							</td>
							<td>&nbsp;&nbsp;&nbsp;</td>
							<td width="50%">
								<span fckLang="DlgLnkAnchorById">By Element Id</span><br />
								<select id="cmbAnchorId" onchange="GetE('cmbAnchorName').value='';" style="WIDTH: 100%">
									<option value="" selected="selected"></option>
								</select>
							</td>
						</tr>
					</table>
				</div>
				<div id="divNoAnchor" style="DISPLAY: none">
					<span fckLang="DlgLnkNoAnchors">&lt;No anchors available in the document&gt;</span>
				</div>
			</div>
			<div id="divLinkTypeEMail" style="DISPLAY: none">
				<span fckLang="DlgLnkEMail">E-Mail Address</span><br />
				<input id="txtEMailAddress" style="WIDTH: 100%" type="text" /><br />
				<span fckLang="DlgLnkEMailSubject">Message Subject</span><br />
				<input id="txtEMailSubject" style="WIDTH: 100%" type="text" /><br />
				<span fckLang="DlgLnkEMailBody">Message Body</span><br />
				<textarea id="txtEMailBody" style="WIDTH: 100%" rows="3" cols="20"></textarea>
			</div>
		</div>
		<form id="form1" runat="server">
		        <div id="divUpload" style="DISPLAY: none;" class="litModuleTreeAreaV2 litText">
		        <asp:ScriptManager ID="ScriptManager" runat="server" />		                
                        <TreeView:TreeView id="c_treeView" 
                            CssClass="treeView" 
                            NodeCssClass="TreeNode" 
                            SelectedNodeCssClass="SelectedTreeNode"
	                        HoverNodeCssClass="HoverTreeNode" runat="server"
	                        DragAndDropEnabled = "false"
	                        OnDemandLoading="true" 
	                        LineImagesFolderUrl="~/LitiumStudio/CMS/Images/lines" 
	                        ImagesBaseUrl="~/LitiumStudio/Images/icons_standard/"
	                Height="325px"
	                Width="605"
	                        ShowTrashcan="false" 
	                        ShowArchive="false" 
	                        ShowStatus="false" 
	                        ShowStatistics="false" 
	                        ShowTasks="false" 
	                        ShowFiles="true">
	                    </TreeView:TreeView>
   		        </div>
   		        <div id="divMediaArchive" style="DISPLAY: none">
	                <table cellpadding="10" cellspacing="0" border="0" width="100%">
	                    <tr>
	                        <td>
		                        <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border: 1px solid #A19E98; background-color:#FFFFFF;">
			                        <tr>
				                        <td style="padding:5px; padding-left:10px; padding-bottom:0px;" width="200" valign="top">
					                        <fieldset style="width:200px; height:240px; padding:5px; padding-right:0px;"><legend class="litBoldText"><Foundation:ModuleString ID="ModuleString2" Name="FoldersCategories" runat="server" />&nbsp;&nbsp;</legend>
					                            <div style="width:185px; height:225px; overflow:auto; margin-top:5px;">
					                                <LS:TreeHelper runat="server" ID="m_treeHelper2" AssociatedControlID="c_mediaArchiveTreeView" />
							                <MediaArchiveTreeView:AdminTreeView
							                    width="100%" height="100%" Runat="server"
							                    id="c_mediaArchiveTreeView"
							                    CssClass="TreeView TreeViewPopup"
							                    ShowArchive="False"
							                    ShowTrashcan="False"							                    
							                            ImagesBaseUrl="~/LitiumStudio/Images/icons_standard/"/>
                                                </div>
					                        </fieldset><img src="<%=Page.ResolveUrl("~/LitiumStudio/Newsletter/images/transparent.gif")%>" width="200" height="1" />
					                    </td>
				                        <td style="padding:5px; padding-bottom:0px;" valign="top" width="100%">
					                        <fieldset style="width:378px; height:240px; padding:5px; padding-right:0px;"><legend class="litBoldText"><Foundation:ModuleString ID="ModuleString3" Name="Files" runat="server" />&nbsp;&nbsp;</legend>
						                        <div style="width:363px; height:225px; overflow:auto; margin-top:5px;">
							                        <asp:Repeater ID="c_repeaterList" Runat="server">
								                        <ItemTemplate>
									                        <table id="itemTable" runat="server" cellpadding="0" cellspacing="0" border="0" class="litImageList" onMouseOut="listRow_onMouseOut(this);" onMouseOver="listRow_onMouseOver(this);" onClick="listRow_onClick(this);">
										                        <tr>
											                        <td valign="top"><img id="img" runat="server" class="litImageBorder"/></td>
											                        <td valign="top" width="100%"><asp:Label id="labelName" Font-Bold="true" Runat="server"/><br /><asp:Label id="labelInfo" Runat="server"/><br /><asp:DropDownList ID="dropDownListVersions" style="margin-top:3px;" Visible="false" runat="server" /></td>
										                        </tr>
									                        </table>
								                        </ItemTemplate>
							                        </asp:Repeater>
						                        </div>
					                        </fieldset>
				                            <img src="<%=Page.ResolveUrl("~/LitiumStudio/Newsletter/images/transparent.gif")%>" width="350" height="1" />
				                        </td>
			                        </tr>
		                        </table>
		                    </td>
		                </tr>
		            </table>
		            <table cellpadding="10" cellspacing="0" border="0" width="100%">
			            <tr>
				            <td align="right" style="padding-top:0px;">
				                 <input id="c_okButton" onserverclick="OkButton_Click" type="button" value="Send it to the Server" fcklang="FileUseBtn" runat="server"/>   
					             <input type="hidden" name="MediaArchive_FileID" value="0"/>
				            </td>
			            </tr>
		            </table>
	            </div>
   		     </form>
		<div id="divTarget" style="DISPLAY: none">
			<table cellspacing="0" cellpadding="0" width="100%" border="0">
				<tr>
					<td nowrap="nowrap">
						<span fckLang="DlgLnkTarget">Target</span><br />
						<select id="cmbTarget" onchange="SetTarget(this.value);">
							<option value="" fckLang="DlgGenNotSet" selected="selected">&lt;not set&gt;</option>
							<option value="frame" fckLang="DlgLnkTargetFrame">&lt;frame&gt;</option>
							<option value="popup" fckLang="DlgLnkTargetPopup">&lt;popup window&gt;</option>
							<option value="_blank" fckLang="DlgLnkTargetBlank">New Window (_blank)</option>
							<option value="_top" fckLang="DlgLnkTargetTop">Topmost Window (_top)</option>
							<option value="_self" fckLang="DlgLnkTargetSelf">Same Window (_self)</option>
							<option value="_parent" fckLang="DlgLnkTargetParent">Parent Window (_parent)</option>
						</select>
					</td>
					<td>&nbsp;</td>
					<td id="tdTargetFrame" nowrap="nowrap" width="100%">
						<span fckLang="DlgLnkTargetFrameName">Target Frame Name</span><br />
						<input id="txtTargetFrame" style="WIDTH: 100%" type="text" onkeyup="OnTargetNameChange();"
							onchange="OnTargetNameChange();" />
					</td>
					<td id="tdPopupName" style="DISPLAY: none" nowrap="nowrap" width="100%">
						<span fckLang="DlgLnkPopWinName">Popup Window Name</span><br />
						<input id="txtPopupName" style="WIDTH: 100%" type="text" />
					</td>
				</tr>
			</table>
			<br />
			<table id="tablePopupFeatures" style="DISPLAY: none" cellspacing="0" cellpadding="0" align="center"
				border="0">
				<tr>
					<td>
						<span fckLang="DlgLnkPopWinFeat">Popup Window Features</span><br />
						<table cellspacing="0" cellpadding="0" border="0">
							<tr>
								<td valign="top" nowrap="nowrap" width="50%">
									<input id="chkPopupResizable" name="chkFeature" value="resizable" type="checkbox" /><label for="chkPopupResizable" fckLang="DlgLnkPopResize">Resizable</label><br />
									<input id="chkPopupLocationBar" name="chkFeature" value="location" type="checkbox" /><label for="chkPopupLocationBar" fckLang="DlgLnkPopLocation">Location 
										Bar</label><br />
									<input id="chkPopupManuBar" name="chkFeature" value="menubar" type="checkbox" /><label for="chkPopupManuBar" fckLang="DlgLnkPopMenu">Menu 
										Bar</label><br />
									<input id="chkPopupScrollBars" name="chkFeature" value="scrollbars" type="checkbox" /><label for="chkPopupScrollBars" fckLang="DlgLnkPopScroll">Scroll 
										Bars</label>
								</td>
								<td></td>
								<td valign="top" nowrap="nowrap" width="50%">
									<input id="chkPopupStatusBar" name="chkFeature" value="status" type="checkbox" /><label for="chkPopupStatusBar" fckLang="DlgLnkPopStatus">Status 
										Bar</label><br />
									<input id="chkPopupToolbar" name="chkFeature" value="toolbar" type="checkbox" /><label for="chkPopupToolbar" fckLang="DlgLnkPopToolbar">Toolbar</label><br />
									<input id="chkPopupFullScreen" name="chkFeature" value="fullscreen" type="checkbox" /><label for="chkPopupFullScreen" fckLang="DlgLnkPopFullScrn">Full 
										Screen (IE)</label><br />
									<input id="chkPopupDependent" name="chkFeature" value="dependent" type="checkbox" /><label for="chkPopupDependent" fckLang="DlgLnkPopDependent">Dependent 
										(Netscape)</label>
								</td>
							</tr>
							<tr>
								<td valign="top" nowrap="nowrap" width="50%">&nbsp;</td>
								<td></td>
								<td valign="top" nowrap="nowrap" width="50%"></td>
							</tr>
							<tr>
								<td valign="top">
									<table cellspacing="0" cellpadding="0" border="0">
										<tr>
											<td nowrap="nowrap"><span fckLang="DlgLnkPopWidth">Width</span></td>
											<td>&nbsp;<input id="txtPopupWidth" type="text" maxlength="4" size="4" /></td>
										</tr>
										<tr>
											<td nowrap="nowrap"><span fckLang="DlgLnkPopHeight">Height</span></td>
											<td>&nbsp;<input id="txtPopupHeight" type="text" maxlength="4" size="4" /></td>
										</tr>
									</table>
								</td>
								<td>&nbsp;&nbsp;</td>
								<td valign="top">
									<table cellspacing="0" cellpadding="0" border="0">
										<tr>
											<td nowrap="nowrap"><span fckLang="DlgLnkPopLeft">Left Position</span></td>
											<td>&nbsp;<input id="txtPopupLeft" type="text" maxlength="4" size="4" /></td>
										</tr>
										<tr>
											<td nowrap="nowrap"><span fckLang="DlgLnkPopTop">Top Position</span></td>
											<td>&nbsp;<input id="txtPopupTop" type="text" maxlength="4" size="4" /></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<div id="divAttribs" style="DISPLAY: none">
			<table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
				<tr>
					<td valign="top" width="50%">
						<span fckLang="DlgGenId">Id</span><br />
						<input id="txtAttId" style="WIDTH: 100%" type="text" />
					</td>
					<td width="1"></td>
					<td valign="top">
						<table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
							<tr>
								<td width="60%">
									<span fckLang="DlgGenLangDir">Language Direction</span><br />
									<select id="cmbAttLangDir" style="WIDTH: 100%">
										<option value="" fckLang="DlgGenNotSet" selected>&lt;not set&gt;</option>
										<option value="ltr" fckLang="DlgGenLangDirLtr">Left to Right (LTR)</option>
										<option value="rtl" fckLang="DlgGenLangDirRtl">Right to Left (RTL)</option>
									</select>
								</td>
								<td width="1%">&nbsp;&nbsp;&nbsp;</td>
								<td nowrap="nowrap"><span fckLang="DlgGenAccessKey">Access Key</span><br />
									<input id="txtAttAccessKey" style="WIDTH: 100%" type="text" maxlength="1" size="1" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td valign="top" width="50%">
						<span fckLang="DlgGenName">Name</span><br />
						<input id="txtAttName" style="WIDTH: 100%" type="text" />
					</td>
					<td width="1"></td>
					<td valign="top">
						<table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
							<tr>
								<td width="60%">
									<span fckLang="DlgGenLangCode">Language Code</span><br />
									<input id="txtAttLangCode" style="WIDTH: 100%" type="text" />
								</td>
								<td width="1%">&nbsp;&nbsp;&nbsp;</td>
								<td nowrap="nowrap">
									<span fckLang="DlgGenTabIndex">Tab Index</span><br />
									<input id="txtAttTabIndex" style="WIDTH: 100%" type="text" maxlength="5" size="5" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td valign="top" width="50%">&nbsp;</td>
					<td width="1"></td>
					<td valign="top"></td>
				</tr>
				<tr>
					<td valign="top" width="50%">
						<span fckLang="DlgGenTitle">Advisory Title</span><br />
						<input id="txtAttTitle" style="WIDTH: 100%" type="text" />
					</td>
					<td width="1">&nbsp;&nbsp;&nbsp;</td>
					<td valign="top">
						<span fckLang="DlgGenContType">Advisory Content Type</span><br />
						<input id="txtAttContentType" style="WIDTH: 100%" type="text" />
					</td>
				</tr>
				<tr>
					<td valign="top">
						<span fckLang="DlgGenClass">Stylesheet Classes</span><br />
						<input id="txtAttClasses" style="WIDTH: 100%" type="text" />
					</td>
					<td></td>
					<td valign="top">
						<span fckLang="DlgGenLinkCharset">Linked Resource Charset</span><br />
						<input id="txtAttCharSet" style="WIDTH: 100%" type="text" />
					</td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
				<tr>
					<td>
						<span fckLang="DlgGenStyle">Style</span><br />
						<input id="txtAttStyle" style="WIDTH: 100%" type="text" />
					</td>
				</tr>
			</table>
		</div>
</body>
</html>