<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_CMS_WebUserControls_StatusAreaInfo, Litum.Studio.Web" %>
<asp:PlaceHolder ID="c_placeHolderWorkingCopyAndLocked" runat="server">
	<div class="litPageStatus" runat="server" id="c_titleWorkingCopyAndLocked">
		<asp:Label ID="c_labelWorkingCopyAndLocked" runat="server" /></div>
</asp:PlaceHolder>
<asp:PlaceHolder ID="c_placeHolderPublished" runat="server">
	<div class="litPageStatus" runat="server" id="c_titlePublishedUnpublishing">
		<asp:Label ID="c_labelPublished" runat="server" /><asp:Label ID="c_labelScheduledUnpublishing"
			runat="server" /></div>
</asp:PlaceHolder>
<asp:PlaceHolder ID="c_placeHolderScheduledPublishing" runat="server">
	<div class="litPageStatus" runat="server" id="c_titleScheduledPublishing">
		<asp:Label ID="c_labelScheduledPublishing" runat="server" /></div>
</asp:PlaceHolder>
<asp:PlaceHolder ID="c_placeHolderScheduledRemoval" runat="server">
	<div class="litPageStatus" runat="server" id="c_titleScheduledRemoval">
		<asp:Label ID="c_labelScheduledRemoval" runat="server" /></div>
</asp:PlaceHolder>
