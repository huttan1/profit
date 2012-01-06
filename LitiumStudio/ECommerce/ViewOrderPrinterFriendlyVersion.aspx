<%@ page language="C#" autoeventwireup="true" inherits="LitiumStudio_ECommerce_ViewOrderPrinterFriendlyVersion, Litum.Studio.Web" title="Litium Studio - View Order Printer Friendly version" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
     <style type="text/css">
			.hiddenData, .hiddenHeader
			{
				display: none;
			}
			.printHeader
			{
			    font-size: 130%;
			    font-weight: bold;
			}
			.litFormLeft{ padding-top: 0px !important;}
			.printBlock{padding-left: 13px !important;}
			.lsViewOrderRightPadding{padding-right: 0px !important;}
    </style>
</head>
<body onload="PrintAndClose()">
    <form id="form1" runat="server">
   
    <script type="text/javascript">        
        <%
        if (IsIEbefore7)
        {%>
            document.write("<link href='<%=Page.ResolveUrl("~/LitiumStudio/StyleSheets/DefaultSkin/printIE.css")%>' rel='Stylesheet' type='text/css' media='print' />"); 
        <%
        }
        else
        {%>
            document.write("<link href='<%=Page.ResolveUrl("~/LitiumStudio/StyleSheets/DefaultSkin/print.css")%>' rel='Stylesheet' type='text/css' media='print' />");
        <%
        }
        %>
      </script>  

    <div>
        <asp:HiddenField runat="server" ID="c_hiddenPageContent"/>
        <asp:Literal ID = "c_literalContent" runat = "server" />
        <div id = "c_divContent" runat = "server"></div>
    </div>
     <script type="text/javascript">
       
        function PrintAndClose() {
            window.print();
            window.close();
        }
     </script>
    </form>
</body>
</html>
