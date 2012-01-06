<%@ Control Language="c#" CodeFile="MetadataSettingsPanel.ascx.cs" Inherits="Modules_CMS_Panels_MetadataSettingsPanel" %>
<%@ Register TagPrefix="ex" Assembly="Litium.Extensions" Namespace="Litium.Extensions.Metadata.WebControls" %>
<%@ Import Namespace="Litium.Extensions.Metadata"%>

<link rel="Stylesheet" href="<% = ResolveUrl("~/Extensions/Common/Styles/metadataselector.css") %>" />
<link rel="Stylesheet" type="text/css" href="<% = ResolveUrl("~/Extensions/Common/Styles/jquery.ui/smoothness/smoothness.css") %>" />
<script type="text/javascript" src="<% = ResolveUrl("~/Extensions/Common/Scripts/jquery-ui-1.7.1.custom.min.js") %>"></script>

<fieldset class="MetadataAdminFieldset">
	<legend><strong>Metadata</strong></legend>
	
	<asp:PlaceHolder ID="m_placeHolderConnectedMetadata" runat="server" Visible="false">
		<div style="margin: 10px 0px;">
			<strong>Sidans metadata</strong><br />
			<asp:DataList id="m_dataListConnectedMetadata" RepeatColumns="2" RepeatDirection="Vertical" runat="server">
				<ItemTemplate>
					 <%# Container.DataItem %>
				</ItemTemplate>
			</asp:DataList>
		</div>
	</asp:PlaceHolder>
	
	<div>
		<ex:MetadataSelector ID="c_metadataSelector" 
			ButtonCssClass="MetadataSelectorButton"
			ButtonType="Button"
			SaveToProperty="false"
			ButtonTextSystemStringKey="Extensions_MD_Selector_ButtonText" 
			DialogTitleSystemStringKey="Extensions_MD_Selector_DialogTitle" 
			runat="server" 
		/>
	</div>
</fieldset>