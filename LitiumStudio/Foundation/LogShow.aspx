<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_LogShow, Litum.Studio.Web" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
        <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		    <toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemBack" runat="server"/>
	    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconMainLog" /><Foundation:SystemString Name="LogView" runat="server" ID="Systemstring7"/> "<asp:Label runat="server" id="c_labelLogTitle"/>"
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
	    <span class="litBoldText"><Foundation:SystemString ID="SystemString6" Name="Date" runat="server"/>: </span><asp:Label runat="server" id="c_labelLogDate" CssClass="litText" /><br /><div style="height:5px;"></div>
	    <span class="litBoldText"><Foundation:SystemString ID="SystemString4" Name="Level" runat="server"/>: </span><asp:Label runat="server" id="c_labelLogLevel" CssClass="litText"/><br /><div style="height:5px;"></div>
        <span class="litBoldText"><Foundation:SystemString ID="SystemString3"  Name="WebServer" runat="server"/>: </span><asp:Label runat="server" id="c_labelServer" CssClass="litText"/><br />
	    <span class="litBoldText"><Foundation:SystemString ID="SystemString5" Name="Event" runat="server"/>: </span><asp:Label runat="server" id="c_labelLogText" CssClass="litText"/><br />
    </div>
    <script type="text/javascript">
        var submitObject = null;
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemBack.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
</asp:Content>