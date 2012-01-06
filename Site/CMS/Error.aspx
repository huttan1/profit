<%@ Page Language="C#" CodeFile="Error.aspx.cs" Inherits="Site.CMS.Templates.Error" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="sv" xml:lang="sv">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/ui/css/base.ashx" />
<title><asp:literal ID="ErrorPageTitle" runat="server"/></title>
</head>
<body class="p-error">
<form method="post" runat="server">
<h1><asp:literal ID="ErrorPageTitleHeading" runat="server"/></h1>
<p runat="server" ID="c_labelErrorTitle" />
<p runat="server" ID="c_labelErrorText" />
<p><asp:Button ID="c_buttonBack" runat="server" OnClick="ButtonBack_Click" /></p>
</form>
</body>
</html>