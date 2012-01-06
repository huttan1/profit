<%@ page language="C#" masterpagefile="~/LitiumStudio/Newsletter/Framework/Base1.master" inherits="LitiumStudio_Newsletter_SMSCreate2, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Newsletter/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbar" runat="server" >
        <toolbar:ToolbarItem OnClick="ToolbarItemCreateAbort_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateAbort" runat="server"/>	
		<toolbar:DividerItem ID="DividerItem3" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
        <toolbar:ToolbarItem OnClick="ToolbarItemSaveAndClose_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemSaveAndClose" runat="server"/>
        <toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
        <toolbar:ToolbarItem OnClick="ToolbarItemCreatePrevious_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreatePrevious" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
        <toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemNext" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" runat="Server" ContentPlaceHolderID="LitiumStudioContentHeading">
	<img src="Images/transparent.gif" alt="" class="litIconCircularSMS" />
    <Foundation:ModuleString ID="ModuleString5" Name="SMSCreate1Header" runat="server" />&nbsp;
    <span style="font-weight:normal;">(<Foundation:ModuleString Name="SMSCreate2Steps" runat="server" ID="Systemstring2"/>)</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
	        <tr>
				<td valign="top">
				    <div class="litBoldText" style="padding-top:20px;"><Foundation:ModuleString name="DefaultSenderName" runat="server" ID="Propertyname6"/><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></div>
					<asp:TextBox runat="server" ID="c_senderName" CssClass="litInputText" /> <asp:RequiredFieldValidator ID="c_validatorSenderName" runat="server" Display="Dynamic" ControlToValidate="c_senderName" CssClass="litErrorMsg" EnableClientScript="false"/><asp:CustomValidator OnServerValidate="SenderNameValidator" ID="c_customValidatorSenderName" runat="server" Display="Dynamic" ControlToValidate="c_senderName" CssClass="litErrorMsg" />
				</td>
			</tr>
			<tr>
			    <td><br /><hr /></td>
			</tr>
			<tr>
                <td class="litBoldText"><Foundation:ModuleString ID="ModuleString3" Name="PhoneLists" runat="server" /><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></td>
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
        <asp:Panel id="c_panelMajorError" visible="False" runat="server"> 
            <fieldset class="litErrorFieldset"><legend class="litErrorFieldsetMsg"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><b><Foundation:SystemString Name="UnknownError" runat="server" ID="Systemstring5"/></b></legend><img src="Images/transparent.gif" width="5" alt="" /><br />
                <asp:Label id="c_labelMajorError" runat="server"/>
            </fieldset>
        </asp:Panel>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_senderName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemNext.ClientID.ToString()); %>");
        var cancelObject = null;
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>