<%@ page language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_CreateFolder1, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/MediaArchive/Framework/Base.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <Toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbarCreate" runat="server" >
	    <Toolbar:ToolbarItem OnClick="ToolbarItemCreateAbort_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
	        Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop"
	        SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemCreateAbort" runat="server"/>	
	    <Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
	    <Toolbar:ToolbarItem OnClick="ToolbarItemCreateNext_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
	        Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight"
	        SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemCreateNext"
	        runat="server"/>	
    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">    
    <Foundation:ModuleString ID="ModuleString1" Name="CreateFolderPageSubHeader" Runat="server"/> <span style="font-weight:normal;">(<Foundation:ModuleString ID="ModuleString4" Name="CreateFolderPage1SubHeader1" runat="Server"/>)</span>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <table border="0" cellspacing="0" cellpadding="0">
	        <tr>
		        <td colspan="2" class="litText"><b><Foundation:ModuleString Name="Name" runat="server" ID="Modulestring5"/>:</b></td>
	        </tr>
	        <tr>
		        <td><asp:TextBox CssClass="litInputText200" ID="mc_textboxFolderName" Runat="server" TabIndex="0"></asp:TextBox></td>
		        <td style="padding-left:10px;" class="litErrorMsg"><asp:RequiredFieldValidator ID="mc_validatorRequiredFolderName" ControlToValidate="mc_textBoxFolderName" Runat="server" Display="Dynamic"><img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" /><Foundation:ModuleString Name="RequiredField" runat="server" ID="Systemstring1"/></asp:RequiredFieldValidator><asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorFolderName" ControlToValidate="mc_textBoxFolderName" ValidationExpression="[^<>\']*"><img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" /><Foundation:ModuleString Name="MessageMaliciousInput" runat="server" ID="Modulestring6"/></asp:RegularExpressionValidator></td>
	        </tr>
        </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(mc_textboxFolderName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemCreateNext.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(mc_toolbarItemCreateAbort.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>