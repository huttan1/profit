<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_GroupCreate2a, Litum.Studio.Web" %>

<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
<img src="../Images/transparent.gif" alt="" class="litIconFoundationGroups" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
           <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
		    <toolbar:DividerItem ID="DividerItem1" ImageURL="../images/transparent.gif" Class="litToolbarSpace" runat="server" />
		    <toolbar:ToolbarItem OnClick="ToolbarItemPrevious_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemPrevious" runat="server"/>	
		    <toolbar:DividerItem ID="DividerItem2" ImageURL="../images/transparent.gif" Class="litToolbarSpace" runat="server" />
		    <toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemNext" runat="server"/>	
	    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">            
            <span class="litText"><Foundation:SystemString ID="SystemString4" Name="GroupCreatePage2aDescription1" runat="server"/><br /><br /></span>
            <table border="0" cellspacing="0" cellpadding="0">
			    <tr>
				    <td colspan="2" class="litBoldText"><asp:Label runat="server" ID="c_labelGroupName" AssociatedControlID="c_textBoxGroupName"><Foundation:SystemString ID="SystemString5" Name="GroupName" runat="server"/></asp:Label><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</td>
			    </tr>
			    <tr>
				    <td><asp:TextBox cssclass="litInputText200" id="c_textBoxGroupName" runat="server"/></td>
				    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorGroupName" runat="server" ControlToValidate="c_textBoxGroupName" OnServerValidate="ValidateGroupName" cssClass="error"/></td>
			    </tr>
		    </table><br />
		    <table border="0" cellspacing="0" cellpadding="0">
			    <tr>
				    <td colspan="2" class="litBoldText"><asp:Label runat="server" ID="c_labelGroupDisplayName" AssociatedControlID="c_textBoxGroupDisplayName"><Foundation:SystemString ID="SystemString6" Name="Description" runat="server"/></asp:Label>:</td>
			    </tr>
			    <tr>
				    <td><asp:TextBox cssclass="litInputTextArea" id="c_textBoxGroupDisplayName" Rows="5" TextMode="MultiLine" runat="server"/></td>
				    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorGroupDisplayName" runat="server" ControlToValidate="c_textBoxGroupDisplayName" OnServerValidate="ValidateGroupDisplayName" cssClass="error"/></td>
			    </tr>
		    </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_textBoxGroupName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemNext.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e) { var key = (window.event) ? window.event.keyCode : e.keyCode; if (key == 27) simulateClick(cancelObject); else if (key == 13) simulateClick(submitObject); }
        if (focusObject && !focusObject.disabled) { focusObject.focus(); }
    </script>
</asp:Content>