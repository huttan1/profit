<%@ page language="C#" masterpagefile="~/LitiumStudio/Relations/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_Relations_EditMultiAssign, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Relations/Framework/Base.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarRight" runat="server" >
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCancel" OnClick="ToolbarItemCancel_Click" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemSave" OnClick="ToolbarItemSave_Click" runat="server"/>
	</toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
     <img src="Images/transparent.gif" alt="" class="litIconRelationsPerson" /><asp:Label runat="server" ID="c_labelHeader" />  
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentRight" runat="Server">
    <script type="text/javascript" src="Scripts/listBoxSelection.js"></script>
    <div class="lsContentScroll">
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="litBoldText"><Foundation:ModuleString ID="ModuleString1" Name="AvailableGroups" runat="server" />:</td>
                <td>&nbsp;</td>
                <td class="litBoldText"><Foundation:ModuleString ID="ModuleString2" Name="GroupsOfThePerson" runat="server" />:</td>
            </tr>
            <tr>
                <td><asp:ListBox Runat="server" ID="c_listBoxGroupExistingItems" Rows="13" SelectionMode="Multiple" CssClass="litInputSelect340"/></td>
                <td>
                    <input id="c_buttonGroupAdd" runat="server" type="button" class="litInputButton litInputButtonAdd" /><br /><br />
                    <input id="c_buttonGroupRemove" runat="server" type="button" class="litInputButton litInputButtonRemove" />
                    <input id="c_hiddenGroupSelectedItems" runat="server" type="hidden" />
                </td>
                <td><asp:ListBox Runat="server" ID="c_listBoxGroupSelectedItems" Rows="13" SelectionMode="Multiple" CssClass="litInputSelect340"/></td>
            </tr>
        </table>
        <table id="c_tableOrganization" runat="server" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;">
            <tr>
                <td class="litBoldText"><Foundation:ModuleString ID="ModuleString3" Name="AvailableOrganizations" runat="server" />:</td>
                <td>&nbsp;</td>
                <td class="litBoldText"><Foundation:ModuleString ID="ModuleString4" Name="OrganizationsOfThePerson" runat="server" />:</td>
            </tr>
            <tr>
                <td><asp:ListBox Runat="server" ID="c_listBoxOrgExistingItems" Rows="13" SelectionMode="Multiple" CssClass="litInputSelect340"/></td>
                <td>
                    <input id="c_buttonOrgAdd" runat="server" type="button" class="litInputButton litInputButtonAdd" /><br /><br />
                    <input id="c_buttonOrgRemove" runat="server" type="button" class="litInputButton litInputButtonRemove" />
                    <input id="c_hiddenOrgSelectedItems" runat="server" type="hidden" />
                </td>
                <td><asp:ListBox Runat="server" ID="c_listBoxOrgSelectedItems" Rows="13" SelectionMode="Multiple" CssClass="litInputSelect340"/></td>
            </tr>
        </table>
    </div>
</asp:Content>