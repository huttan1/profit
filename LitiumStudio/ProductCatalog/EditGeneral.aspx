<%@ page validaterequest="false" language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_EditGeneral, Litum.Studio.Web" %>

<%@ Register TagPrefix="MediaArchive" TagName="MediaArchiveDialog" Src="~/LitiumStudio/WebUserControls/MediaArchiveDialog.ascx" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="c_toolbarRight" runat="server">
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemCancel" CausesValidation="false"
			OnClick="ToolbarItemCancel_Click" runat="server" />
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server"
			ID="Divideritem2" />
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="c_toolbarItemSave" OnClick="ToolbarItemSave_Click"
			runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" class="litIconArticle" alt="" runat="server" id="imageIcon" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentTabScroll">
		<div class="lsTabContainer">
			<WebControls:TabListContainer ID="m_tabs" runat="server">
				<tabitems>
					<WebControls:TabListItem CausesValidation="true" ID="c_tabItemGeneral" OnClick="TabItemGeneral_Click"
						LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink"
						ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent"
						runat="server" />
					<WebControls:TabListItem CausesValidation="true" ID="c_tabItemIncludedArticles" OnClick="TabItemIncludedArticles_Click"
						LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink"
						ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent"
						runat="server" Visible="false" />
					<WebControls:TabListItem CausesValidation="true" ID="c_tabItemPrice" OnClick="TabItemPrice_Click"
						LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink"
						ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent"
						runat="server" Visible="false" />
					<WebControls:TabListItem CausesValidation="true" ID="c_tabItemSettings" OnClick="TabItemSettings_Click"
						LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink"
						ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent"
						runat="server" />
				</tabitems>
			</WebControls:TabListContainer>
			<div class="lsTabContent">
				<Foundation:InformationGroup runat="server" ID="c_informationGroupGeneral" Width="805px">
					<asp:Panel runat="server" ID="c_panelArticleNumber">
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString1" Name="ArticleNumber" runat="server" />
							<img src="images/transparent.gif" style="vertical-align: middle;" class="litIconRequired"
								alt="" /></div>
						<asp:TextBox ID="c_textBoxArticleNumber" CssClass="litInputText770" MaxLength="150" runat="server" Enabled="false" />
					</asp:Panel>
					<div runat="server" id="c_skuPanel" style="clear: left;" visible="false">
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
					</div>
					<br style="clear: both;" />
					<asp:Repeater runat="server" ID="c_nameRepeater" OnItemDataBound="PropertiesRepeater_ItemBound">
						<HeaderTemplate>
							<table>
						</HeaderTemplate>
						<ItemTemplate>
							<tr>
								<td>
									<asp:Panel ID="c_placeHolder" runat="server">
									</asp:Panel>
								</td>
							</tr>
						</ItemTemplate>
						<FooterTemplate>
							</table></FooterTemplate>
					</asp:Repeater>
					<asp:Panel runat="server" ID="c_urlPanel">
						<asp:Repeater runat="server" ID="c_urlRepeater">
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
									<asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="c_urlName"
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
							<asp:Label runat="server" ID="repeaterLabel" CssClass="litBoldText" />
							<asp:Panel ID="c_placeHolder" runat="server">
							</asp:Panel>
						</Foundation:InformationGroup>
					</ItemTemplate>
				</asp:Repeater>
				<MediaArchive:MediaArchiveDialog ID="mediabankdialog" runat="server" />
			</div>
		</div>
	</div>
<Telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">
        function DisableToolbarWhileHtmlEditorLoad() {
            toolbarItemAction("disable", "1_1");
        }
        function EnableToolbarAfterHtmlEditorLoad() {
            toolbarItemAction("activate", "1_1");
        }
        function DisableTabsWhileHtmlEditorLoad() {
            var enabledTabItems = document.getElementsByTagName('a');
            for (i = 0; i < enabledTabItems.length; i++) {
                if (enabledTabItems.item(i).id.indexOf('m_tabs') > -1) {
                    if ('<%= Context.Request.UserAgent != null && Context.Request.UserAgent.IndexOf("MSIE") < 0 %>' == 'True') {
                        DisableAnchor(enabledTabItems.item(i), 1)
                    }
                    else
                        enabledTabItems.item(i).disabled = true;
                }
			}
            if ('<%= Context.Request.UserAgent != null && Context.Request.UserAgent.IndexOf("MSIE") < 0%>' == 'True'){
                   var enabledLiItems = document.getElementsByTagName('li');
				   for (i = 0; i < enabledLiItems.length; i++) 
				        DisableLi(enabledLiItems.item(i), 1);
            }
        }
        function EnableTabsAfterHtmlEditorLoad() {
            var disabledTabItems = document.getElementsByTagName('a');
            for (i = 0; i < disabledTabItems.length; i++) {
                if (disabledTabItems.item(i).id.indexOf('m_tabs') > -1) {
                    if ('<%= Context.Request.UserAgent != null && Context.Request.UserAgent.IndexOf("MSIE") < 0 %>' == 'True'){
                        DisableAnchor(disabledTabItems.item(i), 0)
                    }
                    else
                        disabledTabItems.item(i).disabled = false;
                }
            }
            if ('<%= Context.Request.UserAgent != null && Context.Request.UserAgent.IndexOf("MSIE") < 0 %>' == 'True') {
                   var disabledLiItems = document.getElementsByTagName('li');
				   for (i = 0; i < disabledLiItems.length; i++) 
				        DisableLi(disabledLiItems.item(i), 0);
            }
        }
        function DisableAnchor(obj, disable){
            if (disable == 1) {
                var href = obj.getAttribute("href");
                obj.setAttribute('disabled', 'disabled');
                if (href && href != "" && href != null) {
                    obj.setAttribute('href_bak', href);
                }
                obj.removeAttribute('href');
            }
            else {
                obj.setAttribute('href', obj.attributes['href_bak'].nodeValue);
                obj.removeAttribute('disabled');
            }
        }
		function DisableLi(obj, disable){
		    if (disable == 1) {
		        var onClick = obj.getAttribute("onclick");
		        obj.setAttribute('disabled', 'disabled');
		        if (onClick && onClick != "" && onClick != null) {
		            obj.setAttribute('onclick_bak', onClick);
		        }
		        obj.removeAttribute('onclick');
		    }
		    else {
		        if (obj.attributes['onclick_bak']) {
		            obj.setAttribute('onclick', obj.attributes['onclick_bak'].nodeValue);
		        }
		        obj.removeAttribute('disabled');
		    }
       }
    </script>
</Telerik:RadScriptBlock>
</asp:Content>
