<%@ page language="C#" autoeventwireup="true" inherits="Modules_PC_SelectProductCatalog, Litum.Studio.Web" %>

<%@ Import Namespace="Litium.Studio.UI.ProductCatalog.Common.Constants" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>
		<Foundation:ModuleString Name="ArticlesCreateNewProduct" runat="server" />
	</title>
	<link href="<%=Page.ResolveUrl("~/LitiumStudio/CMS/Styles/treeStyle.css")%>" type="text/css"
		rel="stylesheet" />
	<link href="<%=Page.ResolveUrl("~/LitiumStudio/ProductCatalog/Styles/ProductCatalog.css")%>"
		type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl("~/LitiumStudio/StyleSheets/Foundation.css")%>" />
	<link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl("~/LitiumStudio/StyleSheets/Position.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl(FoundationContext.SkinPath + "/Skin.css")%>" />
	<style type="text/css">
		html, body
		{
			overflow: hidden;
			height: 100%;
			margin: 0;
			padding: 0;
		}
		.litTreeView td
		{
			padding: 0 !important;
		}
	</style>
	<!--[if lt IE 7]>
        <style type="text/css">
        .litTreeView 
        {
            overflow: auto; 
            overflow-y: auto !important;
            overflow-x: hidden !important;
            margin: 0 !important; 
            padding: 5px !important;	
            width: 96%;
            height: 96%; 	                           
        }
        </style>
        <![endif]-->
	<!--[if gte IE 7]>
        <style type="text/css">
        .litTreeView 
        {
            overflow-y: auto !important;
            overflow-x: hidden !important;
            margin: 0 !important; 
            padding: 5px !important;	            	                           
        }
        </style>
        <![endif]-->
	<!--[if !IE]>
        <style type="text/css">
        .litTreeView 
        {
            overflow-y: auto !important;
            overflow-x: hidden !important;
            margin: 0 !important; 
            padding: 5px !important;	
        }
        </style>
        <![endif]-->

	<script type="text/javascript">
		//<![CDATA[
		function SetProductCatalog(sender, eventArgs) {
			var node = eventArgs.get_node();
			var nodeValue = node.get_value();
			var parentWindow = window.parent;

			var isProductGroup = nodeValue.indexOf('<%= StringConstants.CHILD_PRODUCT_GROUP_NAME %>') > -1;
			if (isProductGroup) {
				var productCatalogID = document.getElementById('ProductCatalogID');


				if (parentWindow && typeof parentWindow.enableSaveButton != 'undefined') {
					parentWindow.enableSaveButton();
				}

				if (productCatalogID) {
					productCatalogID.value = node._attributes._data.PC_ID;
				}
			}
			else {
				if (parentWindow && typeof parentWindow.disableSaveButton != 'undefined') {
					parentWindow.disableSaveButton();
				}
			}
			
		}
		//]]>
	</script>

</head>
<body class="litModalPopupBody">
	<form id="Form1" method="post" style="overflow:auto" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" />
	<Telerik:RadAjaxManager ID="RadAjaxManager2" runat="server" />
	<div>
		<input type="hidden" id="ProductCatalogID" value="" />
		<LS:TreeHelper runat="server" ID="m_treeHelper" AssociatedControlID="CreateNewProductTree" />
		<Telerik:RadTreeView  ID="CreateNewProductTree" runat="server" EnableViewState="false"
			PersistLoadOnDemandNodes="false" OnClientNodeClicked="SetProductCatalog" OnNodeExpand="Tree_NodeExpand">
		</Telerik:RadTreeView>
	</div>
	</form>
</body>
</html>
