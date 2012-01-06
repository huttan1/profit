<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_EditSortOrder, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<ComponentArt:ToolBar ID="ToolBarControl" AutoPostBackOnSelect="true" OnItemCommand="ToolBar_ItemCommand"
		runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16">
		<Items runat="server">	
			<ComponentArt:ToolBarItem ID="Cancel" ImageUrl="icons_standard/sign_stop.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="Save" ImageUrl="icons_standard/floppy_disk_blue.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
		</Items>
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

<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<asp:Image runat="server" ImageUrl="Images/transparent.gif" AlternateText="" ID="HeaderImage" />
	<asp:Label runat="server" ID="HeaderName" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioFilterArea" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="GridControl" ID="GridControlHelper"
			OnNeedData="Grid_NeedData" DataKeyName="ID" AutoSortOnFirstColumn="false" AllowPaging="false" />
		<Telerik:RadGrid   
			OnRowDrop="ProductItemsGrid_RowDrop"   
			AllowPaging="false"
			AllowMultiRowSelection="true" 
			runat="server"
			ID="GridControl">
			<ClientSettings AllowRowsDragDrop="true">	
				<Selecting AllowRowSelect="true" />
			</ClientSettings>
			<MasterTableView runat="server" ClientDataKeyNames="ID">
				<Columns>
					<Telerik:GridClientSelectColumn HeaderStyle-Width="25px" />
					<Telerik:GridBoundColumn DataField="ArticleNumber" />
					<Telerik:GridBoundColumn DataField="Name" />
					<Telerik:GridBoundColumn DataField="TypeName" />
					<Telerik:GridBoundColumn DataField="Remarks" />
					<Telerik:GridBoundColumn DataField="CompleteString" />
					<Telerik:GridBoundColumn DataField="CanBeInPriceAgentsList" />
					<Telerik:GridBoundColumn DataField="ID" Visible="false" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>
