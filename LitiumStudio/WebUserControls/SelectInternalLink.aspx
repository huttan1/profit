<%@ page language="C#" autoeventwireup="true" inherits="Modules_Common_SelectInternalLink, Litum.Studio.Web" %>

<%@ Register TagPrefix="treeview" Namespace="Litium.Foundation.Modules.CMS.WebControls.TreeView"
	Assembly="Litium.Studio.WebControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="overflow-y: hidden;">
<head>
	<title>
		<Foundation:ModuleString Name="InternalLink" runat="server" />
	</title>
    <style type="text/css">
	    .TreeView td { padding:0px; }
	    .TreeView { position:relative; padding:0px;}
    </style>
	<link href="<%=Page.ResolveUrl("~/LitiumStudio/Stylesheets/TreeCA.css")%>" type="text/css"
		rel="stylesheet" />
		
	<link href="<%=Page.ResolveUrl("~/LitiumStudio/Stylesheets/Foundation.css")%>" type="text/css"
		rel="stylesheet" />
		
		
	<link href="<%=Page.ResolveUrl("~/LitiumStudio/Stylesheets/Position.css")%>" type="text/css"
		rel="stylesheet" />
		
	<link href="<%=Page.ResolveUrl(FoundationContext.SkinPath)%>" type="text/css"
		rel="stylesheet" />

	<script type="text/javascript" src="<%=Page.ResolveUrl("~/LitiumStudio/JavaScripts/HttpRequest.js")%>"></script>

	<script type="text/javascript">
		//<!--
		function nodeSelect(sender) {
			document.getElementById("selectedPageID").value = sender.get_id();
			MakeHttpRequest("<%=Page.Request.RawUrl %>", function() {
				if (http_request.readyState == 4) {
					if (http_request.status == 200) {
						var value = http_request.responseText;
						document.getElementById("selectedPageName").value = value;
					}
				}
			}, "mode=pageName&PageID=" + encodeURIComponent(sender.get_id()));
		}
		//-->
	</script>

</head>
<body class="litModalPopupBody" style="padding: 0px;">
	<form id="Form1" method="post" runat="server">
	<table cellpadding="0" cellspacing="0" border="0" width="665" height="365" style="border: 1px solid #A19E98;
		background-color: #FFFFFF; margin: 10px;">
		<tr>
			<td style="width: 250px;" valign="top">
				<treeview:TreeView ID="c_treeView" runat="server" CssClass="treeView" NodeCssClass="litTreeNode"
					SelectedNodeCssClass="litSelectedTreeNode" HoverNodeCssClass="litHoverTreeNode" DragAndDropEnabled="false"
					OnDemandLoading="true" ImagesBaseUrl="/LitiumStudio/Images/icons_standard"
					Width="665px" Height="365px" ShowTrashcan="false" ShowArchive="false" ShowStatistics="false"
					ShowStatus="false" ShowTasks="false" ShowFiles="false" ClientSideOnNodeSelect="nodeSelect" ForceReadPermissionCheck="true">
				</treeview:TreeView>
			</td>
		</tr>
	</table>
	<input type="hidden" id="selectedPageID" /><input type="hidden" id="selectedPageName" />
	</form>
</body>
</html>
