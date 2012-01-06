<%@ page language="C#" autoeventwireup="true" inherits="FCKeditor_editor_plugins_CMSImageUpload_DirectEditImageUpload" CodeFile="DirectEditImageUpload.aspx.cs" %>

<%@ Register TagPrefix="treeview" Namespace="Litium.Foundation.Modules.MediaArchive.WebControls.AdminTreeView"  Assembly="Litium.Studio.WebControls"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title><%=this.Title %></title>
    <Telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
    <link href="../../dialog/common/fck_dialog_common.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl(FoundationContext.SkinPath + "/Skin.css")%>" />

    <link href="../../../../CMS/Styles/treeStyle.css" type="text/css" rel="stylesheet">
    <link href="../../../../CMS/Styles/treeStyleEditor.css" type="text/css" rel="stylesheet"> 
    <script src="../../dialog/common/fck_dialog_common.js" type="text/javascript"></script>
    <script src="../common/imageUpload.js" type="text/javascript"></script>
	<script type="text/javascript" language="javascript">
	<!--
    var lrSelectedRow = null;
    function listRow_onClick(t) {
	    t.className = 'litImageList litImageListSelected';
	    if ((lrSelectedRow != null) && (lrSelectedRow != t))
		    lrSelectedRow.className = 'litImageList';
	    lrSelectedRow = t;
	    document.forms[0].MediaArchiveFileID.value = t.id.substr(t.id.length - 36);
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


        function dropDownChanged(dropDownList) {
            var Index = dropDownList.selectedIndex;
            document.forms[0].MediaArchiveFileVersionID.value = dropDownList.options[Index].value;
           }
	//-->
	</script>
	</Telerik:RadScriptBlock>
</head>
<body style="overflow: hidden;">
    <div id="divProgress" style="position:absolute; top:150px; left:230px;">
        <span class="litText" id="textProgress"><Foundation:SystemString Name="ProgressText" runat="server"/> </span><img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/progress.gif")%>" id="imageProgress" width="89" height="17" style="display:inline; vertical-align:middle;" alt="" />
    </div>
	<div id="divInfo" style="display:none;">
		<table cellspacing="1" cellpadding="1" border="0" width="100%" height="100%">
			<tr>
				<td>
					<table cellspacing="0" cellpadding="0" width="100%" border="0">
						<tr>
							<td width="100%">
								<span fcklang="DlgImgURL">URL</span>
							</td>
							<td id="tdBrowse" style="display: none" nowrap="nowrap" rowspan="2"></td>
						</tr>
						<tr>
							<td valign="top">
								<input id="txtUrl" style="width:626px" type="text" onblur="UpdatePreview();" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<span fcklang="DlgImgAlt">Short Description</span><br />
					<input id="txtAlt" style="width: 100%" type="text" /><br />
				</td>
			</tr>
			<tr height="100%">
				<td valign="top">
					<table cellspacing="0" cellpadding="0" width="100%" border="0" height="100%">
						<tr>
							<td valign="top">
								<br />
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td nowrap="nowrap">
											<span fcklang="DlgImgWidth">Width</span>&nbsp;</td>
										<td>
											<input type="text" size="10" id="txtWidth" onkeyup="OnSizeChanged('Width',this.value);" /></td>
										<td rowspan="2">
											<div id="btnLockSizes" class="BtnLocked" onmouseover="this.className = (bLockRatio ? 'BtnLocked' : 'BtnUnlocked' ) + ' BtnOver';"
												onmouseout="this.className = (bLockRatio ? 'BtnLocked' : 'BtnUnlocked' );" title="Lock Sizes"
												onclick="SwitchLock(this);">
											</div>
										</td>
										<td rowspan="2">
											<div id="btnResetSize" class="BtnReset" onmouseover="this.className='BtnReset BtnOver';"
												onmouseout="this.className='BtnReset';" title="Reset Size" onclick="ResetSizes();">
											</div>
										</td>
									</tr>
									<tr>
										<td nowrap="nowrap">
											<span fcklang="DlgImgHeight">Height</span>&nbsp;</td>
										<td>
											<input type="text" size="10" id="txtHeight" onkeyup="OnSizeChanged('Height',this.value);" /></td>
									</tr>
								</table>
								<br />
								<table cellspacing="0" cellpadding="0" border="0" width="200">
									<tr>
										<td nowrap="nowrap">
											<span fcklang="DlgImgBorder">Border</span>&nbsp;</td>
										<td>
											<input type="text" size="5" value="" id="txtBorder" onkeyup="UpdatePreview();" /></td>
									</tr>
									<tr>
										<td nowrap="nowrap">
											<span fcklang="DlgImgHSpace">HSpace</span>&nbsp;</td>
										<td>
											<input type="text" size="5" id="txtHSpace" onkeyup="UpdatePreview();" /></td>
									</tr>
									<tr>
										<td nowrap="nowrap">
											<span fcklang="DlgImgVSpace">VSpace</span>&nbsp;</td>
										<td>
											<input type="text" size="5" id="txtVSpace" onkeyup="UpdatePreview();" /></td>
									</tr>
									<tr>
										<td nowrap="nowrap">
											<span fcklang="DlgImgAlign">Align</span>&nbsp;</td>
										<td>
											<select id="cmbAlign" onchange="UpdatePreview();">
												<option value="" selected="selected"></option>
												<option fcklang="DlgImgAlignLeft" value="left">Left</option>
												<option fcklang="DlgImgAlignAbsBottom" value="absBottom">Abs Bottom</option>
												<option fcklang="DlgImgAlignAbsMiddle" value="absMiddle">Abs Middle</option>
												<option fcklang="DlgImgAlignBaseline" value="baseline">Baseline</option>
												<option fcklang="DlgImgAlignBottom" value="bottom">Bottom</option>
												<option fcklang="DlgImgAlignMiddle" value="middle">Middle</option>
												<option fcklang="DlgImgAlignRight" value="right">Right</option>
												<option fcklang="DlgImgAlignTextTop" value="textTop">Text Top</option>
												<option fcklang="DlgImgAlignTop" value="top">Top</option>
											</select>
										</td>
									</tr>
								</table>
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;</td>
							<td width="100%" valign="top">
								<table cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed">
									<tr>
										<td>
											<span fcklang="DlgImgPreview">Preview</span></td>
									</tr>
									<tr>
										<td valign="top">
											<iframe class="ImagePreviewArea" src="image_preview.html" frameborder="0" marginheight="0" marginwidth="0"></iframe>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<form id="c_form" name="frmUpload" enctype="multipart/form-data" method="post" runat="server">
	<asp:ScriptManager ID="ScriptManager" runat="server" />
	<div id="divUpload" style="display: none">
		<span fcklang="DlgLnkUpload">Upload</span><br />
        <input id="file" type="file" style="width:100%;" name="file" size="101"><br /><br />
		<asp:CustomValidator ID="m_customValidatorFileSize" runat="server" OnServerValidate="CustomValidatorFileSize_ServerValidate"></asp:CustomValidator>
        <div style="float:right;">
            <input id="c_buttonSave" onserverclick="ButtonSave_Click" type="button" value="Send it to the Server" fcklang="ImageUploadBtn" runat="server"/>
        </div>
	</div>
	<div id="divMediaArchive" style="display: none">


	    <table cellpadding="5" cellspacing="0" border="0" width="100%" background-color="#FFFFFF">
            <tr>
                <td style="padding-left:10px; padding-bottom:10px; width:210px;" valign="top">
                    <fieldset style="width:195px; height:370px; padding:5px; padding-right:0px;"><legend class="litBoldText"><asp:Label runat="server" ID="c_labelFoldersCategories"></asp:Label>&nbsp;&nbsp;</legend>
                        <div style="width:188px; height:360px; overflow:auto; margin-top:5px;">
					                    <LS:TreeHelper runat="server" ID="m_treeHelper" AssociatedControlID="c_treeView" />
							            <TreeView:AdminTreeView width="100%" height="100%" Runat="server" id="c_treeView"
							                ShowArchive="False" ShowTrashcan="False" 
							                ImagesBaseUrl="~/LitiumStudio/Images/icons_standard/"/>
                        </div>
                    </fieldset>
                    <img src="<%=Page.ResolveUrl("~/LitiumStudio/CMS/images/transparent.gif")%>" width="205" height="1" border="0" alt="" />
                </td>
                
                <td style="padding-right:10px; padding-left:0px; padding-bottom:5px; width:405px;" valign="top">
                    <fieldset runat="server" id="m_fileBrowseFieldSet" style="width:390px;padding:5px; padding-left:10px; padding-right:5px;"><legend class="litBoldText"><asp:Label ID="c_labelFiles" runat="server" />&nbsp;&nbsp;</legend>
                        <div runat="server" id="m_fileBrowseDiv" style="width:387px; overflow:auto; margin-top:5px;">
	                        <asp:Repeater ID="c_repeaterList" Runat="server" Visible="false" OnItemDataBound="RepeaterList_ItemDataBound">
		                        <ItemTemplate>
			                        <table id="itemTable" runat="server" cellpadding="0" cellspacing="0" border="0" class="litImageList litImageListGray" style="margin-bottom:5px; margin-right:5px; cursor:pointer;" onMouseOut="listRow_onMouseOut(this);" onMouseOver="listRow_onMouseOver(this);" onClick="listRow_onClick(this);">
				                        <tr>
					                        <td valign="top"><img id="img" runat="server" class="litImageBorder"/></td>
					                        <td valign="top" width="100%" style="padding-left:10px;">
					                            <asp:Label id="labelName" Runat="server" CssClass="litBoldText"/><br />
					                            <asp:Label id="labelInfo" Runat="server" CssClass="litText"/><br />
					                            <asp:DropDownList ID="dropDownListVersions" CssClass="litInputSelect" style="width:auto;" Visible="false" runat="server" />
					                       </td>
				                        </tr>
			                        </table>
		                        </ItemTemplate>
	                        </asp:Repeater>
                        </div>
                    </fieldset>
                    <fieldset runat="server" id="m_fileUploadFieldSet" style="width:390px; height:53px; margin-top:5px;padding:5px; padding-left:10px; padding-right:5px;" visible="false"><legend class="litBoldText"><asp:Label ID="_lableUpload" runat="server" />&nbsp;&nbsp;</legend>
                        <div style="width:387px; height:44px; overflow:auto;">
	                        <div style="float:left;">
	                            <asp:FileUpload runat="server" ID="_uploadFile" style="width: 200px;" size="21" class="litInputFile" runat="server"/><br />
	                            <asp:CheckBox ID="_checkboxCreatePreDefinedVersions" runat="server" class="litText" Text="Auto generate predefined versions1" />
	                        </div>
	                        <div style="float:right;">
	                            <asp:Button id="_uploadFileButton" cssclass="litInputButton" style="width:auto;padding-left:18px;background:#F3F3EE url(../../../../../../../LitiumStudio/images/icons_standard/import2_16px.gif) center left no-repeat;height:24px;" OnClick="ButtonUpload_Click" runat="server"/>
	                        </div>
                        </div>
                    </fieldset>
				                <img src="<%=Page.ResolveUrl("~/LitiumStudio/CMS/images/transparent.gif")%>" width="350" height="1" />
                </td>
            </tr>
        </table>
		<table cellpadding="10" cellspacing="0" border="0" width="100%">
			<tr>
				<td align="right" style="padding-top:0px;">
				     <input id="c_okButton" onserverclick="OkButton_Click" type="button" value="Send it to the Server" fcklang="ImageUseBtn" runat="server"/>   
					 <input type="hidden" name="MediaArchiveFileID" value="0"/>
                     <input type="hidden" name="MediaArchiveFileVersionID" value="0"/>
				</td>
			</tr>
		</table>
	</div>
    </form>
	<div id="divAdvanced" style="display: none">
		<table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
			<tr>
				<td valign="top" width="50%">
					<span fcklang="DlgGenId">Id</span><br />
					<input id="txtAttId" style="width: 100%" type="text" />
				</td>
				<td width="1">
					&nbsp;&nbsp;</td>
				<td valign="top">
					<table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							<td width="60%">
								<span fcklang="DlgGenLangDir">Language Direction</span><br />
								<select id="cmbAttLangDir" style="width: 100%">
									<option value="" fcklang="DlgGenNotSet" selected="selected">&lt;not set&gt;</option>
									<option value="ltr" fcklang="DlgGenLangDirLtr">Left to Right (LTR)</option>
									<option value="rtl" fcklang="DlgGenLangDirRtl">Right to Left (RTL)</option>
								</select>
							</td>
							<td width="1%">
								&nbsp;&nbsp;</td>
							<td nowrap="nowrap">
								<span fcklang="DlgGenLangCode">Language Code</span><br />
								<input id="txtAttLangCode" style="width: 100%" type="text" />&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">
					<span fcklang="DlgGenLongDescr">Long Description URL</span><br />
					<input id="txtLongDesc" style="width: 100%" type="text" />
				</td>
			</tr>
			<tr>
				<td colspan="3">
					&nbsp;</td>
			</tr>
			<tr>
				<td valign="top">
					<span fcklang="DlgGenClass">Stylesheet Classes</span><br />
					<input id="txtAttClasses" style="width: 100%" type="text" />
				</td>
				<td>
				</td>
				<td valign="top">
					&nbsp;<span fcklang="DlgGenTitle">Advisory Title</span><br />
					<input id="txtAttTitle" style="width: 100%" type="text" />
				</td>
			</tr>
		</table>
		<span fcklang="DlgGenStyle">Style</span><br />
		<input id="txtAttStyle" style="width: 100%" type="text" />
	</div>
</body>
 </html>
