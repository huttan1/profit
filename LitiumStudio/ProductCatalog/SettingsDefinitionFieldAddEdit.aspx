<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_ProductCatalog_SettingsDefinitionFieldAddEdit, Litum.Studio.Web" enableeventvalidation="false" validaterequest="false" %>

<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="c_toolbar" runat="server">
		<Toolbar:ToolbarItem ID="c_toolbarItemAbort" OnClick="ToolbarItemAbortClick" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server"
			ID="Divideritem2" />
		<Toolbar:ToolbarItem ID="c_toolbarItemSave" OnClick="ToolbarItemSaveClick" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<asp:Label ID="c_labelTopHeader" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
		<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
			<contenttemplate>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString1" Name="FieldName" Runat="server"/><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></div>
            <div style="float:left;"><asp:TextBox ID="c_textBoxFieldDefinitionName" runat="server" CssClass="litInputText200" /></div>
            <div style="float:left; padding-left:10px; padding-top:2px;">
				<asp:RequiredFieldValidator runat="server" SetFocusOnError="true" CssClass="litErrorMsg" ID="c_requiredFieldValidatorFieldDefinitionName" ControlToValidate="c_textBoxFieldDefinitionName" Display="Dynamic" />
				<asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorFieldDefinitionName" ControlToValidate="c_textBoxFieldDefinitionName" ValidationExpression="[^<>\']*">
					<img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" />
					<Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="SystemString1"/>
				</asp:RegularExpressionValidator>
				<asp:RegularExpressionValidator ID="c_lengthFieldValidatorTemplateName" runat="server"
                                    ControlToValidate="c_textBoxFieldDefinitionName"     
                                    ValidationExpression="^.{1,100}$" />  
            </div>
            <div style="float:left; padding-left:10px; padding-top:2px;" class="litErrorMsg" runat="server" id="c_definitionname_not_unique" visible="false"><img src='images/transparent.gif' style='vertical-align:middle;' class='litIconError' alt='' /><Foundation:ModuleString ID="ModuleString18" Name="ValidatorNotUniqeValue" Runat="server"/></div>
            <div style="clear:both;"></div>
            <div style="float:left; margin-top:15px;"><asp:PlaceHolder ID="c_placeHolderFieldNameLanguages" runat="server"></asp:PlaceHolder></div>
			<div style="clear:both;"></div>
            <div class="litText" style="float:left; margin-top:10px; margin-bottom:10px;">              
				<Foundation:ModuleString ID="ModuleString13" Name="FieldNameDescription" Runat="server"/>
            </div>
            <div style="clear:both;"></div>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString11" Name="ImportFieldElement" Runat="server"/></div>
            <div style="float:left;"><asp:TextBox ID="c_textboxImportName" runat="server" CssClass="litInputText200" /></div>
             <div style="float:left; padding-left:10px; padding-top:2px;">
             <asp:RegularExpressionValidator ID="c_lengthFieldValidatorImportName" runat="server"
                                    ControlToValidate="c_textboxImportName"     
                                    ValidationExpression="^.{1,100}$" />  
            </div>
            <div style="clear:both;"></div>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString2" Name="Type" Runat="server"/><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></div>
            <asp:ListBox ID="c_dropDownListFieldDefinitionType" AutoPostBack="True" OnSelectedIndexChanged="DropDownListFieldDefinitionType_OnSelectedIndexChanged" runat="server" CssClass="litInputSelect" style="width:206px;" Rows="1" /><br />
            <div style="height:15px;"></div>
            <asp:Checkbox ID="c_checkBoxDefinitionRequired" runat="server" CssClass="litBoldText" />
            <div style="height:5px;"></div>
            <asp:Checkbox ID="c_checkBoxDefinitionInternal" runat="server" CssClass="litBoldText" />
            <div style="height:5px;"></div>
            <asp:Checkbox ID="c_checkBoxDefinitionSearchable" runat="server" CssClass="litBoldText" />
            <div style="height:5px;"></div>
            <asp:Checkbox ID="c_checkBoxDefinitionWriteProtected" runat="server" CssClass="litBoldText" />
            <div style="height:5px;"></div>
            <asp:Checkbox ID="c_checkBoxDefinitionLanguageDependent" runat="server" CssClass="litBoldText" />
            <div style="height:15px;"></div>
            <asp:Checkbox ID="c_checkBoxDefinitionLanguageDefaultValues" AutoPostBack="True" OnCheckedChanged="CheckBoxDefinitionLanguageDefaultValues_OnCheckedChanged" runat="server" CssClass="litBoldText" />
            <asp:Label CssClass="litErrorMsg" ID="c_labelRequiredSave" runat="server"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString ID="ModuleString9" Name="ValidatorSaveDefinitionFieldBeforeAdd" Runat="server"/></asp:Label>
            <asp:Label CssClass="litErrorMsg" ID="c_labelRequiredDefaultValueSelected" runat="server" Visible="false"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString ID="ModuleString10" Name="ValidatorDefinitionFieldDefault" Runat="server"/></asp:Label>

            <div style="height:5px;"></div>
            <asp:PlaceHolder ID="c_placeHolderDefaultValues" Runat="server" Visible="false">
                <div class="litListAreaV2" style="float:left;">
                    <table cellpadding="0" cellspacing="0" border="0" style="width:auto;">
                        <tr>
                            <th class="lsListHeader" align="left" style="width:60px;"><Foundation:ModuleString ID="ModuleString5" Name="Sorting" Runat="server"/></th>
                            <th class="lsListHeader" align="left" style="width:100px;"><Foundation:ModuleString ID="ModuleString6" Name="Value" Runat="server"/></th>
                            <asp:Repeater ID="c_repeaterLangugesTableHeader" runat="server">
                                <ItemTemplate>
                                    <th class="lsListHeader" align="left"><%#DataBinder.Eval(Container.DataItem, "Name") %></th>
                                </ItemTemplate>
                            </asp:Repeater>
                            <th class="lsListHeader" style="width:100px;"><Foundation:ModuleString ID="ModuleString7" Name="Default" Runat="server"/></th>
                            <th style="width:32px;">&nbsp;</th>
                        </tr>
                        <asp:Repeater ID="c_repeaterDefaultValues" OnItemCommand="RepeaterDefaultValues_OnItemCommand" OnItemDataBound="RepeaterDefaultValuesItemDataBound" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><asp:TextBox ID="c_textBoxSortOrder" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "SortOrder") %>' CssClass="litInputText" style="width:25px;" /><asp:HiddenField runat="server" ID="c_hiddenFieldDefaultValueId" Value='<%#DataBinder.Eval(Container.DataItem, "ID") %>' /></td>
                                    <td>
                                        <asp:TextBox ID="c_textBoxDefaultValue" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Value") %>' CssClass="litInputText100" />
                                        <asp:RegularExpressionValidator display="dynamic" SetFocusOnError="true" runat="server"  endabled="false" cssclass="litErrorMsg" id="c_regexpvalidator"/><asp:RequiredFieldValidator display="dynamic" SetFocusOnError="true" runat="server" endabled="false" cssclass="litErrorMsg" id="c_reqvalvalidator" />
                                    </td>
                                    <asp:Repeater ID="c_repeaterDefaultValuesLanguages" OnItemDataBound="RepeaterDefaultValuesLanguagesItemDataBound" runat="server">
                                        <ItemTemplate>
                                            <td>
                                                <asp:TextBox ID="c_DefaultValuesLanguages" runat="server" CssClass="litInputText100" /><asp:HiddenField runat="server" ID="c_hiddenFieldLanguageId" Value='<%#DataBinder.Eval(Container.DataItem, "ID") %>' />
                                            </td>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <td align="center"><asp:Literal runat="server" ID="literalSelectedDefaultValue" /></td>
                                    <td style="padding:0px;"><asp:ImageButton CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "Id")%>' ImageUrl="Images/transparent.gif" Runat="server" ID="c_buttonDelete" CausesValidation="False" align="AbsMiddle" CssClass="litIconDelete" BorderWidth="0" /><asp:ImageButton CommandName="Add" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "Id")%>' ImageUrl="Images/transparent.gif" Runat="server" ID="c_buttonAdd" CausesValidation="true" align="AbsMiddle" CssClass="litIconAdd" BorderWidth="0" /></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
                <div style="clear:both;"></div>
                <div class="litText" style="margin-top:5px;width:700px;"><Foundation:ModuleString ID="ModuleString8" Name="AternativeDescription" Runat="server"/></div>
                <div class="litText" style="margin-top:10px;width:700px;"><Foundation:ModuleString ID="ModuleString12" Name="AternativeDescription2" Runat="server"/></div>
		</asp:PlaceHolder>
		</contenttemplate>
		</asp:UpdatePanel>
	</div>
	<script type="text/javascript">
		var focusObject = document.getElementById("<% Response.Write(c_textBoxFieldDefinitionName.ClientID.ToString()); %>");
		var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
		var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemAbort.ClientID.ToString()); %>");
		document.onkeypress = function (e) { var key = (window.event) ? window.event.keyCode : e.keyCode; if (key == 27) simulateClick(cancelObject); else if (key == 13) simulateClick(submitObject); }
		if (focusObject && !focusObject.disabled) { focusObject.focus(); }
	</script>
</asp:Content>
