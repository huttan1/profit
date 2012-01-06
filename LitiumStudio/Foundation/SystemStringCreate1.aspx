<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_SystemStringCreate1, Litum.Studio.Web" %>

<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
        <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
		    <toolbar:DividerItem ID="DividerItem1" ImageURL="../images/transparent.gif" Class="litToolbarSpace" runat="server" />
		    <toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>	
	    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../images/icons_modules/main_sysmess_24px.png" width="24" height="24" style="vertical-align:middle;" alt="" /><Foundation:SystemString ID="SystemString2" Name="SystemStringCreatePageSubHeader1" runat="server" /><span class="litContentTopGuide">&nbsp;(<Foundation:SystemString Name="SystemStringCreatePageSubHeader2" runat="server" ID="Systemstring3"/>)</span>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <!--Innehåll-->
    <div class="lsContentScroll">
		    <table border="0" cellspacing="0" cellpadding="0">
			    <tr>
				    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString4" Name="SelectLanguage" runat="server" />:</td>
			    </tr>
			    <tr>
				    <td><asp:DropDownList cssclass="litInputSelect" OnSelectedIndexChanged="SelectLanguage_Changed" AutoPostBack="True" id="c_dropDownListLanguage" runat="server"/></td>
				    <td style="padding-left:10px;" class="litErrorMsg"></td>
			    </tr>
		    </table><br />
		    <table border="0" cellspacing="0" cellpadding="0">
			    <tr>
				    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString5" Name="SystemStringName" runat="server" /><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</td>
			    </tr>
			    <tr>
				    <td><asp:TextBox cssclass="litInputText200" id="c_textBoxSystemStringName" runat="server"/></td>
				    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorSystemStringName" runat="server" ControlToValidate="c_textBoxSystemStringName" OnServerValidate="ValidateSystemStringName" cssClass="error"/></td>
			    </tr>
		    </table><br />
		    <table border="0" cellspacing="0" cellpadding="0">
			    <tr>
				    <td colspan="2" class="litBoldText"><Foundation:SystemString Name="SystemString" runat="server" ID="Systemstring6"/>:</td>
			    </tr>
			    <tr>
				    <td><asp:TextBox cssclass="litInputText" id="c_textBoxSystemStringValue" runat="server"/></td>
				    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorSystemStringValue" runat="server" ControlToValidate="c_textBoxSystemStringValue" OnServerValidate="ValidateSystemStringValue" cssClass="error"/></td>
			    </tr>
		    </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_textBoxSystemStringName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>