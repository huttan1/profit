<%@ page language="C#" masterpagefile="~/LitiumStudio/Newsletter/Framework/Base1.master" inherits="LitiumStudio_Newsletter_PhoneNumbersFailed, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Newsletter/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbar" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="mc_toolbarItemCancel" runat="server"/>	
	    <toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarDivider" runat="server" ID="Divideritem1"/>
	    <toolbar:ToolbarItem OnClick="ToolbarItemDeleteAll_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemDeleteAll" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" runat="Server" ContentPlaceHolderID="LitiumStudioContentHeading">
    <img src="Images/transparent.gif" alt="" class="litIconCircularAddressLists" /><Foundation:ModuleString ID="ModuleString2" Name="AddressListFailedPhoneNumbers" runat="server" /> "<asp:Label runat="server" id="mc_labelListName" />"
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <asp:DataList Runat="server" ID="mc_dgrdFailedAddresses">
	        <ItemTemplate>
		        <div class="litText"><%#(Container.DataItem as Litium.Foundation.Modules.Newsletter.AddressLists.AddressListMember).PhoneNumber%></div>
	        </ItemTemplate>
        </asp:DataList>
        <asp:Panel id="c_panelMajorError" visible="False" runat="server"> 
            <fieldset class="litErrorFieldset"><legend class="litErrorFieldsetMsg"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><b><Foundation:SystemString Name="UnknownError" runat="server" ID="Systemstring9"/></b></legend><img src="Images/transparent.gif" width="5" alt="" /><br />
                <asp:Label id="c_labelMajorError" runat="server"/>
            </fieldset>
        </asp:Panel>
    </div>
    <script type="text/javascript">
        var submitObject = null;
        var cancelObject = document.getElementById("<% Response.Write(mc_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
</asp:Content>