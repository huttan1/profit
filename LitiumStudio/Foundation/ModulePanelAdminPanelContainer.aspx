<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_ModuleAdminPanelContainer, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
        <toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemBack" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <asp:Panel runat="server" ID="c_headerPanel" Visible="true">
        <img id="c_imagePanel" style="vertical-align: middle; margin-right: 5px;" alt="" runat="server" src=""/>
        <span style="font-weight:bold;"><asp:Label ID="c_labelPanelheading" runat="server" /></span>        
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <asp:PlaceHolder ID="c_placeHolderPanelContent" runat="server" />
</asp:Content>


