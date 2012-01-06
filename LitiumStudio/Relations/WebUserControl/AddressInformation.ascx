<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_Relations_WebUserControl_AddressInformation, Litum.Studio.Web" %>
<Foundation:InformationGroup ID="c_addressGroupView" runat="server" Visible="false">
	<br />
	<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr>
			<td style="padding-bottom: 5px; white-space: nowrap;" class="litBoldText" valign="top">
				<Foundation:ModuleString ID="ModuleString7" Name="Address" runat="server" />
				:
			</td>
			<td style="padding-bottom: 5px; padding-left: 5px; width: 100%;" class="litText">
				<asp:Label runat="server" ID="c_addressView" />
			</td>
		</tr>
		<tr>
			<td style="padding-bottom: 5px; white-space: nowrap;" class="litBoldText" valign="top">
				<Foundation:ModuleString ID="ModuleString15" Name="ZipCode" runat="server" />
				:
			</td>
			<td style="padding-bottom: 5px; padding-left: 5px; width: 100%;" class="litText">
				<asp:Label runat="server" ID="c_zipView" />
			</td>
		</tr>
		<tr>
			<td style="padding-bottom: 5px; white-space: nowrap;" class="litBoldText" valign="top">
				<Foundation:ModuleString ID="ModuleString16" Name="City" runat="server" />
				:
			</td>
			<td style="padding-bottom: 5px; padding-left: 5px; width: 100%;" class="litText">
				<asp:Label runat="server" ID="c_cityView" />
			</td>
		</tr>
		<tr>
			<td style="padding-bottom: 5px; white-space: nowrap;" class="litBoldText" valign="top">
				<Foundation:ModuleString ID="ModuleString8" Name="Country" runat="server" />
				:
			</td>
			<td style="padding-bottom: 5px; padding-left: 5px; width: 100%;" class="litText">
				<asp:Label runat="server" ID="c_countryView" />
			</td>
		</tr>
		<%--<tr>
        <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="ModuleString2" Name="State" runat="server" />:</td>
        <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_stateView" /></td>
    </tr>--%>
		<tr>
			<td style="padding-bottom: 5px; white-space: nowrap;" class="litBoldText" valign="top">
				<Foundation:ModuleString ID="ModuleString22" Name="Phone" runat="server" />
				:
			</td>
			<td style="padding-bottom: 5px; padding-left: 5px; width: 100%;" class="litText">
				<asp:Label runat="server" ID="c_phoneView" />
			</td>
		</tr>
		<tr>
			<td style="padding-bottom: 5px; white-space: nowrap;" class="litBoldText" valign="top">
				<Foundation:ModuleString ID="ModuleString1" Name="PhoneMobile" runat="server" />
				:
			</td>
			<td style="padding-bottom: 5px; padding-left: 5px; width: 100%;" class="litText">
				<asp:Label runat="server" ID="c_phoneMobileView" />
			</td>
		</tr>
		<tr>
			<td style="padding-bottom: 5px; white-space: nowrap;" class="litBoldText" valign="top">
				<Foundation:ModuleString ID="ModuleString10" Name="Email" runat="server" />
				:
			</td>
			<td style="padding-bottom: 5px; padding-left: 5px; width: 100%;" class="litText">
				<asp:Label runat="server" ID="c_emailView" />
			</td>
		</tr>
	</table>
