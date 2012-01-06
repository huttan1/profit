<%@ page validaterequest="false" language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_ArticleAdd2, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<%@ Register TagPrefix="UC" TagName="NameRepeater" Src="~/LitiumStudio/ProductCatalog/WebUserControls/PropertiesRepeaterControl.ascx" %>
<%@ Register TagPrefix="MediaArchive" TagName="MediaArchiveDialog" src="~/LitiumStudio/WebUserControls/MediaArchiveDialog.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="c_toolbarRight" runat="server">
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemCancel" OnClick="ToolbarItemCancel_Click"
			runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server"
			ID="Divideritem2" />
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemSave" OnClick="ToolbarItemSave_Click"
			runat="server" />
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemCreatePrevious" OnClick="ToolbarItemPrev_Click"
			runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="~/LitiumStudio/Images/icons_standard/product_blue.png" alt="" runat="server"
		id="c_imageIcon" /><Foundation:ModuleString ID="ModuleString1" Name="NewHeader" runat="server" />
	&nbsp;<asp:Label ID="c_labelHeader" runat="server" /><span class="litTextNormalWeight">&nbsp;<Foundation:ModuleString
		ID="HeaderOnOfThree" Name="HeaderStepTwoOfTwo" runat="server" />
	</span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll" style="width: 850px">
		<Foundation:InformationGroup runat="server" ID="c_informationGroupGeneral" Width="805px">
			<div runat="server" id="c_articleNumberPanel">
				<div class="litBoldHeader">
					<Foundation:ModuleString ID="ModuleString4" Name="ArticleNumber" runat="server" />
					<img src="images/transparent.gif" style="vertical-align: middle;" class="litIconRequired"
						alt="" /></div>
				<div style="float: left;">
					<asp:TextBox ID="c_textBoxArticleNumber" CssClass="litInputText770" runat="server" /></div>
				<div style="float: left; padding-left: 10px; padding-top: 2px;">
					<asp:RequiredFieldValidator runat="server" SetFocusOnError="true" ID="c_RequiredFieldValidatorArticleNumber"
						CssClass="litErrorMsg" ControlToValidate="c_textBoxArticleNumber" Display="Dynamic" /></div>
				<div style="float: left; padding-left: 10px; padding-top: 2px;" class="litErrorMsg"
					runat="server" id="c_articlenumber_not_unique" visible="false">
					<img src='images/transparent.gif' style='vertical-align: middle;' class='litIconError'
						alt='' /><Foundation:ModuleString ID="ModuleString5" Name="ValidatorNotUniqeValue"
							runat="server" />
				</div>
			</div>
			<%if (Request.Browser.Browser == "IE" && Request.Browser.MajorVersion < 8)
             {%>
			        <br style="clear: both;" />
			        <%
             }%>
			<br style="clear: both;" />
			<div runat="server" id="c_skuPanel" style="clear: left;">
				<div class="litBoldHeader">
					<Foundation:ModuleString ID="ModuleString7" Name="SKU" runat="server" />
					<img src="images/transparent.gif" style="vertical-align: middle;" class="litIconRequired"
						alt="" /></div>
				<div style="float: left;">
					<asp:DropDownList ID="c_skuID" CssClass="litInputSelect" runat="server" />
				</div>
				<div style="float: left; padding-left: 10px; padding-top: 2px;">
					<asp:RequiredFieldValidator runat="server" SetFocusOnError="true" ID="c_RequiredFieldValidatorSKU"
						CssClass="litErrorMsg" ControlToValidate="c_skuID" Display="Dynamic" /></div>
				<br style="clear: both;" />
			</div>
			<asp:Repeater runat="server" ID="c_nameRepeater" OnItemDataBound="PropertiesRepeater_ItemBound">
			    <HeaderTemplate><table></HeaderTemplate>
				<ItemTemplate>	
				    <tr><td>
					<asp:Panel ID="c_placeHolder" runat="server">
					</asp:Panel></td></tr>
				</ItemTemplate>
				<FooterTemplate></table></FooterTemplate>
			</asp:Repeater>
			<asp:Panel runat="server" ID="c_urlPanel">
				<asp:Repeater runat="server" ID="c_urlRepeater" OnItemDataBound="UrlRepeater_ItemBound">
					<ItemTemplate>
						<div style="float: left;">
							<div class="litBoldHeader" style="float: left; margin-right: 5px;">
								<Foundation:ModuleString ID="ModuleString6" Name="UrlName" runat="server" />
							</div>
							<div class="litBoldHeader">
								<%#string.Format("({0})", Eval("Language")).ToLower() %>
								<img src="images/transparent.gif" style="vertical-align: middle;" class="litIconRequired"
									alt="" />
							</div>
							<asp:TextBox runat="server" CssClass="litInputText770" MaxLength="400" ID="c_urlName"
								Text='<%#Eval("Url") %>' />
							<asp:HiddenField runat="server" ID="c_urlId" Value='<%#Eval("LanguageID") %>' />
							<asp:CustomValidator ID="Validator" runat="server" ControlToValidate="c_urlName"
								OnServerValidate="OnUrlNameValidate" ValidateEmptyText="true" />
						</div>
						<br style="clear: both;" />
					</ItemTemplate>
				</asp:Repeater>
				<div class="clearer">
				</div>
			</asp:Panel>
		</Foundation:InformationGroup>
		<asp:Repeater runat="server" ID="c_groupRepeater" OnItemDataBound="PropertiesRepeater_ItemBound">
			<ItemTemplate>
				<br />
				<Foundation:InformationGroup ID="informationGroup" runat="server" Width="805px">
					<asp:Label runat="server" ID="repeaterLabel" CssClass="litBoldText" ForeColor="#666666" />
					<asp:Panel ID="c_placeHolder" runat="server">
					</asp:Panel>
				</Foundation:InformationGroup>
			</ItemTemplate>
		</asp:Repeater>
	</div>
    <script type="text/javascript">
        function DisableToolbarWhileHtmlEditorLoad() {
            toolbarItemAction("disable", "1_1,1_2");
        }
        function EnableToolbarAfterHtmlEditorLoad() {
            toolbarItemAction("activate", "1_1,1_2");
        }
    </script>
    <MediaArchive:MediaArchiveDialog id="mediabankdialog" runat="server"/>
</asp:Content>
