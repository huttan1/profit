<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_WebUserControls_PropertyViewControl, Litum.Studio.Web" %>
<div>
	<asp:HiddenField runat="server" ID="templateFieldId" Visible="false" />
	<asp:HiddenField runat="server" ID="languageId" Visible="false" />
	<asp:Label runat="server" ID="label" Visible="false" />
	<asp:Image ID="fileImage" runat="server" Visible="false" Style="vertical-align: middle;
		margin-top: 4px;" />
	<asp:HyperLink runat="server" ID="fileLink" Visible="false" Style="margin-top: 4px;" /><asp:Label
		runat="server" ID="fileText" Visible="false" />
</div>

