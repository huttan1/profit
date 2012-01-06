<%@ page language="C#" masterpagefile="~/LitiumStudio/Newsletter/Framework/Base1.master" inherits="LitiumStudio_Newsletter_CircularsAddresses, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Newsletter/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbar" runat="server" >
        <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
        <toolbar:DividerItem ID="DividerItem2" ImageURL="Images/transparent.gif" Class="litToolbarDivider" runat="server" />
	    <toolbar:ToolbarItem OnClick="ToolbarItemRefresh_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconRefresh" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemRefresh" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="LitiumStudioContentHeading">
    <img src="Images/transparent.gif" alt="" class="litIconCircularAddressLists" /><Foundation:ModuleString ID="ModuleString4" Name="ShowRecipientsHeader" runat="server" /> "<asp:Label Runat="server" ID="mc_labelHeader" />"
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td valign="top" style="padding-bottom:10px;">
	                <span class="litText"><b><Foundation:ModuleString ID="ModuleString1" Name="ShowAddressTypes" runat="server" /></b></span><br />
	                <asp:DropDownList Runat="server" ID="mc_ddlAddressList" AutoPostBack="True" CssClass="litInputSelect" Width="300" />
                </td>
            </tr>	
            <tr>
                <td valign="top" class="litText">
	                <asp:DataList Runat="server" ID="mc_dgrdAddresses">
		                <ItemTemplate>
			                <div><%#DataBinder.Eval(Container.DataItem, "Email")%></div>
		                </ItemTemplate>
	                </asp:DataList>
                </td>
            </tr>	
        </table>
    </div>
    <script type="text/javascript">
        var submitObject = null;
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
</asp:Content>