<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PageTypesTemplateEdit, Litum.Studio.Web" %>
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
	<img src="../Images/transparent.gif" alt="" class="litIconTemplate" />
	<asp:Label ID="c_labelTemplateName" Runat="server"/>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
        <div class="lsContentScroll">
		    <table border="0" cellspacing="0" cellpadding="0">
		        <tr>
			        <td colspan="2" class="litBoldText"><Foundation:ModuleString ID="ModuleString1" Name="TemplateName" runat="server" />:</td>
		        </tr>
		        <tr>
			        <td><asp:TextBox cssclass="litInputText200" id="c_textBoxTemplateName" runat="server"/></td>
			        <td style="padding-left:10px;"><Pages:LitCustomValidator ID="c_validatorTemplateName" runat="server" ControlToValidate="c_textBoxTemplateName" OnServerValidate="ValidateTemplateName" cssClass="litErrorMsg"/></td>
		        </tr>
	        </table><br />
	        <table border="0" cellspacing="0" cellpadding="0">
		        <tr>
			        <td colspan="2"><span class="litBoldText"><Foundation:ModuleString Name="TemplateFileName" runat="server" ID="Systemstring3"/>:</span> <span class=litText><Foundation:ModuleString Name="TemplateFileNameTip" runat="server" ID="ModuleString2"/></span></td>
		        </tr>
		        <tr>
			        <td><asp:TextBox cssclass="litInputText" id="c_textBoxTemplateFileName" runat="server"/></td>
			        <td style="padding-left:10px;"><Pages:LitCustomValidator ID="c_validatorTemplateFileName" runat="server" ControlToValidate="c_textBoxTemplateFileName" OnServerValidate="ValidateTemplateFileName" cssClass="litErrorMsg"/></td>
		        </tr>
	        </table><br />
	        <table border="0" cellspacing="0" cellpadding="0">
		        <tr>
			        <td colspan="2" ><span class="litBoldText"><Foundation:ModuleString Name="TemplateThumbnailUrl" runat="server" ID="Systemstring1"/>:</span> <span class=litText><Foundation:ModuleString Name="TemplateThumbnailUrlTip" runat="server" ID="ModuleString3"/></span></td>
		        </tr>
		        <tr>
			        <td><asp:TextBox cssclass="litInputText" id="c_textBoxTemplateThumbnailUrl" runat="server"/></td>
			        <td style="padding-left:10px;"><Pages:LitCustomValidator ID="c_validatorTemplateThumbnailUrl" runat="server" ControlToValidate="c_textBoxTemplateThumbnailUrl" OnServerValidate="ValidateTemplateThumbnailUrl" cssClass="litErrorMsg"/></td>
		        </tr>
	        </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_textBoxTemplateName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>