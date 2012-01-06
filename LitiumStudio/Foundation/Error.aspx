<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/LitiumStudio.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_Error, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/Framework/LitiumStudio.master" %>
<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioTopMenu" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="c_toolbar" runat="server">
		<Toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif"
			ID="c_toolbarItemBack" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../images/transparent.gif" style="vertical-align: middle;" class="litIconError"
		alt="" />&nbsp;<Foundation:SystemString Name="ErrorPageTitle" runat="server" ID="Systemstring1" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="LitiumStudioContent" runat="Server">
	<div class="lsContentScroll"> 
		<div class="litBoldText"><%=System.DateTime.Now%></div>
		<br />
		<asp:Label runat="server" ID="c_labelErrorTitle" />
		<br />
		<asp:Label runat="server" ID="c_labelErrorText" CssClass="litText" />
	</div>

	<script type="text/javascript">
		var submitObject = null;
		var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemBack.ClientID.ToString()); %>");
		document.onkeypress = function(e) { var key = (window.event) ? window.event.keyCode : e.keyCode; if (key == 27) simulateClick(cancelObject); else if (key == 13) simulateClick(submitObject); }
	</script>

</asp:Content>
