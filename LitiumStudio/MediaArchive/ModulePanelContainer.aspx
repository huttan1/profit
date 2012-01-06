<%@ page language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_ModulePanelContainer, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/MediaArchive/Framework/Base.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
    <asp:Panel runat="server" ID="c_headerPanel" Visible="true">
        <img id="c_imagePanel" style="vertical-align: middle; margin-right: 5px;" alt="" runat="server" src=""/>
        <span style="font-weight:bold;"><asp:Label ID="c_labelPanelheading" runat="server" /></span>        
    </asp:Panel>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <asp:PlaceHolder ID="c_placeHolderPanelContent" runat="server" />
</asp:Content>