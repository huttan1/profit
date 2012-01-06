<%@ page language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_CreateImage3, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/MediaArchive/Framework/Base.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <Toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbarRight" runat="server" >
	    <Toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
	        Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
	        ImageURL="Images/transparent.gif" ID="mc_toolbarItemCancel" runat="server"/>
	    <Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
	    <Toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
	        LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected"
	        ImageURL="Images/transparent.gif" ID="mc_toolbarItemBack" runat="server"/>
	    <Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem1"/>
	    <Toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
	        LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected"
	        ImageURL="Images/transparent.gif" ID="mc_toolbarItemNext" runat="server"/>
    </Toolbar:HorizontalToolbar>
</asp:Content>


<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">     
     <Foundation:ModuleString ID="ModuleString4" Name="CreateImagePageSubHeader" Runat="server"/> <span style="font-weight:normal;">(<Foundation:ModuleString ID="ModuleString8" Name="CreateImagePage3SubHeader1" runat="Server"/>)</span>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <span class="litText"><Foundation:ModuleString Name="CreateImagePage3Description1" runat="server" ID="Modulestring1"/><br /><br /></span>
        <table border="0" cellspacing="0" cellpadding="0" ID="Table1">
	        <tr>
		        <td valign="top">
			        <asp:ListBox AutoPostBack="True" Rows="5" CssClass="litInputSelect" ID="mc_dropdownAvailableImages" Runat="server" OnSelectedIndexChanged="mc_dropdownAvailableImages_SelectedIndexChanged" />
		        </td>
		        <td valign="top" style="padding-left:10px;">
		            <asp:Panel runat="server" ID="c_panelCreate" Visible="false"><asp:LinkButton CssClass="litText" runat="server" ID="c_linkCreate" OnClick="c_linkCreate_Click"><Foundation:ModuleString Name="MetaDataCreatePageSubHeader1" runat="server" /></asp:LinkButton></asp:Panel>
			        <asp:Repeater Runat="server" ID="mc_repeaterMetadataValues" OnItemDataBound="mc_repeaterMetadataValues_ItemDataBound" OnItemCommand="mc_repeaterMetadataValues_ItemCommand">
				        <ItemTemplate>
					        <table border="0" cellspacing="0" cellpadding="0">
						        <tr>
							        <td colspan="3" class="litText"><b><asp:Label Runat="server" id="mc_labelKeyName" />:</b></td>
						        </tr>
						        <tr>
							        <td valign="top"><asp:panel id="panelMetadataKeyName" runat="server" Visible="False"><asp:RequiredFieldValidator runat="server" id="validator1" ControlToValidate="mc_textBoxMetadataKeyName" Display="Dynamic" CssClass="litErrorMsg"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString Name="RequiredField" runat="server" ID="Modulestring2"/><br /></asp:RequiredFieldValidator><asp:CustomValidator ControlToValidate="mc_textBoxMetadataKeyName" runat="server" id="mc_validatorDuplicateKeys" Display="Dynamic" CssClass="litErrorMsg" onServerValidate="mc_validatorDuplicateKeys_ServerValidate"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString Name="ErrorDuplicateKey" runat="server" ID="Modulestring16"/><br /></asp:CustomValidator><asp:TextBox CssClass="litInputText200" id="mc_textBoxMetadataKeyName" runat="server" /><span class="litBoldText"><br /><Foundation:ModuleString ID="ModuleString3" Name="NewMetadataValue" runat="server" />:</span></asp:Panel><asp:TextBox CssClass="litInputText200" ID="mc_textBoxMetadataValue" Runat="server"></asp:TextBox></td>
							        <td style="width:16px;" valign="top">
								        <asp:panel id="panelMetadataKeyRemove" CssClass="litBlankAddDelete" runat="server"><asp:ImageButton id="mc_imageButtonMetadataKeyRemove" src="Images/transparent.gif" align="AbsMiddle" border="0" cssclass="litIconDelete" runat="server" CommandName="remove" CausesValidation="false" /></asp:Panel>
							        </td>
							        <td style="width:16px;" valign="top">
								        <asp:panel id="panelMetadataKeyAdd" CssClass="litBlankAddDelete" runat="server" Visible="False"><asp:ImageButton id="mc_imageButtonMetadataKeyAdd" src="Images/transparent.gif" align="AbsMiddle" border="0" cssclass="litIconAdd" runat="server" CommandName="add" /></asp:Panel>
							        </td>
						        </tr>
						        <tr>
							        <td colspan="3" style="padding-left:2px;" class="litErrorMsg"><asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorMetadataValue" ControlToValidate="mc_textBoxMetadataValue" ValidationExpression="[^<>\']*" ><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString Name="MessageMaliciousInput" runat="server" ID="Modulestring6"/></asp:RegularExpressionValidator></td>										
						        </tr>
					        </table><br />
				        </ItemTemplate>
			        </asp:Repeater>
		        </td>
	        </tr>
        </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(mc_dropdownAvailableImages.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemNext.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(mc_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>