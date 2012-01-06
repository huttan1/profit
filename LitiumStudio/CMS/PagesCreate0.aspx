<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesCreate0, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>
<%@ Register TagPrefix="TreeView" Namespace="Litium.Foundation.Modules.CMS.WebControls.TreeView" Assembly="Litium.Studio.WebControls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarCreate" runat="server" >
		<toolbar:ToolbarItem OnClick="ToolbarItemCreateAbort_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateAbort" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2" Visible="false"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemCreatePrevious_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreatePrevious" runat="server" Visible="false"/>
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem1"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemCreateNext_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateNext" runat="server"/>	
	</toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" alt="" class="litIconDocumentAdd2" />
	<Foundation:ModuleString ID="ModuleString1" Name="CreatePageHeader" Runat="server"/> <span style="font-weight:normal;"><asp:Label runat="server" ID="c_guideNumber"></asp:Label></span>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <style type="text/css">
	    .sharedPageTreeView td { padding:0px; }
	    .sharedPageTreeView { position:relative; padding:0px;}
    </style>
    <div class="lsContentScroll">
		            <!--Info and error message-->
		            <table border="0" cellspacing="0" cellpadding="0" width="500">
		                <tr runat="server" id="c_tableRowPageTree">
		                    <td valign="top" style="width:50%;">
			                    <span class="litBoldText"><asp:Label ID="c_labelTitle1" runat="server"/></span>
			                    <img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />
		                    </td>
		                    <td><span id="c_errorNoMasterPageSelected" runat="server" class="litErrorMsg" visible="false"></span></td>
	                    </tr>
	                    <tr>
	                       <td><span class="litText"><asp:Label ID="c_labelDescription1" runat="server"/></span></td> 
	                    </tr>
		            </table>
		            <!--Tree view-->
		            <table border="0" cellspacing="0" cellpadding="5" width="500">
	                    <tr>
	                        <td>
	                            <TreeView:TreeView
			                        width="300"
			                        id="c_treeView"
			                        CssClass="TreeView sharedPageTreeView"
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
			                        EnableNonMasterPageCandidates="false"
			                        ImagesBaseUrl="/LitiumStudio/Images/icons_standard"
			                        >
			                    </TreeView:TreeView>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td style="padding-top: 35px;">
	                            <span class="litBoldText"><asp:Label ID="c_labelTitle2" runat="server"/></span><br />
	                            <asp:CheckBox runat="server" id="c_includeMasterPageChildren"  />
	                            <span class="litText"><asp:Label ID="c_labelDescription2" runat="server"/></span><br />
	                            <span class="litText"><asp:Label ID="c_labelDescription3" Visible="false" runat="server"/></span>
	                        </td>
                        </tr>
			        </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById(null);
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemCreateNext.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCreateAbort.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>