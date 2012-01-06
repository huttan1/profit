<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_ModuleShow, Litum.Studio.Web" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
        <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		    <toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemBack" runat="server"/>
		    <toolbar:DividerItem ID="DividerItem1" ImageURL="../images/transparent.gif" Class="litToolbarDivider" runat="server" />
		    <toolbar:ToolbarItem OnClick="ToolbarItemEdit_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemEdit" runat="server"/>
		    <toolbar:ToolbarItem OnClick="ToolbarItemDelete_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemDelete" runat="server"/>
	    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconModules" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
	    <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td style="padding-bottom:5px;" class="litBoldText"><Foundation:SystemString ID="SystemString3" Name="AssemblyName" runat="server" />:</td>
			    <td style="padding-bottom:5px;padding-left:10px;" class="litText"><asp:Label runat="server" id="c_labelAssemblyName"/></td>
		    </tr>
		    <tr>
			    <td style="padding-bottom:5px;" class="litBoldText"><Foundation:SystemString ID="SystemString4" Name="ClassName" runat="server" />:</td>
			    <td style="padding-bottom:5px;padding-left:10px;" class="litText"><asp:Label runat="server" id="c_labelClassName"/></td>
		    </tr>
		    <tr>
			    <td style="padding-bottom:5px;" class="litBoldText"><Foundation:SystemString ID="SystemString5" Name="Version" runat="server" />:</td>
			    <td style="padding-bottom:5px; padding-left:10px;" class="litText"><asp:Label runat="server" id="c_labelVersion"/></td>
		    </tr>
		    <tr>
			    <td style="padding-bottom:5px;" class="litBoldText"><Foundation:SystemString ID="SystemString6" Name="LargeIconPath" runat="server" />:</td>
			    <td style="padding-bottom:5px;padding-left:10px;" class="litText"><asp:Label runat="server" id="c_labelLargeIconPath"/></td>
		    </tr>
		    <tr>
			    <td style="padding-bottom:5px;" class="litBoldText"><Foundation:SystemString ID="SystemString13" Name="MediumIconPath" runat="server" />:</td>
			    <td style="padding-bottom:5px;padding-left:10px;" class="litText"><asp:Label runat="server" id="c_labelMediumIconPath"/></td>
		    </tr>
		    <tr>
			    <td style="padding-bottom:5px;" class="litBoldText"><Foundation:SystemString ID="SystemString7" Name="SmallIconPath" runat="server" />:</td>
			    <td style="padding-bottom:5px;padding-left:10px;" class="litText"><asp:Label runat="server" id="c_labelSmallIconPath"/></td>
		    </tr>
		    <tr>
			    <td style="padding-bottom:5px;" class="litBoldText"><Foundation:SystemString ID="SystemString8" Name="StartPagePath" runat="server" />:</td>
			    <td style="padding-bottom:5px;padding-left:10px;" class="litText"><asp:Label runat="server" id="c_labelStartPagePath"/></td>
		    </tr>
		    <tr>
			    <td style="padding-bottom:5px;" class="litBoldText"><Foundation:SystemString ID="SystemString9" Name="SettingsPagePath" runat="server" />:</td>
			    <td style="padding-bottom:5px;padding-left:10px;" class="litText"><asp:Label runat="server" id="c_labelSettingsPagePath"/></td>
		    </tr>
		    <tr>
			    <td style="padding-bottom:5px;" class="litBoldText"><Foundation:SystemString ID="SystemString10" Name="ErrorPagePath" runat="server" />:</td>
			    <td style="padding-bottom:5px;padding-left:10px;" class="litText"><asp:Label runat="server" id="c_labelErrorPagePath"/></td>
		    </tr>
	    </table><br />
	    <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td><fieldset><legend class="litBoldText"><Foundation:SystemString ID="SystemString11" Name="GroupPermissions" runat="server"/>:</legend><img src="../images/transparent.gif" width="10" alt="" /><br />
				    <table border="0" cellspacing="0" cellpadding="0">
					    <tr>
						    <td valign="top"><asp:ListBox Runat="server" ID="c_listBoxGroup" Rows="10" AutoPostBack="True" OnSelectedIndexChanged="SelectGroup_Changed" CssClass="litInputSelect"/></td>
						    <td valign="top" style="padding-left:10px;"><asp:Label runat="server" id="c_labelGroupPermissions" CssClass="litText"/></td>
					    </tr>
				    </table>
			    </fieldset></td>
		    </tr>
	    </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_listBoxGroup.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemEdit.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemBack.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>