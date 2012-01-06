<%@ page language="C#" masterpagefile="~/LitiumStudio/Relations/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_Relations_Search, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/Relations/Framework/Base.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">

	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="c_toolbar" runat="server">
		<Toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="images/transparent.gif" ID="c_toolbarItemCancel" runat="server" />
		<Toolbar:DividerItem ID="c_divider1" ImageURL="Images/transparent.gif" Class="litToolbarDivider"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemSearch_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconRelationsFind"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif"
			ID="c_toolbarItemSearch" runat="server" />
	</Toolbar:HorizontalToolbar>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" style="vertical-align: middle; margin-right: 5px;" class="litIconDocumentFind2" alt="" />
    <Foundation:ModuleString ID="ModuleString23" Name="SearchPageHeader" runat="server" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" runat="Server">
	
    <div class="lsContentScroll">
		<div class="litDescriptionText">
			<Foundation:ModuleString ID="ModuleString2" Name="SearchPageDescription" runat="server" />
		</div>

		<div style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString11" Name="FieldTemplate" runat="server" />
			</div>
			<div>
				<asp:DropDownList runat="server" ID="c_dropDownListFieldDefinitions" AutoPostBack="true"
					OnSelectedIndexChanged="TemplateChanged" CssClass="litInputSelect" Style="width: 206px;" />
			</div>
		</div>
		<div style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString20" Name="Group" runat="server" />
			</div>
			<div>
				<asp:DropDownList runat="server" ID="c_dropDownListGroups" CssClass="litInputSelect"
					Style="width: 206px;" />
			</div>
		</div>
		<div style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString21" Name="Organization" runat="server" />
			</div>
			<div>
				<asp:DropDownList runat="server" ID="c_dropDownListOrganizations" CssClass="litInputSelect"
					Style="width: 206px;" />
			</div>
		</div>
		<div style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString22" Name="Role" runat="server" />
			</div>
			<div>
				<asp:DropDownList runat="server" ID="c_dropDownListRoles" CssClass="litInputSelect"
					Style="width: 206px;" />
			</div>
		</div>

		<div style="clear: both"> </div>

		<hr style="margin-top: 10px;" />
		
        <asp:Panel runat="server" ID="c_panelFirstName" Style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString12" Name="FirstName" runat="server" />
			</div>
			<div>
				<asp:TextBox runat="server" CssClass="litInputText200" ID="c_firstName" /></div>
		</asp:Panel>
		
        <asp:Panel runat="server" ID="c_panelMiddleName" Style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString16" Name="MiddleName" runat="server" />
			</div>
			<div>
				<asp:TextBox runat="server" CssClass="litInputText200" ID="c_middleName" /></div>
		</asp:Panel>
		
        <asp:Panel runat="server" ID="c_panelLastName" Style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString13" Name="LastName" runat="server" />
			</div>
			<div>
				<asp:TextBox runat="server" CssClass="litInputText200" ID="c_lastName" /></div>
		</asp:Panel>
		
        <asp:Panel runat="server" ID="c_panelCustomerNr" Style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString14" Name="CustomerNumber" runat="server" />
			</div>
			<div>
				<asp:TextBox runat="server" CssClass="litInputText200" ID="c_customerNumber" /></div>
		</asp:Panel>
		
        <asp:Panel runat="server" ID="c_panelTitle" Style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString17" Name="Title" runat="server" />
			</div>
			<div>
				<asp:TextBox runat="server" CssClass="litInputText200" ID="c_title" /></div>
		</asp:Panel>
		
        <asp:Panel runat="server" ID="c_panelEmail" Style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString15" Name="Email" runat="server" />
			</div>
			<div>
				<asp:TextBox runat="server" CssClass="litInputText200" ID="c_email" /></div>
		</asp:Panel>
		
        <asp:Panel runat="server" ID="c_panelCompany" Style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString3" Name="Company" runat="server" />
			</div>
			<div>
				<asp:TextBox runat="server" CssClass="litInputText200" ID="c_company" /></div>
		</asp:Panel>
		
        <asp:Panel runat="server" ID="c_panelAdress" Style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString4" Name="Address" runat="server" />
			</div>
			<div>
				<asp:TextBox runat="server" CssClass="litInputText200" ID="c_address" /></div>
		</asp:Panel>
		
        <asp:Panel runat="server" ID="c_panelZipCode" Style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString5" Name="ZipCode" runat="server" />
			</div>
			<div>
				<asp:TextBox runat="server" CssClass="litInputText200" ID="c_zipCode" /></div>
		</asp:Panel>
		
        <asp:Panel runat="server" ID="c_panelCity" Style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString6" Name="City" runat="server" />
			</div>
			<div>
				<asp:TextBox runat="server" CssClass="litInputText200" ID="c_city" /></div>
		</asp:Panel>
		
        <asp:Panel runat="server" ID="c_panelCountry" Style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString9" Name="Country" runat="server" />
			</div>
			<div>
				<ComponentArt:ComboBox TextBoxEnabled="false" ID="c_country" runat="Server" Width="200"
					Height="20" AutoHighlight="false" AutoComplete="true" AutoFilter="true" ItemClientTemplateId="LanguageItemTemplate"
					ItemCssClass="ddn-item" ItemHoverCssClass="ddn-item-hover" CssClass="cmb" HoverCssClass="cmb-hover"
					TextBoxCssClass="txt" DropHoverImageUrl="../../LitiumStudio/Images/combobox/ddn-hover.png"
					DropImageUrl="../../LitiumStudio/Images/combobox/ddn.png" DropDownResizingMode="bottom"
					DropDownWidth="200" DropDownHeight="160" DropDownCssClass="ddn" DropDownContentCssClass="ddn-con">
					<ClientTemplates>
						<ComponentArt:ClientTemplate ID="LanguageItemTemplate">
							<img src="../../LitiumStudio/Images/icons_standard/flags/##DataItem.get_id()##.png"
								class="icon" width="16" height="16" alt="##DataItem.get_id()##" title="##DataItem.get_id()##" />
							## DataItem.get_text() ##
						</ComponentArt:ClientTemplate>
					</ClientTemplates>
					<DropDownFooter>
						<div class="ddn-ftr">
						</div>
					</DropDownFooter>
				</ComponentArt:ComboBox>
			</div>
		</asp:Panel>
		
        <asp:Panel runat="server" ID="c_panelPhoneHome" Style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString7" Name="HomePhone" runat="server" />
			</div>
			<div>
				<asp:TextBox runat="server" CssClass="litInputText200" ID="c_phoneHome" /></div>
		</asp:Panel>
		
        <asp:Panel runat="server" ID="c_panelPhoneWork" Style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString8" Name="WorkPhone" runat="server" />
			</div>
			<div>
				<asp:TextBox runat="server" CssClass="litInputText200" ID="c_phoneWork" /></div>
		</asp:Panel>
		
        <asp:Panel runat="server" ID="c_panelPhoneMobile" Style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString10" Name="CellPhone" runat="server" />
			</div>
			<div>
				<asp:TextBox runat="server" CssClass="litInputText200" ID="c_phoneMobile" /></div>
		</asp:Panel>
		
        <asp:Panel runat="server" ID="c_panelComments" Style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString19" Name="Comments" runat="server" />
			</div>
			<div>
				<asp:TextBox runat="server" CssClass="litInputText200" ID="c_comments" /></div>
		</asp:Panel>

		<div style="clear: both"> </div>

		<asp:Panel runat="server" ID="c_panelGender" Style="float: left; margin-right: 20px;">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString18" Name="Gender" runat="server" />
			</div>
			<div class="litText">
				<asp:RadioButton ID="c_radioButtonFemale" runat="server" GroupName="Gender" />&nbsp;&nbsp;&nbsp;<asp:RadioButton
					ID="c_radioButtonMale" runat="server" GroupName="Gender" /></div>
		</asp:Panel>

		<div style="clear: both"> </div>

		<asp:Repeater runat="server" ID="c_repeaterCustomFields" OnItemDataBound="RepeaterCustomFields_OnItemDataBound">
			<ItemTemplate>
				<div style="float: left; margin-right: 20px;">
					<div class="litBoldHeader">
						<asp:Label runat="server" ID="c_labelFieldName" /></div>
					<div>
						<asp:TextBox runat="server" CssClass="litInputText200" ID="c_textBoxField" />
						<asp:DropDownList runat="server" CssClass="litInputSelect" Style="width: 206px; margin-top: 1px; margin-bottom: 1px;" ID="c_dropDownList" Visible="false" />
						<asp:HiddenField runat="server" ID="c_hiddenField" />
					</div>
				</div>
			</ItemTemplate>
		</asp:Repeater>

	</div>
</asp:Content>
