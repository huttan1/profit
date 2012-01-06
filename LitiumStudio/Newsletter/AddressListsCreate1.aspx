<%@ page language="C#" masterpagefile="~/LitiumStudio/Newsletter/Framework/Base1.master" inherits="LitiumStudio_Newsletter_AddressListsCreate1, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Newsletter/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbar" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="mc_toolbarItemCancel" runat="server"/>	
	    <toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
	    <toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="mc_toolbarItemSave" runat="server"/>	
	    <toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem3"/>
        <toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemNext" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" runat="Server" ContentPlaceHolderID="LitiumStudioContentHeading">
        <img src="Images/transparent.gif" alt="" class="litIconCircularAddressLists" /><Foundation:ModuleString ID="ModuleString1" Name="AddressListCreatePageSubHeader1" runat="server" />&nbsp;<span style="font-weight:normal;">(<Foundation:ModuleString Name="AddressListCreateSteps1" runat="server" ID="Systemstring2"/>)</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="3" class="litBoldText"><Foundation:ModuleString ID="ModuleString3" Name="AddressListName" runat="server" /><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></td>
			</tr>
			<tr>
				<td style="width:430px;" colspan="2"><asp:TextBox Width="430px" CssClass="litInputText" id="mc_textBoxAddressListName" runat="server"/></td>
				<td style="width:200px; padding-left:5px;"> <asp:RequiredFieldValidator ID="c_validatorAddressListName" runat="server" Display="Dynamic" ControlToValidate="mc_textBoxAddressListName" CssClass="litErrorMsg" /></td>
			</tr>
			<tr>
				<td colspan="3" class="litBoldText" style="padding-top:15px;"><Foundation:ModuleString Name="AddressListDescription" runat="server" ID="Modulestring10"/></td>
			</tr>
			<tr>
				<td colspan="3" style="padding-bottom: 35px;"><asp:TextBox Width="430px" cssclass="litInputTextArea" id="mc_textBoxAddressListDescription" Rows="5" TextMode="MultiLine" runat="server"/></td>
			</tr>
			<tr>
				<td style="padding-right: 5px;"><asp:RadioButton runat="server" ID="c_fromInputField" onclick="handleRadioButtons(this)" GroupName="CreateListSelection" Checked="true" CssClass="litText" /></td>
				<td colspan="2" class="litBoldText"><asp:Label runat="server" AssociatedControlID="c_fromInputField" ID="label1"><Foundation:ModuleString Name="AddressListEmailAddresses" runat="server" ID="Modulestring5" /></asp:Label></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2" class="litText"><Foundation:ModuleString Name="AddressListCreatePage1Description2" runat="server" ID="Modulestring4" /></td>
			</tr>
			<tr>
				<td></td>
				<td style="padding-bottom: 15px;"><asp:TextBox cssclass="litInputText" TextMode="MultiLine" Rows="5" id="mc_textBoxEmailAddresses" runat="server"/></td>
				<td style="padding-left:5px;"><asp:CustomValidator ID="mc_validatorEmailAddresses" runat="server" OnServerValidate="ValidateEmailAddresses" cssClass="litErrorMsg"/></td>
			</tr>
			<tr>
				<td><asp:RadioButton runat="server" ID="c_fromTextFile" onclick="handleRadioButtons(this)" GroupName="CreateListSelection" CssClass="litText" /></td>
				<td colspan="2" class="litBoldText"><asp:Label runat="server" AssociatedControlID="c_fromTextFile" ID="label2"><Foundation:ModuleString Name="AddressListTextFile" runat="server" ID="Modulestring7" /></asp:Label></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2" class="litText"><Foundation:ModuleString Name="AddressListCreatePage1Description3" runat="server" ID="Modulestring6" /></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2" style="padding-bottom: 15px;"><input class="litInputFile" id="mc_inputTextFile" type="file" size="63" runat="server" /></td>
			</tr>
		  </table>
		<br />
		<asp:Panel id="c_panelMajorError" visible="False" runat="server"> 
			<fieldset class="litErrorFieldset"><legend class="litErrorFieldsetMsg"><img src="~/LitiumStudio/Newsletter/Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><b><Foundation:SystemString Name="UnknownError" runat="server" ID="Systemstring5"/></b></legend><img src="~/LitiumStudio/Newsletter/Images/transparent.gif" width="5" alt="" /><br />
				<asp:Label id="c_labelMajorError" runat="server"/>
			</fieldset>
		</asp:Panel>
    </div>
    <script type="text/javascript">
        function handleRadioButtons(obj){
            if (obj==document.getElementById("<%Response.Write(c_fromInputField.ClientID.ToString());%>")){
                document.getElementById("<%Response.Write(mc_textBoxEmailAddresses.ClientID.ToString());%>").disabled=false;
                document.getElementById("<%Response.Write(mc_inputTextFile.ClientID.ToString());%>").disabled=true;
            }
            else if (obj==document.getElementById("<% Response.Write(c_fromTextFile.ClientID.ToString()); %>")){
                document.getElementById("<% Response.Write(mc_textBoxEmailAddresses.ClientID.ToString()); %>").disabled=true;
                document.getElementById("<% Response.Write(mc_inputTextFile.ClientID.ToString()); %>").disabled=false;
            }
        }
        var disableSubmitObject = document.getElementById("<% Response.Write(mc_textBoxEmailAddresses.ClientID.ToString()); %>");
        var focusObject = document.getElementById("<% Response.Write(mc_textBoxAddressListName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(mc_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var srcElmnt=(window.event)?window.event.srcElement:e.target; var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13 && srcElmnt!=disableSubmitObject) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>