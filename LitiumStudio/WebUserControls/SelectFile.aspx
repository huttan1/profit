<%@ page language="C#" autoeventwireup="true" inherits="Modules_Common_SelectFile, Litum.Studio.Web" %>
<%@ Register TagPrefix="MediaArchive" Namespace="Litium.Foundation.Modules.MediaArchive.WebControls.AdminTreeView"  Assembly="Litium.Studio.WebControls"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml" style="overflow-y:hidden;">
    <head>
        <title><Foundation:ModuleString Name="MediaArchive" runat="server"/></title>
          <style type="text/css">
            .litTreeView td { padding:0px; }
            .litTreeView { position:relative; padding:0px;}
        </style>

        <link href="<%=Page.ResolveUrl("~/LitiumStudio/CMS/Styles/treeStyle.css")%>" type="text/css" rel="stylesheet" />
        <link href="<%=Page.ResolveUrl("~/LitiumStudio/MediaArchive/Styles/MediaArchive.css")%>" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl("~/LitiumStudio/StyleSheets/Foundation.css")%>" />
        <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl("~/LitiumStudio/StyleSheets/Position.css")%>" />
	    <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl(FoundationContext.SkinPath + "/Skin.css")%>" />
        <script type="text/javascript">
	    //<!--
	    var lrSelectedRow = null;
        function listRow_onClick(t) {
	        t.className = 'litImageList litImageListSelected';
	        if ((lrSelectedRow != null) && (lrSelectedRow != t))
		        lrSelectedRow.className = 'litImageList';
	        lrSelectedRow = t;
	        
	        var nodeid = t.id.substr(0,t.id.length - 36);
	        var dropDownList = document.getElementById(nodeid+'dropDownListVersions');

	        if (dropDownList != null) {
	            var Index = dropDownList.selectedIndex;
	            document.getElementById('inputHiddenMediaArchiveFileVersionName').value = dropDownList.options[Index].text;
	            document.getElementById('inputHiddenMediaArchiveFileVersionID').value = dropDownList.options[Index].value;
	        } else {
	            document.getElementById('inputHiddenMediaArchiveFileVersionName').value = null;
	            document.getElementById('inputHiddenMediaArchiveFileVersionID').value = null;
	        }
	        document.getElementById('inputHiddenMediaArchiveFileName').value = document.getElementById(nodeid+'labelName').innerHTML;
	        document.getElementById('inputHiddenMediaArchiveFileID').value = t.id.substr(t.id.length - 36);
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
            document.getElementById('inputHiddenMediaArchiveFileVersionName').value = dropDownList.options[Index].text;
            document.getElementById('inputHiddenMediaArchiveFileVersionID').value = dropDownList.options[Index].value;
        }
       
	    //-->
        </script>
    </head>
    <body class="litModalPopupBody">    
        <form id="Form1" method="post" runat="server">
            <asp:ScriptManager ID="ScriptManager" runat="server" />            
            <input type="hidden" id="inputHiddenMediaArchiveFileID" value=""/>
            <input type="hidden" id="inputHiddenMediaArchiveFileName" value=""/>
            <input type="hidden" id="inputHiddenMediaArchiveFileVersionID" value=""/>
            <input type="hidden" id="inputHiddenMediaArchiveFileVersionName" value=""/>
            
            <table cellpadding="5" cellspacing="0" border="0" width="680" style="border: 1px solid #cfcdcc; background-color:#FFFFFF; margin:10px;">
                <tr>
                    <td style="padding-left:10px; padding-bottom:10px; width:250px;" valign="top">
                        <fieldset style="width:235px; height:400px; padding:5px; padding-right:0px;  border: 1px solid #cfcdcc;"><legend class="litBoldText"><asp:Label runat="server" ID="c_labelFoldersCategories"></asp:Label>&nbsp;&nbsp;</legend>
                            <div style="width:228px; height:380px; overflow:auto; margin-top:5px;">
                                <LS:TreeHelper runat="server" ID="m_treeHelper" AssociatedControlID="c_treeView" />
		                        <MediaArchive:AdminTreeView Runat="server" ID="c_treeView" CssClass="litTreeView TreeViewPopup" ShowArchive="False" ShowTrashcan="False" NodeCssClass="litTreeNode" SelectedNodeCssClass="litSelectedTreeNode" HoverNodeCssClass="litHoverTreeNode" ImagesBaseUrl="~/LitiumStudio/Images/icons_standard/"/>
                            </div>
                        </fieldset>
                        <img src="../images/transparent.gif" width="245" height="1" border="0" alt="" />
					</td>
                    <td style="padding-right:10px; padding-left:0px; padding-bottom:5px; width:405px;" valign="top">
                        <fieldset runat=server id="m_fileBrowseFieldSet" style="width:385px; height:400px; padding:5px; padding-left:10px; padding-right:5px; border: 1px solid #cfcdcc;"><legend class="litBoldText"><asp:Label ID="c_labelFiles" runat="server" />&nbsp;&nbsp;</legend>
	                        <div runat="server" id="m_fileBrowseDiv" style="width:382px; height:380px; overflow:auto; margin-top:5px;">
		                        <asp:Repeater ID="c_imageRepeaterList" Runat="server" Visible="false" onitemdatabound="RepeaterList_ItemDataBound" >
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
		                        <asp:Repeater ID="c_fileRepeaterList" Runat="server" Visible="false" onitemdatabound="RepeaterList_ItemDataBound">
			                        <ItemTemplate>
				                        <table id="itemTable" runat="server" cellpadding="0" cellspacing="0" border="0" class="litImageList litImageListGray" style="margin-bottom:5px; margin-right:5px; cursor:pointer;" onMouseOut="listRow_onMouseOut(this);" onMouseOver="listRow_onMouseOver(this);" onClick="listRow_onClick(this);">
					                        <tr>
						                        <td valign="center"><img id="img" runat="server" class="litImageBorder"/></td>
						                        <td valign="top" width="100%" style="padding-left:10px;">
													<asp:Label id="labelName" Runat="server" CssClass="litBoldText"/><br />
													<asp:Label id="labelInfo" Runat="server" CssClass="litText"/>
													<asp:DropDownList ID="dropDownListVersions" CssClass="litInputSelect" style="margin-left:10px;width:auto;" Visible="false" runat="server" />
												</td>
					                        </tr>
				                        </table>
			                        </ItemTemplate>
		                        </asp:Repeater>
	                        </div>
                        </fieldset>
                        <fieldset runat="server" id="m_fileUploadFieldSet" style="width:385px; height:55px; margin-top:5px;padding:5px; padding-left:10px; padding-right:5px;  border: 1px solid #cfcdcc;" visible="false"><legend class="litBoldText"><asp:Label ID="_lableUpload" runat="server" />&nbsp;&nbsp;</legend>
                            <div style="width:382px; height:50px; overflow:auto;">
		                        <div style="float:left;">
		                            <asp:FileUpload runat="server" ID="_uploadFile" style="width: 200px;" size="21" class="litInputFile" runat="server"/><br />
		                            <asp:CheckBox ID="_checkboxCreatePreDefinedVersions" runat="server" class="litText" Text="Auto generate predefined versions1" />
		                        </div>
		                        <div style="float:right;">
		                            <asp:Button id="_uploadFileButton" cssclass="litInputButton" style="width:auto;padding-left:18px;background:#F3F3EE url(../../LitiumStudio/images/icons_standard/import2_16px.gif) center left no-repeat;height:24px;" OnClick="ButtonUpload_Click" runat="server"/>
		                        </div>
                            </div>
                        </fieldset>
                        <img src="../images/transparent.gif" width="395" height="1" />
					</td>
                </tr>
            </table>
        </form>
    </body>
</html>
