<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_SystemStringExport1, Litum.Studio.Web" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
        <Toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		    <Toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem"
		        LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
		        ImageURL="../images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
		    <Toolbar:DividerItem ID="DividerItem1" ImageURL="../images/transparent.gif" Class="litToolbarSpace" runat="server" />
		    <Toolbar:ToolbarItem DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconExport2"
		        SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemExport"
		        runat="server" />
	    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconMessages" />&nbsp; 
	<span class="litContentTopHeader"><Foundation:SystemString ID="SystemString10" Name="SystemStringExportPageSubHeader1" runat="server" /></span><span class="litContentTopGuide">&nbsp;(<Foundation:SystemString Name="SystemStringExportPageSubHeader2" runat="server" ID="Systemstring11"/>)</span>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <!--Innehåll-->
    <div class="lsContentScroll">
            <span class="litText"><Foundation:SystemString ID="SystemString4" Name="SystemStringExportPage1Description1" runat="server"/><br /><br /><Foundation:SystemString ID="SystemString5" Name="SystemStringExportPage1Description2" runat="server"/><br /><br /></span>
		    <table border="0" cellspacing="0" cellpadding="0">
			    <tr>
				    <td colspan="2" class="litBoldText"><Foundation:SystemString Name="SelectLanguage" runat="server" ID="Systemstring6"/>:</td>
			    </tr>
			    <tr>
				    <td><asp:DropDownList cssclass="litInputSelect" id="c_dropDownListLanguage" runat="server"/></td>
				    <td style="padding-left:10px;" class="litErrorMsg"></td>
			    </tr>
		    </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_dropDownListLanguage.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemExport.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>