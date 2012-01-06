<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_EditRelations, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="c_toolbarRight" runat="server">
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemCancel" OnClick="ToolbarItemCancel_Click"
			runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server"
			ID="Divideritem2" />
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemSave" OnClick="ToolbarItemSave_Click"
			runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" class="litIconRelations" alt="" runat="server"
		id="c_imageIcon" /><Foundation:ModuleString ID="ModuleString1" Name="RelationsEditHeader"
			runat="server" />
	&nbsp;<asp:Label ID="c_labelHeader" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<Telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">

		<script type="text/javascript">


			function openProductWin() {
				var url = '<%=Page.ResolveUrl("~/LitiumStudio/ProductCatalog/Framework/SelectProduct.aspx")%>' +
				'?pcid=' + '<%= hiddenProductCatalogId.Value %>' +
				"&RelationId=" + $get('<%= hiddenRelationId.ClientID %>').value +
				"&pid=" + '<%=(Request.Params["pid"] ?? string.Empty) %>' +
				 "&pgid=" + '<%=(Request.Params["pgid"] ?? string.Empty) %>';
				var oWnd = radopen(url, "RadWindowProduct");
			}
			function RefreshProdcutGrid() {
				var masterTable = $find("<%= c_productRelationsGrid.ClientID %>").get_masterTableView();
				masterTable.rebind();
			}

			function openGroupWin() {
				var url = '<%=Page.ResolveUrl("~/LitiumStudio/ProductCatalog/Framework/SelectProductGroup.aspx")%>' +
				'?pcid=' + '<%= hiddenProductCatalogId.Value %>' +
				"&RelationId=" + $get('<%= hiddenRelationId.ClientID %>').value +
				"&pid=" + '<%=(Request.Params["pid"] ?? string.Empty) %>' +
				 "&pgid=" + '<%=(Request.Params["pgid"] ?? string.Empty) %>';
				var oWnd = radopen(url, "RadWindowGroup");
			}
			function RefreshGroupGrid() {
				var masterTable = $find("<%= c_productGroupRelationsGrid.ClientID %>").get_masterTableView();
				masterTable.rebind();
			}
			
		</script>

	</Telerik:RadScriptBlock>
	<div class="lsContentScroll">
		<asp:UpdatePanel ID="c_relationUP" UpdateMode="Conditional" runat="server">
			<ContentTemplate>
				<div style="height: 50px;">									
					<Foundation:ModuleString ID="ModuleString4" CssClass="litBoldHeader" Name="RelationType" runat="server" />
					<br />
					<asp:DropDownList ID="c_relationsType" Width="150px" AutoPostBack="true" OnTextChanged="RelationsType_IndexChanged"
						runat="server" />
				</div>
				<div style="clear:both;"></div>
				<div style="width: 750px" >
					<div>
						<div style="float: left">
							<Foundation:ModuleString ID="ModuleString2" CssClass="litBoldHeader" Name="Products" runat="server" />
						</div>
						<div style="float: right;">
							<asp:LinkButton ID="c_addProductRealtions" OnClientClick="openProductWin(); return false;"
								runat="server" Text="Add" CssClass="lsLink litText litContentPager"/>
						</div>
					</div>
					<br />	
					<div style="overflow: hidden;"  class="lsSeparateArea">			
					    <LS:GridHelperAjax runat="server" AssociatedControlID="c_productRelationsGrid" OnNeedData="productGridRelation_NeedData"
						    ID="c_productRelationsGridHelper" DataKeyName="ID" />
					    <Telerik:RadGrid AllowPaging="true" runat="server" ID="c_productRelationsGrid" Height="250px"
						    Width="750" OnItemCommand="ProductGrid_ItemCommand" BorderStyle="Solid" BorderColor="Gray">
						    <MasterTableView runat="server" ClientDataKeyNames="ID">
							    <Columns>
								    <Telerik:GridBoundColumn AllowSorting="true" DataField="Name" />
								    <Telerik:GridBoundColumn AllowSorting="true" DataField="ArticleNumber" />
								    <Telerik:GridBoundColumn AllowSorting="true" DataField="AssortmentPath" />
								    <Telerik:GridButtonColumn CommandName="Delete" DataTextField="ID" ImageUrl="../Images/icons_standard/delete.png"
									    ButtonType="ImageButton" UniqueName="column">
									    <HeaderStyle Width="27px" />
								    </Telerik:GridButtonColumn>
								    <Telerik:GridBoundColumn DataField="ID" Display="false" />
							    </Columns>
						    </MasterTableView>
					    </Telerik:RadGrid>
					</div>
				</div>
				<div style="clear:both;"></div>
				<div style="width: 750px; margin-top: 5px;">
					<div>
						<div style="float: left">
							<asp:Label>
								<Foundation:ModuleString ID="ModuleString3" Name="ProductGroups" CssClass="litBoldHeader" runat="server" />
							</asp:Label>
						</div>
						<div style="float: right">
							<asp:LinkButton ID="c_addProductGroupRelations" runat="server" Text="Add" OnClientClick="openGroupWin(); return false;" CssClass="lsLink litText litContentPager"/>
						</div>
					</div>
					<br />
					<div style="overflow: hidden;" class="lsSeparateArea">
					    <LS:GridHelperAjax runat="server" AssociatedControlID="c_productGroupRelationsGrid"
						    OnNeedData="productGroupGridRelation_NeedData" ID="c_productGroupRelationsGridHelper"
						    DataKeyName="ID" />
					    <Telerik:RadGrid AllowPaging="true" runat="server" OnItemCommand="GroupGrid_ItemCommand"
						    ID="c_productGroupRelationsGrid" Height="250px" Width="750">
						    <MasterTableView runat="server" ClientDataKeyNames="ID">
							    <Columns>
								    <Telerik:GridBoundColumn AllowSorting="true" DataField="Name" />
								    <Telerik:GridBoundColumn AllowSorting="true" DataField="AssortmentPath" />
								    <Telerik:GridButtonColumn CommandName="Delete" CommandArgument="ID" ImageUrl="../Images/icons_standard/delete.png"
									    ButtonType="ImageButton" UniqueName="column">
									    <HeaderStyle Width="27px" />
								    </Telerik:GridButtonColumn>
								    <Telerik:GridBoundColumn DataField="ID" Display="false" />
							    </Columns>
						    </MasterTableView>
					    </Telerik:RadGrid>
					 </div>
				</div>
				<Telerik:RadWindowManager ID="RadWindowManager1" IconUrl="~/LitiumStudio/Images/icons_standard/product_group_16px.png"
					ShowContentDuringLoad="false" VisibleStatusbar="false" ReloadOnShow="true" runat="server"
					Modal="true" Width="616" Height="529" Behaviors="Close" Skin="Default">
					<Windows>
						<Telerik:RadWindow ID="RadWindowProduct" OnClientClose="RefreshProdcutGrid" NavigateUrl="SelectProduct.aspx">
						</Telerik:RadWindow>
						<Telerik:RadWindow ID="RadWindowGroup" OnClientClose="RefreshGroupGrid" NavigateUrl="SelectProductGroup.aspx">
						</Telerik:RadWindow>
					</Windows>
				</Telerik:RadWindowManager>
				<asp:HiddenField ID="hiddenProductCatalogId" runat="server" />
				<asp:HiddenField ID="hiddenRelationId" runat="server" />
			</ContentTemplate>
		</asp:UpdatePanel>
	</div>
</asp:Content>
