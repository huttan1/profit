<%@ page language="C#" masterpagefile="~/LitiumStudio/Newsletter/Framework/Base1.master" inherits="LitiumStudio_Newsletter_CircularsCreate3, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Newsletter/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbar" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemSaveAndClose_Click" CausesValidation="false" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="mc_toolbarItemSaveAndClose" runat="server"/>
	    <toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
	    <toolbar:ToolbarItem OnClick="ToolbarItemPrevious_Click" CausesValidation="false" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="mc_toolbarItemPrevious" runat="server"/>
	    <toolbar:DividerItem ID="DividerItem2" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
	    <toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="mc_toolbarItemNext" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
        <img src="Images/transparent.gif" alt="" class="litIconCircularCirculars" /><Foundation:ModuleString ID="c_header" runat="server" />&nbsp;<span style="font-weight:normal;">(<Foundation:ModuleString Name="CircularCreatePage3SubHeader2" runat="server" ID="Systemstring2"/>)</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="litBoldText"><Foundation:ModuleString ID="ModuleString3" Name="SenderName" runat="server" /><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></td>
            </tr>
            <tr>
                <td style="padding-bottom:15px;"><asp:TextBox cssclass="litInputText" id="mc_textBoxSenderName" runat="server"/> <asp:RequiredFieldValidator ID="mc_validatorSenderName" runat="server" Display="Dynamic" ControlToValidate="mc_textBoxSenderName" CssClass="litErrorMsg" /></td>
            </tr>
            <tr>
                <td class="litBoldText"><Foundation:ModuleString ID="ModuleString5" Name="SenderEmail" runat="server" /><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></td>
            </tr>
            <tr>
                <td style="padding-bottom:15px;"><asp:TextBox cssclass="litInputText" id="mc_textBoxSenderEmail" runat="server"/> <asp:CustomValidator ID="mc_validatorSenderEmail" runat="server" Display="Dynamic" ControlToValidate="mc_textBoxSenderEmail" OnServerValidate="ValidateSenderEmail" ValidateEmptyText="true" CssClass="litErrorMsg" /></td>
            </tr>
            <tr>
                <td class="litBoldText"><Foundation:ModuleString ID="ModuleString7" Name="Recipientlists" runat="server" /><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /><asp:CustomValidator ID="c_validatorCheckBoxes" runat="server" OnServerValidate="ValidateCheckBoxes" Display="Dynamic" CssClass="litErrorMsg" /></td>
	        </tr>
            <tr>
                <td>
                    <table>
                        <asp:Repeater runat="server" ID="c_addressListRepeater">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:CheckBox runat="server" ID="c_addressListCheckBox" />
                                        <asp:Label runat="server" CssClass="litText" ID="c_addressListLabel"></asp:Label>
                                        <asp:HiddenField runat="server" ID="c_addressListID" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </td>
            </tr>
        </table><br />
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById(null);
        var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemNext.ClientID.ToString()); %>");
        var cancelObject = null;
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>