</Foundation:InformationGroup>
<Foundation:InformationGroup ID="c_addressGroupEdit" runat="server" Visible="false">

	<script type="text/javascript">
		function FillDefaultAddressInformation(defaultAddress, fields) {
			for (field in fields) {
				var fieldName = fields[field];
				if (typeof (fieldName) !== "string") {
					fieldName.selectItemByIndex(defaultAddress[field]);
				} else {
					var obj = $get(fieldName);
					if (obj && defaultAddress[field]) {
						obj.value = defaultAddress[field];
					}
				}
			}
		}
	</script>

	<div class="litBoldHeader">
		<Foundation:ModuleString ID="ModuleString3" Name="Address" runat="server" />
		<img src="../images/transparent.gif" runat="server" id="c_imageRequiredAddress" style="vertical-align: middle;"
			class="litIconRequired" alt="" visible="false" /></div>
	<asp:TextBox runat="server" CssClass="litInputText200" ID="c_address" /><asp:RequiredFieldValidator
		SetFocusOnError="true" ControlToValidate="c_address" ID="c_validatorAddress1"
		CssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server" /><br />
	<asp:TextBox runat="server" CssClass="litInputText200" ID="c_address2" /><asp:RequiredFieldValidator
		SetFocusOnError="true" ControlToValidate="c_address2" ID="c_validatorAddress2"
		CssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server" />
	<div class="litBoldHeader">
		<Foundation:ModuleString ID="ModuleString4" Name="ZipCode" runat="server" />
		<img src="../images/transparent.gif" runat="server" id="c_imageRequiredZip" style="vertical-align: middle;"
			class="litIconRequired" alt="" visible="false" /></div>
	<asp:TextBox runat="server" CssClass="litInputText200" ID="c_zip" /><asp:RequiredFieldValidator
		SetFocusOnError="true" ControlToValidate="c_zip" ID="c_validatorZip" CssClass="litErrorMsg"
		Enabled="false" Display="Dynamic" runat="server" />
	<div class="litBoldHeader">
		<Foundation:ModuleString ID="ModuleString5" Name="City" runat="server" />
		<img src="../images/transparent.gif" runat="server" id="c_imageRequiredCity" style="vertical-align: middle;"
			class="litIconRequired" alt="" visible="false" /></div>
	<asp:TextBox runat="server" CssClass="litInputText200" ID="c_city" /><asp:RequiredFieldValidator
		SetFocusOnError="true" ControlToValidate="c_city" ID="c_validatorCity" CssClass="litErrorMsg"
		Enabled="false" Display="Dynamic" runat="server" />
	<div class="litBoldHeader">
		<Foundation:ModuleString ID="ModuleString9" Name="Country" runat="server" />
		<img src="../images/transparent.gif" runat="server" id="c_imageRequiredCountry" style="vertical-align: middle;"
			class="litIconRequired" alt="" visible="false" /></div>
	<ComponentArt:ComboBox TextBoxEnabled="false" ID="c_comboBoxLanguage" runat="Server"
		Width="200" Height="20" AutoHighlight="false" AutoComplete="true" AutoFilter="true"
		ItemClientTemplateId="LanguageItemTemplate" ItemCssClass="ddn-item" ItemHoverCssClass="ddn-item-hover"
		CssClass="cmb" HoverCssClass="cmb-hover" TextBoxCssClass="txt" DropHoverImageUrl="../../LitiumStudio/Images/combobox/ddn-hover.png"
		DropImageUrl="../../LitiumStudio/Images/combobox/ddn.png" DropDownResizingMode="bottom"
		DropDownWidth="200" DropDownHeight="170" DropDownCssClass="ddn" DropDownContentCssClass="ddn-con">
		<ClientTemplates>
			<ComponentArt:ClientTemplate ID="LanguageItemTemplate">
				<img src="../../LitiumStudio/Images/icons_standard/flags/##DataItem.get_id()##.png"
					class="icon" width="16" height="16" alt="##DataItem.get_id()##" title="##DataItem.get_id()##" />
				## DataItem.get_text() ##
			</ComponentArt:ClientTemplate>
		</ClientTemplates>
		<ClientEvents>
			<%-- <Expand EventHandler="setTopPossition" />
					<Collapse EventHandler="setTopPossitionCollapse" />		--%>
			<Load EventHandler="ComboBox1_onLoad" />
		</ClientEvents>
		<DropDownFooter>
			<div class="ddn-ftr">
			</div>
		</DropDownFooter>
	</ComponentArt:ComboBox>
	<%--<div class="litBoldHeader">
        <Foundation:ModuleString ID="ModuleString1" Name="State" runat="server" />
        <img src="../images/transparent.gif" runat="server" id="c_imageRequiredState" style="vertical-align: middle;"
            class="litIconRequired" alt="" visible="false" /></div>
    <asp:TextBox runat="server" CssClass="litInputText200" ID="c_state" /><asp:RequiredFieldValidator
        SetFocusOnError="true" ControlToValidate="c_State" ID="c_validatorState"
        CssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server" />--%>
	<div class="litBoldHeader">
		<Foundation:ModuleString ID="ModuleString6" Name="Phone" runat="server" />
		<img src="../images/transparent.gif" runat="server" id="c_imageRequiredPhone" style="vertical-align: middle;"
			class="litIconRequired" alt="" visible="false" />
	</div>
	<asp:TextBox runat="server" CssClass="litInputText200" ID="c_phone" /><asp:RequiredFieldValidator
		SetFocusOnError="true" ControlToValidate="c_phone" ID="c_validatorPhone" CssClass="litErrorMsg"
		Enabled="false" Display="Dynamic" runat="server" />
	<div class="litBoldHeader">
		<Foundation:ModuleString ID="ModuleString2" Name="PhoneMobile" runat="server" />
		<img src="../images/transparent.gif" runat="server" id="c_imageRequiredPhoneMobile"
			style="vertical-align: middle;" class="litIconRequired" alt="" visible="false" />
	</div>
	<asp:TextBox runat="server" CssClass="litInputText200" ID="c_phoneMobile" /><asp:RequiredFieldValidator
		SetFocusOnError="true" ControlToValidate="c_phoneMobile" ID="c_validatorPhoneMobile"
		CssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server" />
	<div class="litBoldHeader">
		<Foundation:ModuleString ID="ModuleString11" Name="Email" runat="server" />
		<img src="../images/transparent.gif" runat="server" id="Img1" style="vertical-align: middle;"
			class="litIconRequired" alt="" visible="false" />
	</div>
	<asp:TextBox runat="server" CssClass="litInputText200" ID="c_email" /><asp:RequiredFieldValidator
		SetFocusOnError="true" ControlToValidate="c_email" ID="RequiredFieldValidator1"
		CssClass="litErrorMsg" Enabled="false" Display="Dynamic" runat="server" />
	<asp:Panel runat="server" ID="c_copyPanel" Visible="false">
		<asp:CheckBox runat="server" ID="c_copyBox" />
		<asp:Label runat="server" ID="CopyAddressLabel" CssClass="litText" AssociatedControlID="c_copyBox">
			<Foundation:ModuleString runat="server" Name="CopyAddress" ID="CopyAddress" />
		</asp:Label>
	</asp:Panel>
	<div style="clear: both;">
	</div>
</Foundation:InformationGroup>
