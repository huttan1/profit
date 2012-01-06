<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" enableeventvalidation="false" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesCreate1, Litum.Studio.Web" validaterequest="false" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarCreate" runat="server" >
		<toolbar:ToolbarItem OnClick="ToolbarItemCreateAbort_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateAbort" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem1" Visible="false"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemCreatePrevious_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreatePrevious" runat="server" Visible="false"/>
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemCreateNext_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateNext" runat="server"/>	
		<toolbar:ToolbarItem OnClick="ToolbarItemCreateSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateSave" runat="server"/>	
		<toolbar:ToolbarItem OnClick="ToolbarItemCreateSaveAndEdit_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateSaveAndEdit" runat="server"/>	
	</toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" alt="" class="litIconDocumentAdd2" />
	<Foundation:ModuleString ID="ModuleString1" Name="CreatePageHeader" Runat="server"/> <span style="font-weight:normal;"><asp:Label runat="server" ID="c_guideNumber"></asp:Label></span>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
		            <table border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
				        <tr>
					        <td valign="top">
						        <span class="litBoldText"><Foundation:ModuleString ID="ModuleString3" name="PageName" runat="Server" /></span><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /><br />
						        <div>
						            <div style="float:left;"><asp:TextBox cssclass="litInputText200" id="c_textBoxPageName" runat="server"/></div>
						           	<div style="float:left; padding-left:10px; padding-top:2px;">
		                                <asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorFolderName" ControlToValidate="c_textBoxPageName" ValidationExpression="[^<>\']*"><img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" /><Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="Modulestring18"/></asp:RegularExpressionValidator>
		                            </div>
						            <div style="float:left; padding-left:10px; padding-top:2px;"><asp:RequiredFieldValidator EnableClientScript="false" runat="server" ID="c_RequiredFieldValidatorPageName" CssClass="litErrorMsg" ControlToValidate="c_textBoxPageName" Display="Dynamic" /></div>
						        </div>
						        <div style="clear:both;"></div>
						        <span class="litText"><Foundation:ModuleString ID="ModuleString4" name="CreatePage2Description1" runat="Server" /></span>
					        </td>
				        </tr>
				        <tr>
					        <td valign="top" style="padding-top:15px; width: 100%;">
						        <span class="litBoldText"><Foundation:ModuleString ID="ModuleString2" name="AdvancedPageAlias" runat="Server" /></span><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /><br />
						        <div>
						            <div style="float:left;"><asp:TextBox cssclass="litInputText200" id="c_pageAlias" runat="server"/></div>
						            <div style="float:left; padding-left:10px; padding-top:2px;">
		                                <asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="RegularExpressionValidator1" ControlToValidate="c_pageAlias" ValidationExpression="[^<>\']*"><img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" /><Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="SystemString1"/></asp:RegularExpressionValidator>
		                            </div>
						            <div style="float:left; padding-left:10px; padding-top:2px;"><asp:RequiredFieldValidator EnableClientScript="false" runat="server" ID="c_pageAliasRequiredValidator" CssClass="litErrorMsg" ControlToValidate="c_pageAlias" Display="Dynamic" /><asp:CustomValidator runat="server" ID="c_pageAliasValidator" OnServerValidate="PageAliasValidator_Validate" CssClass="litErrorMsg" ControlToValidate="c_pageAlias" Display="Dynamic" /></div>
						        </div>
						        <div style="clear:both;"></div>
						        <span class="litText"><Foundation:ModuleString ID="ModuleString6" name="AdvancedPageAliasDescription" runat="Server" /></span>
					        </td>
				        </tr>
				        <tr id="c_trTemplates" runat="server">
				            <td valign="top" style="padding-top:35px; width: 100%;">
							    <span class="litBoldText"><Foundation:ModuleString ID="ModuleString5" name="Template" runat="Server" /></span><br />
						        <span class="litText"><Foundation:ModuleString ID="ModuleString7" name="TemplateInfo" runat="Server" /></span><br />							    
							    <asp:Repeater ID="c_repeaterTemplates" Runat="server">
							        <ItemTemplate>
								        <div style="float:left; padding-right:20px; padding-bottom:10px; text-align:center;" id="templatesDiv">
								            <asp:ImageButton width="90" height="110" CssClass="litSelectedItem" Runat="server" ID="regularTemplate" /><br />
										    <asp:Label runat="server" ID="c_labelTemplateName" CssClass="litText" />
								        </div>
								    </ItemTemplate>
						        </asp:Repeater>
						    </td>
				        </tr>
				        <tr>
				            <td>
				                <input type="hidden" runat="server" id="c_templateName" />
				            </td>
				        </tr>
			        </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_textBoxPageName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemCreateNext.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCreateAbort.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
        
        // Set chosen template name to hidden input
        function SetTemplateNameToHidden(imageButtonID, hiddenFieldID, templateType)
        {
            var imageButton = document.getElementById(imageButtonID);            
            var hiddenField = document.getElementById(hiddenFieldID);
            
            // Set value
            hiddenField.value = imageButton.title;
            
            // Set all image styles to unselected
            var imageButtons = document.body.getElementsByTagName("input");
            var types = "";
            for (i=0; i<=imageButtons.length-1; i++)
            {
                if(imageButtons[i].type == "image" && imageButtons[i].id.indexOf(templateType) > -1) {
                    //types += imageButtons[i].type + " ";
                    imageButtons[i].className = "litUnSelectedItem";
                }    
            }
            
            // Set style
            imageButton.className = "litSelectedItem";   
        }
    </script>
</asp:Content>