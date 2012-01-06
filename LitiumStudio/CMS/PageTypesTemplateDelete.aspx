<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" enableeventvalidation="false" autoeventwireup="true" inherits="LitiumStudio_CMS_PageTypesTemplateDelete, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<%@ Register TagPrefix="Pages" Namespace="Litium.Studio.UI.CMS.Pages.WebControls" Assembly="Litium.Studio.UI" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="c_toolbar" runat="server">
		<Toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="images/transparent.gif" ID="c_toolbarItemCancel" runat="server" />
		<Toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemDelete_Click" DisabledClass="litToolbarItem"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif"
			ID="c_toolbarItemDelete" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconTemplate" />
	<Foundation:ModuleString ID="ModuleString1" Name="TemplateDeletePageSubHeader1" runat="server" />
	<asp:Label ID="c_labelTemplateNameToDelete" runat="server" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
		<table border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
			<tr>
				<td valign="top">
					<span class="litText">
						<asp:Label ID="c_templateInfo" runat="server" /></span>
				</td>
			</tr>
			<tr>
				<td valign="top" style="padding-top: 35px;">
					<asp:Repeater ID="c_repeaterTemplates" runat="server">
						<ItemTemplate>
							<div style="float: left; padding-right: 20px; padding-bottom: 10px; text-align: center;"
								id="templatesDiv">
								<asp:ImageButton Width="90" Height="110" CssClass="litSelectedItem" runat="server"
									ID="Imagebutton1" /><br />
								<asp:Label runat="server" ID="c_labelTemplateName" CssClass="litText" />
							</div>
						</ItemTemplate>
					</asp:Repeater>
				</td>
			</tr>
			<tr>
				<td>
					<input type="hidden" runat="server" id="c_templateName" />
				</td>
			</tr>
		</table>
		<LS:GridHelperAjax ID="m_pagesHelper" runat="server" AssociatedControlID="m_pages"
			DataKeyName="ID" OnNeedData="grid_NeedData" FullHeight="false" />
		<Telerik:RadGrid runat="server" ID="m_pages" Width="100%">
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridBoundColumn DataField="Name"  />
					<Telerik:GridBoundColumn DataField="Place" />
					<Telerik:GridBoundColumn DataField="LastDate" />
					<Telerik:GridHyperLinkColumn DataNavigateUrlFormatString="{0}" DataNavigateUrlFields="PageUrl"
						Text="&lt;img class='litIconNavRightBlue' src='Images/transparent.gif' &gt;"
						ItemStyle-Width="5" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
	<Telerik:RadScriptBlock runat="server">

		<script type="text/javascript">
			// Set chosen template name to hidden input
			function SetTemplateNameToHidden(imageButtonID, hiddenFieldID) {
				var imageButton = document.getElementById(imageButtonID);
				var hiddenField = document.getElementById(hiddenFieldID);

				// Set value
				hiddenField.value = imageButton.title;

				// Set all image styles to unselected
				var imageButtons = document.body.getElementsByTagName("input");
				var types = "";
				for (i = 0; i <= imageButtons.length - 1; i++) {
					if (imageButtons[i].type == "image") {
						//types += imageButtons[i].type + " ";
						imageButtons[i].className = "litUnSelectedItem";
					}
				}

				// Set style
				imageButton.className = "litSelectedItem";
			}
		</script>

	</Telerik:RadScriptBlock>
</asp:Content>
