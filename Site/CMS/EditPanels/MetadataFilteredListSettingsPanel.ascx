<%@ Control Language="c#" CodeFile="MetadataFilteredListSettingsPanel.ascx.cs" Inherits="Modules.CMS.Panels.Modules_CMS_Panels_MetadataFilteredListSettingsPanel" %>
<%@ Register TagPrefix="ex" Assembly="Litium.Extensions" Namespace="Litium.Extensions.Metadata.WebControls" %>
<%@ Import Namespace="Litium.Extensions.Metadata" %>
<link rel="Stylesheet" href="<% = ResolveUrl("~/Extensions/Common/Styles/metadataselector.css") %>" />
<link rel="Stylesheet" type="text/css" href="<% = ResolveUrl("~/Extensions/Pages/Styles/metadataadmin.css") %>" />
<link rel="Stylesheet" type="text/css" href="<% = ResolveUrl("~/Extensions/Common/Styles/jquery.ui/smoothness/smoothness.css") %>" />
<script type="text/javascript" src="<% = ResolveUrl("~/Extensions/Common/Scripts/jquery-1.3.2.min.js") %>"></script>
<script type="text/javascript" src="<% = ResolveUrl("~/Extensions/Common/Scripts/jquery-ui-1.7.1.custom.min.js") %>"></script>
<script type="text/javascript" src="<% = ResolveUrl("~/Extensions/Common/Scripts/i18n/ui.datepicker-" + FoundationContext.Culture.TwoLetterISOLanguageName + ".js") %>"></script>

<script type="text/javascript">
	$(document).ready(
		function()
		{
			$.datepicker.setDefaults($.extend({ changeMonth: true, changeYear: true }, $.datepicker.regional['<% = FoundationContext.Culture.TwoLetterISOLanguageName %>'])); 
			$(".DateField").datepicker();
		}
	);
</script>

<fieldset class="MetadataAdminFieldset">
	<legend>
		<strong>Publiceringsdatum</strong>
	</legend>
	<asp:CustomValidator ID="m_customValidatorDates" OnServerValidate="CustomValidatorDateRange_ServerValidate" runat="server" />
	<div style="margin-bottom: 20px;">
		<asp:Literal ID="m_literalPublishDateStart" runat="server" /><br />
		<asp:TextBox CssClass="DateField" ID="m_textBoxStartDate" runat="server" />
		<asp:CustomValidator ID="m_customValidatorStartDate" ControlToValidate="m_textBoxStartDate" OnServerValidate="CustomValidatorDate_ServerValidate" runat="server" />
	</div>
	<div>
		<asp:Literal ID="m_literalPublishDateEnd" runat="server" /><br />
		<asp:TextBox CssClass="DateField" ID="m_textBoxEndDate" runat="server" />
		<asp:CustomValidator ID="m_customValidatorEndDate" ControlToValidate="m_textBoxEndDate" OnServerValidate="CustomValidatorDate_ServerValidate" runat="server" />
	</div>
</fieldset>

<fieldset class="MetadataAdminFieldset">
	<legend>
		<strong><asp:Literal ID="m_literalPageTypes" runat="server" /></strong>
	</legend>
	<div style="margin-bottom: 10px;">
		Alla sidtyper kommer att användas om ingen sidtyp är vald.
	</div>	
	<asp:CheckBoxList ID="m_checkBoxListPageTypes" RepeatColumns="3" RepeatDirection="Horizontal" runat="server" />
</fieldset>

