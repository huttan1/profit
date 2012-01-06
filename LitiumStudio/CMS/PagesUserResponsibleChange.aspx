<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesUserResponsibleChange, Litum.Studio.Web" %>

<%@ Register TagPrefix="CMS" TagName="PageResponsibilityChange" Src="~/LitiumStudio/CMS/WebUserControls/PageResponsibilityChange.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <Toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarEdit" runat="server" >
		<Toolbar:ToolbarItem OnClick="ToolbarItemResponsibleAbort_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
		    Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
		    ImageURL="Images/transparent.gif" ID="c_toolbarItemResponsibleAbort" runat="server"/>	
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace"
		    runat="server" ID="Divideritem2"/>
		<Toolbar:ToolbarItem OnClick="ToolbarItemResponsibleSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
		    Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected"
		    ImageURL="Images/transparent.gif" ID="c_toolbarItemResponsibleSave" runat="server"/>	
    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<Foundation:ModuleString ID="ModuleString16" name="ResponsibleHeaderChange" runat="server" /> <Foundation:ModuleString ID="ModuleString3" name="PageResponsible" runat="Server" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentNoScroll">        
		<CMS:PageResponsibilityChange runat="server" ID="c_responsibilityChange" />
    </div>
    <script type="text/javascript">
        var focusObject = null
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemResponsibleSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemResponsibleAbort.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>