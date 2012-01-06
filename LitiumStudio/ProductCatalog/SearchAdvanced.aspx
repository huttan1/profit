<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_SearchAdvanced, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarRight" runat="server" >
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconFind" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemSearch" OnClick="ToolbarItemSearch_Click" runat="server"/>	
	</toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
	<img src="Images/transparent.gif" class="litIconDocumentFind2" alt="" style="vertical-align:middle;" /><Foundation:ModuleString ID="ModuleString1" Name="AdvancedSearch" Runat="server"/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
		<Foundation:InformationGroup runat="server" ID="c_informationGroup1" >
        <div class="litDescriptionText"><Foundation:ModuleString ID="ModuleString2" Name="AdvancedSearchDescription" runat="server" /></div>
        <div style="float:left; margin-right:20px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
				<ContentTemplate>
					<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString11" Name="AdvancedSearchTemplate" runat="server" /></div>
					<div>
						<asp:DropDownList runat="server" ID="c_dropDownListTemplates" CssClass="litInputSelect" style="width:206px;" AutoPostBack="true" OnSelectedIndexChanged="TemplateChanged" />
					</div>
				</ContentTemplate>
			</asp:UpdatePanel>
        </div>
        <div style="float:left; margin-right:20px;">
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString20" Name="AdvancedSearchTemplateProductCatalog" runat="server" /></div>
            <div>
                <asp:DropDownList runat="server" ID="c_dropDownListProductGroups" CssClass="litInputSelect" style="width:206px;" />
            </div>
        </div>
        <div style="clear:both"></div>
        <hr style="margin-top:10px;" />
        <asp:UpdatePanel runat="server">
			<ContentTemplate>
				<asp:Panel runat="server" ID="c_panelArticleNumber" style="float:left; margin-right:20px;">
					<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString12" Name="ArticleNumber" runat="server" /></div>
					<div><asp:TextBox runat="server" cssclass="litInputText200" id="c_articleNumber" /></div>
				</asp:Panel>
				<asp:Panel runat="server" ID="c_panelVariantDescription" style="float:left; margin-right:20px;">
					<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString3" Name="VariantName" runat="server" /></div>
					<div><asp:TextBox runat="server" cssclass="litInputText200" id="c_variantName" /></div>
				</asp:Panel>
				<div style="clear:both"></div>
				<asp:Repeater runat="server" ID="c_repeaterCustomFields" OnItemDataBound="RepeaterCustomFields_OnItemDataBound">
					<ItemTemplate>
						<asp:Panel runat="server" style="float:left; margin-right:20px;">
							<div class="litBoldHeader"><asp:Label runat="server" id="c_labelFieldName" /></div>
							<div>
								<asp:TextBox runat="server" cssclass="litInputText200" id="c_textBoxField" />
								<asp:DropDownList runat="server" cssclass="litInputSelect" style="width:206px; margin-top:1px; margin-bottom:1px;" id="c_dropDownList" visible="false" />
								<ComponentArt:Calendar id="pickerDateTime" Visible="false" runat="server" />
								<img id="imageSetDate" alt="" class="litCalendarButton" src="~/LitiumStudio/Images/Calendar/btn_calendar.gif" width="22" height="20" runat="server" visible="false" style="margin-left:3px; margin-top:1px; vertical-align:top;" /><img alt="" id="imageClearDate" class="litCalendarButton" src="~/LitiumStudio/Images/Calendar/btn_calendar_clear.gif" width="22" height="20" runat="server" visible="false" style="margin-left:3px; margin-top:1px; vertical-align:top;" />
								<ComponentArt:Calendar runat="server" id="calendarDateTime" visible="false" />
								<asp:HiddenField runat="server" id="c_hiddenField" />
							</div>
						</asp:Panel>
					</ItemTemplate>
				</asp:Repeater>
			</ContentTemplate>
        </asp:UpdatePanel>
		</Foundation:InformationGroup>
    </div>
</asp:Content>
