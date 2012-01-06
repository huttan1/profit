<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_ModuleImport, Litum.Studio.Web" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
        <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>		    
		    <toolbar:ToolbarItem OnClick="ToolbarItemImport_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconImport2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemImport" runat="server"/>	
	    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconModules" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <span class="litText"><Foundation:SystemString ID="SystemString4" Name="ModuleImportPage1Description1" runat="server"/><br /><br /><Foundation:SystemString ID="SystemString5" Name="ModuleImportPage1Description2" runat="server"/><br /><br /></span>
	    <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td style="padding:2px;"><input class="litInputFile" id="c_inputFileModule" type="file" size="63" runat="server" /></td>
		    </tr>
	    </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_inputFileModule.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemImport.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>