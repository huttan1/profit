<%@ page language="C#" masterpagefile="~/LitiumStudio/Newsletter/Framework/Base1.master" inherits="LitiumStudio_Newsletter_AddressListsEdit1, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Newsletter/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbar" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="mc_toolbarItemCancel" runat="server"/>	
	    <toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
	    <toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="mc_toolbarItemSave" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" runat="Server" ContentPlaceHolderID="LitiumStudioContentHeading">
    <img src="Images/transparent.gif" alt="" class="litIconCircularAddressLists" /><asp:Label ID="mc_labelAddressListName" Runat="server"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td colspan="2" class="litBoldText"><Foundation:ModuleString ID="ModuleString1" Name="AddressListName" runat="server"/></td>
            </tr>
            <tr>
                <td style="padding-bottom:15px;"><asp:TextBox cssclass="litInputText" id="mc_textBoxAddressListName" runat="server"/></td>
                <td style="padding-bottom:15px;" style="padding-left:10px;" class="litErrorMsg"><asp:RequiredFieldValidator ID="mc_validatorAddressListName" runat="server" ControlToValidate="mc_textBoxAddressListName" cssClass="error"/></td>
            </tr>
            <tr>
                <td colspan="2" class="litBoldText"><Foundation:ModuleString Name="AddressListDescription" runat="server" ID="Modulestring2"/></td>
            </tr>
            <tr>
                <td style="padding-bottom:15px;"><asp:TextBox cssclass="litInputTextArea" id="mc_textBoxAddressListDescription" Rows="5" TextMode="MultiLine" runat="server"/></td>
                <td></td>
            </tr>
        </table><br />
        <asp:Panel id="c_panelMajorError" visible="False" runat="server"> 
            <fieldset class="litErrorFieldset"><legend class="litErrorFieldsetMsg"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><b><Foundation:SystemString Name="UnknownError" runat="server" ID="Systemstring5"/></b></legend><img src="Images/transparent.gif" width="5" alt="" /><br />
                <asp:Label id="c_labelMajorError" runat="server"/>
            </fieldset>
        </asp:Panel>
    </div>
    <script type="text/javascript">
        var disableSubmitObject = document.getElementById("<% Response.Write(mc_textBoxAddressListDescription.ClientID.ToString()); %>");
        var focusObject = document.getElementById("<% Response.Write(mc_textBoxAddressListName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(mc_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var srcElmnt=(window.event)?window.event.srcElement:e.target; var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13 && srcElmnt!=disableSubmitObject) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>