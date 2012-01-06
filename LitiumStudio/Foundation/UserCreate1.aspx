<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_UserCreate1, Litum.Studio.Web" %>

<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls"  Assembly="Litium.Studio.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
        <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
		    <toolbar:DividerItem ID="DividerItem1" ImageURL="../images/transparent.gif" Class="litToolbarSpace" runat="server" />
		    <toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../../LitiumStudio/Images/transparent.gif" ID="c_toolbarItemNext" runat="server"/>	
	    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconFoundationUsers" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">           
		<span class="litText"><Foundation:SystemString ID="SystemString4" Name="UserCreatePage1Description1" runat="server"/><br /><br /><Foundation:SystemString ID="SystemString5" Name="UserCeratePage1Description2" runat="server"/><br /><br /></span>
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td style="width:30px;" class="litBoldText"><Foundation:SystemString Name="Type" runat="server" ID="Systemstring6"/>:</td>
				<td style="padding:2px;" class="litText"><asp:RadioButton checked="true" CssClass="litInputRadio" GroupName="UserType" id="c_radioButtonInternal" runat="server"/><Foundation:SystemString ID="SystemString7" Name="Internal" runat="server"/></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td style="padding:2px;" class="litText"><asp:RadioButton CssClass="litInputRadio" GroupName="UserType" id="c_radioButtonAD" runat="server"/><Foundation:SystemString ID="SystemString8" Name="ActiveDirectory" runat="server"/></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td style="padding:2px;" class="litText"><asp:RadioButton CssClass="litInputRadio" GroupName="UserType" id="c_radioButtonNovell" runat="server"/><Foundation:SystemString ID="SystemString9" Name="Novell" runat="server"/></td>
			</tr>
		</table>
	</div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_radioButtonInternal.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemNext.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>