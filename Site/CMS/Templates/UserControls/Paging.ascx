<%@ Control Language="C#" AutoEventWireUp="false" CodeFile="~/Site/CMS/Templates/UserControls/Paging.ascx.cs" Inherits="Site.CMS.Templates.UserControls.Paging" %>
	<div id="paging">
        <asp:HyperLink ID="m_pagingFirst" runat="server"><<</asp:HyperLink>
	    <asp:HyperLink ID="m_pagingPrevious" runat="server"><</asp:HyperLink>
	    <asp:PlaceHolder runat="server" ID="m_pagingInformation" />
	    <asp:HyperLink runat="server" ID="m_pagingNext">></asp:HyperLink>
	    <asp:HyperLink ID="m_pagingLast" runat="server">>></asp:HyperLink>
	</div>