<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_ProductCatalog_SettingsDefinitionView, Litum.Studio.Web" enableeventvalidation="false" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>


<%@ Register TagPrefix="productcatalog" TagName="DefinitionFieldAlternativeDialog" src="Framework/DefinitionFieldAlternativeDialog.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemBack" runat="server"/>
	    <toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarDivider" runat="server" />
	    <toolbar:ToolbarItem OnClick="ToolbarItemEdit_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemEdit" runat="server"/>
	    <toolbar:ToolbarItem OnClick="ToolbarItemDelete_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemDelete" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
   <Foundation:ModuleString ID="ModuleString1" Name="SettingsDefinitionViewHeader" Runat="server"/>&nbsp;"<asp:Label runat="server" ID="c_labelTemplateName" />"
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
            <div class="litBoldHeader" style="margin-bottom:2px;"><Foundation:ModuleString ID="ModuleString19" Name="Relations" Runat="server"/>:</div>
            <asp:Repeater ID="c_repeaterRelationTypes" runat="server" OnItemDataBound="RepeaterRelationTypes_ItemDataBoound">
                <HeaderTemplate>
                    <table cellpadding="0" cellspacing="0" border="0" style="width:950px;">
                        <tr>
                            <th class="lsListHeader" align="left"><Foundation:ModuleString ID="ModuleString6" Name="Name" Runat="server"/></th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="litText"><asp:Literal runat="server" ID="c_name" /></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <div class="litBoldHeader" style="margin-bottom:2px;"><Foundation:ModuleString ID="ModuleString13" Name="Fields" Runat="server"/>:</div>
            <asp:Repeater ID="c_repeaterTemplates" runat="server" OnItemDataBound="RepeaterTemplates_ItemDataBound">
                <HeaderTemplate>
                    <table cellpadding="0" cellspacing="0" border="0" style="width:950px;">
                        <tr>
                            <th class="lsListHeader" align="left" style="width:60px;"><Foundation:ModuleString ID="ModuleString2" Name="Sorting" Runat="server"/></th>
                            <th class="lsListHeader" align="left" style="width:60px;"><Foundation:ModuleString ID="ModuleString3" Name="Group" Runat="server"/></th>
                            <th class="lsListHeader" align="left"><Foundation:ModuleString ID="ModuleString4" Name="FieldName" Runat="server"/></th>
                            <th class="lsListHeader" align="left" style="width:60px;"><Foundation:ModuleString ID="ModuleString5" Name="Type" Runat="server"/></th>
                            <th class="lsListHeader" style="width:80px;"><Foundation:ModuleString ID="ModuleString6" Name="Required" Runat="server"/></th>
                            <th class="lsListHeader" style="width:80px;"><Foundation:ModuleString ID="ModuleString7" Name="VariantField" Runat="server"/></th>
                            <th class="lsListHeader" style="width:80px;"><Foundation:ModuleString ID="ModuleString9" Name="WriteProtect" Runat="server"/></th>
                            <th class="lsListHeader" style="width:100px;"><Foundation:ModuleString ID="ModuleString10" Name="HandleMultiLanguages" Runat="server"/></th>
                            <th class="lsListHeader" style="width:80px;"><Foundation:ModuleString ID="ModuleString11" Name="DefinitionDisplayName" Runat="server"/></th>
                            <th class="lsListHeader" style="width:80px;"><Foundation:ModuleString ID="ModuleString12" Name="DefinitionDisplayImage" Runat="server"/></th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="litText"><%#DataBinder.Eval(Container.DataItem, "Index")%></td>
                        <td class="litText"><%#DataBinder.Eval(Container.DataItem, "Group")%>&nbsp;</td>
                        <td class="litBoldText"><%#DataBinder.Eval(Container.DataItem, "Name")%></td>
                        <td class="litText"><asp:Label runat="server" ID="c_fieldDefinitionType" /></td>
                        <td class="litText" align="center"><asp:Label runat="server" ID="labelRequired" /></td>
                        <td class="litText" align="center"><asp:Label runat="server" ID="labelVariantField" /></td>
                        <td class="litText" align="center"><asp:Label runat="server" ID="labelWriteProtected" /></td>
                        <td class="litText" align="center"><asp:Label runat="server" ID="labelLanguageDependent" /></td>
                        <td class="litText" align="center"><asp:Label runat="server" ID="labelIsDisplayName" /></td>
                        <td class="litText" align="center"><asp:Label runat="server" ID="labelIsDisplayImage" /></td>
                    </tr>
                    <tr runat="server" visible="false" id="c_tableRow">
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="9" class="litListContent"><img src="Images/node.gif" /><a href="#" runat="server" id="c_linkAlternative"><Foundation:ModuleString ID="ModuleString14" Name="Alternative" Runat="server"/></a><asp:Label runat="server" id="c_labelDefaultValue" visible="false" /></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
     </div>
    <script type="text/javascript">
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemEdit.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemBack.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
    
    <productcatalog:DefinitionFieldAlternativeDialog id="dfinitionfieldalternativedialog" runat="server"/>
    
</asp:Content>
