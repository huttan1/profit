<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_GroupCopy, Litum.Studio.Web" %>

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
			ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateNext" OnClick="ToolbarItemSave_Click"
			runat="server" CausesValidation="true" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" class="litIconProductCatalog" alt="" /><Foundation:ModuleString
		ID="ModuleHeader" Name="AddHeader" runat="server" />
	<asp:Label ID="c_label" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
		<Foundation:InformationGroup runat="server" ID="InformationGroup1" Width="435px">
			<asp:Panel runat="server" ID="c_urlPanel">
				<asp:Repeater runat="server" ID="c_urlRepeater">
					<ItemTemplate>
						<div style="float: left;">
							<div class="litBoldHeader" style="float: left; margin-right: 5px;">
								<Foundation:ModuleString ID="ModuleString6" Name="UrlName" runat="server" />
							</div>
							<div class="litBoldHeader">
								<%#string.Format("({0})", Eval("Language")).ToLower() %>
							</div>
							<asp:TextBox runat="server" CssClass="litInputText" MaxLength="400" ID="c_urlName"
								Text='<%#Eval("Url") %>' />
							<asp:HiddenField runat="server" ID="c_urlId" Value='<%#Eval("LanguageID") %>' />
							<asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="c_urlName"
								OnServerValidate="OnUrlNameValidate" ValidateEmptyText="true" />
						</div>
						<br style="clear: both;" />
					</ItemTemplate>
				</asp:Repeater>
				<div class="clearer">
				</div>
			</asp:Panel>
		</Foundation:InformationGroup>
	</div>
</asp:Content>