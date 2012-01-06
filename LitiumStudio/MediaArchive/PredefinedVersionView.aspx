<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_PredefinedVersionView, Litum.Studio.Web" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">

    <script type = "text/javascript">

    // Called from the onToolbarItemSelect event of the toolbar in the current page.
    function toolbarItemSelected(sender, eventArgs)
    {
        var toolbarItem = eventArgs.get_item().get_id();  
        if(toolbarItem == 'c_toolbarItemBack')
        {
            __doPostBack('back', '');
        }
        else if(toolbarItem == 'c_toolbarItemEdit')
        {
            __doPostBack('edit', '');      
        }
        else if(toolbarItem == 'c_toolbarItemDelete')
        {
            var confirmationMessage = '<%= ConfirmationMessage %>';
            var confirmed = confirm(confirmationMessage);
            if(confirmed)
            {
                __doPostBack('delete', '');
            }
        }
    }
    
    </script>

    <ComponentArt:ToolBar ID="c_toolbarVersionView"
		runat="server" 
		CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew" 
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" 
		DefaultItemActiveCssClass="litToolbarItemOnMouseDown" 
		DefaultItemDisabledCssClass="litToolbarItemDisabled" 
		ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false" 
		Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
		<Items runat="server">
			<ComponentArt:ToolBarItem ID="c_toolbarItemBack" runat="server" ImageUrl="icons_standard/arrow_left_blue_16px.png" CausesValidation="False"
			    ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="c_toolbarItemEdit" runat="server" ImageUrl="icons_standard/pencil.png"
			    CausesValidation="False"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="c_toolbarItemDelete" runat="server" ImageUrl="icons_standard/delete.png"
			    CausesValidation="False"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
		</Items>
		<ClientEvents>
            <ItemSelect EventHandler="toolbarItemSelected" />
        </ClientEvents>
        <ClientTemplates>
		    <ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemButtonTemplate">
		        <table cellspacing="0" cellpadding="0" border="0" style="margin: 0px; margin-right: auto;">
		            <tbody>
		                <tr>
		                    <td class="ToolbarItemLeft">
		                        &nbsp;
		                    </td>
		                    <td class="ca_tb_img ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##" alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
		                    </td>
		                    <td class="ca_tb_txt ToolbarItemMain">
		                        <nobr>## DataItem.get_text() ##</nobr>
		                    </td>
		                    <td class="ToolbarItemRight">
		                        &nbsp;
		                    </td>
		                </tr>
		            </tbody>
		         </table>			       
		    </ComponentArt:ClientTemplate>
		</ClientTemplates>
	</ComponentArt:ToolBar>

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
<img src="../Images/transparent.gif" alt="" class="litIconMediaArchive" />   
	    <Foundation:ModuleString ID="ModuleString1" Name="GeneratedVersion" runat="server" />:  
	    <asp:Label ID="c_LabelViewVersionHeader" runat="server" Text="Header"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
 
<div class="lsContentScroll">
<table>
    <tr>
        <td>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringName" Name="Name" Runat="server"/>:
            <asp:label runat="server" id="c_labelName" CssClass="litText" Text = "Sample Text" /></div>
        </td>
    </tr>
    <tr id="tr_MaxWidth" runat="server">
        <td>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringMaxWidth" Name="MaxWidth" Runat="server"/>:
            <asp:label runat="server" id="c_labelMaxWidth" CssClass="litText" Text = "Sample Text" /></div>
        </td>
    </tr>
    <tr id="tr_MaxHeight" runat="server">
        <td>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringMaxHeight" Name="MaxHeight" Runat="server"/>:
            <asp:label runat="server" id="c_labelMaxHeight" CssClass="litText" Text = "Sample Text" /></div>
        </td>
    </tr>
     <tr id="tr_Percentage" runat="server">
        <td>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringPercentage" Name="Percentage" Runat="server"/>:
            <asp:label runat="server" id="c_labelPercentage" CssClass="litText" Text = "Sample Text" /></div>
        </td>
    </tr>
     <tr id="tr_KeepAspectRatio" runat="server">
        <td>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringKeepAspectRatio" Name="KeepAspectRatio" Runat="server"/>:
            <asp:CheckBox ID="c_checkBoxKeepAspectRatio" runat="server" Enabled="false" Checked="true" /></div>
        </td>
    </tr>
</table>
</div>
</asp:Content>

