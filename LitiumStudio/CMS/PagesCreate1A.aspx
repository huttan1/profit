<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" enableeventvalidation="false" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesCreate1A, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarCreate" runat="server" >
		<toolbar:ToolbarItem OnClick="ToolbarItemCreateAbort_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateAbort" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem1" Visible="false"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemCreatePrevious_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreatePrevious" runat="server" Visible="false"/>
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemCreateNext_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateNext" runat="server"/>	
	    <toolbar:ToolbarItem OnClick="ToolbarItemCreateSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateSave" runat="server"/>	
		<toolbar:ToolbarItem OnClick="ToolbarItemCreateSaveAndEdit_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateSaveAndEdit" runat="server"/>	
	</toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" alt="" class="litIconDocumentAdd2" />
	<Foundation:ModuleString ID="ModuleString1" Name="CreatePageHeader" Runat="server"/> <span style="font-weight:normal;"><asp:Label runat="server" ID="c_guideNumber"></asp:Label></span>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
            <asp:UpdatePanel ID="UpdatePanelProductTree" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <table border="0" cellspacing="0" cellpadding="5" width="600">
                     <!--Tree view-->
                    <tr>
                        <td>
	                        <span class="litText"><Foundation:ModuleString ID="ModuleString6" Name="ProductGroupInfo" runat="server"/></span><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /><asp:CustomValidator runat="server" ID="c_productGroupValidator" OnServerValidate="ProductGroupValidator_Validate" CssClass="litErrorMsg" Display="Dynamic" /><br />
                            <LS:TreeHelper runat="server" ID="m_treeHelper" AssociatedControlID="ProductTree" />
                                    <Telerik:RadTreeView ID="ProductTree" runat="server" EnableDragAndDrop="false" EnableDragAndDropBetweenNodes="false"
                                        EnableViewState="false" PersistLoadOnDemandNodes="false" 
                                        OnNodeExpand="ProductTree_NodeExpand" OnNodeClick="ProductTree_NodeClick">
                                    </Telerik:RadTreeView>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 15px;">
                            <asp:CheckBox runat="server" id="c_publishRecursively" /><asp:Label runat="server" CssClass="litText" AssociatedControlID="c_publishRecursively"><Foundation:ModuleString ID="ModuleString2" Name="ShowProductGroupRecursivelyInfo" runat="server"/></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 15px;">
                            <span class="litText"><Foundation:ModuleString ID="ModuleString3" Name="OverridingLanguage" runat="server"/></span><br />
                            <asp:DropDownList runat="server" CssClass="litText" id="c_dropDownListLanguage"  /><br />
                            <span class="litText"><Foundation:ModuleString ID="ModuleString4" Name="OverridingLanguageInfo" runat="server"/></span><br />
                        </td>
                    </tr>
	            </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById(null);
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemCreateNext.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCreateAbort.ClientID.ToString()); %>");
        document.onkeypress = function(e) { var key = (window.event) ? window.event.keyCode : e.keyCode; if (key == 27) simulateClick(cancelObject); else if (key == 13) simulateClick(submitObject); }
        if (focusObject && !focusObject.disabled) { focusObject.focus(); }
    </script>
</asp:Content>