<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_UserEdit, Litum.Studio.Web" enableeventvalidation="false" %>

<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
        <Toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		    <Toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem"
		        LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
		        ImageURL="../images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
		    <Toolbar:DividerItem ID="DividerItem1" ImageURL="../images/transparent.gif" Class="litToolbarSpace" runat="server" />
		    <Toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem" Class="litToolbarItem"
		        LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected"
		        ImageURL="../../LitiumStudio/Images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>	
	    </Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconFoundationUsers" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">
    
	<div class="lsContentTabScroll">
	    <LS:TabContainer runat="server" ID="m_tab" />
    </div>

</asp:Content>