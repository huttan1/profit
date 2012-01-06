<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_WebUserControls_PropertiesRepeaterControl, Litum.Studio.Web" %>
<asp:Repeater ID="c_PropertiesRepeater" runat="server" OnItemDataBound="PropertiesRepeater_ItemBound"
	OnItemCommand="PropertiesRepeater_ItemCommand">
	<ItemTemplate>
		<div style="clear: both;">
		</div>
		<div style="margin-top: 15px;">
			<asp:Label runat="server" ID="repeaterLabel" CssClass="litBoldText" /><asp:Label
				runat="server" ID="repeaterLabelRequired" CssClass="litText" Visible="false"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequiredForPublishing" alt="" /></asp:Label></div>
		<div id="parentHolder" style="float: left; width: 426px;" runat="server">
			<asp:HiddenField runat="server" ID="templateFieldId" Visible="false" />
			<asp:HiddenField runat="server" ID="languageId" Visible="false" />
			<asp:TextBox runat="server" ID="textbox" CssClass="litInputText770" Visible="false" />		
			<LS:HtmlEditor runat="server" ID="editor" Visible="false" Width="770px" Height="300px" />			
			<asp:DropDownList runat="server" ID="dropDownList" CssClass="litInputSelect" Style="width: 766px;"
				Visible="false" />
			<asp:RadioButtonList ID="trueFalse" runat="server" CssClass="litInputRadio" Visible="false" />
			<asp:FileUpload runat="server" ID="fileupload" CssClass="litInputFile" Visible="false"
				Style="float: left; width: 350px;" />
			<div runat="server" id="mediabankfiles" visible="false" style="clear: both;">
				<input type="text" runat="server" readonly="readonly" id="mediabankfiledispname"
					class="litInputText100" style="width: 276px;" />
				<input type="button" runat="server" id="mediabankbutton" class="litInputText" style="width: auto;
					margin-left: -2px;" visible="true" />
				<input type="hidden" runat="server" id="mediabankfileid" />
				<input type="hidden" runat="server" id="mediabankversionid" />
			</div>
			<asp:Image ID="fileImage" runat="server" Visible="false" Style="vertical-align: middle;
				margin-top: 4px;" />
			<asp:HyperLink runat="server" ID="fileLink" CssClass="litText" Visible="false" Style="margin-top: 4px;" /><asp:Label
				runat="server" ID="fileText" CssClass="litText" Visible="false" />
			<asp:ImageButton Visible="false" ImageUrl="../Images/transparent.gif" runat="server"
				ID="button" CausesValidation="False" CssClass="litIconDelete" BorderWidth="0"
				Style="vertical-align: middle; margin-top: 4px;" />
		    <LS:DateTimeHelper ID="DateTimeHelper1" runat="server" AssociatedControlID="radPickerDate" />
			<Telerik:RadDatePicker runat="server" ID="radPickerDate" Visible="false" />
		</div>
		<asp:RegularExpressionValidator Display="dynamic" SetFocusOnError="true" runat="server"
			CssClass="litErrorMsg" ID="regexpvalidator" Style="float: left; padding-left: 10px;
			padding-top: 2px;" />
		<asp:RequiredFieldValidator Display="dynamic" SetFocusOnError="true" runat="server"
			CssClass="litErrorMsg" ID="requiredvalidator" Style="float: left; padding-left: 10px;
			padding-top: 2px;" />
	</ItemTemplate>
</asp:Repeater>
