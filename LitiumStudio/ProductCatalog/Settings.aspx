<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_ProductCatalog_Settings, Litum.Studio.Web" enableeventvalidation="false" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
	    <toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" OnClick="ToolbarItemSave_Click" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
   <Foundation:ModuleString ID="ModuleString1" Name="SettingsHeader" Runat="server"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
            <div class="litText"><asp:CheckBox runat="server" ID="c_sku"/><asp:Label runat="server" ID="c_skuLabel" /></div>
            <div class="litText" style="margin-top: 20px;"><asp:CheckBox runat="server" ID="c_checkBoxAddToPriceAgentsList" /><asp:Label runat="server" ID="c_labelAddToPriceAgentsList"/></div>
            <div class="litText" style="margin-top: 20px;"><asp:CheckBox runat="server" ID="c_checkBoxAAAG" /><asp:Label runat="server" ID="c_labelAAAG" /></div>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString4" Name="ReloadCache" Runat="server"/></div>
            <div class="litText"><Foundation:ModuleString ID="ModuleString5" Name="ReloadDescription" Runat="server"/></div>
            <asp:Button runat="server" ID="c_buttonReloadCach" CssClass="litInputButton" style="margin:0px; margin-top:5px;" OnClick="ReloadCache_OnClick" />
            <br /><br />
            <div class="litText"><%=Litium.Foundation.Modules.ProductCatalog.ModuleProductCatalog.Instance.CacheInfo(FoundationContext.Token)%></div>
     </div>
    <script type="text/javascript">
    	var focusObject = document.getElementById("<% Response.Write(c_sku.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = null;
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>