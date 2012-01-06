<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_ProductCatalog_SettingsDefinitionAddEdit, Litum.Studio.Web" autoeventwireup="true" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>


<%@ Register TagPrefix="productcatalog" TagName="DefinitionFieldAlternativeDialog" src="Framework/DefinitionFieldAlternativeDialog.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		<toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
   <asp:Label runat="server" ID="c_labelTopHeader" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
            <asp:Panel runat="server" ID="c_panelStars" Visible="false" CssClass="litGuideStarsV2"/>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString1" Name="Name" Runat="server"/><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></div>
            <div style="float:left;"><asp:TextBox ID="c_textBoxTemplateName" CssClass="litInputText200" runat="server"/></div>
            <div style="float:left; padding-left:10px; padding-top:2px;">
				<asp:RequiredFieldValidator runat="server" SetFocusOnError="true" ID="RequiredFieldValidatorTemplateName" CssClass="litErrorMsg"  ControlToValidate="c_textBoxTemplateName" Display="Dynamic" />
				<asp:RegularExpressionValidator ID="LengthFieldValidatorTemplateName" runat="server"
                                    ControlToValidate="c_textBoxTemplateName"     
                                    ValidationExpression="^.{1,100}$" />  
            </div>          
            <div style="float:left; padding-left:10px; padding-top:2px;" class="litErrorMsg" runat="server" id="c_templatename_not_unique" visible="false"><img src='images/transparent.gif' style='vertical-align:middle;' class='litIconError' alt='' /><Foundation:ModuleString ID="ModuleString18" Name="ValidatorNotUniqeValue" Runat="server"/></div>
            <div style="clear:both;"></div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
            	<ContentTemplate>
                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString2" Name="Type" Runat="server"/></div>
                    <asp:DropDownList id="c_dropDownListTemplateType" AutoPostBack="true" OnSelectedIndexChanged="OnTemplateTypeChanged" CssClass="litInputSelect" runat="server" style="width:206px;"/>
                    <div style="clear:both;"></div>
                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString3" Name="Description" Runat="server"/></div>
                    <asp:TextBox ID="c_textBoxTemplateDescription" CssClass="litInputText" TextMode="MultiLine" Rows="5" runat="server"/>
                    <div style="clear:both;"></div>
                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString4" Name="TemplateToShowWith" Runat="server"/></div>
                    <asp:DropDownList id="c_dropDownListTemplateFile" CssClass="litInputSelect" runat="server" style="width:206px;"/>
                    <asp:Label CssClass="litErrorMsg" ID="c_labelRequiredTemplateFile" runat="server" Visible="false" />
                    <div style="clear:both;"></div>
                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString19" Name="AddRelation" Runat="server"/></div>
                    <asp:DropDownList id="c_dropDownListRelationTypes" CssClass="litInputSelect" runat="server" style="width:206px;float:left;"/>
                    <asp:Button runat="server" onClick="ButtonAddRelationType_onClick" ID="c_buttonAddRelationType" CssClass="litInputButton" style="float:left; width:auto;  margin-left:10px;  margin-top:-2px;" />
                    <div style="clear:both;"></div>
                    <div style="height:5px;"></div>
                    <asp:Repeater ID="c_repeaterRelationTypes" runat="server" OnItemCommand="RepeaterRelationTypes_OnItemCommand" OnItemDataBound="RepeaterRelationTypes_ItemDataBound">
                        <HeaderTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="width:950px;">
                                <tr>
                                    <th class="lsListHeader" align="left"><Foundation:ModuleString ID="ModuleString6" Name="Relation" Runat="server"/></th>
                                    <th style="width:16px;">&nbsp;</th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="litText"><asp:Literal runat="server" ID="c_name" /></td>
                                <td style="padding:0px;"><asp:ImageButton CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ID")%>' ImageUrl="Images/transparent.gif" Runat="server" ID="c_buttonDelete" CausesValidation="False" align="AbsMiddle" CssClass="litIconDelete" BorderWidth="0" /></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div style="clear:both;"></div>
                    <div style="height:20px;"></div>
                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString5" Name="AddDefinitionField" Runat="server"/></div>
                    <asp:DropDownList id="c_dropDownListTemplateFields" CssClass="litInputSelect" runat="server" style="width:206px;float:left;"/>
                    <ComponentArt:ComboBox ID="c_TemplateFields" runat="server"
                        AutoHighlight="false" Visible="false"
                        AutoComplete="true"
                        AutoFilter="true"
                        DataTextField="CountryName"
                        DataValueField="CountryCode"
                        CssClass="comboBox"
                        HoverCssClass="comboBoxHover"
                        FocusedCssClass="comboBoxHover"
                        TextBoxCssClass="comboTextBox"
                        TextBoxHoverCssClass="comboBoxHover"
                        DropDownCssClass="comboDropDown"
                        ItemCssClass="comboItem"
                        ItemHoverCssClass="comboItemHover"
                        SelectedItemCssClass="comboItemHover"
                        DropDownResizingMode="Corner"
                        DropHoverImageUrl="~/LitiumStudio/Images/combobox/drop_hover.gif"
                        DropImageUrl="~/LitiumStudio/Images/combobox/drop.gif"
                        Width="206" style="float:left;">
                    </ComponentArt:ComboBox>
                    <asp:Button runat="server" onClick="ButtonAddField_onClick" ID="c_buttonAddField" CssClass="litInputButton" style="float:left; width:auto;  margin-left:10px;  margin-top:-2px;"/>
                    <div style="float:left; padding-left:10px; padding-top:2px;">
                        <asp:Label CssClass="litErrorMsg" ID="c_labelRequiredSave" runat="server" Visible="false" />
                        <asp:Label CssClass="litErrorMsg" ID="c_labelRequiredSelected" runat="server" Visible="false" />
                    </div>
                    <div style="clear:both; height:5px;"></div>
                    <asp:Repeater ID="c_repeaterTemplates" runat="server" OnItemCommand="RepeaterTemplates_OnItemCommand" OnItemDataBound="RepeaterTemplates_ItemDataBound">
                        <HeaderTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="width:950px;">
                                <tr>
                                    <th class="lsListHeader" align="left" style="width:60px;"><Foundation:ModuleString ID="ModuleString6" Name="Sorting" Runat="server"/></th>
                                    <th class="lsListHeader" align="left"><Foundation:ModuleString ID="ModuleString7" Name="Group" Runat="server"/></th>
                                    <th class="lsListHeader" align="left"><Foundation:ModuleString ID="ModuleString8" Name="FieldName" Runat="server"/></th>
                                    <th class="lsListHeader" align="left" style="width:60px;"><Foundation:ModuleString ID="ModuleString9" Name="Type" Runat="server"/></th>
                                    <th class="lsListHeader" style="width:80px;"><Foundation:ModuleString ID="ModuleString10" Name="Required" Runat="server"/></th>
                                    <th class="lsListHeader" style="width:80px;" runat="server" id="c_vgf"><Foundation:ModuleString ID="ModuleString11" Name="VariantField" Runat="server"/></th>
                                    <th class="lsListHeader" style="width:80px;"><Foundation:ModuleString ID="ModuleString13" Name="WriteProtect" Runat="server"/></th>
                                    <th class="lsListHeader" style="width:100px;"><Foundation:ModuleString ID="ModuleString14" Name="HandleMultiLanguages" Runat="server"/></th>
                                    <th class="lsListHeader" style="width:80px;"><Foundation:ModuleString ID="ModuleString15" Name="DefinitionDisplayName" Runat="server"/></th>
                                    <th class="lsListHeader" style="width:80px;"><Foundation:ModuleString ID="ModuleString16" Name="DefinitionDisplayImage" Runat="server"/></th>
                                    <th class="lsListHeader" style="width:16px;">&nbsp;</th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><asp:TextBox ID="textBoxIndex" runat="server" CssClass="litInputText" style="width:50px;"/><asp:HiddenField runat="server" ID="c_hiddenFieldID" Value='<%#DataBinder.Eval(Container.DataItem, "FieldDefinitionID")%>' /></td>
                                <td><asp:TextBox ID="textBoxGroup" runat="server" CssClass="litInputText" maxlength="45" style="width:100px;"/></td>
                                <td class="litBoldText"><%#DataBinder.Eval(Container.DataItem, "Name")%></td>
                                <td class="litText"><asp:Label runat="server" ID="c_fieldDefinitionType" /></td>
                                <td class="litText" align="center"><asp:Label runat="server" ID="labelRequired" /></td>
                                <td class="litText" align="center" runat="server" id="c_vgf"><asp:CheckBox runat="server" ID="chkIsVariantGroupField" /></td>
                                <td class="litText" align="center"><asp:Label runat="server" ID="labelWriteProtected" /></td>
                                <td class="litText" align="center"><asp:Label runat="server" ID="labelLanguageDependent" /></td>
                                <td class="litText" align="center"><asp:Literal runat="server" ID="literalIsDisplayName" /></td>
                                <td class="litText" align="center"><asp:Literal runat="server" ID="literalIsDisplayImage" /></td>
                                <td style="padding:0px;"><asp:ImageButton CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "FieldDefinitionID")%>' ImageUrl="Images/transparent.gif" Runat="server" ID="c_buttonDelete" CausesValidation="False" align="AbsMiddle" CssClass="litIconDelete" BorderWidth="0" /></td>
                            </tr>
                            <tr runat="server" visible="false" id="c_tableRow">
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td colspan="10" class="litListContent"><img src="Images/node.gif" /><a href="#" runat="server" id="c_linkAlternative"><Foundation:ModuleString ID="ModuleString20" Name="Alternative" Runat="server"/></a><asp:Label runat="server" id="c_labelDefaultValue" visible="false" /></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div style="clear:both;"></div>
                    <div class="litText" style="margin-top:5px;"><Foundation:ModuleString ID="ModuleString17" Name="DefinitionFieldsDescription" Runat="server"/></div>
                </ContentTemplate>
            </asp:UpdatePanel>
            
     </div>
	 <Telerik:RadCodeBlock runat="server">
    <script type="text/javascript">
    	function validateNotDisplayName(field) {
    		var c = $get(field);
    		if (c && c.checked) {
    			alert("<Foundation:ModuleString Name="VariantGroupFieldCantBeDisplayName" Runat="server"/>");
    			return false;
    		}
    		return true;
    	}

        var focusObject = document.getElementById("<% Response.Write(c_textBoxTemplateName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
	 </Telerik:RadCodeBlock>
    
    <productcatalog:DefinitionFieldAlternativeDialog id="dfinitionfieldalternativedialog" runat="server"/>
    
</asp:Content>
