<%@ page language="C#" masterpagefile="~/LitiumStudio/Newsletter/Framework/Base1.master" inherits="LitiumStudio_Newsletter_AddressesCreate1, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Newsletter/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbar" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="mc_toolbarItemCancel" runat="server"/>	
	    <toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
	    <toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="mc_toolbarItemSave" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" runat="Server" ContentPlaceHolderID="LitiumStudioContentHeading">
	    <img src="Images/transparent.gif" alt="" class="litIconCircularAddressLists" /><Foundation:ModuleString ID="ModuleString1" Name="AddressCreatePageSubHeader1" runat="server" />&nbsp;<span style="font-weight:normal;">(<Foundation:ModuleString Name="AddressCreatePageSubHeader2" runat="server" ID="Systemstring2"/>)</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td colspan="2" class="litText"><Foundation:ModuleString ID="ModuleString2" Name="AddressCreatePage1Description1" runat="server" /><br /><br /></td>
            </tr>
            <tr>
                <td colspan="2" class="litBoldText"><Foundation:ModuleString ID="ModuleString3" Name="EmailAddress" runat="server" /></td>
            </tr>
            <tr>
	            <td><asp:TextBox cssclass="litInputText" id="mc_textBoxAddress" runat="server"/></td>
	            <td style="padding-left:10px;"><asp:CustomValidator ID="mc_validatorAddress" ValidateEmptyText="true" runat="server" ControlToValidate="mc_textBoxAddress" OnServerValidate="ValidateAddress" cssClass="litErrorMsg"/></td>
	        </tr>
        </table><br />
        <asp:Panel id="c_panelMajorError" visible="False" runat="server"> 
            <fieldset class="litErrorFieldset"><legend class="litErrorFieldsetMsg"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><b><Foundation:SystemString Name="UnknownError" runat="server" ID="Systemstring5"/></b></legend><img src="Images/transparent.gif" width="5" alt="" /><br />
                <asp:Label id="c_labelMajorError" runat="server"/>
            </fieldset>
        </asp:Panel>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(mc_textBoxAddress.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(mc_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>