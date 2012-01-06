<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_GroupCreate1, Litum.Studio.Web" %>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
<img src="../Images/transparent.gif" alt="" class="litIconFoundationGroups" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
    <Toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
	    <Toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
	    <Toolbar:DividerItem ID="DividerItem1" ImageURL="../images/transparent.gif" Class="litToolbarSpace" runat="server" />
	    <Toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../../LitiumStudio/Images/transparent.gif" ID="c_toolbarItemNext" runat="server"/>	
    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
            <span class="litText"><Foundation:SystemString Name="GroupCreatePage1Description1" runat="server" ID="Systemstring4"/><br /><br /><Foundation:SystemString Name="GroupCeratePage1Description2" runat="server" ID="Systemstring5"/><br /><br /></span>
		    <table border="0" cellspacing="0" cellpadding="0">
			    <tr>
				    <td style="width:30px;" class="litBoldText"><Foundation:SystemString Name="Type" runat="server" ID="Systemstring6"/>:</td>
				    <td style="padding:2px;" class="litText"><asp:RadioButton checked="true" CssClass="litInputRadio" GroupName="GroupType" id="c_radioButtonInternal" runat="server"/><asp:Label runat="server" ID="c_labelInternal" AssociatedControlID="c_radioButtonInternal"><Foundation:SystemString Name="Internal" runat="server" ID="Systemstring7"/></asp:Label></td>
			    </tr>
			    <tr>
				    <td>&nbsp;</td>
				    <td style="padding:2px;" class="litText"><asp:RadioButton CssClass="litInputRadio" GroupName="GroupType" id="c_radioButtonAD" runat="server"/><asp:Label runat="server" ID="c_labelAD" AssociatedControlID="c_radioButtonAD"><Foundation:SystemString Name="ActiveDirectory" runat="server" ID="Systemstring8"/></asp:Label></td>
			    </tr>
			    <tr>
				    <td>&nbsp;</td>
				    <td style="padding:2px;" class="litText"><asp:RadioButton CssClass="litInputRadio" GroupName="GroupType" id="c_radioButtonNovell" runat="server"/><asp:Label runat="server" ID="c_labelNovell" AssociatedControlID="c_radioButtonNovell"><Foundation:SystemString Name="Novell" runat="server" ID="Systemstring9"/></asp:Label></td>
			    </tr>
		    </table><br />
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_radioButtonInternal.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemNext.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>