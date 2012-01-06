<%@ Page Language="C#" CodeFile="LoadSearchHit.aspx.cs" Inherits="Templates_LoadSearchHit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
	<head>
	    <title>Fel</title>
		<meta name="vs_defaultClientScript" content="JavaScript" />
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<link rel="stylesheet" href="<%=Page.ResolveUrl("~/Styles/public.css")%>" type="text/css" />
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<%--The content here will only be shown if something unexpected happens.--%>
			<h1 class="c-H1header c-MarginSingle">
				Sidan kunde ej laddas
			</h1>
			<div class="c-Text c-MarginDouble">
				Kontakta administratör om felet kvarstår.
			</div>
			<div class="c-Text c-MarginDouble">
				<asp:HyperLink id="c_buttonBack" runat="server" Text="Gå till startsidan" />
			</div>
		</form>
	</body>
</html>