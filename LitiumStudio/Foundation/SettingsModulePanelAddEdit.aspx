<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_Foundation_SettingsModuelPanelAddEdit, Litum.Studio.Web" enableeventvalidation="false" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		<toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../Images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>
		<toolbar:DividerItem ImageURL="../Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../Images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
   <asp:Label runat="server" ID="c_labelTopHeader" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">

    <div class="lsContentScroll">
            <div class="litBoldHeader">
                <Foundation:SystemString ID="c_systemStringModulePanelName" Name="ModulePanelName" Runat="server"/>
                <img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />
            </div>
            <div style="float:left;">
                <asp:TextBox ID="c_textBoxModulePanelName" CssClass="litInputText200" runat="server"/>
            </div>
            <div style="float:left; padding-left:10px; padding-top:2px;">
                <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" ID="c_requiredFieldValidatorModulePanelName" CssClass="litErrorMsg" ControlToValidate="c_textBoxModulePanelName" Display="Dynamic"/>
            </div>
             <div style="float:left; padding-left:10px; padding-top:2px;">
                <asp:CustomValidator runat="server" SetFocusOnError="true" ID="c_customValidateUniqueModulePanelName" CssClass="litErrorMsg" ControlToValidate="c_textBoxModulePanelName" Display="Dynamic" OnServerValidate="CheckModulePanelName_ServerValidate"/>
            </div>
            <div style="float:left; padding-left:10px; padding-top:2px;" class="litErrorMsg" runat="server" id="c_PanelName_not_unique" visible="false">
                <img src='../images/transparent.gif' style='vertical-align:middle;' class='litIconError' alt='' />
                <Foundation:SystemString ID="SystemStringValidatorNotUniqeValue" Name="ModulePanelNameNotUnique" Runat="server"/>
            </div>
            <div style="clear:both;"></div>
            <div class="litBoldHeader">
                <Foundation:SystemString ID="SystemStringContentPanelPath" Name="ModulePanelContentPanelPath" Runat="server"/>&nbsp;
                <Foundation:ModuleString ID="ModuleStringContentPanelPathExample" Name="ModulePanelContentPanelPathExample" Runat="server"/>
                <img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />
            </div>
            <div style="float:left;"> 
            <asp:TextBox ID="c_textBoxContentPanelPath" CssClass="litInputText" runat="server"/>
            </div>
            <div style="float:left; padding-left:10px; padding-top:2px;">
                <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" ID="c_requiredFieldValidatorModuleContentPanelPath" CssClass="litErrorMsg" ControlToValidate="c_textBoxContentPanelPath" Display="Dynamic"/>
            </div>
            <div style="clear:both;"></div>
            
            <div style="margin-top:15px;">
                <Foundation:SystemString ID="SystemStringAdminPanelPath" CssClass="litBoldHeader" Name="ModulePanelAdminPanelPath" Runat="server"/>
                <Foundation:ModuleString ID="ModuleStringAdminPanelPathExmple" Name="ModulePanelAdminPanelPathExample" Runat="server" CssClass="litBoldHeader"/>
            </div>
            <asp:TextBox ID="c_textBoxAdminPanelPath" CssClass="litInputText" runat="server"/>
            <div style="clear:both;"></div>
            
            <div style="margin-top:15px;">
                <Foundation:SystemString ID="SystemStringIconPath" CssClass="litBoldHeader" Name="ModulePanelIconPath" Runat="server"/>
                <Foundation:ModuleString ID="ModuleStringIconPathExample" Name="ModulePanelIconPathExample" Runat="server" CssClass="litBoldHeader"/>
            </div>
            <asp:TextBox ID="c_textBoxIconPath" CssClass="litInputText" runat="server"/>
            <div style="clear:both;"></div>  
            
             <div style="margin-top:15px;">
            </div>
            <asp:CheckBox ID="c_checkBoxEnabled" CssClass="litInputCheckbox input litBoldHeader" runat="server"/>
            <div style="clear:both;"></div>  
            
            <asp:Repeater ID="c_repeaterModulePanelTitles" runat="server">
            <ItemTemplate>
                <div style="margin-top:15px;" class="litBoldHeader">
                    <Foundation:SystemString ID="SystemStringTitle" Name="ModulePanelTitle" Runat="server"/> 
                    <%#string.Format("({0})", Eval("LanguageName")) %>
                </div>
                    <asp:TextBox ID="c_textBoxTitle" CssClass="litInputText" runat="server" Text='<%#Eval("Title").ToString().Trim()%>'/>
                <div style="clear:both;"></div>
                    <asp:HiddenField runat="server" ID="c_hiddenLanguageId" Value='<%#Eval("LanguageID") %>' />
            </ItemTemplate>            
            </asp:Repeater>
                      
     </div>
     
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_textBoxModulePanelName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>