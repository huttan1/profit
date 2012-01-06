<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_ArticlePaste, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarRight" runat="server" >
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCancel" OnClick="ToolbarItemCancel_Click" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemSave" OnClick="ToolbarItemSave_Click" runat="server"/>	
	</toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
 <img id="Img1" src="Images/transparent.gif" class="litIconArticle" alt="" runat="server" /><Foundation:ModuleString ID="ModuleString1" Name="PasteHeader" Runat="server"/>&nbsp;<asp:label id="c_label" runat="server" /><span class="litTextNormalWeight">&nbsp;<Foundation:ModuleString ID="ModuleString2" Name="HeaderStepOneOfOne" Runat="server"/></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
		<Foundation:InformationGroup runat="server" ID="c_informationGroup1" Width="440px" >
        <table cellpadding="15" cellspacing="0" border="0" class="litModuleContentWithTreeMainSizeV2">
	        <tr>
		        <td valign="top" class="litGuideStars2">
		            <div class="litDescriptionText"><Foundation:ModuleString ID="ModuleString3" Name="PasteArticleDescription" Runat="server"/></div>
		            <div runat="server" id="c_articleNumberPanel" >
		                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString4" Name="ArticleNumber" Runat="server"/><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></div>
		                <div style="float:left;"><asp:TextBox id="c_textBoxArticleNumber" cssclass="litInputText" style="width:100px;" runat="server"/></div>
		                <div style="float:left; padding-left:10px; padding-top:2px;"><asp:RequiredFieldValidator runat="server" SetFocusOnError="true" ID="c_RequiredFieldValidatorArticleNumber" CssClass="litErrorMsg" ControlToValidate="c_textBoxArticleNumber" Display="Dynamic" /></div>
                        <div style="float:left; padding-left:10px; padding-top:2px;" class="litErrorMsg" runat="server" id="c_articlenumber_not_unique" visible="false"><img src='images/transparent.gif' style='vertical-align:middle;' class='litIconError' alt='' /><Foundation:ModuleString ID="ModuleString5" Name="ValidatorNotUniqeValue" Runat="server"/></div>
                    </div>
		        </td>
	        </tr>
	        <tr>
	        <td>
	        		<asp:Panel runat="server" ID="c_urlPanel">
			            <asp:Repeater runat="server" ID="c_urlRepeater">
				            <ItemTemplate>
					            <div style="float: left;">
						            <div class="litBoldHeader" style="float: left; margin-right: 5px;">
							            <Foundation:ModuleString ID="ModuleString6" Name="UrlName" runat="server" />
						            </div>
						            <div class="litBoldHeader">
							            <%#string.Format("({0})", Eval("Language")).ToLower() %>
							            <img src="images/transparent.gif" style="vertical-align: middle;" class="litIconRequired" alt="" />
						            </div>
						            <asp:TextBox runat="server" CssClass="litInputText" MaxLength="400" ID="c_urlName" Text='<%#Eval("Url") %>' />
						            <asp:HiddenField runat="server" ID="c_urlId" Value='<%#Eval("LanguageID") %>' />
						            <asp:CustomValidator ID="Validator" runat="server" ControlToValidate="c_urlName" OnServerValidate="OnUrlNameValidate" ValidateEmptyText="true" />
					            </div>
					            <br style="clear: both;" />
				            </ItemTemplate>
			            </asp:Repeater>
			            <div class="clearer">
			            </div>
		            </asp:Panel>
	        </td>
	        </tr>
        </table>
        </Foundation:InformationGroup>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_textBoxArticleNumber.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>