<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_ProductCatalog_SettingsStockKeepingUnitView, Litum.Studio.Web" enableeventvalidation="false" %>

<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
    <ComponentArt:ToolBar ID="ListToolbar" AutoPostBackOnSelect="true" OnItemCommand="ToolBar_ItemCommand"
        runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
        DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
        DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
        ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
        DefaultItemImageHeight="16">
        <Items runat="server">
            <ComponentArt:ToolBarItem ID="Abort" runat="server" ImageUrl="icons_standard/arrow_left_blue_16px.png"
                CausesValidation="False" KeyboardShortcut="Esc" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif" ImageHeight="16"
                ImageWidth="1" />
            <ComponentArt:ToolBarItem ID="Edit" runat="server" ImageUrl="icons_standard/pencil.png" CausesValidation="False"
                KeyboardShortcut="Enter"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
        </Items>
        <ClientTemplates>
		    <ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemButtonTemplate">
		        <table cellspacing="0" cellpadding="0" border="0" style="margin: 0px; margin-right: auto;">
		            <tbody>
		                <tr>
		                    <td class="ToolbarItemLeft">
		                        &nbsp;
		                    </td>
		                    <td class="ca_tb_img ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##" alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
		                    </td>
		                    <td class="ca_tb_txt ToolbarItemMain">
		                        <nobr>## DataItem.get_text() ##</nobr>
		                    </td>
		                    <td class="ToolbarItemRight">
		                        &nbsp;
		                    </td>
		                </tr>
		            </tbody>
		         </table>			       
		    </ComponentArt:ClientTemplate>
		</ClientTemplates>
    </ComponentArt:ToolBar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	 <Foundation:ModuleString
                    ID="ModuleString3" runat="server" Name="StockKeepingUnit" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">
    <div class="lsContentScroll">
            <div>
                <Foundation:ModuleString runat="server" CssClass="litBoldText" Name="StockKeepingUnitCode" />:
                <asp:Label runat="server" ID="c_skuCode" CssClass="litText" />
            </div>
            <div>
                <Foundation:ModuleString ID="ModuleString1" CssClass="litBoldText" runat="server" Name="StockKeepingUnitDecimalDigits" />:
                <asp:Label runat="server" ID="c_decimalDigits" CssClass="litText" />
            </div>
            <div class="litBoldHeader">
                <Foundation:ModuleString runat="server" Name="Description" />
            </div>
            <asp:DataList runat="server" ID="c_descriptions" RepeatDirection="Vertical" CellPadding="0"
                CellSpacing="0" OnItemCreated="Description_ItemCreated" DataKeyField="ID">
                <ItemStyle Width="210" VerticalAlign="Top" />
                <ItemTemplate>
                    <span class="litBoldText">
                        <%#Eval("Name") %>:</span>
                    <asp:Label runat="server" ID="c_description" CssClass="litText" />
                </ItemTemplate>
            </asp:DataList>
    </div>
</asp:Content>
