<%@ page language="C#" masterpagefile="~/LitiumStudio/Newsletter/Framework/Base1.master" inherits="LitiumStudio_Newsletter_CircularsCreate1, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Newsletter/Framework/Base1.master" %>
<%@ Register TagPrefix="TreeView" Namespace="Litium.Foundation.Modules.CMS.WebControls.TreeView" Assembly="Litium.Studio.WebControls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbar" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemSaveAndClose_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemSaveAndClose" runat="server"/>
	    <toolbar:DividerItem ID="DividerItem2" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
	    <toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemNext" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>
    <asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
        <img src="Images/transparent.gif" alt="" class="litIconCircularCirculars" /><Foundation:ModuleString ID="c_header" runat="server" />&nbsp;<span style="font-weight:normal;">(<Foundation:ModuleString Name="CircularCreatePage1SubHeader2" runat="server" ID="Systemstring2"/>)</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <style type="text/css">
	    .circularTreeView td { padding:0px; }
	    .circularTreeView { position:relative; padding:0px;}
    </style>
    <div class="lsContentScroll">
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td valign="top" colspan="2" >
                    <Foundation:ModuleString ID="ModuleString1" CssClass="litText" Name="CircularCreatePage2Description1" runat="server" /><br /><br />
                    <div id="c_replaceText"  runat="server" visible="false"><Foundation:ModuleString ID="ModuleString4" Name="CircularCreatePage2Warning1" runat="server" CssClass="litErrorMsg" /><br /><br /></div>
                </td>
            </tr>
            <tr runat="server" id="c_tableRowTemplate">
                <td valign="top"><asp:RadioButton ID="mc_radioButtonTemplate" GroupName="Template" Checked="true" runat="server"/></td>
                <td valign="top" style="width:100%; padding-left:4px;padding-top:4px;" class="litText">
	                <b><Foundation:ModuleString Name="Template" runat="server" ID="Modulestring2"/></b><br />
	                <asp:Repeater ID="mc_repeaterCircularTemplate" Runat="server">
		                <ItemTemplate>
		                    <div style="float:left;padding-right:20px;padding-bottom:10px;text-align:center;">
	                            <asp:ImageButton ID="ImageButton1" width="90" height="110" CssClass="litSelectedItem" OnClick="TemplateImage_Click" Runat="server"/><br />
	                            <asp:Label Runat="server" ID="Label1" CssClass="litText" />
                            </div>
		                </ItemTemplate>
	                </asp:Repeater>
                </td>
            </tr>
            <tr runat="server" id="c_tableRowPageTree">
                <td valign="top"><asp:RadioButton ID="mc_radioButtonPageTree" GroupName="Template" runat="server"/></td>
                <td valign="top" style="width:100%; height:100%; padding-left:4px; padding-top:4px;">
                    <b><Foundation:ModuleString ID="ModuleString3" Name="PageFromStudio" runat="server"/></b><br />
                    <TreeView:TreeView
                        width="300"
                        id="mc_treeView"
                        CssClass="TreeView circularTreeView"
                        NodeCssClass="litTreeNode"
                        SelectedNodeCssClass="litSelectedTreeNode"
                        HoverNodeCssClass="litHoverTreeNode"
                        runat="server"
                        OnDemandLoading="true"
                        ShowStatus="false"
                        ShowTasks="false"
                        ShowStatistics="false"
                        ShowTrashcan="false"
                        ShowArchive="false"
                        ImagesBaseUrl="/LitiumStudio/Images/icons_standard">
                    </TreeView:TreeView>
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemNext.ClientID.ToString()); %>");
        var cancelObject = null;
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
</asp:Content>