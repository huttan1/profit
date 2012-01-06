<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_UserSettings, Litum.Studio.Web" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="mc_toolbar" runat="server">
		    <toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../../LitiumStudio/Images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">
    <div class="lsContentScroll">
        <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td class="litBoldText"><Foundation:SystemString Name="Skin" runat="server" ID="Systemstring3"/>:</td>
		    </tr>
		    <tr>
			    <td><asp:DropDownList Runat="server" ID="c_dropDownListSkin" CssClass="litInputSelect"/></td>
		    </tr>
	    </table><br />
	    <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td class="litBoldText"><Foundation:SystemString ID="SystemString2" Name="Language" runat="server" />:</td>
		    </tr>
		    <tr>
			    <td><asp:DropDownList Runat="server" ID="c_dropDownListLanguage" CssClass="litInputSelect"/></td>
		    </tr>
	    </table>
    </div>
</asp:Content>
