<%@ page language="C#" masterpagefile="~/LitiumStudio/Relations/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_Relations_Add6, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Relations/Framework/Base.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
        <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
        <toolbar:DividerItem ID="DividerItem2" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
		<toolbar:ToolbarItem OnClick="ToolbarItemPrevious_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemPrevious" runat="server"/>
	    <toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
   	    <toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>	
	</toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
        <img src="Images/transparent.gif" alt="" class="litIconRelationsPerson" /><Foundation:ModuleString ID="ModuleString5" Name="PersonAddPageHeader" runat="server" /><span class="litTextNormalWeight">&nbsp;(<Foundation:ModuleString ID="ModuleString6" Name="PersonAddPage6SubHeader" runat="server"/>)</span>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <script type="text/javascript" src="Scripts/listBoxSelection.js"></script>
    <div class="lsContentScroll">
        <span class="litText"><Foundation:ModuleString ID="ModuleString1" Name="PersonAddPage6Description" runat="server" /><br /><br /></span>
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="litBoldText"><Foundation:ModuleString ID="ModuleString3" Name="AvailableOrganizations" runat="server" />:</td>
                <td class="litBoldText"><Foundation:ModuleString ID="ModuleString2" Name="AvailableRoles" runat="server" />:</td>
                <td>&nbsp;</td>
                <td class="litBoldText"><Foundation:ModuleString ID="ModuleString4" Name="RolesOfThePerson" runat="server" />:</td>
            </tr>
            <tr>
                <td style="padding-right:5px;"><asp:ListBox Runat="server" ID="c_listBoxExistingOrgs" Rows="13" CssClass="litInputSelect340"/></td>
                <td><asp:ListBox Runat="server" ID="c_listBoxExistingRoles" Rows="13" CssClass="litInputSelect"/></td>
                <td><input id="c_buttonAdd" runat="server" type="button" class="litInputButton litInputButtonAdd" /><br /><br />
                    <input id="c_buttonRemove" runat="server" type="button" class="litInputButton litInputButtonRemove" />
                    <input id="c_hiddenSelectedItems" runat="server" type="hidden" />
                    <input id="c_hiddenExistingItems" runat="server" type="hidden" />
                </td>
                <td><asp:ListBox Runat="server" ID="c_listBoxSelectedRoles" Rows="13" CssClass="litInputSelect"/></td>
            </tr>
        </table>
    </div>
    <Telerik:RadCodeBlock runat="server">
         <script type="text/javascript">
             addEvent(window, "load", function () {
                 SortField('<%=c_listBoxExistingOrgs.ClientID%>');
                 SortField('<%=c_listBoxExistingRoles.ClientID%>');
             });
        </script>
    </Telerik:RadCodeBlock>
</asp:Content>