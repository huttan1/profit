<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_AssortmentAddEdit, Litum.Studio.Web" %>

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
			LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateNext" OnClick="ToolbarItemSave_Click" OnClickCode="if (CheckIfLanguageHaveChange())"
			runat="server" CausesValidation="true" />
	</Toolbar:HorizontalToolbar>
	<Telerik:RadScriptBlock runat="server">
	<script type="text/javascript">
		function CheckIfLanguageHaveChange() {
			var v = $get("<%=c_updated.ClientID %>").value;
			if (v == "")
				return true;

			return confirm(v);
		}
	</script>
	</Telerik:RadScriptBlock>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" class="litIconProductCatalog" alt="" /><Foundation:ModuleString
		ID="ModuleHeader" Name="AddHeader" runat="server" />
	<asp:Label ID="c_label" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
		<Foundation:InformationGroup runat="server" ID="c_informationGroupGeneral" Width="240px">
		<div class="litDescriptionText">
			<Foundation:ModuleString ID="Description" Name="AddProductCatalogDescription" runat="server" />
		</div>
		<asp:UpdatePanel runat="server">
			<ContentTemplate>
				<asp:HiddenField runat="server" ID="c_updated" />
				<asp:Panel runat="server" ID="c_languagePanel">
					<div class="litBoldHeader" style="margin-bottom: 2px;">
						<Foundation:ModuleString ID="ModuleString5" Name="Language" runat="server" />
					</div>
					<asp:CheckBoxList ID="c_checkBoxListLanguage" CssClass="litText litInputCheckbox" OnSelectedIndexChanged="CheckBoxListLanguage_OnSelectedIndexChanged"
						AutoPostBack="true" runat="server" />
				</asp:Panel>
				<asp:Panel runat="server" ID="NamePanel">
					<div class="litBoldHeader" style="margin-bottom: -12px;">
						<Foundation:ModuleString ID="ModuleString3" Name="NameTranslations" runat="server" />
					</div>
					<asp:Repeater runat="server" ID="NameRepeater">
						<ItemTemplate>
							<div style="float: left; padding-right: 10px;">
								<div class="litBoldHeader">
									<%#Eval("Language") %>
									<img src="images/transparent.gif" style="vertical-align: middle;" class="litIconRequired" alt="" />
								</div>
								<asp:TextBox runat="server" CssClass="litInputText200" MaxLength="400" ID="c_name"
									Text='<%#Eval("Name") %>' />
								<asp:RequiredFieldValidator runat="server" SetFocusOnError="true" EnableClientScript="false"
									ID="c_RequiredFieldValidatorName" CssClass="litErrorMsg" ControlToValidate="c_name"	Display="Dynamic" 
									ErrorMessage='<%# GetRequiredFieldMessage() %>' />
								<asp:HiddenField runat="server" ID="c_languageId" Value='<%#Eval("LanguageID") %>' />
							</div>
							<br style="clear: both;" />
						</ItemTemplate>
					</asp:Repeater>
					<div class="clearer">
					</div>
				</asp:Panel>
			</ContentTemplate>
		</asp:UpdatePanel>
		</Foundation:InformationGroup>
	</div>
</asp:Content>
