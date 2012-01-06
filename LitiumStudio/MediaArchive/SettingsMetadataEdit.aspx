<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_SettingsMetadataEdit, Litum.Studio.Web" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="mc_toolbar" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemCancel" runat="server"/>	
	    <toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemSave" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
    <asp:Label ID="mc_labelMetaDataName" Runat="server"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
        <div class="lsContentScroll">
	        <table border="0" cellspacing="0" cellpadding="0">
		        <tr>
			        <td colspan="2" class="litBoldText"><Foundation:ModuleString Name="Metadata" runat="server" ID="Systemstring4"/>:</td>
		        </tr>
		        <tr>
			        <td><asp:TextBox cssclass="litInputText200" id="mc_textBoxMetaDataName" runat="server"/></td>
			        <td><asp:RequiredFieldValidator ID="c_validatorName" ControlToValidate = "mc_textBoxMetaDataName" runat="server" Display = "Dynamic">
                        <img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" />
				        <Foundation:ModuleString Name="RequiredField" runat="server" ID="ModuleString1"/>
                    </asp:RequiredFieldValidator></td>
			        <td style="padding-left:10px;" class="litErrorMsg"><asp:CustomValidator ID="mc_validatorMetaDataName" runat="server" ControlToValidate="mc_textBoxMetaDataName" OnServerValidate="ValidateMetaDataName" cssClass="error"/></td>
		        </tr>
	        </table><br />
        </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(mc_textBoxMetaDataName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(mc_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>