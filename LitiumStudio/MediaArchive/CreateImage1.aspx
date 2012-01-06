<%@ page language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_CreateImage1, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/MediaArchive/Framework/Base.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbarRight" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemCancel" runat="server"/>
	    <toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
	    <toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemNext" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>


<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">   
    <Foundation:ModuleString ID="ModuleString1" Name="CreateImagePageSubHeader" Runat="server"/> <span style="font-weight:normal;">(<Foundation:ModuleString ID="ModuleString4" Name="CreateImagePage1SubHeader1" runat="Server"/>)</span>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <span class="litText">
        <%--<Foundation:ModuleString Name="CreateImagePage1Description1" runat="server" ID="Modulestring1"/> <Foundation:ModuleString Name="LabelImageToFolder" runat="server" ID="Modulestring14"/>&nbsp;<b>"<asp:Label runat="server" id="mc_labelParentFolderName" />"</b>.<br /><br />--%>
        <asp:Label runat="server" ID="c_maxSize" /><br /><br /><Foundation:ModuleString Name="CreateImagePage1Description2" runat="server" ID="Modulestring2"/><br /><br /></span>
        <asp:FileUpload class="litInputFile" size="63" ID="inputImage1" runat="server" /><br /><br />
        <asp:FileUpload class="litInputFile" size="63" ID="inputImage2" runat="server" /><br /><br />
        <asp:FileUpload class="litInputFile" size="63" ID="inputImage3" runat="server" /><br /><br />
        <asp:FileUpload class="litInputFile" size="63" ID="inputImage4" runat="server" /><br /><br />
        <asp:FileUpload class="litInputFile" size="63" ID="inputImage5" runat="server" /><br /><br />
        <asp:Panel id="mc_imagesValidator" class="litErrorMsg" visible="false" runat="server" style="padding-bottom:10px;">
            <img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" /><Foundation:ModuleString Name="ErrorRequiredFiles" runat="server" ID="Modulestring15"/>
        </asp:Panel>
         <span class="litText"><asp:CheckBox ID="c_checkboxCreatePreDefinedVersions" runat="server" Text = "Auto generate predefined versions1" class="litInputCheckbox" /><br /><br /></span>
        <span class="litText"><Foundation:ModuleString Name="CreateImagePage1Description3" runat="server" ID="Modulestring3"/><br /><br /></span>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(inputImage1.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemNext.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(mc_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>