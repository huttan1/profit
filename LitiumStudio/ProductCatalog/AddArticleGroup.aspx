<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_AddArticleGroup, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarRight" runat="server" >
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCancel" OnClick="ToolbarItemCancel_Click" runat="server"/>
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem1"/>
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemSave" OnClick="ToolbarItemSave_Click" runat="server"/>
	</toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
      <img src="Images/transparent.gif" class="litIconVariant" alt="" />
        <Foundation:ModuleString ID="ModuleString1" Name="ArticleGroupAddHeader" Runat="server"/>&nbsp;  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">    
    <div class="lsContentScroll">
		<Foundation:InformationGroup runat="server" ID="c_informationGroupGeneral" Width="325px">
		<asp:UpdatePanel ID="UpdatePanel1" runat="server">
			<ContentTemplate>
				<asp:Panel runat="server" ID="c_languagePanel">
					<div class="litBoldHeader" style="margin-bottom: 2px;">
						<Foundation:ModuleString ID="ModuleString3" Name="Language" runat="server" />
					</div>
					<asp:CheckBoxList ID="c_checkBoxListLanguage" CssClass="litText litInputCheckbox" OnSelectedIndexChanged="CheckBoxListLanguage_OnSelectedIndexChanged"
						AutoPostBack="true" runat="server" />
				</asp:Panel>
				<asp:Panel runat="server" ID="NamePanel">
					<div class="litBoldHeader" style="margin-bottom: -12px;">
						<Foundation:ModuleString ID="ModuleString4" Name="NameTranslations" runat="server" />
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