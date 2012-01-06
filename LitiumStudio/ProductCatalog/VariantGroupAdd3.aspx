<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_VariantGroupAddEdit3, Litum.Studio.Web" validaterequest="false" %>

<%@ Register TagName="EditRepeater" TagPrefix="UC" Src="WebUserControls/ArticleBatchEditRepeaterControl.ascx" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="c_toolbarRight" runat="server">
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateAbort" OnClick="ToolbarItemAbort_Click"
			runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server"
			ID="Divideritem3" />
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateSave" OnClick="ToolbarItemCreateSave_Click"
			runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server"
			ID="Divideritem2" />
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemCreatePrevious" OnClick="ToolbarItemPrev_Click"
			runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server"
			ID="Divideritem1" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<div style="float: left">
		<img src="Images/transparent.gif" class="litIconProductGroup" alt="" runat="server"
			id="c_imageIcon" />
		<asp:Label ID="c_label" runat="server" />
		<span class="litTextNormalWeight">&nbsp;
			<asp:Label ID="c_labelSteps" runat="server" />
		</span>
	</div>
	<div style="float: right; padding-right: 8px;">
		<asp:LinkButton ID="LinkButtonCreateArticle" OnClientClick="RowAddClick(); return false;"
			runat="server" />&nbsp;&nbsp;
		<asp:LinkButton ID="LinkButtonAddArticle" OnClientClick="openProductWin(); return false;"
			runat="server" />
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<Telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
		<script type="text/javascript">
			function openProductWin() {
				var url = '<%=Page.ResolveUrl("~/LitiumStudio/ProductCatalog/Framework/SelectArticles.aspx")%>?TemplateID=<%=m_variantGroupCarrier.TemplateID %>&AllArticleFieldID=<%=c_allArticleIDs.ClientID %>';
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
	</Telerik:RadScriptBlock>
	<div class="lsContentNoScroll">
		<UC:EditRepeater runat="server" ID="c_articleRepeater" />
		
		<div style="display: none;"><Telerik:RadWindowManager ID="RadWindowManager1" IconUrl="~/LitiumStudio/Images/icons_standard/product_group_16px.png"
			ShowContentDuringLoad="false" VisibleStatusbar="false" ReloadOnShow="true" runat="server"
			Modal="true" Width="616" Height="529" Behaviors="Close" Skin="Vista" KeepInScreenBounds="true">
			<Windows>
				<Telerik:RadWindow runat="server" ID="RadWindowArticles" OnClientClose="clientClose" />
			</Windows>
		</Telerik:RadWindowManager>
			<asp:HiddenField runat="server" ID="c_addArticleID" />
			<asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline">
				<ContentTemplate>
					<asp:HiddenField runat="server" ID="c_allArticleIDs" />
				</ContentTemplate>
			</asp:UpdatePanel>
		</div>
	</div>
</asp:Content>
