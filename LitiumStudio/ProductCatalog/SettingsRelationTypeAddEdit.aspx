<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_ProductCatalog_SettingsRelationTypeAddEdit, Litum.Studio.Web" enableeventvalidation="false" validaterequest="false" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		<toolbar:ToolbarItem ID="c_toolbarItemCancel" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" runat="server"/>
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
		<toolbar:ToolbarItem ID="c_toolbarItemSave" onclick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<asp:Label runat="server" ID="c_labelTopHeader" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
            <asp:Panel runat="server" ID="c_panelStars" Visible="false" CssClass="litGuideStarsV2"/>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString2" Name="RelationTypeName" Runat="server"/><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></div>
            <asp:TextBox runat="server" ID="c_textBoxRelationTypeName" CssClass="litInputText"/> <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" ID="RequiredFieldValidatorRelationTypeName" CssClass="litErrorMsg" ControlToValidate="c_textBoxRelationTypeName" Display="Dynamic" />
            <asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorFolderName" ControlToValidate="c_textBoxRelationTypeName" ValidationExpression="[^<>\']*"><img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" /><Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="Modulestring18"/></asp:RegularExpressionValidator>
		    <asp:RegularExpressionValidator ID="c_lengthValidatorTemplateName" runat="server"
                                    ControlToValidate="c_textBoxRelationTypeName"     
                                    ValidationExpression="^.{1,250}$" />  
            <div style="margin-top:15px;"><asp:PlaceHolder ID="c_placeHolderRelationTypeNameLanguages" runat="server"></asp:PlaceHolder></div>
            <div style="clear:both;"></div>
            <div style="margin-top:15px;" class="litText">
                <asp:RadioButton runat="server" ID="c_radioButtonDirectional" GroupName="RelationTypeDirection" /><br /><br />
                <asp:RadioButton runat="server" ID="c_radioButtonBidirectional" GroupName="RelationTypeDirection" />
            </div>
     </div>
    <script type="text/javascript">
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
</asp:Content>