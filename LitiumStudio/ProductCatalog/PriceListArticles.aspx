<%@ page language="C#" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_PriceListArticles, Litum.Studio.Web" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>

<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">

	<script type="text/javascript">
		//<![CDATA[
		function ToolBar1_ItemBeforeSelect(sender, eventArgs) {
			var id = eventArgs.get_item().get_id();
			if (id == 'Remove') {
				if (!confirm('<%=SystemStrings.GetValue(Litium.Studio.UI.ProductCatalog.Common.Constants.SystemStringConstants.LABEL_CONFIRMATION_DELETE, FoundationContext.LanguageID, true) %>')) {
					eventArgs.set_cancel(true);
				}
			}
		}
		
		//]]>
	</script>

	<ComponentArt:ToolBar ID="ToolBar1" AutoPostBackOnSelect="true" OnItemCommand="ToolBar_ItemCommand"
		runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16">
		<Items runat="server">
			<ComponentArt:ToolBarItem ID="Back" runat="server"
			    ImageUrl="icons_standard/arrow_left_blue_16px.png"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ItemType="Separator" ImageUrl="toolbar/break.gif" ImageHeight="16"
				ImageWidth="1" />
			<ComponentArt:ToolBarItem ID="Add" runat="server"
			    ImageUrl="icons_standard/add.png" Enabled="false" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="Remove" runat="server"
			    ImageUrl="icons_standard/delete.png" Enabled="false" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
		</Items>
		<ClientEvents>
			<ItemBeforeSelect EventHandler="ToolBar1_ItemBeforeSelect" />
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
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
<img src="Images/transparent.gif" height="16px" class="litIconBarcode" alt="" /><asp:Label
		ID="priceListBreadcrumb" Text="" runat="server" />	
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">

	 <Telerik:RadScriptBlock ID="RadScriptBlock3" runat="server">
        <script type="text/javascript">
        	function RowSelecting(sender, args, gridHelper) {
        	<%if (Master.WriteAccess)
				{%>		
        			ToolBar1.get_items().getItem(3).set_enabled(true);        		          
        			<%
				}%>
             
            }
            function RowDeselected(sender, args, gridHelper) {
            <%if (Master.WriteAccess)
				{%>		
              		var rgGrid = $find("<%=c_articlesGrid.ClientID%>");
            		var MasterTable = rgGrid.get_masterTableView();
            		var selectedRows = MasterTable.get_selectedItems();
            		if (selectedRows.length > 0) {
            			ToolBar1.get_items().getItem(3).set_enabled(true);           		

            		}
            		else {
            			ToolBar1.get_items().getItem(3).set_enabled(false);           		

            		}
            	<%
				}%>
            }
            function GridCreating(sender, args, gridHelper) {  
            <%if (Master.WriteAccess)
				{%>		          	
            		ToolBar1.get_items().getItem(3).set_enabled(false);
            	<%
				}%>
            	
            }
</script>

	</Telerik:RadScriptBlock>
	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="c_articlesGrid" ID="c_articleGridHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid  AllowMultiRowSelection="true" AllowPaging="true" runat="server" ID="c_articlesGrid">
			<ClientSettings>
				<Selecting AllowRowSelect="true" />
				<ClientEvents OnRowDropping="onRowDropping" OnRowSelecting="RowSelecting" OnGridCreating="GridCreating" OnRowDeselected="RowDeselected"  />
			</ClientSettings>
			<MasterTableView runat="server" ClientDataKeyNames="ID">
				<Columns>
					<Telerik:GridClientSelectColumn HeaderStyle-Width="30" />					
					<Telerik:GridBoundColumn DataField="ArticleNumber" />
					<Telerik:GridBoundColumn DataField="DisplayName" />
					<Telerik:GridBoundColumn DataField="FormatedPrice"  />
					<Telerik:GridBoundColumn DataField="FormatedVAT"  />
					<Telerik:GridBoundColumn DataField="FormattedPriceWithVAT"/>
					<Telerik:GridBoundColumn DataField="ID" Visible="false" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	
		<script type="text/javascript">
			//<![CDATA[
			// Image preloading
			var img1 = new Image();
			img1.src = '../../LitiumStudio/Images/grid/spinner.gif';
			//]]>    
		</script>

	</div>
</asp:Content>
