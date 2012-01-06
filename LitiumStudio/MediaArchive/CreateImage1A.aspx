<%@ page language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_CreateImage1A, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/MediaArchive/Framework/Base.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbarRight" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemCancel" runat="server"/>
	    <toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
	    <toolbar:ToolbarItem URL="javascript:LitiumUpload();" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemNext" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
    	<Telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">

     <script type="text/javascript" src="<%=Page.ResolveUrl("~/LitiumStudio/FlexUpload/js/swfobject.js")%>"></script>
    <script type="text/javascript">
        var so;
        function LoadFlexUpload()
        {
            so = new SWFObject("<%=Page.ResolveUrl("~/LitiumStudio/FlexUpload/LitiumFlexUpload.swf")%>", "flexFileUpload", "600", "250", "9");
                    so.addVariable("redirect", "<%=Page.ResolveUrl("~/LitiumStudio/MediaArchive/CreateImage2.aspx?")%>");
                    so.addVariable("upload", "<%=Page.ResolveUrl("~/LitiumStudio/MediaArchive/MediaArchiveFlexUpload.aspx?" + this.UploadQueryString)%>");
                    so.addVariable("buttonBrowse", "<Foundation:ModuleString Name="Browse" runat="server"/>");
                    so.addVariable("buttonRemove", "<Foundation:ModuleString Name="Remove" runat="server" />");
                    so.addVariable("labelFileName", "<Foundation:ModuleString Name="FileName" runat="server" />");
                    so.addVariable("labelSize", "<Foundation:ModuleString Name="Size" runat="server" />");
                    so.addVariable("labelProgress", "<Foundation:ModuleString Name="Progress" runat="server" />");
                    so.addVariable("labelFilesWithTotalSize", "<Foundation:ModuleString Name="FilesWithTotalSize" runat="server" />");
                    so.addVariable("maxFileSize", <%=this.MaxFileSize%>);
                    so.addVariable("javascriptUploadComplete", "FlexUploadComplete");
                    so.addVariable("javascriptUploadReset", "FlexUploadReset");
                    so.addVariable("sessionID", "<%=this.SessionID%>");
                    so.addVariable("labelNoFileSelected", "<Foundation:ModuleString Name="ErrorRequiredFiles" runat="server" ID="Modulestring4"/>");
                    so.addVariable("filenames", "Files (*.*)");
                    so.addVariable("extensions", "*.*");
                    so.addParam("wmode", "transparent");
                    so.addParam("allowScriptAccess", "always");
                    so.addParam("type", "application/x-shockwave-flash");
                    so.write("flashcontent");
        }
        function FlexUploadComplete() 
        {
            var chk = document.getElementById('<%=c_checkboxCreatePreDefinedVersions.ClientID%>');
            var appendQuerystring = '&Create_PDV=no';
            if(chk != null && chk.checked)
            {
                appendQuerystring = "&Create_PDV=yes";   
            }
            var redirectUrl = '<%=Page.ResolveUrl("~/LitiumStudio/MediaArchive/CreateImage2.aspx?" + this.QueryString)%>' + appendQuerystring;
            document.location = redirectUrl;
        }
        function FlexUploadReset(action) {
            if (action == 'cancel')
                toolbarItemAction('activate','1_0');
            else
                toolbarItemAction('activate','1_0,1_1');
        }
        function LitiumUpload()
        {
            var flexFileUpload = document.getElementById('flexFileUpload');
            if(flexFileUpload)
            {
                toolbarItemAction('disable','1_0,1_1');
                flexFileUpload.Upload();
            }
        }
    </script>

	</Telerik:RadScriptBlock> 
	    <img src="Images/transparent.gif" style="vertical-align:middle; margin-right:5px; display:none;" class="litIconFileAdd" alt="" onload="LoadFlexUpload()"/>  
        <Foundation:ModuleString ID="ModuleString1" Name="CreateImagePageSubHeader" Runat="server"/> <span style="font-weight:normal;">(<Foundation:ModuleString ID="ModuleString5" Name="CreateImagePage1SubHeader1" runat="Server"/>)</span>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server"> 
<div class="lsContentScroll">
    <span class="litText"><%--<Foundation:ModuleString Name="CreateImagePage1Description1" runat="server" ID="Modulestring1"/> <Foundation:ModuleString Name="LabelImageToFolder" runat="server" ID="Modulestring14"/>&nbsp;<b>"<asp:Label runat="server" id="mc_labelParentFolderName" />"</b>.<br /><br />--%>
    <asp:Label runat="server" ID="c_maxSize" /><br /><br /><Foundation:ModuleString Name="CreateImagePage1Description2" runat="server" ID="Modulestring2"/><br /><br /></span>
    <div id="flashcontent" align = "left"></div>
     <div id="checkboxContent">
         <span class="litText"><asp:CheckBox ID="c_checkboxCreatePreDefinedVersions" runat="server" Text = "Auto generate predefined versions1" class="litInputCheckbox" /></span>
     </div><br />
    <span class="litText"><Foundation:ModuleString Name="CreateImagePage1Description3" runat="server" ID="Modulestring3"/><br /><br /></span>
</div>
    <script type="text/javascript">
        var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemNext.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(mc_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
</asp:Content>