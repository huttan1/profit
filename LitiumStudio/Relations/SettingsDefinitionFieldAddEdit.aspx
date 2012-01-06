<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_Relations_SettingsDefinitionFieldAddEdit, Litum.Studio.Web" validaterequest="false" %>

<%@ Register assembly="Litum.Studio.Web"  TagPrefix="FieldDefinitionAdmin" Namespace="Litium.Studio.UI.Relations.FieldTemplates.WebControls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
	    <toolbar:ToolbarItem ID="c_toolbarItemAbort" OnClick="ToolbarItemAbort_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
		<toolbar:ToolbarItem ID="c_toolbarItemSave" OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="server">
	<asp:Label ID="c_labelTopHeader" Runat="server"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
		<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString1" Name="LabelFieldTemplateName" runat="server" /><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
		<div style="float:left;"><asp:TextBox cssclass="litInputText200" id="c_textBoxFieldName" runat="server"/></div>
		<div style="float:left; padding-left:10px; padding-top:2px;"><asp:CustomValidator SetFocusOnError="true" ID="c_validatorFieldTemplateName" runat="server" EnableClientScript="true" Display="dynamic" OnServerValidate="ValidateFieldDefinitionName" ControlToValidate="c_textBoxFieldName" ValidateEmptyText="true" CssClass="litErrorMsg" /></div>
		<div style="float:left; padding-left:10px; padding-top:2px;"><asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorFolderName" ControlToValidate="c_textBoxFieldName" ValidationExpression="[^<>\']*"><img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" /><Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="Modulestring18"/></asp:RegularExpressionValidator></div>
		<div style="float:left; padding-left:10px; padding-top:2px;">
            <asp:RegularExpressionValidator ID="c_lengthFieldValidatorName" runat="server"
                                    ControlToValidate="c_textBoxFieldName"     
                                    ValidationExpression="^.{1,100}$" />  
        </div>
		<div style="clear:both;"></div>
		
		<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString3" Name="LabelSelectDefinitionType" runat="server" /><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
		<div style="float:left;"><asp:DropDownList id="c_dropDownListFieldDefinitions" OnSelectedIndexChanged="DropDownListFieldDefinitions_SelectedIndexChanged" AutoPostBack="true" CssClass="litInputSelect" runat="server" style="width:206px;"/></div>
		<div style="float:left; padding-left:10px; padding-top:2px;"><asp:CustomValidator SetFocusOnError="true" ID="c_customValidatorType" Display="dynamic" runat="server" ControlToValidate="c_dropDownListFieldDefinitions" OnServerValidate="ValidateFieldType" ValidateEmptyText="true" CssClass="litErrorMsg" /></div>
		<div style="clear:both;"></div>
		
		<asp:PlaceHolder ID="c_placeHolderField" runat="server" Visible="false">
			<asp:Panel runat="server" ID="c_panelStars" Visible="false" CssClass="litGuideStarsV2"/>
			
			<div class="litBoldHeader"><Foundation:ModuleString Name="LabelAdminGUIStatus" runat="server" /></div>
			<asp:DropDownList id="c_dropDownAdminGUIStatus" cssclass="litInputSelect" runat="server" style="width:206px;"/>
			
			<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString5" Name="LabelGUIStatus" runat="server"/></div>
			<asp:DropDownList id="c_dropDownGUIStatus" cssclass="litInputSelect" runat="server" style="width:206px;"/>
			
			<div style="margin-top:15px;" class="litText"><asp:CheckBox CssClass="litInputCheckbox" id="c_checkBoxMandatory" runat="server"/></div>
			<div style="margin-top:15px;" class="litText"><asp:CheckBox CssClass="litInputCheckbox" id="c_checkBoxAlternatives" AutoPostBack="true" OnCheckedChanged="CheckBoxAlternatives_CheckedChanged" runat="server"/></div>
			<div style="clear:both; height:5px;"></div>
			
			<asp:Repeater id="c_repeaterAlternatives" OnItemCommand="RepeaterAlternatives_ItemCommand" OnItemDataBound="RepeaterAlternatives_ItemDataBound" runat="server">
				<HeaderTemplate>
					<table cellpadding="0" cellspacing="0" border="0" style="width:500px;">
						<tr>
							<th class="lsListHeader" align="left" style="width:10px;"></th>
							<th class="lsListHeader" align="left"><Foundation:ModuleString Name="LabelAlternativeValue" runat="server" /></th>
							<th class="lsListHeader" align="center" style="width:100px; text-align:center;"><Foundation:ModuleString ID="ModuleString2" Name="LabelAlternativeDefault" runat="server" /></th>
							<th class="lsListHeader" align="left" style="width:16px; padding:0px;"></th>
							<th class="lsListHeader" align="left" style="width:16px; padding:0px;"></th>
						</tr>
				</HeaderTemplate>
				<ItemTemplate>
						<tr>
							<td><span class="litText"><asp:Label id="c_labelAlternative" runat="server"/></span></td>
							<td>
								<asp:TextBox id="c_textBoxAlternativeString" cssclass="litInputText litInputFullWidth" runat="server"/>
								<table cellspacing="0" cellpadding="0" border="0" style="width:100px;" id="c_tableAlternativeDateTime" runat="server" visible="false">
									<tr>
										<td style="padding:0px;">
											<LS:DateTimeHelper ID="dateTimeHelper" runat="server" AssociatedControlID="radPickerDate" />
											<Telerik:RadDatePicker runat="server" ID="radPickerDate" Visible="false" />
										</td>
										<td style="font-size:10px; padding:0px;">&nbsp;</td>
										<td style="width:22px; padding:0px;">&nbsp;</td>
										<td style="width:22px; padding:0px;">&nbsp;</td>
									</tr>
								</table>
								<asp:RegularExpressionValidator SetFocusOnError="true" display="dynamic" runat="server"  enabled="false" cssclass="litErrorMsg" id="regexpvalidator"/><asp:RequiredFieldValidator display="dynamic" runat="server" endabled="false" cssclass="litErrorMsg" id="reqvalvalidator" />								</td>
							<td align="center"><asp:Literal ID="c_literalDefaultSelect" runat="server" /></td>
							<td style="width:16px; padding:0px;" valign="top"><asp:ImageButton id="c_imageButtonAlternativeRemove" ImageUrl="~/LitiumStudio/Relations/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" CausesValidation="false" cssclass="litIconDelete" runat="server"/></td>
							<td style="width:16px; padding:0px;" valign="top"><asp:ImageButton id="c_imageButtonAlternativeAdd" ImageUrl="~/LitiumStudio/Relations/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconAdd" runat="server"/></td>
						</tr>
				</ItemTemplate>
				<FooterTemplate>
					</table>
				</FooterTemplate>
			</asp:Repeater>
		</asp:PlaceHolder>
     </div>
     <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_textBoxFieldName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemAbort.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if (focusObject && !focusObject.disabled) { focusObject.focus(); }
    </script>
</asp:Content>
