<%@ page language="C#" masterpagefile="~/LitiumStudio/Help/Framework/Help.master" autoeventwireup="true" inherits="LitiumStudio_Help_Default, Litum.Studio.Web" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
    <toolbar:HorizontalToolbar ID="HorizontalToolbar1" runat="server">
        <toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled"
            Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPDF" SelectedClass="litToolbarItem litToolbarItemSelected"
            ImageURL="../images/transparent.gif" ID="c_toolbarDownload" runat="server" />
    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconHelp" /><asp:Label runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" runat="Server">
        	<iframe id="iframe" src="Content/Introduction/Introduction.htm" name="IFrame" frameborder="no" width="100%" height="100" scrolling="no"></iframe>    
</asp:Content>