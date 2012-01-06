<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_Relations_SettingsRoleAddEdit, Litum.Studio.Web" enableeventvalidation="false" validaterequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="c_toolbar" runat="server">
		<Toolbar:ToolbarItem ID="c_toolbarItemAbort" OnClick="ToolbarItemAbort_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server"
			ID="Divideritem2" />
		<Toolbar:ToolbarItem ID="c_toolbarItemSave" OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ContentPlaceHolderID="LitiumStudioContentHeading" runat="server">
		<asp:Label ID="c_labelHeaderRole" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
		<div class="litBoldHeader">		
				<Foundation:ModuleString ID="ModuleString1" Name="LabelRoleName" runat="server" />:<img src="images/transparent.gif" style="vertical-align: middle;" class="litIconRequired"
					alt="" /><br />
		</div>
		<div style="float: left;">
			<asp:TextBox CssClass="litInputText200" ID="c_textBoxRoleName" runat="server" /></div>
		<div style="float: left; padding-left: 10px; padding-top: 2px;">
			<asp:CustomValidator SetFocusOnError="true" ID="c_validatorRoleName" runat="server"
				ValidateEmptyText="true" Display="Dynamic" OnServerValidate="ValidateGroupName"
				ControlToValidate="c_textBoxRoleName" CssClass="litErrorMsg" /></div>
		<div style="float:left; padding-left:10px; padding-top:2px;">
		    <asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorFolderName" ControlToValidate="c_textBoxRoleName" ValidationExpression="[^<>\']*"><img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" /><Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="Modulestring18"/></asp:RegularExpressionValidator>
		</div>
		<div style="float:left; padding-left:10px; padding-top:2px;">
            <asp:RegularExpressionValidator ID="c_lengthFieldValidatorName" runat="server"
                                    ControlToValidate="c_textBoxRoleName"     
                                    ValidationExpression="^.{1,255}$" />  
        </div>
		<div style="clear: both;">
		</div>
		<div class="litBoldHeader">
			<Foundation:ModuleString ID="ModuleString3" Name="Description" runat="server" />
		</div>
		<div style="float: left;">
		    <asp:TextBox ID="c_textBoxRoleDescription" CssClass="litInputText" TextMode="MultiLine"
			    Rows="5" runat="server" />
	    </div>
	    <div style="float:left; padding-left:10px; padding-top:2px;">
		    <asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="c_textBoxRoleDescriptionValidator" ControlToValidate="c_textBoxRoleDescription" ValidationExpression="[^<>\']*"><img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" /><Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="SystemString1"/></asp:RegularExpressionValidator>
		</div>
		<div style="clear: both;">
		</div>
	</div>

	<script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_textBoxRoleName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemAbort.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
	</script>

</asp:Content>
