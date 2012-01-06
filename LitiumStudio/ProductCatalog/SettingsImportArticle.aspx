<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_SettingsImportArticle, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
        <toolbar:ToolbarItem ID="c_toolbarItemSave" OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" runat="server"/>
        <toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
        <toolbar:ToolbarItem OnClick="ToolbarItemImport_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconImport2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemImport" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>
 
 <asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
   <Foundation:ModuleString ID="ModuleString9" Name="ImportArticle" Runat="server"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
			<div class="litText"><Foundation:ModuleString ID="ModuleString1" Name="SettingsImportDescription1" Runat="server"/><br /><br />
			<Foundation:ModuleString ID="ModuleString8" Name="SettingsImportDescription3" Runat="server"/><br /><br /></div>
            <hr/>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString2" Name="ImportSettingTemplate" Runat="server"/></div>
            <asp:DropDownList enabled="true" id="c_dropDownListImportTemplate" cssclass="litInputSelect" runat="server"/>   
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString3" Name="ImportSettingNode" Runat="server"/></div>
            <asp:TextBox ID="c_textboxXmlNode" runat="server" CssClass="litInputText200" />
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString4" Name="ImportSettingArticle" Runat="server"/></div>
            <asp:TextBox ID="c_textboxArticleNumberField" runat="server" CssClass="litInputText200" />
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString5" Name="ImportSettingURL" Runat="server"/></div>
            <asp:TextBox ID="c_textboxURLField" runat="server" CssClass="litInputText200" />
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString10" Name="ImportSettingArticleGroup" Runat="server"/></div>
            <asp:TextBox ID="c_textboxArticleGroupField" runat="server" CssClass="litInputText200" />
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString11" Name="ImportSettingSKU" Runat="server"/></div>
            <asp:TextBox ID="c_textboxSKUField" runat="server" CssClass="litInputText200" />
            <hr style="margin-top:15px;"/>
		    <div class="litBoldHeader" style="margin-bottom:2px;"><Foundation:ModuleString ID="ModuleString6" Name="Language" Runat="server"/></div>
			<asp:CheckBoxList id="c_checkBoxListLanguage" runat="server" cssclass="litInputCheckbox litText" />
            <br /><br />
            <div class="litBoldHeader" style="margin-bottom:2px;"><Foundation:ModuleString ID="ModuleString7" Name="ChooseFileForImport" Runat="server"/></div>
            <input class="litInputFile" id="c_inputFile" type="file" size="63" runat="server" />
    </div>
</asp:Content>