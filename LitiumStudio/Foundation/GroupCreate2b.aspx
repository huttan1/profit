<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_GroupCreate2b, Litum.Studio.Web" %>

<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
<img src="../Images/transparent.gif" alt="" class="litIconFoundationGroups" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
        <Toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		    <Toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>		    
		    <Toolbar:ToolbarItem OnClick="ToolbarItemPrevious_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemPrevious" runat="server"/>		    
		    <Toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemNext" runat="server"/>	
	    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <span class="litText"><Foundation:SystemString ID="SystemString4" Name="GroupCreatePage2bDescription1" runat="server"/><br /><br /></span>
	    <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td colspan="2" class="litBoldText"><asp:Label runat="server" ID="c_labelGroupName" AssociatedControlID="c_textBoxGroupName"><Foundation:SystemString ID="SystemString5" Name="Path" runat="server"/></asp:Label><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</td>
		    </tr>
		    <tr>
			    <td><asp:TextBox cssclass="litInputText" id="c_textBoxGroupName" runat="server"/></td>
			    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorGroupName" runat="server" ControlToValidate="c_textBoxGroupName" OnServerValidate="ValidateGroupName" cssClass="error"/></td>
		    </tr>
	    </table><br />
	    <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td colspan="2" class="litBoldText"><asp:Label runat="server" ID="c_labelVerifyUserName" AssociatedControlID="c_textBoxVerifyUserName"><Foundation:SystemString ID="SystemString6" Name="VerifyingUserName" runat="server"/></asp:Label><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</td>
		    </tr>
		    <tr>
			    <td><asp:TextBox cssclass="litInputText" id="c_textBoxVerifyUserName" runat="server"/></td>
			    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorVerifyUserName" runat="server" ControlToValidate="c_textBoxVerifyUserName" OnServerValidate="ValidateVerifyUserName" cssClass="error"/></td>
		    </tr>
	    </table><br />
	    <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td colspan="2" class="litBoldText"><asp:Label runat="server" ID="c_labelVerifyPassword" AssociatedControlID="c_textBoxVerifyPassword"><Foundation:SystemString ID="SystemString7" Name="VerifyingPassword" runat="server"/></asp:Label><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</td>
		    </tr>
		    <tr>
			    <td><asp:TextBox TextMode="Password" cssclass="litInputText" id="c_textBoxVerifyPassword" runat="server"/></td>
			    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorVerifyPassword" runat="server" ControlToValidate="c_textBoxVerifyPassword" OnServerValidate="ValidateVerifyPassword" cssClass="error"/></td>
		    </tr>
	    </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_textBoxGroupName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemNext.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>