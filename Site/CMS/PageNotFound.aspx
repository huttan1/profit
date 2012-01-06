<%@ Page Language="C#" CodeFile="PageNotFound.aspx.cs" Inherits="Site.CMS.Templates.PageNotFound" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" runat="server">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/ui/css/base.ashx" />
<title runat="server"><asp:Literal ID="c_literalTitle" runat="server" /></title>
</head>
<body class="p-pagenotfound">
<form method="post" runat="server">
	<h1><asp:Literal ID="c_literalHeading" runat="server" /></h1>
	<p class="message"><asp:Literal ID="c_literalMessage" runat="server" /></p>
	<p class="url"><asp:Literal ID="c_literalURL" runat="server" /></p>
	<p class="back"><asp:HyperLink id="c_buttonBack" runat="server" /></p>
</form>
</body>
</html>