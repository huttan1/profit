<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_Newsletter_TemplatesEdit1, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="mc_toolbar" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="mc_toolbarItemCancel" runat="server"/>	
	    <toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
	    <toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="mc_toolbarItemSave" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
<img src="../Images/transparent.gif" alt="" class="litIconCircular" />
    <asp:Label ID="mc_labelTemplateName" Runat="server"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
	        <table border="0" cellspacing="0" cellpadding="0">
		        <tr>
			        <td colspan="2"><b><Foundation:ModuleString ID="ModuleString1" Name="TemplateName" runat="server" CssClass="litText" /><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</b></td>
		        </tr>
		        <tr>
			        <td><asp:TextBox cssclass="litInputText" id="mc_textBoxTemplateName" runat="server"/></td>
			        <td style="padding-left:10px;"><asp:RequiredFieldValidator ID="mc_validatorTemplateName" runat="server" ControlToValidate="mc_textBoxTemplateName" cssClass="litErrorMsg"/></td>
		        </tr>
		        <tr>
		            <td colspan="2" style="padding-top:15px;"><b><Foundation:ModuleString Name="TemplateDescription" runat="server" ID="ModuleString3" CssClass="litText" /></b></td>
		        </tr>
		        <tr>
			        <td><asp:TextBox cssclass="litInputTextArea" id="mc_textBoxTemplateDescription" Rows="5" TextMode="MultiLine" runat="server"/></td>
			        <td></td>
			    </tr>
		        <tr>
			        <td colspan="2" style="padding-top:15px;"><b><Foundation:ModuleString Name="TemplateFileName" runat="server" ID="Systemstring3" CssClass="litText" /></b></td>
		        </tr>
		        <tr>
			        <td>
			            <asp:TextBox cssclass="litInputText" id="mc_textBoxTemplateFileName" runat="server"/>
			            <div class="litText"><Foundation:ModuleString Name="TemplateFileNameDescription" runat="server" ID="Modulestring8" /></div>
			        </td>
			        <td style="padding-left:10px;"><asp:RequiredFieldValidator ID="mc_validatorTemplateFileName" runat="server" ControlToValidate="mc_textBoxTemplateFileName" cssClass="litErrorMsg"/></td>
		        </tr>
		        <tr>
			        <td colspan="2" style="padding-top:15px;"><b><Foundation:ModuleString Name="TemplateImageURL" runat="server" ID="Systemstring1" CssClass="litText" /><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</b></td>
		        </tr>
		        <tr>
			        <td>
			            <asp:TextBox cssclass="litInputText" id="mc_textBoxTemplateImageURL" runat="server"/>
			            <div class="litText"><Foundation:ModuleString Name="TemplateImageURLDescription" runat="server" ID="Modulestring2" /></div>
			        </td>
			        <td style="padding-left:10px;"><asp:RequiredFieldValidator ID="mc_validatorTemplateImageURL" runat="server" ControlToValidate="mc_textBoxTemplateImageURL" cssClass="litErrorMsg"/></td>
		        </tr>
	        </table>
     </div>
     <script type="text/javascript">
        var disableSubmitObject = document.getElementById("<% Response.Write(mc_textBoxTemplateDescription.ClientID.ToString()); %>");
        var focusObject = document.getElementById("<% Response.Write(mc_textBoxTemplateName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(mc_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var srcElmnt=(window.event)?window.event.srcElement:e.target; var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13 && srcElmnt!=disableSubmitObject) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>