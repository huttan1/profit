<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_WebUserControls_PropertyEditControl, Litum.Studio.Web" enableviewstate="true" %>
<asp:HiddenField runat="server" ID="templateFieldId" Visible="false" />
<asp:HiddenField runat="server" ID="languageId" Visible="false" />
<table cellpadding="0" cellspacing="0" border="0" style="">
	<tr>
		<td style="width: 16px; border-bottom: none; padding: 0;" valign="top" runat="server"
			id="repeaterIconRequired" visible="false">
			<asp:Image runat="server" ImageUrl="../images/transparent.gif" Style="vertical-align: middle;"
				class="litIconRequired" alt="" />
		</td>
		<td valign="top" style="border-bottom: none; padding: 0;">
			<div>
				<asp:Label runat="server" ID="label" Visible="false" />
				<asp:TextBox runat="server" ID="textbox" CssClass="litInputText175" Visible="false" />
				<LS:HtmlEditor runat="server" ID="editor" Visible="false" Width="420px" Height="300px" />
				<asp:DropDownList runat="server" ID="dropDownList" CssClass="litInputSelect" Style="width: 175px;"
					Visible="false" />
				<asp:RadioButtonList ID="trueFalse" runat="server" CssClass="litInputRadio" Visible="false" />
				<div runat="server" id="mediabankfiles" visible="false">
					<input type="text" runat="server" readonly="readonly" id="mediabankfiledispname"
						class="litInputText100" style="width: 276px;" />
					<input type="button" runat="server" id="mediabankbutton" class="litInputText" style="width: auto;
						margin-left: -2px;" visible="true" />
					<input type="hidden" runat="server" id="mediabankfileid" />
					<input type="hidden" runat="server" id="mediabankversionid" />
				</div>
				<asp:FileUpload runat="server" ID="fileupload" CssClass="litInputFile" Visible="false"
					onchange="LitiumStudio_AddUploadControl(this.id)" Size="65"   Style="width: 100%;" />
				<asp:Image ID="fileImage" runat="server" Visible="false" Style="vertical-align: middle;
					margin-top: 4px;" />
				<asp:HyperLink runat="server" ID="fileLink" CssClass="litText" Visible="false" Style="margin-top: 4px;" /><asp:Label
					runat="server" ID="fileText" CssClass="litText" Visible="false" />
				<asp:ImageButton Visible="false" ImageUrl="~/LitiumStudio/Images/transparent.gif"
					runat="server" ID="button" CausesValidation="False" CssClass="litIconDelete"
					BorderWidth="0" Style="vertical-align: middle; margin-top: 4px;" />
				<LS:DateTimeHelper ID="DateTimeHelper1" runat="server" AssociatedControlID="radPickerDate" />
				<Telerik:RadDatePicker runat="server" ID="radPickerDate" Visible="false" />
			</div>
			<div style="margin-top: 5px;" runat="server" id="c_copyAllDiv" visible="false">
				<asp:CheckBox ID="c_copyAllData" CssClass="litInputCheckbox" runat="server" />
			</div>
			<asp:RegularExpressionValidator Display="dynamic" ControlToValidate="textbox" SetFocusOnError="true"
				runat="server" CssClass="litErrorMsg" ID="regexpvalidator" Style="float: left;
				padding-left: 10px; padding-top: 2px;" />
			<asp:RequiredFieldValidator Display="dynamic" ControlToValidate="textbox" SetFocusOnError="true"
				runat="server" CssClass="litErrorMsg" ID="requiredvalidator" Style="float: left;
				padding-left: 10px; padding-top: 2px;" />
		</td>
	</tr>
</table>
