<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_Add1, Litum.Studio.Web" %>

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
	<img src="Images/transparent.gif" class="litIconProductGroup" alt="" runat="server"
		id="c_imageIcon" /><Foundation:ModuleString ID="ModuleString1" Name="AddHeader" runat="server" />
	&nbsp;<asp:Label ID="c_label" runat="server" /><span class="litTextNormalWeight">&nbsp;<Foundation:ModuleString
		ID="HeaderOnOfThree" Name="HeaderStepOneOfThree" runat="server" />
	</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
		<Foundation:InformationGroup runat="server" ID="c_informationGroup1" Width="440px" >
		<asp:CustomValidator Height="25" runat="server" ID="c_custSKU" CssClass="litErrorMsg"
			Display="Dynamic" />
		<div class="litDescriptionText">
			<Foundation:ModuleString ID="Description" Name="Add1Description" runat="server" />
		</div>
		<asp:Panel runat="server" ID="templates">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString4" Name="Definition" runat="server" />
			</div>
			<asp:DropDownList ID="c_dropDownListDefinition" CssClass="litInputText" runat="server" />
		</asp:Panel>
		<asp:UpdatePanel runat="server">
			<ContentTemplate>
				<asp:Panel runat="server" ID="c_languagePanel">
					<div class="litBoldHeader" style="margin-bottom: 2px;">
						<Foundation:ModuleString ID="ModuleString5" Name="Language" runat="server" />
					</div>
					<asp:CheckBoxList ID="c_checkBoxListLanguage" CssClass="litText" OnSelectedIndexChanged="CheckBoxListLanguage_OnSelectedIndexChanged"
						AutoPostBack="true" runat="server" />
				</asp:Panel>
				<asp:Panel runat="server" ID="c_urlPanel">
					<asp:Repeater runat="server" ID="c_urlRepeater">
						<ItemTemplate>
							<div style="float: left;">
								<div class="litBoldHeader" style="float: left; margin-right: 5px;">
									<Foundation:ModuleString ID="ModuleString6" Name="UrlName" runat="server" />
								</div>
								<div class="litBoldHeader">
									<%#string.Format("({0})", Eval("Language")).ToLower() %>
									<img src="images/transparent.gif" style="vertical-align: middle;"
										class="litIconRequired" alt="" />
								</div>
								<asp:TextBox runat="server" CssClass="litInputText" MaxLength="400" ID="c_urlName"
									Text='<%#Eval("Url") %>' />
								<asp:HiddenField runat="server" ID="c_urlId" Value='<%#Eval("LanguageID") %>' />
								<asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="c_urlName"
									OnServerValidate="OnUrlNameValidate" ValidateEmptyText="true" />
							</div>
							<br style="clear:both;"/>
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
