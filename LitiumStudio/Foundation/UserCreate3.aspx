<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_UserCreate3, Litum.Studio.Web" %>

<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
        <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>		   
		    <toolbar:ToolbarItem OnClick="ToolbarItemPrevious_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemPrevious" runat="server"/>		    
		    <toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemNext" runat="server"/>	
	    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconFoundationUsers" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">
	<script language="javascript" type="text/javascript" src="../JavaScripts/listBoxSelection.js"></script>
	<div class="lsContentScroll">  
        <asp:Panel id="c_panelAD" runat="server">
		    <span class="litText"><Foundation:SystemString Name="UserCreatePage3Description1" runat="server" ID="Systemstring4"/><br /><br /></span>
	    </asp:Panel>
	    <asp:Panel id="c_panelInternal" runat="server">
		    <span class="litText"><Foundation:SystemString Name="UserCreatePage3Description2" runat="server" ID="Systemstring5"/><br /><br /></span>
		    <table border="0" cellspacing="0" cellpadding="0">
			    <tr>
				    <td class="litBoldText"><Foundation:SystemString Name="SystemGroups" runat="server" ID="Systemstring6"/>:</td>
				    <td>&nbsp;</td>
				    <td class="litBoldText"><Foundation:SystemString Name="GroupsOfTheUser" runat="server" ID="Systemstring7"/>:</td>
			    </tr>
			    <tr>
				    <td><asp:ListBox Runat="server" ID="c_listBoxExistingItems" Rows="13" SelectionMode="Multiple" CssClass="litInputSelect340"/></td>
				    <td><input id="c_buttonAdd" runat="server" type="button" class="litInputButton litInputButtonAdd" /><br /><br />
					    <input id="c_buttonRemove" runat="server" type="button" class="litInputButton litInputButtonRemove" />
					    <input id="c_hiddenSelectedItems" runat="server" type="hidden" />
				    </td>
				    <td><asp:ListBox Runat="server" ID="c_listBoxSelectedItems" Rows="13" SelectionMode="Multiple" CssClass="litInputSelect340"/></td>
			    </tr>
		    </table><br /><br />
	    </asp:Panel>
    </div>
    <Telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            addEvent(window, "load", function () {
                SortField('<%=c_listBoxExistingItems.ClientID%>');
            });
            var focusObject = document.getElementById("<% Response.Write(c_listBoxExistingItems.ClientID.ToString()); %>");
            var submitObject = document.getElementById("<% Response.Write(c_toolbarItemNext.ClientID.ToString()); %>");
            var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
            document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
            if(focusObject && !focusObject.disabled) {focusObject.focus();}
        </script>
    </Telerik:RadCodeBlock>
</asp:Content>