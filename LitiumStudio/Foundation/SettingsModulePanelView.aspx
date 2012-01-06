<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_CMS_SettingsPanelView, Litum.Studio.Web" enableeventvalidation="false" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
        <toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemBack" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
   <asp:Label runat="server" ID="c_labelTopHeader" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">

    <div class="lsContentScroll">
            <div class="litBoldHeader">
                <Foundation:SystemString ID="SystemStringContentPanelPath" Name="ModulePanelContentPanelPath" Runat="server"/>:
            </div>
            <asp:Label ID="c_labelContentPanelPath" CssClass="litInputText" runat="server"/>
            <div style="clear:both;"></div>
            
            <div style="margin-top:15px;">
                <Foundation:SystemString ID="SystemStringAdminPanelPath" CssClass="litBoldHeader" Name="ModulePanelAdminPanelPath" Runat="server"/>:
            </div>
            <asp:Label ID="c_labelBoxAdminPanelPath" CssClass="litInputText" runat="server"/>
            <div style="clear:both;"></div>
            
            <div style="margin-top:15px;">
                <Foundation:SystemString ID="SystemStringIconPath" CssClass="litBoldHeader" Name="ModulePanelIconPath" Runat="server"/>:
            </div>
            <asp:Label ID="c_labelBoxIconPath" CssClass="litInputText" runat="server"/>
            <div style="clear:both;"></div>  
            
              <div style="margin-top:15px;">
                <Foundation:SystemString ID="SystemStringStatus" CssClass="litBoldHeader" Name="ModulePanelStatus" Runat="server"/>:
            </div>
            <asp:Label ID="c_labelStatus" CssClass="litInputText" runat="server"/>
            <div style="clear:both;"></div> 
            
            <asp:Repeater ID="c_repeaterModulePanelTitles" runat="server">
            <ItemTemplate>
                <div style="margin-top:15px;">
                    <Foundation:SystemString ID="SystemStringTitle" CssClass="litBoldHeader" Name="ModulePanelTitle" Runat="server"/> 
                    <%#string.Format("({0})", Eval("LanguageName")) %>
                </div>
                    <asp:Label ID="c_textBoxTitle" CssClass="litInputText" runat="server" Text='<%#Eval("Title").ToString().Trim()%>'/>
                <div style="clear:both;"></div>
            </ItemTemplate>            
            </asp:Repeater>                      
     </div> 
</asp:Content>