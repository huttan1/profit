<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_SystemStringEdit1, Litum.Studio.Web" %>

<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls"  Assembly="Litium.Studio.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
        <Toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		    <Toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem"
		        LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
		        ImageURL="../images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
		    <Toolbar:DividerItem ID="DividerItem1" ImageURL="../images/transparent.gif" Class="litToolbarSpace" runat="server" />
		    <Toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem" Class="litToolbarItem"
		        LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected"
		        ImageURL="../../LitiumStudio/Images/transparent.gif" ID="c_toolbarItemNext" runat="server"/>	
	    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconMessages" />&nbsp; <Foundation:SystemString Name="SystemStringEdit" runat="server" ID="Systemstring12"/> "<asp:Label ID="c_labelSystemStringName" Runat="server"/>"
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <!--Modulikon-->
    <div class="lsContentScroll">
            <table border="0" cellspacing="0" cellpadding="0">
			    <tr>
				    <td colspan="2" class="litBoldText"><Foundation:SystemString Name="SelectLanguage" runat="server" ID="Systemstring2"/>:</td>
			    </tr>
			    <tr>
				    <td><asp:DropDownList cssclass="litInputSelect" OnSelectedIndexChanged="SelectLanguage_Changed" AutoPostBack="True" id="c_dropDownListLanguage" runat="server"/></td>
				    <td style="padding-left:10px;" class="litErrorMsg"></td>
			    </tr>
		    </table><br />
		    <table border="0" cellspacing="0" cellpadding="0">
			    <tr>
				    <td colspan="2" class="litBoldText"><Foundation:SystemString Name="SystemStringName" runat="server" ID="Systemstring3"/><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</td>
			    </tr>
			    <tr>
				    <td><asp:TextBox cssclass="litInputText200" id="c_textBoxSystemStringName" runat="server"/></td>
				    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorSystemStringName" runat="server" ControlToValidate="c_textBoxSystemStringName" OnServerValidate="ValidateSystemStringName" cssClass="error"/></td>
			    </tr>
		    </table><br />
		    <table border="0" cellspacing="0" cellpadding="0">
			    <tr>
				    <td colspan="2" class="litBoldText"><Foundation:SystemString Name="SystemString" runat="server" ID="Systemstring4"/>:</td>
			    </tr>
			    <tr>
				    <td><asp:TextBox cssclass="litInputText" id="c_textBoxSystemStringValue" runat="server"/></td>
				    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorSystemStringValue" runat="server" ControlToValidate="c_textBoxSystemStringValue" OnServerValidate="ValidateSystemStringValue" cssClass="error"/></td>
			    </tr>
		    </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_textBoxSystemStringName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemNext.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>