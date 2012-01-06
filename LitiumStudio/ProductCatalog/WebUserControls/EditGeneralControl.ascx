<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_WebUserControls_EditGeneralControl, Litum.Studio.Web" %>
<%@ Register TagPrefix="PR" TagName="PropertiesRepeater" Src="~/LitiumStudio/ProductCatalog/WebUserControls/PropertiesRepeaterControl.ascx" %>
<%@ Register TagPrefix="MediaArchive" TagName="MediaArchiveDialog" Src="~/LitiumStudio/WebUserControls/MediaArchiveDialog.ascx" %>
<div class="lsTabContent">
	<Foundation:InformationGroup ID="c_variantGroupNames" runat="server" Width="805px" Visible="false">
		<asp:Repeater runat="server" ID="c_nameRepeater">
			<ItemTemplate>
				<div style="padding-right: 10px;">
					<div class="litBoldHeader">
						<Foundation:ModuleString ID="Name" Name="Name" runat="server" />
						&nbsp;(<%#Eval("Language") %>)&nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="../images/transparent.gif"
							Style="vertical-align: middle;" class="litIconRequired" alt="" /></div>
					<asp:TextBox runat="server" CssClass="litInputText770" MaxLength="400" ID="c_name" Text='<%#Eval("Name") %>' />
					<asp:HiddenField runat="server" ID="c_languageId" Value='<%#Eval("LanguageID") %>' />
					<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="c_name"
						Display="Dynamic" CssClass="litErrorMsg">
						<img id="Img1" runat="server" src='~/LitiumStudio/images/transparent.gif' style='vertical-align: middle;'
							class='litIconError' alt='' /><Foundation:ModuleString ID="ModuleString1" runat="server"
								Name="ValidatorRequiredDisplayName" />
					</asp:RequiredFieldValidator>
				</div>
			</ItemTemplate>
		</asp:Repeater>
	</Foundation:InformationGroup>
	<asp:Repeater runat="server" ID="c_groupRepeater" OnItemDataBound="PropertiesRepeater_ItemBound">
		<ItemTemplate>
			<br />
			<Foundation:InformationGroup ID="informationGroup" runat="server" Width="805px">
				<asp:Label runat="server" ID="repeaterLabel" CssClass="litBoldText" />
				<asp:Panel ID="c_placeHolder" runat="server">
				</asp:Panel>
			</Foundation:InformationGroup>
		</ItemTemplate>
	</asp:Repeater>
	<MediaArchive:MediaArchiveDialog ID="mediabankdialog" runat="server" />
</div>
