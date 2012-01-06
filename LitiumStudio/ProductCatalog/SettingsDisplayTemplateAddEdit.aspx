<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" validaterequest="false" inherits="LitiumStudio_ProductCatalog_SettingsDisplayTemplateAddEdit, Litum.Studio.Web" enableeventvalidation="false" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		<toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
   <asp:Label runat="server" ID="c_labelTopHeader" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
            <asp:Panel runat="server" ID="c_panelStars" Visible="false" CssClass="litGuideStarsV2"/>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString1" Name="Name" Runat="server"/><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></div>
            <div style="float:left;"><asp:TextBox  ID="c_textBoxTemplateName" CssClass="litInputText200" runat="server"/></div>
            <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" CssClass="litErrorMsg" ID="c_requiredFieldValidatorFieldDefinitionName" ControlToValidate="c_textBoxTemplateName" Display="Dynamic" />
				<asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorFieldDefinitionName" ControlToValidate="c_textBoxTemplateName" ValidationExpression="[^<>\']*">
					<img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" />
					<Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="SystemString1"/>
				</asp:RegularExpressionValidator>
            <div style="float:left; padding-left:10px; padding-top:2px;"><asp:RequiredFieldValidator runat="server" SetFocusOnError="true" ID="c_requiredFieldValidatorTemplateName" CssClass="litErrorMsg" ControlToValidate="c_textBoxTemplateName" Display="Dynamic" /></div>
            <div style="float:left; padding-left:10px; padding-top:2px;" class="litErrorMsg" runat="server" id="c_templatename_not_unique" visible="false"><img src='images/transparent.gif' style='vertical-align:middle;' class='litIconError' alt='' /><Foundation:ModuleString ID="ModuleString18" Name="ValidatorNotUniqeValue" Runat="server"/></div>
            <div style="clear:both;"></div>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString2" Name="Type" Runat="server"/></div>
            <asp:DropDownList id="c_dropDownListTemplateType" CssClass="litInputSelect" runat="server" style="width:206px;"/>
            <asp:Label ID="c_labelTemplateType" CssClass="litText" runat="server" />
            <div style="clear:both;"></div>
            <div style="margin-top:15px;"><Foundation:ModuleString ID="ModuleString3" CssClass="litBoldHeader" Name="FileName" Runat="server"/><span class="litBoldHeader"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</span> (<Foundation:ModuleString ID="ModuleString6" CssClass="litText" Name="FileNameInfo" Runat="server"/>)</div>
            <asp:TextBox ID="c_textBoxFileName" CssClass="litInputText" runat="server"/>
             <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" CssClass="litErrorMsg" ID="RequiredFieldValidator1" ControlToValidate="c_textBoxFileName" Display="Dynamic" />
				<asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="RegularExpressionValidator1" ControlToValidate="c_textBoxFileName" ValidationExpression="[^<>\']*">
					<img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" />
					<Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="SystemString2"/>
				</asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" ID="c_requiredFieldValidatorFileName" CssClass="litErrorMsg" ControlToValidate="c_textBoxFileName" Display="Dynamic" />
            <div style="clear:both;"></div>
            <div style="margin-top:15px;"><Foundation:ModuleString CssClass="litBoldHeader" ID="ModuleString4" Name="ImageEditTitle" Runat="server"/><span class="litBoldHeader"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</span> (<Foundation:ModuleString ID="ModuleString5" CssClass="litText" Name="ImageInfo" Runat="server"/>)</div>
            <asp:TextBox ID="c_textBoxThumbnail" CssClass="litInputText" runat="server"/>
             <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" CssClass="litErrorMsg" ID="RequiredFieldValidator2" ControlToValidate="c_textBoxThumbnail" Display="Dynamic" />
				<asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="RegularExpressionValidator2" ControlToValidate="c_textBoxThumbnail" ValidationExpression="[^<>\']*">
					<img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" />
					<Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="SystemString3"/>
				</asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" ID="c_requiredFieldValidatorThumbnail" CssClass="litErrorMsg" ControlToValidate="c_textBoxThumbnail" Display="Dynamic" />
            <div style="clear:both;"></div>
     </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_textBoxTemplateName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>