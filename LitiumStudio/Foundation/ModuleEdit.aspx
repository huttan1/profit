<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_ModuleEdit1, Litum.Studio.Web" %>

<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls"  Assembly="Litium.Studio.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
        <Toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		    <Toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem"
		        LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
		        ImageURL="../images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
		    <Toolbar:DividerItem ID="DividerItem1" ImageURL="../images/transparent.gif" Class="litToolbarSpace" runat="server" />
		    <Toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem" Class="litToolbarItem"
		        LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected"
		        ImageURL="../images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>	
	    </Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconModules" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentTabScroll">
        <LS:TabContainer runat="server" ID="m_tab" />
    </div>
    <script type="text/javascript">     
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>