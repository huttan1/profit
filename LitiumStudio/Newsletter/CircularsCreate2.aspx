<%@ page language="C#" masterpagefile="~/LitiumStudio/Newsletter/Framework/Base1.master" validaterequest="false" inherits="LitiumStudio_Newsletter_CircularsCreate2, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/Newsletter/Framework/Base1.master" %>
<%@ Register TagPrefix="HTMLEditor" Namespace="Litium.Studio.UI.Newsletter.Circulars.WebControls"
	Assembly="Litium.Studio.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="mc_toolbar" runat="server">
		<Toolbar:ToolbarItem OnClick="ToolbarItemSaveAndClose_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif"
			ID="mc_toolbarItemSaveAndClose" runat="server" />
		<Toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemPrevious_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif"
			ID="mc_toolbarItemPrevious" runat="server" />
		<Toolbar:DividerItem ID="DividerItem2" ImageURL="images/transparent.gif" Class="litToolbarSpace"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif"
			ID="mc_toolbarItemNext" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" alt="" class="litIconCircularCirculars" /><Foundation:ModuleString
		ID="c_header" runat="server" />
	&nbsp;<span style="font-weight: normal;">(<Foundation:ModuleString Name="CircularCreatePage2SubHeader2"
		runat="server" ID="Systemstring2" />
		)</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">

	<script type="text/javascript">
		//<![CDATA[
		// This is the height the browser falls back to if not able to regulate the height automatically.
		var IFRAME_HEIGHT = 350;

		// Regulates the height of the iframe where possible. Otherwise the height is set manually by the constant IFRAME_HEIGHT.
		function iFrameHeight() {
			var height = 0;
			var obj;

			// Firefox
			if (!document.all && document.getElementById) {
				// Get the iframe object
				// Get the iframe object
				obj = document.getElementById('<%=c_iframe.ClientID%>');
				obj.style.height = IFRAME_HEIGHT + 'px';
			} else if (!document.all && document.getElementsById) {
				var frameCollection = document.getElementsById('<%=c_iframe.ClientID%>');
				obj = frameCollection[0];

				try {
					// Try to get privilege to read height property
					netscape.security.PrivilegeManager.enablePrivilege('UniversalPreferencesRead');

					// Get the height of the reference URL's content
					height = obj.contentDocument.height;

					// Set iframe's height to the same height as its content
					obj.style.height = height + 70 + 'px';
				}
				catch (err) {
					// If access is denied to the referer's height attribute, set height manually
					obj.style.height = IFRAME_HEIGHT + 'px';
				}
			}
			// Internet explorer
			else if (document.all) {
				// Get the iframe object
				obj = document.getElementById('<%=c_iframe.ClientID%>');

				try {
					obj.style.height = IFRAME_HEIGHT + 'px';
				}
				catch (err) {
					// If access is denied to the referer's height attribute, set height manually
					obj.style.height = IFRAME_HEIGHT + 'px';
				}
			}
		}
		//]]>
	</script>

	<div class="lsContentScroll">
		<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td valign="top" style="padding-right: 10px;">
					<span class="litBoldText" style="margin-bottom: 2px;">
						<Foundation:ModuleString Name="Template" runat="server" ID="Modulestring2" />
					</span>
					<br />
					<img id="mc_imageTemplate" runat="server" width="90" height="110" style="margin-top: 2px;"
						alt="" /><br />
					<br />
				</td>
				<td valign="top">
					<table cellpadding="0" cellspacing="0" border="0" class="litInputTable" style="width: expression((document.documentElement.clientWidth || document.body.clientWidth) - 400 + 'px');
						width: 100%; height: expression((document.documentElement.clientHeight || document.body.clientHeight) - 450 + 'px');
						height: 100%;">
						<tr>
							<td class="litBoldText">
								<Foundation:ModuleString ID="ModuleString5" Name="CircularSubject" runat="server" />
								<img src="Images/transparent.gif" style="vertical-align: middle;" class="litIconRequired"
									alt="" />
							</td>
						</tr>
						<tr>
							<td>
								<asp:TextBox CssClass="litInputText" ID="mc_textBoxSubject" runat="server" />
								<asp:RequiredFieldValidator ID="mc_validatorSubject" runat="server" Display="Dynamic"
									ControlToValidate="mc_textBoxSubject" CssClass="litErrorMsg"  EnableClientScript="false"/>
							</td>
						</tr>
						<tr>
							<td class="litBoldText">
								<br />
								<br />
								<Foundation:ModuleString ID="ModuleString1" Name="CircularContent" runat="server" />
							</td>
						</tr>
						<tr>
							<td valign="top">
								<HTMLEditor:HTMLEditor ID="mc_htmlEditorContent" Width="100%" Height="350px" CssClass="litInputTextArea litInputFullWidth"
									runat="server" />
								<asp:Panel runat="server" ID="c_panelIframe" Visible="false" Style="height: 100%;">
									<iframe id="c_iframe" name="c_iframe" runat="server" scrolling="yes" style="width: 100%;
										height: 100%; background-color: #FFFFFF;" frameborder="1"></iframe>
								</asp:Panel>
								<br />
								<asp:CustomValidator ID="mc_validatorContent" runat="server" Display="Dynamic" ValidateEmptyText="true"
									OnServerValidate="ValidateContent" CssClass="litErrorMsg" />
							</td>
						</tr>
						<tr>
							<td>
								<div class="litBoldText" style="padding-top: 20px;">
									<Foundation:ModuleString Name="TextVersion" runat="server" ID="Propertyname6" />
								</div>
								<asp:TextBox runat="server" ID="c_textContent" TextMode="MultiLine"
									Width="99%" Rows="8" />
								<div class="litText">
									<Foundation:ModuleString Name="TextVersionDescriptionInGuide" runat="server" ID="ModuleString3" />
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

	<script type="text/javascript">
        function DisableToolbarWhileHtmlEditorLoad() {
            toolbarItemAction("disable", "1_0,1_1,1_2");
        }
        function EnableToolbarAfterHtmlEditorLoad() {
            toolbarItemAction("activate", "1_0,1_1,1_2");
        }
    	var focusObject = document.getElementById("<% Response.Write(mc_textBoxSubject.ClientID.ToString()); %>");
		var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemNext.ClientID.ToString()); %>");
		var cancelObject = null;
		document.onkeypress = function(e) { var key = (window.event) ? window.event.keyCode : e.keyCode; if (key == 27) simulateClick(cancelObject); else if (key == 13) simulateClick(submitObject); }
		if (focusObject && !focusObject.disabled) { focusObject.focus(); }
	</script>

</asp:Content>
