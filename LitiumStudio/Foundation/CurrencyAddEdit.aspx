<%@ page title="" language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_CurrencyAddEdit, Litum.Studio.Web" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ID="HorizontalToolbar1" runat="server">
		<Toolbar:ToolbarItem OnClick="ToolbarItemAbort_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="../images/transparent.gif" ID="c_toolbarItemAbort" runat="server" />
		<Toolbar:DividerItem ImageURL="../images/transparent.gif" Class="litToolbarDivider"
			runat="server" ID="Divideritem1" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif"
			ID="c_toolbarItemSave" CausesValidation="true" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconCurrencies" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
		<div class="litBoldHeader">
			<Foundation:SystemString ID="ModuleString15" Name="CurrencyHeaderIsBaseCurrency"
				runat="server" />
			:
		</div>
		<div>
			<asp:CheckBox runat="server" ID="c_baseCurrency" CssClass="litInputSelect" AutoPostBack="true"
				OnCheckedChanged="BaseCurrency_CheckedChanged" />
		</div>
		<div class="litBoldHeader">
			<Foundation:SystemString ID="ModuleString4" Name="CurrencyHeaderName" runat="server" />
			:
		</div>
		<div>
			<asp:DropDownList runat="server" ID="c_currencyCode" CssClass="litInputSelect" />
		</div>
		<div class="litBoldHeader">
			<Foundation:SystemString ID="ModuleString3" Name="CurrencyHeaderRate" runat="server" />
			<img src="../images/transparent.gif" style="vertical-align: middle;" class="litIconRequired"
				alt="" />:
		</div>
		<div>
			<asp:TextBox runat="server" ID="c_exchangeRate" CssClass="litInputSelect" MaxLength="10" />
			<asp:RequiredFieldValidator CssClass="litErrorMsg" ID="c_exchangeRateValidator" ControlToValidate="c_exchangeRate"
				runat="server" Display="Dynamic" Style="padding-left: 10px;" />
			<asp:RangeValidator ID="c_exchangeRateValidatorRange" ControlToValidate="c_exchangeRate"
				runat="server" Display="Dynamic" Style="padding-left: 10px;" MinimumValue="0"
				MaximumValue="99999999999999" Type="Double" />
		</div>
	</div>
</asp:Content>
