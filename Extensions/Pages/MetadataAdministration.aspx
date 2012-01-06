<%@ Page Language="C#" CodeFile="MetadataAdministration.aspx.cs" MasterPageFile="~/LitiumStudio/Framework/ControlPanel.master" 
Inherits="Extensions.Pages.MetadataAdministration" AutoEventWireup="true" %>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
<img src="<% = ResolveUrl("~/Extensions/Common/Images/branch_edit_32px.png") %>" alt="" /><Foundation:SystemString ID="SystemString1" runat="server" Name="Extensions_MD_Administration_Header" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" runat="Server">
	<%--Place ALL javascript and css links here to follow XHTML rules--%>
	<link rel="stylesheet" href="Styles/metadataadmin.css" type="text/css" />
	<link rel="stylesheet" href="<% = ResolveUrl("~/Extensions/Common/Styles/jquery.ui/smoothness/smoothness.css") %>" type="text/css" />

    <%--Choose website--%>
    <div class="Section">
		<div class="SectionHeader ui-widget-header ui-helper-clearfix"><asp:Literal ID="m_literalMetadataWebSite" runat="server"></asp:Literal></span></div>
		<div class="SectionContent">
			<asp:DropDownList ID="m_dropDownListWebsites" CssClass="MetadataLanguageDownDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownListMetadataLanguages_SelectedIndexChanged"/>
		</div>
    </div>

		<%--Choose metadata type--%>
	<div class="Section">
		<div class="SectionHeader ui-widget-header ui-helper-clearfix"><asp:Literal ID="m_literalMetadataMetadataType" runat="server"></asp:Literal></div>
        <div class="SectionContent">  
			<asp:PlaceHolder ID="m_placeHoderTypeButtons" runat="server">
				<asp:DropDownList id="m_dropDownListMetadataTypes" CssClass="MetadataAdminDownDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownListMetadataTypes_SelectedIndexChanged"  />&nbsp;
				<asp:ImageButton id="m_imageButtonEditType" OnClick="ImageButtonEditType_Click" AlternateText="Edit" ImageUrl="~/Extensions/Common/Images/edit_16px.png" runat="server" />&nbsp;
				<asp:ImageButton ID="m_imageButtonDeleteType" OnClick="ImageButtonDeleteType_Click" OnClientClick="return confirm('Vill du verkligen ta bort denna metadatatyp?');" AlternateText="Delete" ImageUrl="~/Extensions/Common/Images/delete_16px.png" runat="server" />&nbsp;
				<asp:ImageButton ID="m_imageButtonCreateType" OnClick="ImageButtonCreateType_Click" AlternateText="Create" ImageUrl="~/Extensions/Common/Images/add_16px.png" runat="server" />
			</asp:PlaceHolder>
			
			<asp:PlaceHolder ID="m_placeHoderEditingTypeButtons" Visible="false" runat="server">
				<asp:TextBox ID="m_textBoxTypeDescription" runat="server"></asp:TextBox>&nbsp;
				<asp:ImageButton ID="m_imageButtonSaveType" OnClick="ImageButtonSaveType_Click" AlternateText="Save" ImageUrl="~/Extensions/Common/Images/disk_blue_16px.png" runat="server" />&nbsp;
				<asp:ImageButton ID="m_imageButtonCancelEditType" OnClick="ImageButtonCancelEditType_Click" AlternateText="Cancel editing" ImageUrl="~/Extensions/Common/Images/stop_16px.png" runat="server" />
			</asp:PlaceHolder>
	        
			<asp:PlaceHolder ID="m_placeHoderCreateTypeButtons" Visible="false" runat="server">
				<strong><foundation:SystemString Name="Extensions_MD_Settings_TypeCode" runat="server" /></strong><br />
				<asp:TextBox ID="m_textBoxCreateTypeType" Width="20" runat="server"></asp:TextBox><br />
				<asp:RequiredFieldValidator ID="m_requiredFieldValidatorType" EnableClientScript="true" Display="Dynamic" ControlToValidate="m_textBoxCreateTypeType" runat="server"></asp:RequiredFieldValidator>
				<asp:RangeValidator ID="m_rangeValidatorType" EnableClientScript="true" Display="Dynamic" MinimumValue="0" MaximumValue="99999" ControlToValidate="m_textBoxCreateTypeType" runat="server"></asp:RangeValidator><br />
				
				<strong><foundation:SystemString Name="Extensions_MD_Settings_Description" runat="server" /></strong><br />
				<asp:TextBox ID="m_textBoxCreateTypeDescription" runat="server"></asp:TextBox>&nbsp;
				<asp:ImageButton ID="m_imageButtonSaveNewType" OnClick="ImageButtonSaveNewType_Click" AlternateText="Save" ImageUrl="~/Extensions/Common/Images/disk_blue_16px.png" runat="server" />&nbsp;<asp:ImageButton ID="m_imageButtonCancelCreateType" OnClick="ImageButtonCancelCreateType_Click" AlternateText="Cancel" ImageUrl="~/Extensions/Common/Images/stop_16px.png" runat="server" />
			</asp:PlaceHolder>
	        
			<asp:Label CssClass="litErrorMsg" ID="m_labelTypeErrorMsg" runat="server"></asp:Label>
		</div>
	</div>
     

    <%--Choose language--%>
    <div class="Section">
		<div class="SectionHeader ui-widget-header ui-helper-clearfix"><asp:Literal ID="m_literaMetadataLanguage" runat="server"></asp:Literal></div>
		<div class="SectionContent"> 
			<asp:DropDownList ID="m_dropDownListMetadataLanguages" CssClass="MetadataLanguageDownDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownListMetadataLanguages_SelectedIndexChanged" />
		</div>
    </div>
    <%--Metadata--%>
    <asp:Panel CssClass="Section" ID="m_panelMetadata" runat="server">
		<div class="SectionHeader ui-widget-header ui-helper-clearfix"><asp:Literal id="m_literalMetadataName" runat="server" /></div>
	    <div class="SectionContent"> 
			<asp:PlaceHolder ID="m_placeHolderAddMetadata" runat="server">
				<strong><foundation:SystemString Name="Extensions_MD_Settings_AddMetadata" runat="server" /></strong><br />
				<asp:TextBox cssclass="MetadataAdminField" id="m_textBoxCreateMetadataTranslation" runat="server" />
				<asp:ImageButton CssClass="MetadataAdminImageButton" ID="m_buttonAdd" ImageUrl="~/Extensions/Common/Images/add_16px.png" OnClick="ButtonAdd_Click" runat="server" />
				<asp:CustomValidator OnServerValidate="CustomValidatorMetadataTranslation_ServerValidate" ID="m_customValidatorMetadataTranslation" runat="server" Display="Dynamic"></asp:CustomValidator>
	        </asp:PlaceHolder>
			<asp:PlaceHolder ID="m_placeHolderEditMetadata" Visible="false" runat="server">
				<strong><foundation:SystemString Name="Extensions_MD_Settings_EditMetadata" runat="server" /></strong><br />
				<asp:TextBox cssclass="MetadataAdminField" id="m_textBoxEditMetadataTranslation" runat="server" />
				<asp:ImageButton ID="m_imageButtonEditMetadataSave" OnClick="ImageButtonEditMetadataSave_Click" AlternateText="Save" ImageUrl="~/Extensions/Common/Images/disk_blue_16px.png" runat="server" />&nbsp;<asp:ImageButton ID="m_imageButtonEditMetadataCancel" OnClick="ImageButtonEditMetadataCancel_Click" AlternateText="Cancel" ImageUrl="~/Extensions/Common/Images/stop_16px.png" runat="server" />
			</asp:PlaceHolder>			        
	        <br /><br />
	        <asp:Repeater id="m_repeaterMetadata" OnItemCommand="RepeaterMetadata_ItemCommand" OnItemDatabound="RepeaterMetadata_ItemDataBound" runat="server">
		        <ItemTemplate>
			        <div class="MetadataItem" onmouseover="this.className = 'MetadataItemAlternating ui-corner-all'" onmouseout="this.className = 'MetadataItem'">
				        <div class="MetadataItemText word_wrap"><asp:Label id="labelText" runat="server" /></div>
                        
				        <div class="MetadataItemButtons">
					        <%--<asp:ImageButton CssClass="ButtonHidden" ID="imageButtonSave" ImageUrl="~/Extensions/Common/Images/disk_blue_16px.png" runat="server" />
					        <img id="imgEdit" alt="Edit" runat="server" />&nbsp;
					        <img id="imgCancel" class="ButtonHidden" alt="Stop" runat="server" />--%>
					        <asp:ImageButton ID="m_imageButtonEdit" ImageUrl="~/Extensions/Common/Images/edit_16px.png" runat="server" />
					        <asp:ImageButton id="m_imageButtonDeleteLinks" ImageUrl="~/Extensions/Common/Images/deletelinks_16px.png" runat="server" />
					        <asp:ImageButton id="m_imageButtonDelete" ImageUrl="~/Extensions/Common/Images/delete_16px.png" runat="server" />
				        </div>
					    		
				        <div class="clear"></div>
			        </div>
		        </ItemTemplate>
	        </asp:Repeater>
        </div>
    </asp:Panel>

</asp:content>
