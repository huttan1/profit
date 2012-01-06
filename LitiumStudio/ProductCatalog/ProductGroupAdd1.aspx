<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_ProductGroupAdd1, Litum.Studio.Web" %>
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
	<img src="Images/transparent.gif" alt="" runat="server"	id="c_imageIcon" />
	<Foundation:ModuleString ID="ModuleString1" Name="AddHeader" runat="server" />&nbsp;
	<asp:Label ID="c_label" runat="server" />
	<span class="litTextNormalWeight">&nbsp;
		<Foundation:ModuleString ID="HeaderOnOfThree" Name="HeaderStepOneOfTwo" runat="server" />
	</span>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
		<Foundation:InformationGroup runat="server" ID="c_informationGroup1" Width="440px">
			<div class="litDescriptionText">
				<Foundation:ModuleString ID="Description" Name="ProductGroupAdd1Description" runat="server" />
			</div>
			<asp:Panel runat="server" ID="templates">
				<div class="litBoldHeader">
					<Foundation:ModuleString ID="ModuleString4" Name="Definition" runat="server" />
				</div>
				<asp:DropDownList ID="c_dropDownListDefinition" CssClass="litInputText" runat="server" />
			</asp:Panel>
		</Foundation:InformationGroup>
	</div>
</asp:Content>
