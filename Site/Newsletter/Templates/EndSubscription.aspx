<%@ Page language="c#" CodeFile="EndSubscription.aspx.cs" ValidateRequest="false" Inherits="Site.Newsletter.Templates.EndSubscription" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="sv" xml:lang="sv">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="/ui/css/base.css" />
        <title><Foundation:ModuleString Name="CircularPageTitle" runat="server"/></title>
        <style type="text/css">
            body { color: #000; font: 75% Arial, verdana, sans-serif; }
            form { width: 40em; margin: 10em auto 2em; padding: 3em; border: 1px solid #ccc; background-color: #fff; }            
            h1, h2, h3, h4, h5, h6 { margin-bottom: 1em; color: #333; }
            h2, h3, h4, h5, h6 { margin-top: 1em; margin-bottom: .5em; }
            h1 { font-size: 2em; margin-bottom: .5em; }
            h2 { font-size: 1.5em; }
            h3 { font-size: 1em; font-weight: bold; }            
            td, th { text-align: left; vertical-align: top; }
            th { font-weight: bold; }
            ul { list-style: disc outside; margin: 1em 0 2em 1.63em; }
            ol { list-style: decimal outside; margin: 1em 0 2em 1.72em; }
            ul ul, ul ol, ol ol, ol ul { margin-top: 0; margin-bottom: 0; padding-top: 1em; }
            li { margin: 0 0 .5em 0; }
            p { margin: 0 0 1em 0; }
            a:link, a:visited { color: #008eb6; text-decoration: underline; }
            a:active, a:hover { color: #3e9fc2; text-decoration: none; }
            a img { border: 0; }            
        </style>        
	</head>
	<body>
	    <form method="post" runat="server">	    
			<!-- Content Start-->
			<p><strong><asp:Label id="c_subscriptionAddressList" runat="server"/>:</strong> <asp:Label ID="c_labelAddressList" Runat="server"/></p>
			<asp:Panel Runat="server" id="c_panelAddressRemoved" Visible="False">
				<p><asp:Label id="c_subscriptionEndConfirmation" runat="server" /></p>
			</asp:Panel>
			<asp:Panel Runat="server" id="c_panelAddressNotFound" Visible="False">
				<p><asp:Label id="c_subscriptionMessageAddressNotFound" runat="server" /></p>
			</asp:Panel>
			<asp:Panel Runat="server" id="c_panelBadRequest" Visible="False">
				<p><asp:Label id="c_subscriptionMessageBadRequest" runat="server" /></p>
			</asp:Panel>
			<!-- Content End -->
		</form>
	</body>
</html>