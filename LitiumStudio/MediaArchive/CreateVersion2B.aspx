<%@ page language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_CreateVersion2B, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/MediaArchive/Framework/Base.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbarRight" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemCancel" runat="server"/>
	    <toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
	    <toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemBack" runat="server"/>
	    <toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem1"/>
	    <toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemSave" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">     
        <Foundation:ModuleString ID="ModuleString9" Name="CreateVersionPageSubHeader" Runat="server"/> <span style="font-weight:normal;">(<Foundation:ModuleString ID="ModuleString10" Name="CreateVersionPage2SubHeader1" runat="Server"/>)</span>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <asp:Label runat="server" ID="c_maxSize" CssClass="litText" /><br /><br />
        <span class="litText"><Foundation:ModuleString Name="CreateImagePage1Description2" runat="server" ID="Modulestring2"/><br /><br /></span>
        <asp:FileUpload class="litInputFile" size="63" ID="mc_fileNewVersion" runat="server" /><br /><br />
        <span class="litText"><Foundation:ModuleString Name="CreateImagePage1Description3" runat="server" ID="Modulestring3"/></span><br /><br />				       
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(mc_fileNewVersion.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(mc_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>