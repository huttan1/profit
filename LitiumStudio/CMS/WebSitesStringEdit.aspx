<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_CMS_WebSitesStringEdit, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<%@ Register TagPrefix="Pages" Namespace="Litium.Studio.UI.CMS.Pages.WebControls" Assembly="Litium.Studio.UI"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
        <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
        <toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
        <toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<asp:Label ID="c_labelWebSiteStringName" Runat="server"/>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">   
        <div class="lsContentScroll">
            <table border="0" cellspacing="0" cellpadding="0">
		        <tr>
			        <td colspan="2" class="litBoldText"><Foundation:ModuleString ID="ModuleString2" Name="WebSiteStringName" runat="server" /><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</td>
		        </tr>
		        <tr>
			        <td><asp:TextBox cssclass="litInputText200" id="c_textBoxWebSiteStringName" runat="server"/></td>
			        <td style="padding-left:10px;"><Pages:LitCustomValidator ID="c_validatorWebSiteStringName" runat="server" ControlToValidate="c_textBoxWebSiteStringName" OnServerValidate="ValidateWebSiteStringName" cssClass="litErrorMsg"/></td>
		        </tr>
	        </table><br />
	        <table border="0" cellspacing="0" cellpadding="0">
		        <tr>
			        <td colspan="2" class="litBoldText"><Foundation:ModuleString Name="WebSiteString" runat="server" ID="Systemstring3"/>:</td>
		        </tr>
		        <tr>
			        <td><asp:TextBox cssclass="litInputText" id="c_textBoxWebSiteStringValue" runat="server"/></td>
			        <td style="padding-left:10px;"><Pages:LitCustomValidator ID="c_validatorWebSiteStringValue" runat="server" ControlToValidate="c_textBoxWebSiteStringValue" OnServerValidate="ValidateWebSiteStringValue" cssClass="litErrorMsg"/></td>
		        </tr>
	        </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_textBoxWebSiteStringName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>