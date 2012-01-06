<%@ page language="C#" masterpagefile="~/LitiumStudio/Newsletter/Framework/Base1.master" inherits="LitiumStudio_Newsletter_SMSCreate1, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Newsletter/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbar" runat="server" >
        <toolbar:ToolbarItem OnClick="ToolbarItemCreateAbort_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateAbort" runat="server"/>	
		<toolbar:DividerItem ID="DividerItem2" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
        <toolbar:ToolbarItem OnClick="ToolbarItemSaveAndClose_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemSaveAndClose" runat="server"/>
        <toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
        <toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemNext" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" runat="Server" ContentPlaceHolderID="LitiumStudioContentHeading">
	<img src="Images/transparent.gif" alt="" class="litIconCircularSMS" />
    <Foundation:ModuleString ID="ModuleString5" Name="SMSCreate1Header" runat="server" />&nbsp;
    <span style="font-weight:normal;">(<Foundation:ModuleString Name="SMSCreate1Steps" runat="server" ID="Systemstring2"/>)</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
	        <tr>
				<td valign="top">
				    <div class="litBoldText" style="padding-top:20px;"><Foundation:ModuleString name="Message" runat="server" ID="Propertyname6"/><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></div>
					<asp:TextBox runat="server" ID="c_textContent" TextMode="MultiLine" CssClass="litInputText" Rows="8" /> <asp:RequiredFieldValidator ID="c_validatorTextContent" runat="server" Display="Dynamic" ControlToValidate="c_textContent" CssClass="litErrorMsg" EnableClientScript="false"/>
					<br /><asp:CustomValidator OnServerValidate="TextContentValidator" ID="c_customValidatorSenderName" runat="server" Display="Dynamic" ControlToValidate="c_textContent" CssClass="litErrorMsg" />
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
        var focusObject = document.getElementById("<% Response.Write(c_textContent.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemNext.ClientID.ToString()); %>");
        var cancelObject = null;
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>