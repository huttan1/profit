<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/ArticlesEditBase.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_ArticlesEditSettings, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/ArticlesEditBase.master" %>


<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" Runat="Server">
    <img src="Images/transparent.gif" class="litIconArticle" alt="" /><Foundation:ModuleString ID="ModuleString6" Name="ArticlesEditSettingsHeader" Runat="server"/>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

        <div>
            <table cellpadding="15" cellspacing="0" border="0">
	            <tr>
		            <td valign="top">
		                <div class="litBoldHeader" style="margin-top:0px;"><Foundation:ModuleString ID="ModuleString2" Name="ArticleDefinition" Runat="server"/></div>
		                <div style="float:left;"><asp:DropDownList id="c_dropDownListDefinition" AutoPostBack="true" OnSelectedIndexChanged="DropDownListDefinition_OnSelectedIndexChanged" cssclass="litInputText200" runat="server"/></div>
                        <div style="clear:both;"></div>
                        <div style="margin-top:5px; width:500px;" class="litText">
                            <Foundation:ModuleString ID="ModuleString4" Name="ArticlesEditSettingsDescriptionDefinition1" Runat="server"/><br /><br />
                            <Foundation:ModuleString ID="ModuleString5" Name="ArticlesEditSettingsDescriptionDefinition2" Runat="server"/>
                        </div>
			            <div class="litBoldHeader" style="margin-bottom:2px;"><Foundation:ModuleString ID="ModuleString3" Name="Language" Runat="server"/></div>
			            <asp:Repeater ID="c_languageList" OnItemCommand="LanguageClicked"  OnItemDataBound="LanguageList_DataBound" runat="server">
			            <ItemTemplate>
			                <asp:ImageButton CssClass="litText" Style="vertical-align:middle;" id="c_imageButton" runat="server" />&nbsp;<asp:Label CssClass="litText" runat="server" id="c_languageName" /><br />
			            </ItemTemplate>
			            </asp:Repeater>
			            <div style="clear:both;"></div>
			            <div style="margin-top:5px; width:500px;" class="litText">
			                <Foundation:ModuleString ID="ModuleString7" Name="ArticlesEditSettingsDescriptionLanguage" Runat="server"/>
			            </div>
		            </td>
	            </tr>
            </table>
        </div>
</asp:Content>