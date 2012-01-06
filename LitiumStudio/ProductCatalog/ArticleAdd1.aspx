<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_ArticleAdd1, Litum.Studio.Web" %>
<%@ Register TagPrefix="MediaArchive" TagName="MediaArchiveDialog" src="~/LitiumStudio/WebUserControls/MediaArchiveDialog.ascx" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="c_toolbarRight" runat="server">
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateAbort" OnClick="ToolbarItemAbort_Click"
			runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server"
			ID="Divideritem2" />
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateNext" OnClick="ToolbarItemNext_Click"
			runat="server" CausesValidation="true" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="~/LitiumStudio/Images/icons_standard/product_blue.png" alt="" runat="server"
		id="c_imageIcon" /><Foundation:ModuleString ID="ModuleString1" Name="AddHeader" runat="server" />
	&nbsp;<asp:Label ID="c_label" runat="server" /><span class="litTextNormalWeight">&nbsp;<Foundation:ModuleString
		ID="HeaderOnOfThree" Name="HeaderStepOneOfTwo" runat="server" />
	</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
		<Foundation:InformationGroup runat="server" ID="c_informationGroup1" Width="805px">
			<asp:CustomValidator Height="25" runat="server" ID="c_custSKU" CssClass="litErrorMsg"
				Display="Dynamic" />
			<div class="litDescriptionText">
			    <asp:Label ID="c_labelArticleGroup" runat="server" style="font-weight: bold;" ></asp:Label>
			</div>
			<div class="litDescriptionText">
				<Foundation:ModuleString ID="Description" Name="Add1Description" runat="server" />
			</div>
			<asp:Panel runat="server" ID="templates">
				<div class="litBoldHeader">
					<Foundation:ModuleString ID="ModuleString4" Name="Definition" runat="server" />
				</div>
				<asp:DropDownList ID="c_dropDownListDefinition" CssClass="litInputText" runat="server" />
			</asp:Panel>
				<asp:Panel runat="server" ID="c_languagePanel">
					<div class="litBoldHeader" style="margin-bottom: 2px;">
						<Foundation:ModuleString ID="ModuleString5" Name="Language" runat="server" />
					</div>
					<asp:CheckBoxList ID="c_checkBoxListLanguage" CssClass="litText" onclick="CheckAtLeastOne()" runat="server" />
					<asp:HiddenField runat="server" ID="c_addExtraLanguage" />
				</asp:Panel>
		</Foundation:InformationGroup>
	</div>
		<Telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
		<script type="text/javascript">
			function CheckAtLeastOne() {
				$get("<%=c_addExtraLanguage.ClientID %>").value = "";
				var f = "<%=c_checkBoxListLanguage.ClientID %>";
				var i = null;
				var j = 0;
				var selectedCount = 0;
				var lastSelected = null;
				while ((i = $get(f + '_' + (j++))) != null) {
					if (i.disabled) {
						i.disabled = "";
					}
					if (i.parentNode.disabled) {
						i.parentNode.disabled = "";
					}
					if (i.checked) {
						selectedCount++;
						lastSelected = i;
						$get("<%=c_addExtraLanguage.ClientID %>").value = i.id;
					}
				}
				if (selectedCount == 1) {
					lastSelected.disabled = "disabled";
					lastSelected.parentNode.disabled = "disabled";
				}
			}
		</script>
	     <MediaArchive:MediaArchiveDialog id="mediabankdialog" runat="server"/>
	</Telerik:RadCodeBlock>
</asp:Content>