<asp:Panel runat="server" ID="m_panelMetadata">
	<fieldset class="MetadataAdminFieldset">
		<legend>
			<strong>Metadatatyp</strong>
		</legend>
		<div style="margin-bottom: 10px;">
			Alla metadatatyper kommer att användas om ingen metadatatyp är vald.
		</div>	
		<div style="margin-bottom: 10px;">
			<asp:Literal ID="m_literalType1" runat="server" /><br />
			<asp:DropDownList ID="m_dropDownListMetadataTypes" runat="server" />
			&nbsp;
			<asp:ImageButton ID="m_buttonAddMetadataType" ImageUrl="~/Extensions/Common/Images/add_16px.png" OnClick="ButtonAddMetadataType_Click" OnClientClick="javascript:{SetOnBeforeUnload(); return true;}" runat="server" />
		</div>
		<div style="margin-bottom: 20px;">
			<asp:Literal ID="m_literalSelectedMetadatTypes" runat="server" /><br />
			<asp:Repeater ID="m_repeaterSelectedMetadaTypes" OnItemCommand="RepeaterSelectedMetadaTypes_ItemCommand" runat="server">
				<ItemTemplate>
					<div class="MetadataItem" onmouseover="this.className = 'MetadataItemAlternating ui-corner-all'" onmouseout="this.className = 'MetadataItem'">
						<div class="MetadataItemText">
							<%# ((Litium.Extensions.Metadata.MetadataType)Container.DataItem).Description %>
						</div>
						<div class="MetadataItemButtons">
							<asp:ImageButton ID="imageButtonDelete" CommandArgument="<%# ((Litium.Extensions.Metadata.MetadataType)Container.DataItem).Type %>" CommandName="Delete" OnClientClick="javascript:{SetOnBeforeUnload(); return true;}" ImageUrl="~/Extensions/Common/Images/delete_16px.png" runat="server" />
						</div>
					</div>
				</ItemTemplate>
			</asp:Repeater>
		</div>
	</fieldset>
	<fieldset class="MetadataAdminFieldset">
		<legend>
			<strong>Metadata</strong>
		</legend>
		<ex:metadataselector id="m_metadataSelector" buttoncssclass="MetadataSelectorButton"
			buttontype="Button" savetoproperty="true" buttontextsystemstringkey="Extensions_MD_Selector_ButtonText"
			dialogtitlesystemstringkey="Extensions_MD_Selector_DialogTitle" runat="server" />
	</fieldset>
	<fieldset class="MetadataAdminFieldset">
		<legend><strong>Hur du använder metadatainställningarna</strong></legend>
		<div style="margin-bottom: 10px;">
				Exempel 1:
				<ul>
					<li>Start- och slutdatum: 2010-01-01 - 2010-01-31</li>
					<li>Valda sidtyper: Inga</li>
					<li>Valda metadatatyper: Inga</li>
					<li>Vald metadata: Inga</li>
					<li>Resultat: Alla taggade sidor (alla sidtyper) publicerade mellan 100101-100131 visas</li>
				</ul>

				Exempel 2:
				<ul>
					<li>Start- och slutdatum: Inget</li>
					<li>Valda sidtyper: Inga</li>
					<li>Valda metadatatyper: Typ1</li>
					<li>Vald metadata: Metadata1, Metadata2</li>
					<li>Resultat: Alla sidor (alla sidtyper) som är kopplade till metadata av typen Typ1 <b>och/eller</b> kopplade till både Metadata1 och Metadata2 visas.</li>
				</ul>
				
				Exempel 3:
				<ul>
					<li>Start- och slutdatum: Inget</li>
					<li>Valda sidtyper: Inga</li>
					<li>Valda metadatatyper: Inga</li>
					<li>Vald metadata: Metadata1, Metadata2</li>
					<li>Resultat: Alla sidor (alla sidtyper) som är kopplade till både Metadata1 och Metadata2 visas.</li>
				</ul>
				
				Exempel 4:
				<ul>
					<li>Start- och slutdatum: Inget</li>
					<li>Valda sidtyper: Vanlig sida</li>
					<li>Valda metadatatyper: Typ1</li>
					<li>Vald metadata: Inga</li>
					<li>Resultat: Alla sidor (av typen Vanlig sida) som är kopplade till en eller flera metadata av typen Typ1 visas.</li>
				</ul>
		</div>
	</fieldset>
</asp:Panel>
