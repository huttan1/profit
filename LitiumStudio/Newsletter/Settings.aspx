<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_Newsletter_Settings, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="mc_toolbar" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemSave" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
<img src="../Images/transparent.gif" alt="" class="litIconCircular" />
    <Foundation:ModuleString ID="ModuleString7" Name="SettingsPageHeader" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
	        <table border="0" cellspacing="0" cellpadding="0" width="400">
		        <tr>
			        <td class="litBoldText"><Foundation:ModuleString Name="DefaultSenderName" runat="server" ID="Modulestring1" /></td>
		        </tr>
		        <tr>
			        <td>
			            <asp:TextBox cssclass="litInputText" id="mc_textBoxSenderName" runat="server"/>
			            <div class="litText"><Foundation:ModuleString Name="DefaultSenderNameDescription" runat="server" ID="Modulestring8" /></div>
			        </td>
		        </tr>
	        </table><br />
	        <table border="0" cellspacing="0" cellpadding="0" width="400">
		        <tr>
			        <td class="litBoldText"><Foundation:ModuleString Name="DefaultSenderEmail" runat="server" ID="Modulestring2" /></td>
		        </tr>
		        <tr>
			        <td>
			            <asp:TextBox cssclass="litInputText" id="mc_textBoxSenderEmail" runat="server"/> <asp:CustomValidator ID="mc_validatorSenderEmail" runat="server" Display="Dynamic" ControlToValidate="mc_textBoxSenderEmail" OnServerValidate="ValidateSenderEmail" CssClass="litErrorMsg" />
			            <div class="litText"><Foundation:ModuleString Name="DefaultSenderEmailDescription" runat="server" ID="Modulestring9" /></div>
			        </td>
		        </tr>
	        </table>
	        <table border="0" cellspacing="0" cellpadding="0" width="400" runat="server" id="c_pickupDirectoryHolder">
		        <tr>
			        <td class="litBoldText"><br /><Foundation:ModuleString Name="PickupDirectory" runat="server" ID="Modulestring10" /><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></td>
		        </tr>
		        <tr>
			        <td>
			            <asp:TextBox cssclass="litInputText" id="mc_textBoxPickupDirectory" runat="server"/> <asp:RequiredFieldValidator ID="mc_validatorPickupDirectory" runat="server" Display="Dynamic" ControlToValidate="mc_textBoxPickupDirectory" CssClass="litErrorMsg" />
			            <div class="litText"><Foundation:ModuleString Name="PickupDirectoryDescription" runat="server" ID="Modulestring11" /></div>
			        </td>
		        </tr>
	        </table><br />
	        <table border="0" cellspacing="0" cellpadding="0" width="400">
		        <tr>
			        <td class="litBoldText"><Foundation:ModuleString Name="ServerUrl" runat="server" ID="Modulestring12" /><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></td>
		        </tr>
		        <tr>
			        <td>
			            <asp:TextBox cssclass="litInputText" id="mc_textBoxServerUrl" runat="server"/>
			            <asp:CustomValidator ID="mc_validatorServerUrl" runat="server" Display="Dynamic" ControlToValidate="mc_textBoxServerUrl" OnServerValidate="ValidateServerURL" CssClass="litErrorMsg" />
			            <div class="litText"><Foundation:ModuleString Name="ServerUrlDescription" runat="server" ID="Modulestring13" /></div>
			        </td>
		        </tr>
	        </table><br />
	        <table border="0" cellspacing="0" cellpadding="0" width="400">
		        <tr>
			        <td class="litBoldText"><Foundation:ModuleString Name="CharacterEncoding" runat="server" ID="Modulestring3" /><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></td>
		        </tr>
		        <tr>
			        <td>
				        <asp:DropDownList ID="mc_dropDownCharacterEncoding" Runat="server" CssClass="litInputSelect" Width="400">
					        <asp:ListItem Value="ISO-8859-1">ISO-8859-1</asp:ListItem>
					        <asp:ListItem Value="UTF-8">UTF-8</asp:ListItem>
					        <asp:ListItem Value="US-ASCII">US-ASCII</asp:ListItem>
				        </asp:DropDownList>
				        <div class="litText"><Foundation:ModuleString Name="CharacterEncodingDescription" runat="server" ID="Modulestring6" /></div>
			        </td>
		        </tr>
	        </table><br />
	        <table border="0" cellspacing="0" cellpadding="0" width="400">
		        <tr>
			        <td class="litBoldText"><Foundation:ModuleString Name="TextVersion" runat="server" ID="Modulestring4" /></td>
		        </tr>
		        <tr>
			        <td>
			            <asp:TextBox cssclass="litInputText" id="mc_textBoxTextVersion" runat="server" TextMode="MultiLine" Rows="5" />
			            <div class="litText"><Foundation:ModuleString Name="TextVersionDescription" runat="server" ID="Modulestring5" /></div>
			        </td>
		        </tr>
	        </table>
	        <asp:Panel id="mc_panelOkMessage" visible="False" runat="server"> 
		        <fieldset class="litOkFieldset"><legend class="litOkFieldsetMsg"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconOk" alt="" /><b><Foundation:SystemString Name="Ok" runat="server" ID="Systemstring4"/></b></legend><img src="images/transparent.gif" width="5" alt="" /><br />
			        <asp:Label id="mc_labelOkMessage" runat="server" />
		        </fieldset>
	        </asp:Panel>
     </div>
     <script type="text/javascript">
        var disableSubmitObject = document.getElementById("<% Response.Write(mc_textBoxTextVersion.ClientID.ToString()); %>")
        var focusObject = document.getElementById("<% Response.Write(mc_textBoxSenderName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = null;
        document.onkeypress = function(e){var srcElmnt=(window.event)?window.event.srcElement:e.target; var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13 && srcElmnt!=disableSubmitObject) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>