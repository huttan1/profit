<%@ page language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_CreateVersion1, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/MediaArchive/Framework/Base.master" %>


<%@ Register TagPrefix="MediaArchive" Namespace="Litium.Studio.UI.MediaArchive.WebControls" Assembly="Litium.Studio.UI"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbarRight" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemCancel" runat="server"/>
	    <toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
	    <toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemNext" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">     
        <Foundation:ModuleString ID="ModuleString1" Name="CreateVersionPageSubHeader" Runat="server"/> <span style="font-weight:normal;">(<Foundation:ModuleString ID="ModuleString10" Name="CreateVersionPage1SubHeader1" runat="Server"/>)</span>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <table border="0" cellspacing="0" cellpadding="0">
	        <tr>
		        <td colspan="2" align="center" valign="top" class="litText" style="padding-right:10px; width:104px; height:94px;"><MediaArchive:File MaxHeight="94" MaxWidth="94" runat="Server" id="mc_controlImage" CssClass="litImageBorder" UseStaticThumbnail="true"></MediaArchive:File><br /><b><MediaArchive:FileName runat="server" id="mc_controlImageFileName" /></b></td>
	        </tr>
        </table><br />
        <table border="0" cellspacing="0" cellpadding="0">
	        <tr>
		        <td colspan="2" class="litText"><b><Foundation:ModuleString Name="Name" runat="server" ID="Modulestring5"/>:</b></td>
	        </tr>
	        <tr>
		        <td valign="top"><asp:TextBox ID="mc_textBoxVersionName" Runat="server" CssClass="litInputText200" /></td>
		        <td style="padding-left:10px;" class="litErrorMsg"><asp:RequiredFieldValidator Runat="server" ID="mc_validatorRequiredName" Display="Dynamic" ControlToValidate="mc_textBoxVersionName"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString Name="RequiredField" runat="server" ID="Systemstring1"/></asp:RequiredFieldValidator><asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorVersionName" ControlToValidate="mc_textBoxVersionName" ValidationExpression="[^<>\']*" ><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString Name="MessageMaliciousInput" runat="server" ID="Modulestring6"/></asp:RegularExpressionValidator></td>
	        </tr>
        </table><br />
        <table border="0" cellspacing="0" cellpadding="0" ID="Table2">
	        <tr>
		        <td colspan="2" class="litText"><b><Foundation:ModuleString Name="CreateVersionPage1Description5" runat="server" ID="Modulestring9"/></b></td>
	        </tr>
	        <tr>
		        <td class="litText">
			        <asp:RadioButton CssClass="litInputRadio" GroupName="VersionType" Runat="server" Value="1" ID="mc_radioType1" Checked="true" />&nbsp;<Foundation:ModuleString Name="CreateVersionPage1Description3" runat="server" ID="Modulestring7"/><br />
			        <asp:RadioButton CssClass="litInputRadio" GroupName="VersionType" Runat="server" Value="2" ID="mc_radioType2" />&nbsp;<Foundation:ModuleString Name="CreateVersionPage1Description4" runat="server" ID="Modulestring8"/>
		        </td>
	        </tr>
        </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(mc_textBoxVersionName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemNext.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(mc_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>