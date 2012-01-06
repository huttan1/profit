<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_SettingsImport, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <Toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
	    <Toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem"
	        LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
	        ImageURL="images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
	    <Toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace"
	        runat="server" />
	    <Toolbar:ToolbarItem OnClick="ToolbarItemImport_Click" DisabledClass="litToolbarItem" Class="litToolbarItem"
	        LinkClass="litToolbarLink" ImageClass="litIconImport2" SelectedClass="litToolbarItem litToolbarItemSelected"
	        ImageURL="images/transparent.gif" ID="c_toolbarItemImport" runat="server"/>	
    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
   <asp:Label runat="server" ID="c_labelTopHeader" />
</asp:Content>
 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
			<div class="litText"><Foundation:ModuleString ID="ModuleString2" Name="SettingsImportDescription1" Runat="server"/><br /><br />
			<Foundation:ModuleString ID="ModuleString3" Name="SettingsImportDescription2" Runat="server"/><br /><br /></div>
		    <div class="litBoldText"><asp:CheckBox cssclass="litInputCheckBox" id="c_checkBoxReplace" runat="server"/> <asp:Label runat="server" AssociatedControlID="c_checkBoxReplace"><Foundation:ModuleString ID="ModuleString4" Name="UpdateExistingValues" Runat="server"/></asp:Label></div>
            <br />
            <div style="float:left;"><input class="litInputFile" id="c_inputFile" type="file" size="63" runat="server" /></div>
            <div style="float:left; padding-left:10px; padding-top:2px;"><asp:RequiredFieldValidator runat="server" SetFocusOnError="true" ID="c_RequiredFieldValidatorInputFile" CssClass="litErrorMsg" ControlToValidate="c_inputFile" Display="Dynamic" /></div>
    </div>
    <script type="text/javascript">
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemImport.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
</asp:Content>