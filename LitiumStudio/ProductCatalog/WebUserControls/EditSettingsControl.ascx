<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_WebUserControls_EditSettingsControl, Litum.Studio.Web" %>
<div class="lsTabContent">
	<div class="litDescriptionText" runat="server" id="c_header" visible="false">
		<Foundation:ModuleString ID="Description" Name="Add1Description" runat="server" />
	</div>
	<Foundation:InformationGroup runat="server" ID="c_informationGroupSettings" Width="805px">
		<asp:Panel runat="server" ID="templates">
			<div class="litBoldHeader">
				<Foundation:ModuleString ID="ModuleString4" Name="Definition" runat="server" />
			</div>
			<asp:DropDownList ID="c_dropDownListDefinition" CssClass="litInputText200" runat="server" />
			<asp:RequiredFieldValidator runat="server" ControlToValidate="c_dropDownListDefinition"
				Display="Dynamic">
				<img src='images/transparent.gif' style='vertical-align: middle;' class='litIconError'
					alt='' /><Foundation:SystemString ID="SystemString1" Name="RequiredField" runat="server" />
			</asp:RequiredFieldValidator>
			<div style="padding-left: 10px; padding-top: 2px;" runat="server" id="c_labelVariantInfo"
				visible="false" class="litText">
				<img src="images/transparent.gif" style="vertical-align: middle;" class="litIconWarning"
					alt="" /><Foundation:ModuleString ID="ModuleString2" Name="ValidatorChangeDefinitionOnVariant"
						runat="server" />
			</div>
			<div style="padding-left: 10px; padding-top: 2px;" runat="server" id="c_labelVariantGroupInfo"
				visible="false" class="litText">
				<img src="images/transparent.gif" style="vertical-align: middle;" class="litIconWarning"
					alt="" /><Foundation:ModuleString ID="ModuleString6" Name="ValidatorChangeDefinitionOnVariantGroup"
						runat="server" />
			</div>
			<div style="margin-top: 5px; width: 500px;">
				<asp:Label ID="labelChangeInformation" CssClass="litText" runat="server">
					<Foundation:ModuleString ID="ModuleString3" Name="ChangeDefinitionInformation" runat="server" />
				</asp:Label></div>
		</asp:Panel>
		<asp:Panel runat="server" ID="c_languagePanel">
			<div class="litBoldHeader" style="margin-bottom: 2px;">
				<Foundation:ModuleString ID="ModuleString5" Name="Language" runat="server" />
			</div>
			<asp:CheckBoxList ID="c_checkBoxListLanguage" RepeatLayout="Flow" CssClass="litInputCheckbox" runat="server" />
			<asp:HiddenField runat="server" ID="c_addExtraLanguage" />
			<div style="clear: both; margin-top: 5px; width: 500px;" class="litText">
				<Foundation:ModuleString ID="changeLanguageText" Name="ChangeLanguageInformation" runat="server" />
			</div>
		</asp:Panel>
	</Foundation:InformationGroup>
	<Telerik:RadCodeBlock runat="server">
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
	</Telerik:RadCodeBlock>
</div>
