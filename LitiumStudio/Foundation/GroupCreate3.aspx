<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_GroupCreate3, Litum.Studio.Web" %>

<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
    <img src="../Images/transparent.gif" alt="" class="litIconFoundationGroups" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
        <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>		    
		    <toolbar:ToolbarItem OnClick="ToolbarItemPrevious_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemPrevious" runat="server"/>		   
		    <toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemNext" runat="server"/>	
	    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <span class="litText"><Foundation:SystemString ID="SystemString4" Name="GroupCreatePage3Description1" runat="server"/><br /><br /></span>
	    <asp:Repeater id="c_repeaterPermission" runat="server">
		    <ItemTemplate>
			    <asp:CheckBox ID="CheckBox1" CssClass="litInputCheckbox litBoldText" runat="server" /><br>
			    <asp:Panel ID="Panel1" runat="server" CssClass="litText" style="margin-bottom:5px;" />
		    </ItemTemplate>
		    <FooterTemplate>
		    <br>
		    </FooterTemplate>
	    </asp:Repeater> 
    </div>
    <script type="text/javascript">
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemNext.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e) { var key = (window.event) ? window.event.keyCode : e.keyCode; if (key == 27) simulateClick(cancelObject); else if (key == 13) simulateClick(submitObject); }
    </script>
</asp:Content>