<%@ Page Language="C#" AutoEventWireup="false" Inherits="App_Code.Site.CMS.Templates.BaseTemplate" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">

	<h1><web:Text Name="Title" runat="server" /></h1>

	<web:Image Name="Image1" CssClass="main" MaxWidth="460" runat="server" />

	<web:ValueExists Name="Introduction" runat="server">
		<OnTrue>
			<p class="intro"><web:Text Name="Introduction" runat="server" /></p>
		</OnTrue>
	</web:ValueExists>

	<web:Text Name="Text1" runat="server" />

    <site:LinkList runat="server" />
    <site:FileList runat="server" />

</asp:Content>