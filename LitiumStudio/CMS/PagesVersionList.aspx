<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesVersionList, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarVersionList" runat="server" >
		<toolbar:ToolbarItem OnClick="ToolbarItemVersionListBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemVersionListBack" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemVersionListRestore_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconRecycle" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemVersionListRestore" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem3"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemVersionListView_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconView" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemVersionListView" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem4"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemVersionListDelete_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemVersionListDelete" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem1"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemVersionListReset_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDocumentExchangeDelete" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemVersionListReset" runat="server"/>	
	</toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" style="vertical-align:middle; margin-right:5px;" class="litIconDocumentExchange" alt="" />
	<Foundation:ModuleString ID="ModuleString1" name="VersionList" runat="server" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentNoScroll">
        <table cellpadding="15" cellspacing="0" border="0" class="litModuleContentWithTreeMainSizeV2">
	        <tr>
		        <td valign="top">
			        <div class="litListWithTreeAreaV2">
				        <toolbar:List id="c_list" SortAscendingClass="litIconSortAscending" SortDescendingClass="litIconSortDescending"  PageSize="1000" EnableViewState="True" Runat="server">
					        <HeaderTemplate>
						        <table border="0" cellspacing="0" cellpadding="0">
							        <tr>
								        <th align="left" class="lsListHeader"><toolbar:ListColumn id="c_listColumn1" runat="server" /></th>
							        </tr>
					        </HeaderTemplate>
					        <ItemTemplate>
						        <toolbar:ListRow ID="ListRow1" ColumnCssClass="litListContent" runat="server" />
					        </ItemTemplate>
					        <FooterTemplate>		
						        </table>
					        </FooterTemplate>		
				        </toolbar:List>
			        </div>
		        </td>
	        </tr>
        </table>
    </div>
</asp:Content>