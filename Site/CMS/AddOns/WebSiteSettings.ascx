<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebSiteSettings.ascx.cs" Inherits="Site_CMS_AddOns_WebSiteSettings" %>
<div style="margin: 15px 15px 15px 15px; width: 615px;">
	<link type="text/css" href="/Extensions/Pages/Styles/websitesettings.css" />
	<style type="text/css">
		.SectionContainer { overflow:scroll; }
		.Section { padding:15px; width:700px; }
		.SectionHeader { padding:5px; }
		.SectionContent { padding:10px; border-left:1px solid #AAAAAA; border-right:1px solid #AAAAAA; border-bottom:1px solid #AAAAAA; }
		
		.WebSiteSettingItem{ padding:3px;}
		.WebSiteSettingItemName{ float:left; font-size:1.1em; margin-top:3px; width: 150px;}
		.WebSiteSettingItemField{ float:left; font-size:1.1em; margin-top:3px; width: 495px;}
		.WebSiteSettingItemButtons{ float:right; margin-top:2px; }
		.ButtonHidden{ display:none; }
		.WebSiteSettingAdminFieldset{ width:404px; padding-top: 10px; }
		.WebSiteSettingAdminLegend{ font-weight:bold; font-size:1.2em; }
		.WebSiteSettingAdminField { width: 250px; }
		.WebSiteSettingAdminDownDownList { width: 250px; }
		.WebSiteSettingAdminContentWrapper {padding: 5px;}
		.WebSiteSettingAdminImageButton{ }
		.WebSiteSettingAdminFieldset { width:500px; margin-bottom:10px; }

		.ui-widget-header { border: 1px solid #aaaaaa; background: #cccccc url(/Extensions/Common/Styles/jquery.ui/smoothness/images/ui-bg_highlight-soft_75_cccccc_1x100.png) 50% 50% repeat-x; color: #222222; font-weight: bold; }
		.ui-helper-clearfix:after { content: "."; display: block; height: 0; clear: both; visibility: hidden; }
		.clear{clear:both; height: 0px; font-size: 0px; line-height: 0;}

	</style>
    <asp:UpdatePanel runat="server" ID="c_mainUpdatePanel" UpdateMode="Always" ChildrenAsTriggers="true">
        <ContentTemplate>
			<div class="Section">
				<div class="SectionHeader ui-widget-header"><Foundation:SystemString Name="Extensions_WS_SelectWebSiteHeader" runat="server" /></asp:Literal></div>
				<div class="SectionContent">
					<p>
						<strong><Foundation:SystemString Name="Extensions_WS_SelectWebSite" runat="server" /></strong>
						<asp:DropDownList ID="m_dropDownListWebSites" AutoPostBack="true" OnSelectedIndexChanged="DropDownListWebSites_SelectedIndexChanged" runat="server" />
					</p>

					<asp:Panel ID="m_panelCopyTo" runat="server">
						<p>
							<strong><Foundation:SystemString Name="Extensions_WS_SelectWebSiteCopyTo" runat="server" /></strong>
							<asp:DropDownList ID="m_dropDownListWebSitesCopyTo" AutoPostBack="true" OnSelectedIndexChanged="DropDownListWebSitesCopyTo_SelectedIndexChanged" runat="server" />
						</p>
					</asp:Panel>
				</div>
			</div>
			
			<div class="Section">
				<div class="SectionHeader ui-widget-header"><Foundation:SystemString Name="Extensions_WS_NewWebSiteSettingsHeader" runat="server" /></div>
				<div class="SectionContent">
					<p>
						<strong><Foundation:SystemString Name="Extensions_WS_NewWebSiteSettingsNameLabel" runat="server" /></strong><br />
						<asp:TextBox id="m_textBoxNewSettingName" runat="server"></asp:TextBox>
					</p>
					<p>
						<strong><Foundation:SystemString Name="Extensions_WS_NewWebSiteSettingsTypeLabel" runat="server" /></strong><br />
						<asp:RadioButtonList ID="m_radioButtonListType" RepeatDirection="Vertical" runat="server" />
					</p>
					<p>
						<asp:Button ID="m_buttonCreate" OnClick="ButtonCreate_Click" runat="server" />
					</p>
					<p>
						<asp:Label ID="m_labelSettingAlreadyExist" OnClick="ButtonCreate_Click" runat="server" />
					</p>
				</div>
			</div>
			<div class="Section">
				<div class="SectionHeader ui-widget-header"><Foundation:SystemString Name="Extensions_WS_SelectWebSiteSettingsHeader" runat="server" /></asp:Literal></div>
				<div class="SectionContent">	
					<asp:Repeater ID="m_repeaterWebSiteSettings" OnItemCommand="RepeaterWebSiteSettings_OnItemCommand" OnItemDataBound="RepeaterWebSiteSettings_OnItemDataBound" runat="server">
						<ItemTemplate>
							<div class="WebSiteSettingItem">
								<asp:HiddenField ID="settingId" runat="server" />
								<div class="WebSiteSettingItemName">
									<asp:CheckBox ID="checkBoxCopy" Visible="false" Checked="true" runat="server" />
									<asp:Label ID="labelSettingName" runat="server" />
								</div>
								<div class="WebSiteSettingItemField">
									<asp:PlaceHolder ID="panelShortStringValue" Visible="false" runat="server">
										<asp:TextBox ID="textBoxStringValue" runat="server" />
									</asp:PlaceHolder>
									<asp:PlaceHolder ID="panelLongStringValue" Visible="false" runat="server">
										<LS:HtmlEditor id="htmlEditorLongString" CMSInstalled="true" CustomConfigurationsPath="~/Extensions/Common/Scripts/webSiteSettingsEditorConfig.js" runat="server" />
									</asp:PlaceHolder>
									<asp:PlaceHolder ID="panelDateTimeValue" Visible="false" runat="server">
										<LS:DateTimeHelper ID="dateTimeHelperOriginal" runat="server" AssociatedControlID="radDatePickerOriginal" />
										<Telerik:RadDatePicker runat="server" ID="radDatePickerOriginal" MinDate="1754-01-01" />
									</asp:PlaceHolder>
									<asp:PlaceHolder ID="panelNumberValue" Visible="false" runat="server">
										<Telerik:RadNumericTextBox ID="radNumericTextBoxNumberValue" NumberFormat-DecimalDigits="2" NumberFormat-DecimalSeparator="," runat="server"></Telerik:RadNumericTextBox>
									</asp:PlaceHolder>
									<asp:PlaceHolder ID="panelBooleanValue" Visible="false" runat="server">
										<asp:CheckBox ID="checkBoxBooleanValue" runat="server" />
									</asp:PlaceHolder>
								</div>
		                        
								<div class="WebSiteSettingItemButtons">
									<asp:ImageButton id="imageButtonDelete" Visible="false" CommandName="Delete" ImageUrl="~/Extensions/Common/Images/delete_16px.png" runat="server" />
								</div>
							    		
								<div class="clear"></div>
							</div>
						</ItemTemplate>
					</asp:Repeater>
					
					<asp:Button ID="m_buttonSaveValues" OnClick="ButtonSaveValues_Click" runat="server" />
					<asp:Button ID="m_buttonCopyToWebSite" Visible="false" OnClick="ButtonCopyToWebSite_Click" runat="server" />
				</div>
			</div>
        </ContentTemplate>
    </asp:UpdatePanel>
 </div>