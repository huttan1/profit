<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_Relations_Settings, Litum.Studio.Web" enableeventvalidation="false" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="mc_toolbar" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemSave" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <Foundation:ModuleString ID="ModuleString7" Name="SettingsPageHeader" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <script type="text/javascript" src="Scripts/listBoxSelection.js"></script>
    <div class="lsContentScroll">
        <span class="litText"><Foundation:ModuleString ID="ModuleString4" Name="SettingsPageDescription" runat="server" /><br /><br /></span>
        <table border="0" cellspacing="0" cellpadding="5">
		    <tr>
			    <td style="padding-left:0px;" valign="top">
			        <span class="litBoldText"><Foundation:ModuleString ID="ModuleString1" Name="AvailableFields" runat="server" />:<br /></span>
			        <asp:ListBox Runat="server" ID="mc_listBoxExistingItems" style="width:230px;" Rows="20" SelectionMode="Multiple" CssClass="litInputSelect"/>
			    </td>
			    <td>
			        <input id="mc_buttonAdd" runat="server" type="button" class="litInputButton litInputButtonAdd" /><br /><br />
				    <input id="mc_buttonRemove" runat="server" type="button" class="litInputButton litInputButtonRemove" />
				    <input id="mc_hiddenSelectedItems" runat="server" type="hidden" />
			    </td>
			    <td valign="top">
			        <span class="litBoldText"><Foundation:ModuleString ID="ModuleString2" Name="FieldsInTheList" runat="server" />:<br /></span>
			        <asp:ListBox Runat="server" ID="mc_listBoxSelectedItems" style="width:230px;" Rows="20" SelectionMode="Multiple" CssClass="litInputSelect" />
			    </td>
			    <td>
			        <input id="mc_buttonUp" runat="Server" type="button" class="litInputButton" style="width:30px;" /><br /><br />
			        <input id="mc_buttonDown" runat="Server" type="button" class="litInputButton" style="width:30px;" />
			    </td>
		    </tr>
	    </table>
    </div>
    <Telerik:RadCodeBlock runat="server">
         <script type="text/javascript">
             addEvent(window, "load", function () {
                SortField('<%=mc_listBoxExistingItems.ClientID%>');
            });
            var focusObject = document.getElementById("<% Response.Write(mc_listBoxExistingItems.ClientID.ToString()); %>");
            if(focusObject && !focusObject.disabled) {focusObject.focus();}
        </script>
    </Telerik:RadCodeBlock>
</asp:Content>