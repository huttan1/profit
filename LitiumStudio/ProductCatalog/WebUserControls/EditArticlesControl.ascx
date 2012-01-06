<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_WebUserControls_EditArticlesControl, Litum.Studio.Web" %>
<%@ Register TagPrefix="WC" TagName="C" Src="~/LitiumStudio/ProductCatalog/WebUserControls/ArticleBatchEditRepeaterControl.ascx" %>
<Telerik:RadCodeBlock runat="server">
	<script type="text/javascript">
		function ResizeGrid(sender, args) {
			if (inResize == null)
				setTimeout(function () { Resized($find("<%=d.ClientID %>")); }, 100);
			ReloadEditArticleGrid();
		}
		var inResize = null;
		function Resized(sender, args) {
			if (inResize) return;
			inResize = true;
			sender.set_height(sender.get_height() - 43);
			sender._handlePageResize(true);
			inResize = false;
		}
	</script>
	<script type="text/javascript">
		function openProductWin() {
			var url = '<%=Page.ResolveUrl("~/LitiumStudio/ProductCatalog/Framework/SelectArticles.aspx")%>?TemplateID=<%=TemplateID %>&AllArticleFieldID=<%=c_allArticleIDs.ClientID %>&VariantID=<%=VariantGroupID %>';
			var oWnd = radopen(url, "RadWindowArticles");
		}
		function RowAddClick() {
			AddArticle_EditArticleGrid();
		}
		function clientClose(sender, args) {
			var a = args.get_argument();
			if (a != null && a != "") {
				$get("<%=c_addArticleID.ClientID %>").value = args.get_argument();
				ReloadEditArticleGrid()
				$get("<%=c_addArticleID.ClientID %>").value = "";
			}
		}
	</script>
</Telerik:RadCodeBlock>
<Telerik:RadSplitter runat="server" VisibleDuringInit="true" ID="d" Orientation="Horizontal"
	BorderSize="1" OnClientLoad="Resized" OnClientResized="Resized">
	<Telerik:RadPane runat="server" Height="0" Width="0" Collapsed="true">
		<asp:HiddenField runat="server" ID="c_addArticleID" />
		<asp:UpdatePanel ID="UpdatePanel1" runat="server">
			<ContentTemplate>
				<asp:HiddenField runat="server" ID="c_allArticleIDs" />
			</ContentTemplate>
		</asp:UpdatePanel>
	</Telerik:RadPane>
	<Telerik:RadPane ID="RadPane1" runat="server" Height="21" Locked="true" Scrolling="None">
		<div style="height: 20px;"
			class="lsText">
			<div style="float: left; padding-left: 8px; padding-top: 3px;">
				<Foundation:ModuleString runat="server" Name="ArticlesConnectedToTheVariant" />
			</div>
			<div style="float: right; padding-right: 8px; padding-top: 3px; font-weight: bold;">
				<asp:LinkButton ID="LinkButtonCreateArticle" OnClientClick="RowAddClick(); return false;"
					runat="server" CssClass="blueLink" />&nbsp;&nbsp;
				<asp:LinkButton ID="LinkButtonAddArticle" OnClientClick="openProductWin(); return false;"
					runat="server" CssClass="blueLink" />
			</div>
		</div>
	</Telerik:RadPane>
	<Telerik:RadPane ID="RadPane2" runat="server" Scrolling="None" Style="overflow: hidden;">
		<WC:C runat="server" ID="c_grid" />
	</Telerik:RadPane>
</Telerik:RadSplitter>
<Telerik:RadWindowManager ID="RadWindowManager1" IconUrl="~/LitiumStudio/Images/icons_standard/product_group_16px.png"
	ShowContentDuringLoad="false" VisibleStatusbar="false" ReloadOnShow="true" runat="server"
	Modal="true" Width="616" Height="529" Behaviors="Close" Skin="Vista" KeepInScreenBounds="true">
	<Windows>
		<Telerik:RadWindow runat="server" ID="RadWindowArticles" OnClientClose="clientClose" />
	</Windows>
</Telerik:RadWindowManager>
