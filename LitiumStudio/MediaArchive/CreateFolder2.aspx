<%@ page language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_CreateFolder2, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/MediaArchive/Framework/Base.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <Toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbarCreate" runat="server" >
	    <Toolbar:ToolbarItem OnClick="ToolbarItemCreateAbort_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
	        Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop"
	        SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
	        ID="mc_toolbarItemCreateAbort" runat="server"/>	
	    <Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
	    <Toolbar:ToolbarItem OnClick="ToolbarItemCreatePrevious_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
	        Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft"
	        SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
	        ID="mc_toolbarItemCreatePrevious" runat="server"/>	
	    <Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem1"/>
	    <Toolbar:ToolbarItem OnClick="ToolbarItemCreateSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
	        Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue"
	        SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
	        ID="mc_toolbarItemCreateSave" runat="server"/>	
    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">    
    <Foundation:ModuleString ID="ModuleString1" Name="CreateFolderPageSubHeader" Runat="server"/> <span style="font-weight:normal;">(<Foundation:ModuleString ID="ModuleString5" Name="CreateFolderPage2SubHeader1" runat="Server"/>)</span>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
		<span class="litText"><Foundation:ModuleString Name="CreateFolderPage2Description1" runat="server" ID="Modulestring2"/><br /><br /></span>
		<table cellpadding="0" cellspacing="0" border="0" width="100%" ID="Table2">
			<tr>
				<td valign="top">
					<asp:ListBox Runat="server" ID="mc_listBoxGroup" Rows="7" AutoPostBack="True" OnSelectedIndexChanged="SelectGroup_Changed" CssClass="litInputSelect"/>
				</td>
				<td valign="top" style="width:100%; padding-left:10px;" class="litText">
					<asp:Repeater id="mc_repeaterGroupPermission" runat="server">
						<ItemTemplate>
							<asp:CheckBox Cssclass="litInputCheckbox" runat="server" ID="Checkbox1"/><br />
						</ItemTemplate>
					</asp:Repeater> 
				</td>
			</tr>
		</table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(mc_listBoxGroup.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemCreateSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(mc_toolbarItemCreateAbort.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>