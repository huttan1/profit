<%@ page language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_EditImage, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/MediaArchive/Framework/Base.master" %>


<%@ Register TagPrefix="MediaArchive" Namespace="Litium.Studio.UI.MediaArchive.WebControls" Assembly="Litium.Studio.UI"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <Toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbarRight" runat="server" >
	    <Toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
	        Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop"
	        SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
	        ID="mc_toolbarItemCancel" runat="server"/>
	    <Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server"
	        ID="Divideritem2"/>	  
	    <Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem1"/>
	    <Toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
	        Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue"
	        SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
	        ID="mc_toolbarItemSave" runat="server"/>
	    <Toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
	        LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected"
	        ImageURL="Images/transparent.gif" ID="mc_toolbarItemBack" runat="server"/>
    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">  
       <asp:Label Runat="server" ID="mc_labelImageName"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">

    <div class="lsContentTabScroll">	
		<LS:TabContainer runat="server" ID="m_tab" />
	</div>
</asp:Content>
