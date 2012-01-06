<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_ModulePanelContainer, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <asp:Panel runat="server" ID="c_headerPanel" Visible="true">
        <img id="c_image" style="vertical-align: middle; margin-right: 5px;" alt="" runat="server" src=""/>
        <span style="font-weight:bold;"><asp:Label ID="c_labelHeading" runat="server" /></span>        
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <asp:PlaceHolder ID="c_placeHolderContent" runat="server" />
</asp:Content>


