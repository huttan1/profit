<%@ page language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_EditCategory, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/MediaArchive/Framework/Base.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <Toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbarRight" runat="server" >
	    <Toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
	        Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop"
	        SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
	        ID="mc_toolbarItemCancel" runat="server"/>
	    <Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace"
	        runat="server" ID="Divideritem2"/>
	    <Toolbar:ToolbarItem OnClick="ToolbarItemDelete_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
	        Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2"
	        SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
	        ID="mc_toolbarItemDelete" runat="server"/>
	    <Toolbar:ToolbarItem OnClick="ToolbarItemDeleteImages_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
	        Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2" SelectedClass="litToolbarItem litToolbarItemSelected"
	        ImageURL="Images/transparent.gif" ID="mc_toolbarItemDeleteImages" runat="server"/>
	    <Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem1"/>
	    <Toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
	        Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue"
	        SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
	        ID="mc_toolbarItemSave" runat="server"/>
    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
        <asp:Label Runat="server" ID="mc_labelCategoryName"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentTabScroll">	
		<LS:TabContainer runat="server" ID="m_tab" />
	</div>
</asp:Content>